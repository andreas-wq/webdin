<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Article;
use App\Models\Agenda;
use App\Models\Announcement;
use App\Models\Album;
use App\Models\Foto;
use App\Models\Video;
use App\Models\InfoGraphic;
use App\Models\Field;
use App\Models\Staff;
use App\Models\Visitor;
use App\Models\Bencana;
use App\Models\Jenis_bencana;
use Auth;
use Illuminate\Support\Facades\DB;
use Str;


class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:super-admin|admin|operator']);
    }

    public function index()
    {
        $data['countunit'] = Field::count();
        $data['countpegawai'] = Staff::count();
        $data['countartikel'] = Article::count();
        $data['countagenda'] = Agenda::count();
        $data['countpengumuman'] = Announcement::count();
        $data['countalbum'] = Album::count();
        $data['countfoto'] = Foto::count();
        $data['countvideo'] = Video::count();
        $data['countinfografis'] = InfoGraphic::count();
        $data['visitor'] = Visitor::all();
        return view('admin.dashboard', $data);
    }
    public function public()
    {
        $data['countunit'] = Field::count();
        $data['countpegawai'] = Staff::count();
        $data['countartikel'] = Article::count();
        $data['countagenda'] = Agenda::count();
        $data['countpengumuman'] = Announcement::count();
        $data['countalbum'] = Album::count();
        $data['countfoto'] = Foto::count();
        $data['countvideo'] = Video::count();
        $data['countinfografis'] = InfoGraphic::count();
        $data['visitor'] = Visitor::all();
        $data['bencana_count'] = Bencana::count();
        $bencana = DB::table('bencanas')
            ->leftJoin('jenis_bencanas', 'jenis_bencanas.id', '=', 'bencanas.jb_id')
            ->select('jb_id', 'name', DB::raw('count(*) as total'))

            ->groupBy('jb_id')
            ->get();
      
        $series = [];
        foreach ($bencana as $d) {
            $series[] = ['name' => $d->name, 'data' => [$d->total]];
        }
        $data['series'] = $series;

        // dd($series);
        // lokasi rawan bencana
        $lokasi = DB::table('bencanas')
        
        ->leftJoin('kecamatans', 'kecamatans.id', '=', 'bencanas.kecamatan_id')
        ->select('kecamatan_id', 'name', DB::raw('count(*) as total'))
        ->Orderby('total','Desc')
        ->groupBy('kecamatan_id')
        ->first();
        $data['lokasi'] = $lokasi;
// dd($lokasi);
        $jb = DB::table('bencanas')
        ->leftJoin('jenis_bencanas', 'jenis_bencanas.id', '=', 'bencanas.jb_id')
        ->select('jb_id', 'name', DB::raw('count(*) as total'))
        ->Orderby('total','Desc')

        ->groupBy('jb_id')
        ->first();
        $data['jb'] = $jb;

        // grafik pie
        $lokasi2 = DB::table('bencanas')
        
        ->leftJoin('kecamatans', 'kecamatans.id', '=', 'bencanas.kecamatan_id')
        ->select('kecamatan_id', 'name', DB::raw('count(*) as total'))
        ->Orderby('total','Desc')
        ->groupBy('kecamatan_id')
 
        ->get();
  
    $nilai = [];
    $label = [];
    foreach ($lokasi2 as $d) {
        $nilai[] = $d->total;
        $label[]=$d->name;
         
    }
    $data['nilai'] = $nilai;
    $data['label'] = $label;



        return view('admin.dashboard_public', $data);
    }
    public function dump()
    {
        $bencana = DB::table('bencanas')
            ->select('jb_id', DB::raw('count(*) as total'))
            ->groupBy('jb_id')
            ->get();
        $series = [];
        foreach ($bencana as $d) {
            $series[] = ['name' => $d->jb_id, 'data' => [$d->total]];
        }
        dd($series);
    }
}