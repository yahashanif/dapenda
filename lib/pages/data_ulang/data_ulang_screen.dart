import 'package:dapenda/app/constant.dart';
import 'package:dapenda/cubit/data_peserta_cubit/data_peserta_cubit.dart';
import 'package:dapenda/widgets/base_appbar.dart';
import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../themes/themes.dart';
import '../../widgets/DataUlangShimmer.dart';
import '../../widgets/box_gap.dart';
import '../../widgets/text-rapi.dart';

class DataUlangScreen extends StatefulWidget {
  const DataUlangScreen({super.key});

  @override
  State<DataUlangScreen> createState() => _DataUlangScreenState();
}

class _DataUlangScreenState extends State<DataUlangScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController alamatTempatTinggalController = TextEditingController();
  TextEditingController kdPosController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController notlpController = TextEditingController();
  TextEditingController kegiatanController = TextEditingController();
  TextEditingController npwpController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  String? noedu;
  var valueProp = {'nm_prop': 'Jakarta', 'kd_prop': 'jkt'};
  bool init = true;

  Box tokenBox = Hive.box('token');

  @override
  void initState() {
    super.initState();
    var token = tokenBox.get('token');
    context.read<DataPesertaCubit>().getDataPeserta(token: token);
  }

  @override
  Widget build(BuildContext context) {
    validator(value) {
      if (value!.isEmpty) {
        return "*Wajib diisi";
      } else {
        return null;
      }
    }

    return Scaffold(
      appBar: const BaseAppbar(
        title: "Data Ulang",
        centerTitle: false,
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<DataPesertaCubit, DataPesertaState>(
          listener: (context, state) {
            if (state is DataPesertaSuccess) {
              noedu = state.data.noEdu;
              alamatTempatTinggalController.text = state.data.alamat!;
              kdPosController.text = state.data.kodePos!;
              noHpController.text = state.data.noHp!;
              notlpController.text = state.data.noTelp!;
              kegiatanController.text = state.data.kegiatanPensiun!;
              npwpController.text = state.data.npwp!;
            }
            if (state is DataPesertaUpdated) {
              context
                  .read<DataPesertaCubit>()
                  .getDataPeserta(token: tokenBox.get('token'));
            }
          },
          builder: (context, state) {
            print(state);
            if (state is DataPesertaSuccess) {
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getActualX(x: 16, context: context),
                    vertical: getActualY(y: 24, context: context)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'DATA ULANG',
                          style: tahomaB.copyWith(
                            fontSize: getActualY(y: 26, context: context),
                            color: green,
                          ),
                        ),
                      ),
                      const BoxGap(
                        height: 32,
                      ),
                      Text(
                        'Saya',
                        style: tahomaB.copyWith(
                          fontSize: getActualY(y: 16, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextRapi(
                        data: 'Nama Penerima Pensiun',
                        value: state.data.nmPenerimaMp,
                      ),
                      TextRapi(
                        data: 'Nomor e-DU',
                        value: state.data.noEdu,
                      ),
                      TextRapi(
                        data: 'Jenis Pensiun',
                        value: state.data.jnsPensiun,
                      ),
                      TextRapi(
                        data: 'Tempat, Tanggal Lahir',
                        value: state.data.tempatLahir! +
                            ", " +
                            state.data.tglLahir.toString(),
                      ),
                      TextRapi(
                        data: 'Nomor Pensiunan',
                        value: state.data.nip,
                      ),
                      TextRapi(
                        data: 'Status Keluarga terakhir',
                        value: state.data.stsKelAkhir,
                      ),
                      TextRapi(
                        data: 'Alamat Tempat Tinggal',
                        value: '',
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        // initialValue: state.data.alamat,
                        validator: validator,
                        onChanged: (value) {
                          alamatTempatTinggalController.text = value;
                        },
                        // onSaved: (val) => _alamat = val,
                        maxLines: 4,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Alamat Tempat Tinggal Sekarang',
                          hintStyle: tahomaR.copyWith(fontSize: 14),
                        ),
                        controller: alamatTempatTinggalController,
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'Provinsi ',
                        style: tahomaR.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: getActualX(x: 10, context: context)),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                        child: DropdownButton(
                          underline: Container(
                            height: 0,
                          ),
                          isExpanded: true,
                          hint: const Text("Jakarta"),
                          // value: valueProp,
                          items: [
                            {'nm_prop': 'Jakarta', 'kd_prop': 'jkt'},
                            {'nm_prop': 'Padang', 'kd_prop': 'pdg'},
                          ].map(
                            (item) {
                              return DropdownMenuItem<String>(
                                child: Text(item['nm_prop'].toString()),
                                value: item['kd_prop'],
                              );
                            },
                          ).toList(),
                          onChanged: (value) => {
                            setState(
                              () {
                                // _valProvince = value;
                              },
                            )
                          },
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'Kode POS ',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: kdPosController,
                        keyboardType: TextInputType.number,
                        // onSaved: (val) => _kodepos = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Kode POS',
                          hintStyle: tahomaR.copyWith(
                              fontSize: getActualY(y: 14, context: context)),
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'Nomor HP ',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: noHpController,
                        keyboardType: TextInputType.number,
                        // onSaved: (val) => _nohp = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Nomor HP',
                          hintStyle: tahomaR.copyWith(
                              fontSize: getActualY(y: 14, context: context)),
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'Nomor Telepon ',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: notlpController,
                        keyboardType: TextInputType.number,
                        // onSaved: (val) => _notelp = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Nomor Telepon',
                          hintStyle: tahomaR.copyWith(
                              fontSize: getActualY(y: 14, context: context)),
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'NIK',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: nikController,
                        keyboardType: TextInputType.number,
                        // onSaved: (val) => _notelp = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'NIK',
                          hintStyle: tahomaR.copyWith(
                              fontSize: getActualY(y: 14, context: context)),
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'NPWP',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: npwpController,
                        keyboardType: TextInputType.number,
                        // onSaved: (val) => _notelp = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'NPWP',
                          hintStyle: tahomaR.copyWith(
                              fontSize: getActualY(y: 14, context: context)),
                        ),
                      ),
                      const BoxGap(
                        height: 20,
                      ),
                      Text(
                        'Adalah Penerima Hak Manfaat Pensiun dari :',
                        style: tahomaB.copyWith(
                          fontSize: getActualY(y: 16, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      TextRapi(
                        data: 'a.\tNama Penerima Pensiun',
                        value: state.data.nmPenerimaMp,
                      ),
                      TextRapi(
                        data: '\t\t\t\tTempat, Tanggal Lahir',
                        value: state.data.tempatLahir! +
                            ", " +
                            state.data.tglLahir.toString(),
                      ),
                      TextRapi(
                        data: '\t\t\t\tNomor Pensiunan',
                        value: state.data.nip,
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'b.\tUntuk pembayaran Manfaat Pensiun bulanan,\n\t\t\t\tmohon ditransfer ke:',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\t\t\t\t${state.data.nmBankPeserta} Cab ",
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\t\t\t\t${state.data.noRekPeserta} ",
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 32,
                      ),
                      Text(
                        'Demikian pernyataan ini saya buat\ndengan sebenarnya, harap dapat dimaklumi. :',
                        style: tahomaB.copyWith(
                          fontSize: getActualY(y: 16, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 16,
                      ),
                      Text(
                        'Kegiatan Pensiun ',
                        style: tahomaR.copyWith(
                          fontSize: getActualY(y: 14, context: context),
                          color: Colors.black,
                        ),
                      ),
                      const BoxGap(
                        height: 8,
                      ),
                      TextFormField(
                        validator: validator,

                        controller: kegiatanController,
                        // initialValue: _kegiatan != null ? _kegiatan : '',
                        // onSaved: (val) => _kegiatan = val,
                        style: tahomaR.copyWith(
                            fontSize: getActualY(y: 14, context: context)),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Kegiatan Pensiun',
                          hintStyle: tahomaR.copyWith(fontSize: 14),
                        ),
                      ),
                      const BoxGap(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: getActualY(y: 45, context: context),
                            child:
                                // onTap == true
                                //     ? Center(
                                //         child: Container(
                                //           width: 18,
                                //           height: 18,
                                //           child: CircularProgressIndicator(
                                //             backgroundColor: Colors.white,
                                //           ),
                                //         ),
                                //       )
                                //     :
                                CustomButton(
                                    text: "Simpan",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<DataPesertaCubit>()
                                            .updateDataPeserta(
                                                token: '',
                                                edu: state.data.noEdu!,
                                                kegiatan:
                                                    kegiatanController.text,
                                                alamat:
                                                    alamatTempatTinggalController
                                                        .text,
                                                telp: notlpController.text,
                                                hp: noHpController.text,
                                                prop: '',
                                                pos: kdPosController.text);
                                      }
                                    })),
                      )
                    ],
                  ),
                ),
              );
            }
            return DataUlangShimmer();
          },
        ),
      ),
    );
  }
}
