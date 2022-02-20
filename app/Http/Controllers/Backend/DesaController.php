<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Desa;
use App\Models\Kecamatan;

use Maatwebsite\Excel\Facades\Excel;
use App\Imports\DesaImport;

class DesaController extends Controller
{
  //
  public function index()
  {
    try {
      $data['list'] = Desa::orderBy('created_at', 'DESC')->get();
      return view('admin.bkbd.desa.list', $data);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.bkbd.desa.list')->with(['error' => $error]);
    }
  }
  public function create()
  {
    try {
      $data['kecamatan'] = Kecamatan::all();

      return view('admin.bkbd.desa.create', $data);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.desa.list')->with(['error' => $error]);
    }
  }

  public function store(Request $request)
  {
    try {
      // $this->validasiForm($request);
      $data = [
        'name' => $request->name,
        'kecamatan_id' => $request->kecamatan_id
      ];
      //   $data['created_by'] = Auth::user()->name;
      $kategori = Desa::create($data);
      return redirect()->route('admin.desa.list')->with(['success' => 'Data Berhasil Disimpan!']);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.desa.list')->with(['error' => $error]);
    }
  }

  public function edit($id)
  {
    try {
      $data['kecamatan'] = Kecamatan::all();
      $data['fetch'] = Desa::where('id', $id)->first();
      return view('admin.bkbd.desa.edit', $data);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.desa.list')->with(['error' => $error]);
    }
  }

  public function update(Request $request)
  {
    try {
      // $this->validasiForm($request);
      $id = $request->input('id');
      $data = [
        'name' => $request->name,
        'kecamatan_id' => $request->kecamatan_id,
      ];

      $desa = Desa::findOrFail($id);
      $desa->update($data);
      return redirect()->route('admin.desa.list')->with(['success' => 'Data Berhasil Disimpan!']);
    } catch (QueryException $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.desa.list')->with(['error' => $error]);
    }
  }

  public function delete(Request $request)
  {
    try {
      $id = $request->input('id');
      $desa = Desa::find($id);
      $desa->delete();
      return redirect()->route('admin.desa.list')->with(['success' => 'Data Berhasil Dihapus!']);
    } catch (\Exception $e) {
      $error = $e->getMessage();
      return redirect()->route('admin.desa.list')->with(['error' => $error]);
    }
  }

  public function bindData($request)
  {
    if (!empty($request->id)) {
      $tag = Desa::find($request->id);
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


  public function import(Request $request)
  {

    $file = $request->file('file');
    $nameFile = $file->getClientOriginalName();
    $file->move('DataDesa', $nameFile);

    Excel::import(new DesaImport, public_path('/DataDesa/' . $nameFile));

    return redirect()->route('admin.desa.list')->with(['success' => 'Data Berhasil Diimport!']);
    // return redirect('/')->with('success', 'All good!');
  }
}
