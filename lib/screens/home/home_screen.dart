import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/models/item_model.dart';
import 'package:meioambientemobile/core/models/visits_model.dart';
import 'package:meioambientemobile/screens/details/details_screen.dart';
import 'package:meioambientemobile/screens/filter%20dates/filter_date.dart';
import 'package:meioambientemobile/screens/home/home_screen_controller.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'components/visit_tile.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // _manageOrders(List<dynamic> data) {
  //   return ComplaintModel(
  //       //Não achei o index para substituir o 0 e percorrer todo o array
  //       address: data[0]['denuncia']['endereco'] ?? '',
  //       text: data[0]['denuncia']['endereco'] ?? '',
  //       denunciator: data[0]['denuncia']['denunciante'] ?? '',
  //       createdAt: data[0]['denuncia']['created_at'] ?? '',
  //       updatedAt: data[0]['denuncia']['updated_at'] ?? '');

  //   final visitsModel = VisitsModel(
  //     visitDate: data[0]['data_marcada'] ?? '',
  //     visitDoneDate: data[0]['data_realizada'] ?? '',
  //     requirementId: data[0]['requerimento_id'] ?? 0,
  //     complaintId: data[0]['denuncia_id'] ?? 0,
  //     createdAt: data[0]['created_at'] ?? '',
  //     updatedAt: data[0]['updated_at'] ?? '',
  //     pruningId: data[0]['solicitacao_poda_id'] ?? 0,
  //   );
  //   final companyModel = CompanyModel(
  //     name: data[0]['denuncia']['empresa']['nome'],
  //     cpfCnpj: data[0]['denuncia']['empresa']['cpf_cnpj'],
  //   );
  //   final addressModel = AddressModel(
  //       street: data[0]['denuncia']['empresa']['endereco']['rua'] ?? '',
  //       number: data[0]['denuncia']['empresa']['endereco']['numero'],
  //       district: data[0]['denuncia']['empresa']['endereco']['bairro'],
  //       city: data[0]['denuncia']['empresa']['endereco']['cidade'],
  //       state: data[0]['denuncia']['empresa']['estado'] ?? '');
  // }
  late Future _getAllVisits;
  @override
  void didChangeDependencies() {
    _getAllVisits = Api().getAllVisits(context);
    final controller = Provider.of<HomeScreenController>(context);
    controller.getAllVisits(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _getAllVisits = Api().getAllVisits(context);
            });
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          title: Image.asset(
            'lib/assets/images/logo.png',
            width: size.width * 0.25,
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: FutureBuilder(
            future: _getAllVisits,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                final List<dynamic> dataList = snapshot.data as List<dynamic>;

                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Visitas'.toUpperCase(), style: kTitleStyles),
                          InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => const FilterDate()),
                            child: Row(children: [
                              const Icon(
                                Icons.filter_alt,
                                color: kDetailColor2,
                                size: 30,
                              ),
                              Text(
                                DateFormat("dd/MM/yyyy").format(DateTime.now()),
                                style: kdrawerText,
                              ),
                            ]),
                          ),
                        ],
                      ),
                      const VerticalSpacerBox(size: SpacerSize.small),
                      SizedBox(
                        height: size.height * 0.75,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const VerticalSpacerBox(
                                size: SpacerSize.small);
                          },
                          itemCount: dataList.length,
                          itemBuilder: ((context, index) {
                            var data = dataList[index];

                            VisitTile getVisitTilesInfo() {
                              if (data['denuncia'] != null) {
                                final model = VisitsModel(
                                  id: data['id'] ?? 0,
                                  dueDate: data['data_marcada'],
                                  typeTitle: 'Denúncia',
                                  createdDate: data['created_at'],
                                  cep: data['denuncia']['empresa']['endereco']
                                      ['cep'],
                                  city: data['denuncia']['empresa']['endereco']
                                      ['cidade'],
                                  neighborhood: data['denuncia']['empresa']
                                      ['endereco']['bairro'],
                                  number: data['denuncia']['empresa']
                                      ['endereco']['numero'],
                                  state: data['denuncia']['empresa']['endereco']
                                      ['estado'],
                                  street: data['denuncia']['empresa']
                                      ['endereco']['rua'],
                                  complement: data['denuncia']['empresa']
                                      ['endereco']['complemento'],
                                  companyName: data['denuncia']['empresa']
                                      ['nome'],
                                  phoneNumber: data['denuncia']['empresa']
                                      ['telefone']['numero'],
                                  cnpjOrCpf: data['denuncia']['empresa']
                                      ['cpf_cnpj'],
                                  companyEmail: data['denuncia']['empresa']
                                      ['user']['email'],
                                );
                                return VisitTile(
                                  title: 'Denúncia',
                                  visitDate: model.dueDate,
                                  empresa: 'empresa',
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailsScreen(
                                        denunciaId: model.id,
                                        eventDate: model.dueDate,
                                        creationDate: model.createdDate!,
                                        adress: model.street,
                                        street: model.street,
                                        adressNumber: model.number,
                                        district: model.neighborhood,
                                        city: model.city,
                                        cep: model.cep,
                                        complement: model.complement,
                                        phoneNumber: model.phoneNumber,
                                        companyName: model.companyName,
                                        cnpj: model.cnpjOrCpf,
                                        email: model.companyEmail,
                                        name: 'model.name',
                                        profilePhotoUrl:
                                            'model.profilePhotoUrl',
                                      );
                                    }));
                                  },
                                  business: 'business',
                                  tipo: model.typeTitle,
                                  street: model.street,
                                  number: model.number,
                                );
                              } else if (data['solicitacao_poda'] != null) {
                                // final model = VisitsModel(
                                //     dueDate: data['data_marcada'],
                                //     typeTitle: 'Solicitação de poda',
                                //     createdDate: data['created_at']);
                                return VisitTile(
                                  title: 'Denúncia',
                                  visitDate: 'model.dueDate',
                                  empresa: 'empresa',
                                  onTap: () {},
                                  business: 'business',
                                  tipo: 'model.typeTitle',
                                  street: '',
                                  number: '',
                                );
                              } else if (data['requerimento'] != null) {
                                // final model = VisitsModel(
                                //     dueDate: data['data_marcada'],
                                //     typeTitle: 'Requerimento',
                                //     createdDate: data['created_at']);
                                return VisitTile(
                                  title: 'Denúncia',
                                  visitDate: 'model.dueDate',
                                  empresa: 'empresa',
                                  onTap: () {},
                                  business: 'business',
                                  tipo: 'model.typeTitle',
                                  street: '',
                                  number: '',
                                );
                              } else {
                                return VisitTile(
                                  title: 'title',
                                  visitDate: '',
                                  empresa: 'empresa',
                                  onTap: () {},
                                  business: 'business',
                                  tipo: 'tipo',
                                  street: '',
                                  number: '',
                                );
                              }
                            }

                            return Card(
                              child: Container(
                                  height: size.height * 0.23,
                                  decoration: BoxDecoration(
                                      color: kDetailColor,
                                      borderRadius:
                                          BorderRadius.circular(kSmallHeight)),
                                  child: getVisitTilesInfo()
                                  // child: VisitTile(
                                  //   title: addressModel.street +
                                  //       ', ' +
                                  //       addressModel.district +
                                  //       ', ' +
                                  //       addressModel.number,
                                  //   //Não sei converter do dataTime p separar desse modo
                                  //   visitDate: visitsModel.visitDate,
                                  //   empresa: companyModel.name,
                                  //   //Não consegui colocar um condicional nesse campo para cada caso
                                  //   tipo: 'Denúncia',
                                  //   business: '',
                                  //   onTap: () {

                                  ),
                            );
                          }),
                        ),
                      ),
                    ]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }
}

