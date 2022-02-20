@extends('admin.layouts.app')

@section('title', 'Data Media Sosial')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Social Media</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><small><strong>Admin</strong></small></li>
            <li class="breadcrumb-item"><small><strong>Setting</strong></small></li>
            <li class="breadcrumb-item"><small><strong>Social Media</strong></small></li>
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
                <h3 class="card-title">Data Media Sosial</h3>
                <a href="{{route('admin.socmed.create')}}" class="btn btn-success float-right">
                  <i class="fas fa-plus-square"></i> Tambah Data
                </a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th colspan="2">Media Sosial</th>
                    <th>URL</th>
                    <th>Status</th>
                    <th>Aksi</th>
                  </tr>
                  </thead>
                  <tbody>
                    @php $i=1 @endphp
                    @foreach($list as $row)
                    <tr>
                      <td>{{ $i }}</td>
                      <td class="text-center"><i class="{{ $row->icon }}"></i></td>
                      <td>{{ $row->name }}</td>
                      <td>{{ $row->url }}</td>
                      <td>{{ $row->status }}</td>
                      <td>
                        <a href="{{route('admin.socmed.edit',['id' => $row->id])}}" class="btn btn-md btn-success btn-icon" title="Edit">
                          <i class="fas fa-edit"></i>
                        </a>
                        <a href="#" data-toggle="modal" data-target="#hapus{{$row->id}}" class="btn btn-md btn-danger btn-icon" title="Hapus">
                          <i class="fas fa-trash"></i>
                        </a>
                      </td>
                    </tr>
                    <!-- modal -->
                    <div class="modal fade" id="hapus{{$row->id}}">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 class="modal-title"><i class="fas fa-trash"></i>Hapus Data</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <p>
                              Apakah anda yakin untuk menghapus data " {{$row->name}} " ?
                            </p>
                          </div>
                          <div class="modal-footer">
                            <form id="hapus-data" action="{{ route('admin.socmed.delete') }}" method="POST" class="d-none">
                              @csrf
                              <input type="hidden" name="id" value="{{$row->id}}">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Tidak</button>
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
  $(function () {
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
@endsection