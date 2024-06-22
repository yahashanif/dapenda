import 'package:dapenda/app/constant.dart';
import 'package:dapenda/widgets/base_appbar.dart';
import 'package:dapenda/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import '../../widgets/box_gap.dart';
import '../../widgets/text-rapi.dart';

class DataUlangScreen extends StatefulWidget {
  const DataUlangScreen({super.key});

  @override
  State<DataUlangScreen> createState() => _DataUlangScreenState();
}

class _DataUlangScreenState extends State<DataUlangScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppbar(
        title: "Data Ulang",
        centerTitle: false,
        backgroundColor: blue,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  value: "Koen Eliyati",
                ),
                TextRapi(
                  data: 'Nomor e-DU',
                  value: "193301237868",
                ),
                TextRapi(
                  data: 'Jenis Pensiun',
                  value: "Pensiun Normal",
                ),
                TextRapi(
                  data: 'Tempat, Tanggal Lahir',
                  value: "Purworejo, 1933-01-27",
                ),
                TextRapi(
                  data: 'Nomor Pensiunan',
                  value: "8501331285",
                ),
                TextRapi(
                  data: 'Status Keluarga terakhir',
                  value: "Janda",
                ),
                TextRapi(
                  data: 'Alamat Tempat Tinggal',
                  value: '',
                ),
                const BoxGap(
                  height: 8,
                ),
                TextFormField(
                  initialValue: "Perumahan Bilimon ajshdkjashdkasdas",
                  // onSaved: (val) => _alamat = val,
                  maxLines: 4,
                  style: tahomaR.copyWith(
                      fontSize: getActualY(y: 14, context: context)),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Alamat Tempat Tinggal Sekarang',
                    hintStyle: tahomaR.copyWith(fontSize: 14),
                  ),
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
                    value: "_valProvince",
                    items: [],
                    // _dataProvince.map(
                    //   (item) {
                    //     return DropdownMenuItem(
                    //       child: Text(item['nm_prop']),
                    //       value: item['kd_prop'],
                    //     );
                    //   },
                    // ).toList(),
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
                  initialValue: "26255",
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
                  initialValue: '',
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
                  initialValue: '',
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
                TextRapi(
                  data: 'Nomor NPWP',
                  value: '',
                ),
                const BoxGap(
                  height: 40,
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
                  value: "",
                ),
                TextRapi(
                  data: '\t\t\t\tTempat, Tanggal Lahir',
                  value: '',
                ),
                TextRapi(
                  data: '\t\t\t\tNomor Pensiunan',
                  value: "",
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
                  '',
                  style: tahomaR.copyWith(
                    fontSize: getActualY(y: 14, context: context),
                    color: Colors.black,
                  ),
                ),
                Text(
                  '',
                  style: tahomaR.copyWith(
                    fontSize: getActualY(y: 14, context: context),
                    color: Colors.black,
                  ),
                ),
                Text(
                  '',
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
                          CustomButton(text: "Simpan", onPressed: () {})),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
