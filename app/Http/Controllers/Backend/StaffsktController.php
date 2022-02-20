<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Storage;
use App\Models\Sekretariat;
use App\Models\Staffskt;
use Str;
use Auth;

class StaffsktController extends Controller
{
    //
    public function index(){
        try{
          $data['list'] = Staffskt::orderBy('created_at', 'DESC')->get();
          return view('admin.unitkerja.pegawai_skt.list', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function show($id){
        try{
          $data['fetch'] = Staffskt::where('id', $id)->first();
          return view('admin.unitkerja.pegawai_skt.detail', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function create(){
        try{
          $data['field'] = Sekretariat::where('status','show')->get();
          return view('admin.unitkerja.pegawai_skt.create', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function store(Request $request){
        try{
          //upload image
          if(!empty($request->file('photo'))){
            $image = $request->file('photo');
            $img = $image->hashName();
            $image->storeAs('storage/staffskt/images', $img);
          } else {
            $img = null;
          }
          $data = $this->bindData($request);
          $data['photo'] = $img;
          $store = Staffskt::create($data);
          return redirect()->route('admin.staffskt.list')->with(['success' => 'Data Berhasil Disimpan!']);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function edit($id){
        try{
          $data['skretariat'] = Skretariat::where('status','show')->get();
          $data['fetch'] = staffskt::where('id', $id)->first();
          return view('admin.unitkerja.pegawai_skt.edit', $data);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function update(Request $request){
        try{
          $id = $request->input('id');
          $staffskt = Staffskt::where('id',$id)->first();
          //cek jika image kosong
          if($request->file('photo') == '') {
              //update tanpa image
              $staffskt = Staffskt::findOrFail($id);
              $data = $this->bindData($request);
              $staffskt->update($data);
          } else {
              //hapus image lama
              $basename = basename($staffskt->photo);
              $images = Storage::disk('local')->delete('storage/staffskt/images/'.$basename);
              //upload image baru
              $image = $request->file('photo');
              $img = $image->hashName();
              $image->storeAs('storage/staffskt/images', $img);
              //update dengan image
              $staffskt = Staffskt::findOrFail($id);
              $data = $this->bindData($request);
              $data['photo'] = $img;
              $staffskt->update($data);
          }
          return redirect()->route('admin.staffskt.list')->with(['success' => 'Data Berhasil Disimpan!']);
        }catch(QueryException $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function delete(Request $request){
        try{
          $id = $request->input('id');
          $field = staffskt::find($id);
          $field->delete();
          return redirect()->route('admin.staffskt.list')->with(['success' => 'Data Berhasil Dihapus!']);
        }catch(\Exception $e){
          $error = $e->getMessage();
          return redirect()->route('admin.staffskt.list')->with(['error' => $error]);
        }
      }
  
      public function bindData($request)
      {
        if(!empty($request->id)){
            $get = staffskt::find($request->id);
        }
          $data = [
              'skretariat_id'    => $request->input('skretariat_id'),
              'name'        => $request->input('name'),
              'nip'         => $request->input('nip'),
              'golongan'    => $request->input('golongan'),
              'position'    => $request->input('position'),
              'birthplace'  => $request->input('birthplace'),
              'birthday'    => $request->input('birthday'),
              'phone'       => $request->input('phone'),
              'email'       => $request->input('email'),
              'address'     => $request->input('address'),
              'status'      => $request->input('status'),
              'kategori'    => $request->input('kategori'),
          ];
          return $data;
      }
   
}
