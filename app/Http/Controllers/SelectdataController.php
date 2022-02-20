<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;

class SelectdataController extends Controller
{
    //
    public function unit(Request $request)
    {
        //DATA UNIT

        $unit =  DB::table('units')->get();

        return Response::json($unit);
    }
    // DATA KELAS LAYANAN
    public function kelas(Request $request)
    {
        //

        $unit =  DB::table('kelas_layanan')->get();

        return Response::json($unit);
    }
    // DATA jenis tarif
    public function jenis_tarif(Request $request)
    {
        //

        $unit =  DB::table('jenis_tarif')->orderBy('kd_jenistarif', 'asc')->get();

        return Response::json($unit);
    }
    // DATA kelompok item
    public function kelompok_item(Request $request)
    {
        //

        $unit =  DB::table('kelompok_item')->orderBy('kd_kelompokitem', 'asc')->get();

        return Response::json($unit);
    }
    // DATA subunit
    public function subunit(Request $request)
    {
        //

        $subunit =  DB::table('subunits')
            ->leftJoin('kelas_layanan', 'kelas_layanan.kd_kelas', '=', 'subunits.kd_kelas')->orderBy('nama_subunit', 'desc')->get();

        return Response::json($subunit);
    }
    public function agama(Request $request)
    {
        //

        $subunit =  DB::table('agama')->orderBy('kd_agama', 'asc')->get();

        return Response::json($subunit);
    }
    public function status_kawin(Request $request)
    {
        //

        $subunit =  DB::table('status_kawin')->orderBy('kd_statuskawin', 'asc')->get();

        return Response::json($subunit);
    }
    public function pendidikan(Request $request)
    {
        //

        $subunit =  DB::table('pendidikan')->orderBy('kd_pendidikan', 'asc')->get();

        return Response::json($subunit);
    }
    public function status_peg(Request $request)
    {
        //

        $subunit =  DB::table('status_peg')->orderBy('kd_statuspegawai', 'asc')->get();

        return Response::json($subunit);
    }
    public function jabatan(Request $request)
    {
        //

        $subunit =  DB::table('jabatan')->orderBy('kd_jabatan', 'asc')->get();

        return Response::json($subunit);
    }
    public function kelompok_pegawai(Request $request)
    {
        //

        $subunit =  DB::table('kelompok_pegawai')->orderBy('kd_kpegawai', 'asc')->get();

        return Response::json($subunit);
    }
    public function pegawai(Request $request)
    {
        //

        $subunit =  DB::table('pegawai')->orderBy('id_pegawai', 'asc')->get();

        return Response::json($subunit);
    }
    public function pekerjaan(Request $request)
    {
        //

        $subunit =  DB::table('pekerjaan')->orderBy('kd_pekerjaan', 'asc')->get();

        return Response::json($subunit);
    }
    // DATA pelaksana subunit
    public function pelaksana(Request $request)
    {
        //

        $pelaksana =  DB::table('pengelola_subunit')
            ->where('kd_subunit', '=', $request->kd_subunit)
            ->leftJoin('pegawai', 'pegawai.id_pegawai', '=', 'pengelola_subunit.id_pegawai')->orderBy('kd_pengelola', 'asc')->get();

        return Response::json($pelaksana);
    }
    // data rujukan
    public function rujukan(Request $request)
    {
        //

        $subunit =  DB::table('rujukan')->orderBy('kd_rujukan', 'asc')->get();

        return Response::json($subunit);
    }
    // data status bayar
    public function status_bayar(Request $request)
    {
        //

        $subunit =  DB::table('status_bayar')->orderBy('kd_statusbayar', 'asc')->get();

        return Response::json($subunit);
    }
    // data status bayar
    public function tarif_layanan(Request $request)
    {
        //

        $subunit =  DB::table('tarif_layanan')
            ->where('kd_kelas', $request->kd_kelas)
            ->leftJoin('item', 'tarif_layanan.kd_item', '=', 'item.kd_item')
            // ->leftJoin('kelas_layanan', 'tarif_layanan.kd_kelas', '=', 'kelas_layanan.kd_kelas')
            // ->orderBy('kd_item', 'asc')
            ->get();


        return Response::json($subunit);
    }
}
