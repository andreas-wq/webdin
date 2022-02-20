<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Jenis_bencana;

class Jenis_bencanaController extends Controller
{
    //
    public function index()
    {
        try {
            $data['list'] = Jenis_bencana::orderBy('created_at', 'DESC')->get();
            return view('admin.bkbd.jenis_bencana.list', $data);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bkbd.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function create()
    {
        try {
            return view('admin.bkbd.jenis_bencana.create');
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bkbd.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function store(Request $request)
    {
        try {
            // $this->validasiForm($request);
            $data = [
                'name' => $request->name
            ];
            //   $data['created_by'] = Auth::user()->name;
            $kategori = jenis_bencana::create($data);
            return redirect()->route('admin.jenis_bencana.list')->with(['success' => 'Data Berhasil Disimpan!']);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function edit($id)
    {
        try {
            $data['fetch'] = Jenis_bencana::where('id', $id)->first();
            return view('admin.bkbd.jenis_bencana.edit', $data);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function update(Request $request)
    {
        try {
            // $this->validasiForm($request);
            $id = $request->input('id');
            $data = ['name' => $request->name];

            $jenis_bencana = Jenis_bencana::findOrFail($id);
            $jenis_bencana->update($data);
            return redirect()->route('admin.jenis_bencana.list')->with(['success' => 'Data Berhasil Disimpan!']);
        } catch (QueryException $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function delete(Request $request)
    {
        try {
            $id = $request->input('id');
            $jenis_bencana = Jenis_bencana::find($id);
            $jenis_bencana->delete();
            return redirect()->route('admin.jenis_bencana.list')->with(['success' => 'Data Berhasil Dihapus!']);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.jenis_bencana.list')->with(['error' => $error]);
        }
    }

    public function bindData($request)
    {
        if (!empty($request->id)) {
            $tag = Jenis_bencana::find($request->id);
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
}
