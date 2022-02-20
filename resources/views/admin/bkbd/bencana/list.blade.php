@extends('admin.layouts.app')

@section('title', 'Data bencana')

@section('content')
<!-- Lokasi Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Lokasi Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Data Bencana</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><small><strong>Data</strong></small></li>
                        <li class="breadcrumb-item"><small><strong>Bencana</strong></small></li>
                        <li class="breadcrumb-item active"><small><strong>List</strong></small></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Data bencana Terbaru</h3>
                            <a href="{{route('admin.bencana.create')}}" class="btn btn-success float-right">
                                <i class="fas fa-plus-square"></i> Tambah Data
                            </a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kecamatan</th>
                                        <th>Desa</th>
                                        <th>Tanggal Kejadian</th>
                                        <th>Jenis Bencana</th>


                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $i=1 @endphp
                                    @foreach($list as $row)
                                    <tr>
                                        <td>{{ $i }}</td>
                                        <td>{{ $row->kecamatan->name }}</td>
                                        <td>{{ $row->desa->name}}</td>
                                        <td>
                                            {{\Carbon\Carbon::parse($row->tgl_bencana)->translatedFormat('d F Y')}}
                                            
                                          </td>
                                        <td>{{ $row->jenis_bencana->name }}</td>

                                        <td>
                                            <a href="{{route('admin.bencana.edit',['id' => $row->id])}}"
                                                class="btn btn-md btn-success btn-icon" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="#" data-id="{{ $row->id }}"
                                                class="btn btn-md btn-success btn-icon detail" title="Detail">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="#" data-toggle="modal" data-target="#hapus{{$row->id}}"
                                                class="btn btn-md btn-danger btn-icon" title="Hapus">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- modal -->
                                    <div class="modal fade" id="hapus{{$row->id}}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><i class="fas fa-sign-out"></i>Hapus Data
                                                    </h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>
                                                        Apakah anda yakin untuk menghapus data " {{$row->name}} " ?
                                                    </p>
                                                </div>
                                                <div class="modal-footer">
                                                    <form id="hapus-data" action="{{ route('admin.bencana.delete') }}"
                                                        method="POST" class="d-none">
                                                        @csrf
                                                        <input type="hidden" name="id" value="{{$row->id}}">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Tidak</button>
                                                        <button type="submit" class="btn btn-danger">Iya</button>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    @php $i++ @endphp
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
@endsection

@section('top-resource')

<meta name="csrf-token" content="{{ csrf_token() }}">
<!-- DataTables -->

<link rel="stylesheet" href="{{asset('backend/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('backend/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
@endsection

@section('bottom-resource')
<!-- DataTables -->
<script src="{{asset('backend/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('backend/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('backend/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('backend/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script>
$(function() {
    $("#example1").DataTable({
        "responsive": true,
        "autoWidth": false,
    });
    $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
    });
});
</script>
{{-- detail --}}
<script>
      "use strict";
$("body").on("click", ".detail", function () {
    var id = $(this).data("id");
    console.log(id);

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr("content"),
        },
    });

    $.ajax({
        type: "POST",
        url: "/admin/bencana/detail",
        data: {
            id: id,
         
        },
        success: function (data) {
           console.log(data.id);
           console.log(data.desa.name);

         
            }
       
    });
   
});
</script>
@endsection