<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Storage;
use App\Models\Profile;
use App\Models\Website;
use Str;
use Auth;

class ProfileController extends Controller
{

    public function index(){
      try{
        $data['list'] = Profile::orderBy('created_at', 'DESC')->get();
        return view('admin.profil.list', $data);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function show($id){
      try{
        $data['fetch'] = Profile::where('id', $id)->first();
        return view('admin.profil.detail', $data);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function create(){
      try{
        return view('admin.profil.create');
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function store(Request $request){
      try{
        //upload image
        if(!empty($request->file('img'))){
          $image = $request->file('img');          
          $extension = $image->getClientOriginalExtension();
          $img = \Carbon\carbon::now()->translatedFormat('dmY').'-('.Str::slug($request->title).').'.$extension;
          $image->storeAs('storage/profile/images', $img);
        } else {
          $img = null;
        }
        //upload file
        if(!empty($request->file('file'))){
          $berkas = $request->file('file');          
          $extension = $berkas->getClientOriginalExtension();
          $file = \Carbon\carbon::now()->translatedFormat('dmY').'-('.Str::slug($request->title).').'.$extension;
          $berkas->storeAs('storage/profile/files', $file);
        } else {
          $file = null;
        }
        $data = $this->bindData($request);
        $data['img'] = $img;
        $data['file'] = $file;
        $data['created_by'] = Auth::user()->name;
        $store = Profile::create($data);
        return redirect()->route('admin.profile.list')->with(['success' => 'Data Berhasil Ditambahkan!']);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function edit($id){
      try{
        $data['fetch'] = Profile::where('id', $id)->first();
        return view('admin.profil.edit', $data);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function update(Request $request){
      try{
        $id = $request->input('id');   
        $profil = Profile::where('id', $id)->first();
        //upload gambar
        if( $request->file('img') == '' ) {
          if($profil->img){
            $img = $profil->img;
          }else{
            $img = null;
          }
        } else {
          $image = $request->file('img');
          $extension = $image->getClientOriginalExtension();
          $img = \Carbon\carbon::now()->translatedFormat('dmY').'-('.Str::slug($request->title).').'.$extension;
          $baseimage = basename($profil->img);
          $imagepic = Storage::disk('local')->delete('storage/profile/images/'.$baseimage);
          $image->storeAs('storage/profile/images/', $img);
        }
        //upload file
        if( $request->file('file') == '' ) {
          if($profil->file){
            $file = $profil->file;
          }else{
            $file = null;
          }
        } else {
          $berkas = $request->file('file');          
          $extension = $berkas->getClientOriginalExtension();
          $file = \Carbon\carbon::now()->translatedFormat('dmY').'-('.Str::slug($request->title).').'.$extension;
          $basefile = basename($profil->file);
          $doc = Storage::disk('local')->delete('storage/profile/files/'.$basefile);
          $berkas->storeAs('storage/profile/files/', $file);
        }
        $data = $this->bindData($request);
        $data['img'] = $img;
        $data['file'] = $file;
        $data['updated_by'] = Auth::user()->name;
        $profil->update($data);
        return redirect()->route('admin.profile.list')->with(['success' => 'Data Berhasil Disimpan!']);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function delete(Request $request){
      try{
        $id = $request->input('id');
        $catch = Profile::findOrFail($id);
        $catch->delete();
        return redirect()->route('admin.profile.list')->with(['success' => 'Data Berhasil Dihapus!']);
      }catch(\Exception $e){
        $error = $e->getMessage();
        return redirect()->back()->with(['error'=>$error]);
      }
    }

    public function bindData($request){
      if(!empty($request->id)){
        $get = Profile::find($request->id);
    }
      $data = [            
          'title'       => $request->input('title'),
          'slug'        => Str::slug($request->input('title')),          
          'description' => $request->input('description'),           
          'status'      => $request->input('status'),
      ];
      return $data;
    }
    
}