// if (data['solicitacao_poda'] != null) {
                            //   print('é solicitacao');
                            // } else if (data['requerimento'] != null) {
                            //   print('é requerimento');
                            // } else if (data['denuncia'] != null) {
                            //   var denunciaData = data['denuncia'];
                            //   if (data['data_realizada'] != null) {
                            //     complaintModel = ComplaintModel(
                            //         address: denunciaData['endereco'] ?? '',
                            //         text: denunciaData['endereco'] ?? '',
                            //         denunciator: denunciaData['denunciante'] ?? '',
                            //         createdAt: denunciaData['created_at'] ?? '',
                            //         updatedAt: denunciaData['updated_at'] ?? '');

                            //     visitsModel = VisitsModel(
                            //       visitDate: data['data_marcada'] ?? '',
                            //       visitDoneDate: data['data_realizada'] ?? '',
                            //       requirementId: data['requerimento_id'] ?? 0,
                            //       complaintId: data['denuncia_id'] ?? 0,
                            //       createdAt: data['created_at'] ?? '',
                            //       updatedAt: data['updated_at'] ?? '',
                            //       pruningId: data['solicitacao_poda_id'] ?? 0,
                            //     );
                            //     companyModel = CompanyModel(
                            //       name: denunciaData['empresa']['nome'] ?? '',
                            //       cpfCnpj: denunciaData['empresa']['cpf_cnpj'] ?? '',
                            //     );
                            //     addressModel = AddressModel(
                            //       street: denunciaData['empresa']['endereco']['rua'] ?? '',
                            //       number: denunciaData['empresa']['endereco']['numero'],
                            //       district: denunciaData['empresa']['endereco']['bairro'],
                            //       city: denunciaData['empresa']['endereco']['cidade'],
                            //       state: denunciaData['empresa']['estado'] ?? '',
                            //       complement: denunciaData['empresa']['endereco']
                            //               ['complemento'] ??
                            //           '',
                            //       cep: denunciaData['empresa']['endereco']['cep'],
                            //     );
                            //     profileModel = Profile(
                            //         name: denunciaData['empresa']['user']['name'],
                            //         email: denunciaData['empresa']['user']['email'],
                            //         profilePhotoUrl: 'profilePhotoUrl');
                            //     phoneModel = Phone(
                            //         number: denunciaData['empresa']['telefone']['numero']);
                            //   } else {
                            //     complaintModel = ComplaintModel(
                            //         address: data['denuncia']['endereco'] ?? '',
                            //         text: data['denuncia']['endereco'] ?? '',
                            //         denunciator: data['denuncia']['denunciante'] ?? '',
                            //         createdAt: data['denuncia']['created_at'] ?? '',
                            //         updatedAt: data['denuncia']['updated_at'] ?? '');

                            //     visitsModel = VisitsModel(
                            //       visitDate: data['data_marcada'] ?? '',
                            //       visitDoneDate: data['data_realizada'] ?? '',
                            //       requirementId: data['requerimento_id'] ?? 0,
                            //       complaintId: data['denuncia_id'] ?? 0,
                            //       createdAt: data['created_at'] ?? '',
                            //       updatedAt: data['updated_at'] ?? '',
                            //       pruningId: data['solicitacao_poda_id'] ?? 0,
                            //     );
                            //     companyModel = CompanyModel(
                            //       name: data['denuncia']['empresa']['nome'] ?? '',
                            //       cpfCnpj: data['denuncia']['empresa']['cpf_cnpj'] ?? '',
                            //     );
                            //      addressModel = AddressModel(
                            //       street:
                            //           data['denuncia']['empresa']['endereco']['rua'] ?? '',
                            //       number: data['denuncia']['empresa']['endereco']['numero'],
                            //       district: data['denuncia']['empresa']['endereco']
                            //           ['bairro'],
                            //       city: data['denuncia']['empresa']['endereco']['cidade'],
                            //       state: data['denuncia']['empresa']['estado'] ?? '',
                            //       complement: data['denuncia']['empresa']['endereco']
                            //               ['complemento'] ??
                            //           '',
                            //       cep: data['denuncia']['empresa']['endereco']['cep'],
                            //     );
                            //      profileModel = Profile(
                            //         name: data['denuncia']['empresa']['user']['name'],
                            //         email: data['denuncia']['empresa']['user']['email'],
                            //         profilePhotoUrl: 'profilePhotoUrl');
                            //     phoneModel = Phone(
                            //         number: data['denuncia']['empresa']['telefone']
                            //             ['numero']);
                            //   }
                            // }