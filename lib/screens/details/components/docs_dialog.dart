import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/util/download_controller.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:provider/provider.dart';

class DocsDialog extends StatefulWidget {
  const DocsDialog(
      {Key? key, required this.companyId, required this.requirementId})
      : super(key: key);
  final int companyId;
  final int requirementId;

  @override
  State<DocsDialog> createState() => _DocsDialogState();
}

class _DocsDialogState extends State<DocsDialog> {
  late Future _getAllDocuments;
  @override
  void initState() {
    if (mounted) {
      _getAllDocuments = Api().getAllVisitsDocuments(
          companyId: widget.companyId,
          requirementId: widget.requirementId,
          context: context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text(
        'DOCUMENTOS',
        style: kHomeScreen2,
      ),
      content: SizedBox(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> documents = snapshot.data as List<dynamic>;
              return SizedBox(
                height: size.height * 0.6,
                width: size.width * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: size.height * 0.1,
                        child: DocTile(
                          title: documents[index]['nome'],
                          id: documents[index]['id'],
                          companyId: widget.companyId,
                          requirementId: widget.requirementId,
                        ));
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar documentos');
            }
            return SizedBox(
              height: size.height * 0.2,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          future: _getAllDocuments,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Fechar',
              style: kUnderline,
            )),
      ],
    );
  }
}

class DocTile extends StatelessWidget {
  const DocTile({
    Key? key,
    required this.title,
    required this.id,
    required this.companyId,
    required this.requirementId,
  }) : super(key: key);

  final String title;
  final int id;
  final int companyId;
  final int requirementId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: size.width * 0.6,
            child: Text(title,
                overflow: TextOverflow.visible, style: kdrawerText)),
        const Spacer(),
        Column(
          children: [
            Provider.of<DetailsScreenController>(context).isLoading
                ? const CircularProgressIndicator()
                : IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: kDetailColor,
                    ),
                    onPressed: () {
                      Provider.of<DetailsScreenController>(context,
                              listen: false)
                          .getSpecifiedDocument(
                              companyId: companyId,
                              documentName: title,
                              requirementId: requirementId,
                              documentId: id,
                              context: context);
                    },
                  ),
            Provider.of<DownloaderController>(context).percentage != null
                ? Text(Provider.of<DownloaderController>(context).percentage!,
                    style: kdrawerText)
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}
