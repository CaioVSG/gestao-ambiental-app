import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/core/models/visits_model.dart';
import 'package:meioambientemobile/screens/details/details_screen.dart';
import 'package:meioambientemobile/screens/home/home_screen_controller.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'components/visit_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    final controller = Provider.of<HomeScreenController>(context);
    controller.getAllVisits(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              final UserModel userModel =
                  Provider.of<UserModel>(context, listen: false);
              print(userModel.refreshToken);
            }),
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, ProfileScreen.id);
                  },
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: FutureBuilder(
                future: Api().getAllVisits(context),
                builder: ((context, snapshot) {
                  List<dynamic> dataList = snapshot.data as List<dynamic>;
                  if (snapshot.hasData) {
                    final List<dynamic> dataList =
                        snapshot.data as List<dynamic>;
                    final complaintModel = ComplaintModel(
                        //Não achei o index para substituir o 0 e percorrer todo o array
                        address: dataList[0]['denuncia']['endereco'],
                        text: dataList[0]['denuncia']['endereco'],
                        denunciator: dataList[0]['denuncia']['denunciante'],
                        createdAt: dataList[0]['denuncia']['created_at'],
                        updatedAt: dataList[0]['denuncia']['updated_at']);
                    final visitsModel = VisitsModel(
                      visitDate: dataList[0]['data_marcada'] ?? '',
                      visitDoneDate: dataList[0]['data_realizada'] ?? '',
                      requirementId: dataList[0]['requerimento_id'] ?? 0,
                      complaintId: dataList[0]['denuncia_id'] ?? 0,
                      createdAt: dataList[0]['created_at'] ?? '',
                      updatedAt: dataList[0]['updated_at'] ?? '',
                      pruningId: dataList[0]['solicitacao_poda_id'] ?? 0,
                    );
                    final companyModel = CompanyModel(
                      name: dataList[0]['denuncia']['empresa']['nome'],
                      cpfCnpj: dataList[0]['denuncia']['empresa']['cpf_cnpj'],
                    );
                    final addressModel = AddressModel(
                        street: dataList[0]['denuncia']['endereco']['rua'],
                        number: dataList[0]['denuncia']['endereco']['numero'],
                        district: dataList[0]['denuncia']['endereco']['bairro'],
                        city: dataList[0]['denuncia']['endereco']['cidade'],
                        state: dataList[0]['denuncia']['endereco']['estado']);
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Visitas'.toUpperCase(), style: kTitleStyles),
                          const VerticalSpacerBox(size: SpacerSize.small),
                          SizedBox(
                            height: size.height * 0.789,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const VerticalSpacerBox(
                                    size: SpacerSize.small);
                              },
                              itemCount: dataList.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                  child: Container(
                                    height: size.height * 0.23,
                                    decoration: BoxDecoration(
                                        color: kDetailColor,
                                        borderRadius: BorderRadius.circular(
                                            kSmallHeight)),
                                    child: VisitTile(
                                      title: addressModel.street +
                                          ',' +
                                          addressModel.district +
                                          ',' +
                                          addressModel.number,
                                      //Não sei converter do dataTime p separar desse modo
                                      VisitDate: '25/03/2022',
                                      hora: '15:00',
                                      empresa: companyModel.name,
                                      //Não consegui colocar um condicional nesse campo para cada caso
                                      tipo: 'Denúncia',
                                      business: '',
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, DetailsScreen.id);
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            )));
  }
}
