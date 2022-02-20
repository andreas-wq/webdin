<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Storage;
use App\Models\Sekretariat;
use Str;
use Auth;

class SekretariatController extends Controller
{
    //
    public function index(){
        try{
          $data['list'] = Sekretariat::orderBy('created_at', 'DESC')->get();
          return view('admin.unitkerja.sekretariat.list', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
  
      public function create(){
        try{
          return view('admin.unitkerja.sekretariat.create');
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
  
      public function store(Request $request){
        try{
          //upload image
          if(!empty($request->file('img'))){
            $image = $request->file('img');
            $img = $image->hashName();
            $image->storeAs('storage/sekretariat/images', $img);
          } else {
            $img = null;
          }
          $data = [
              'name'        => $request->input('name'),
              'slug'        => Str::slug($request->input('name')),
              'description' => $request->input('description'),
              'img'         => $img,
              'status'      => $request->input('status'),
          ];
          $store = Sekretariat::create($data);
          return redirect()->route('admin.sekretariat.list')->with(['success' => 'Data Berhasil Disimpan!']);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
  
      public function edit($id){
        try{
          $data['fetch'] = Sekretariat::where('id', $id)->first();
          return view('admin.unitkerja.sekretariat.edit', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
  
      public function update(Request $request){
        try{
          $id = $request->input('id');
          $sekretariat = Sekretariat::where('id',$id)->first();
          //cek jika image kosong
          if($request->file('img') == '') {
              //update tanpa image
              $sekretariat = Sekretariat::findOrFail($id);
              $sekretariat->update([
                'name'        => $request->input('name'),
                'slug'        => Str::slug($request->input('name')),
                'description' => $request->input('description'),
                'status'      => $request->input('status'),
              ]);
          } else {
              //hapus image lama
              $basename = basename($sekretariat->img);
              $images = Storage::disk('local')->delete('storage/sekretariat/images/'.$basename);
              //upload image baru
              $image = $request->file('img');
              $img = $image->hashName();
              $image->storeAs('storage/sekretariat/images', $img);
              //update dengan image
              $sekretariat = Sekretariat::findOrFail($id);
              $sekretariat->update([
                  'img'         => $img,
                  'name'        => $request->input('name'),
                  'slug'        => Str::slug($request->input('name')),
                  'description' => $request->input('description'),
                  'status'      => $request->input('status'),
              ]);
          }
          return redirect()->route('admin.sekretariat.list')->with(['success' => 'Data Berhasil Disimpan!']);
        }catch(QueryException $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
  
      public function delete(Request $request){
        try{
          $id = $request->input('id');
          $sekretariat = Sekretariat::find($id);
          $sekretariat->delete();
          return redirect()->route('admin.sekretariat.list')->with(['success' => 'Data Berhasil Dihapus!']);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.sekretariat.list')->with(['error' => $error]);
        }
      }
    
}
