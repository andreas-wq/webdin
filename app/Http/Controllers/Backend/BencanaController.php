<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bencana;
use App\Models\Kecamatan;
use App\Models\Desa;
use App\Models\Jenis_bencana;

use Illuminate\Support\Facades\Response;


class BencanaController extends Controller
{
    //
    public function index()
    {
        try {
            $data['list'] = bencana::orderBy('created_at', 'DESC')->with(['desa', 'kecamatan', 'jenis_bencana'])->get();
            return view('admin.bkbd.bencana.list', $data);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bkbd.bencana.list')->with(['error' => $error]);
        }
    }
    public function create()
    {
        try {
            $data['kecamatan'] = Kecamatan::all();
            $data['jenis_bencana'] = Jenis_bencana::all();
            $data['desa'] = Desa::all();

            return view('admin.bkbd.bencana.create', $data);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bencana.list')->with(['error' => $error]);
        }
    }

    public function store(Request $request)
    {
        try {

            $desa = Desa::find($request->desa_id);


            // $this->validasiForm($request);
            $data = [

                'kecamatan_id' => $desa->kecamatan_id,
                'desa_id' => $request->desa_id,
                'jb_id' => $request->jb_id,
                'tgl_bencana' => $request->tgl_bencana,
                // AKIBAT BENCANA 
                'm_mkk' => $request->m_mkk,
                'm_mjw' => $request->m_mjw,
                'm_hlg' => $request->m_hlg,
                'm_md' => $request->m_md,
                'm_lk' => $request->m_lk,
                'm_tkk' => $request->m_tkk,
                'm_tjw' => $request->m_tjw,

                'r_hcr' => $request->r_hcr,
                'r_rb' => $request->r_rb,
                'r_rs' => $request->r_rs,
                'r_rr' => $request->r_rr,
                'r_trc' => $request->r_trc,

                'sl_trd' => $request->sl_trd,
                'sl_skl' => $request->sl_skl,
                'sl_ti' => $request->sl_ti,
                'sl_swh' => $request->sl_swh,
                'sl_drt' => $request->sl_drt,
                'sl_empg' => $request->sl_empg,
                'sl_jtrd' => $request->sl_jtrd,
                'sl_jtrc' => $request->sl_jtrc,
                'sl_pts' => $request->sl_pts,

                'keterangan' => $request->keterangan,



            ];
            //   $data['created_by'] = Auth::user()->name;
            $kategori = Bencana::create($data);
            return redirect()->route('admin.bencana.list')->with(['success' => 'Data Berhasil Disimpan!']);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bencana.list')->with(['error' => $error]);
        }
    }

    public function edit($id)
    {
        try {
            $data['kecamatan'] = Kecamatan::all();
            $data['jenis_bencana'] = Jenis_bencana::all();
            $data['desa'] = Desa::all();
            $data['fetch'] = bencana::with(['desa', 'kecamatan', 'jenis_bencana'])->where('id', $id)->first();
            return view('admin.bkbd.bencana.edit', $data);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bencana.list')->with(['error' => $error]);
        }
    }

    public function update(Request $request)
    {
        try {
            $desa = Desa::find($request->desa_id);
            // $this->validasiForm($request);
            $id = $request->input('id');
            $data = [
                'kecamatan_id' => $desa->kecamatan_id,
                'desa_id' => $request->desa_id,
                'jb_id' => $request->jb_id,
                'tgl_bencana' => $request->tgl_bencana,
                // AKIBAT BENCANA 
                'm_mkk' => $request->m_mkk,
                'm_mjw' => $request->m_mjw,
                'm_hlg' => $request->m_hlg,
                'm_md' => $request->m_md,
                'm_lk' => $request->m_lk,
                'm_tkk' => $request->m_tkk,
                'm_tjw' => $request->m_tjw,

                'r_hcr' => $request->r_hcr,
                'r_rb' => $request->r_rb,
                'r_rs' => $request->r_rs,
                'r_rr' => $request->r_rr,
                'r_trc' => $request->r_trc,

                'sl_trd' => $request->sl_trd,
                'sl_skl' => $request->sl_skl,
                'sl_ti' => $request->sl_ti,
                'sl_swh' => $request->sl_swh,
                'sl_drt' => $request->sl_drt,
                'sl_empg' => $request->sl_empg,
                'sl_jtrd' => $request->sl_jtrd,
                'sl_jtrc' => $request->sl_jtrc,
                'sl_pts' => $request->sl_pts,

                'keterangan' => $request->keterangan,
            ];

            $bencana = Bencana::findOrFail($id);
            $bencana->update($data);
            return redirect()->route('admin.bencana.list')->with(['success' => 'Data Berhasil Disimpan!']);
        } catch (QueryException $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bencana.list')->with(['error' => $error]);
        }
    }

    public function delete(Request $request)
    {
        try {
            $id = $request->input('id');
            $bencana = bencana::find($id);
            $bencana->delete();
            return redirect()->route('admin.bencana.list')->with(['success' => 'Data Berhasil Dihapus!']);
        } catch (\Exception $e) {
            $error = $e->getMessage();
            return redirect()->route('admin.bencana.list')->with(['error' => $error]);
        }
    }

    public function bindData($request)
    {
        if (!empty($request->id)) {
            $tag = bencana::find($request->id);
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
    public function detail(Request $request)
    {
        //
        $data = bencana::with(['desa', 'kecamatan', 'jenis_bencana'])->where('id', $request->id)->first();



        return Response::json($data);
    }
}
