// To parse this JSON data, do
//
//     final dataPeserta = dataPesertaFromJson(jsonString);

import 'dart:convert';

DataPeserta dataPesertaFromJson(String str) =>
    DataPeserta.fromJson(json.decode(str));

String dataPesertaToJson(DataPeserta data) => json.encode(data.toJson());

class DataPeserta {
  final String? nip;
  final String? jnsPensiun;
  final String? noEdu;
  final String? nmPenerimaMp;
  final String? stsKelAkhir;
  final String? alamat;
  final String? kdProp;
  final String? kodePos;
  final String? noTelp;
  final String? noHp;
  final String? kegiatanPensiun;
  final String? npwp;
  final String? tempatLahir;
  final String? tglLahir;
  final String? nmBankPeserta;
  final String? noRekPeserta;
  final String? nmRekPeserta;

  DataPeserta({
    this.nip,
    this.jnsPensiun,
    this.noEdu,
    this.nmPenerimaMp,
    this.stsKelAkhir,
    this.alamat,
    this.kdProp,
    this.kodePos,
    this.noTelp,
    this.noHp,
    this.kegiatanPensiun,
    this.npwp,
    this.tempatLahir,
    this.tglLahir,
    this.nmBankPeserta,
    this.noRekPeserta,
    this.nmRekPeserta,
  });

  factory DataPeserta.fromJson(Map<String, dynamic> json) => DataPeserta(
        nip: json["nip"],
        jnsPensiun: json["jns_pensiun"],
        noEdu: json["no_edu"],
        nmPenerimaMp: json["nm_penerima_mp"],
        stsKelAkhir: json["sts_kel_akhir"],
        alamat: json["alamat"],
        kdProp: json["kd_prop"],
        kodePos: json["kode_pos"],
        noTelp: json["no_telp"],
        noHp: json["no_hp"],
        kegiatanPensiun: json["kegiatan_pensiun"],
        npwp: json["npwp"],
        tempatLahir: json["tempat_lahir"],
        tglLahir: json["tgl_lahir"],
        nmBankPeserta: json["nm_bank_peserta"],
        noRekPeserta: json["no_rek_peserta"],
        nmRekPeserta: json["nm_rek_peserta"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "jns_pensiun": jnsPensiun,
        "no_edu": noEdu,
        "nm_penerima_mp": nmPenerimaMp,
        "sts_kel_akhir": stsKelAkhir,
        "alamat": alamat,
        "kd_prop": kdProp,
        "kode_pos": kodePos,
        "no_telp": noTelp,
        "no_hp": noHp,
        "kegiatan_pensiun": kegiatanPensiun,
        "npwp": npwp,
        "tempat_lahir": tempatLahir,
        "tgl_lahir": tglLahir,
        "nm_bank_peserta": nmBankPeserta,
        "no_rek_peserta": noRekPeserta,
        "nm_rek_peserta": nmRekPeserta,
      };
}
