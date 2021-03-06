@extends('admin.layouts.app')

@section('title', 'Tambah Kategori')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Lokasi</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><small><strong>BKBD</strong></small></li>
                        <li class="breadcrumb-item"><small><strong>Lokasi</strong></small></li>
                        <li class="breadcrumb-item active"><small><strong>Add</strong></small></li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- jquery validation -->
                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title"><strong>Tambahkan Data Kategori</strong></h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="quickForm" action="{{route('admin.category.add')}}" method="POST">
                            {{csrf_field()}}
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Nama Kategori</label>
                                    <input type="text" name="name" class="form-control" id="name"
                                        placeholder="Masukkan Nama Kategori Baru">
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" name="submit" id="submit" class="btn btn-success float-right"><i
                                        class="fas fa-plus-square"></i>&nbsp;&nbsp;Tambah</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (left) -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
@endsection

@section('top-resource')

@endsection

@section('bottom-resource')
<!-- jquery-validation -->
<script src="{{asset('backend/plugins/jquery-validation/jquery.validate.min.js')}}"></script>
<script src="{{asset('backend/plugins/jquery-validation/additional-methods.min.js')}}"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#quickForm').validate({
        rules: {
            name: {
                required: true,
            }
        },
        messages: {
            name: {
                required: "&nbsp;" + "Kolom tidak boleh kosong, masukkan nama kategori",
            }
        },
        errorElement: 'span',
        errorPlacement: function(error, element) {
            error.addClass('invalid-feedback');
            element.closest('.form-group').append(error);
        },
        highlight: function(element, errorClass, validClass) {
            $(element).addClass('is-invalid');
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).removeClass('is-invalid');
        },
        submitHandler: function(form) {
            $('#submit').attr('disabled', 'disabled');
            form.submit();
        }
    });
});
</script>
@endsection

@section('top-resource')
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
@endsection