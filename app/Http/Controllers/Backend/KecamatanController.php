<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Kecamatan;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\KecamatanImport;

class KecamatanController extends Controller
{
  //
  public function index()
  {
    try {
      $data['list'] = Kecamatan::orderBy('created_at', 'DESC')->get();
      return view('admin.bkbd.kecamatan.list', $data);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.bkbd.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function create()
  {
    try {
      return view('admin.bkbd.kecamatan.create');
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.bkbd.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function store(Request $request)
  {

    $validator = Validator::make($request->all(), [

      'name'    => 'required  | unique:kecamatans',

    ], [
      'name.unique' => 'nama kecamatan sudah diinputkan'
    ]);

    if ($validator->fails()) {
      return redirect()->back()->withInput()->with('error', $validator->messages()->first());
    }


    try {
      // $this->validasiForm($request);


      $data = [
        'name' => $request->name
      ];
      //   $data['created_by'] = Auth::user()->name;
      $kategori = Kecamatan::create($data);
      return redirect()->route('admin.kecamatan.list')->with(['success' => 'Data Berhasil Disimpan!']);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function edit($id)
  {
    try {
      $data['fetch'] = Kecamatan::where('id', $id)->first();
      return view('admin.bkbd.kecamatan.edit', $data);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function update(Request $request)
  {
    try {
      // $this->validasiForm($request);
      $id = $request->input('id');
      $data = ['name' => $request->name];

      $kecamatan = Kecamatan::findOrFail($id);
      $kecamatan->update($data);
      return redirect()->route('admin.kecamatan.list')->with(['success' => 'Data Berhasil Disimpan!']);
    } catch (QueryException $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function delete(Request $request)
  {
    try {
      $id = $request->input('id');
      $kecamatan = Kecamatan::find($id);
      $kecamatan->delete();
      return redirect()->route('admin.kecamatan.list')->with(['success' => 'Data Berhasil Dihapus!']);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.kecamatan.list')->with(['error' => $error]);
    }
  }

  public function bindData($request)
  {
    if (!empty($request->id)) {
      $tag = Kecamatan::find($request->id);
    }
    if (!empty($request->status)) {
      $status = $request->input('status');
    } else {
      $status = "show";
    }
    $data = [
      'name'    => $request->input('name'),
      'slug'    => Str::slug($request->input('name')),
      'status'  => $status
    ];
    return $data;
  }
  // import

  public function import(Request $request)
  {

    $file = $request->file('file');
    $nameFile = $file->getClientOriginalName();
    $file->move('DataKecamatan', $nameFile);

    Excel::import(new KecamatanImport, public_path('/DataKecamatan/' . $nameFile));

    return redirect()->route('admin.kecamatan.list')->with(['success' => 'Data Berhasil Diimport!']);
    // return redirect('/')->with('success', 'All good!');
  }
}
