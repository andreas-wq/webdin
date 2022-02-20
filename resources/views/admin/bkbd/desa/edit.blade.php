@extends('admin.layouts.app')

@section('title', 'Sunting Lokasi')

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
                        <li class="breadcrumb-item"><small><strong>Lokasi</strong></small></li>
                        <li class="breadcrumb-item"><small><strong>Desa</strong></small></li>
                        <li class="breadcrumb-item active"><small><strong>Edit</strong></small></li>
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
                            <h3 class="card-title"><strong>Sunting Data Desa</strong></h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form role="form" action="{{ route('admin.desa.update') }}" id="quickForm" method="post">
                            @csrf
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Nama Desa</label>
                                    <input type="hidden" name="id" class="form-control" id="id" value="{{$fetch->id}}">
                                    <input type="text" name="name" class="form-control" id="name"
                                        value="{{$fetch->name}}">
                                </div>

                        
                            <div class="form-group">
                                <label for="kecamatan_id">Kecamatan</label>
                                <select class="form-control select2bs4 select2" name="kecamatan_id" style="width: 100%;">
                                    {{--@foreach($kecamatan as $list)
                        <option value="{{$list->id}}">{{$list->name}}</option>
                                    @endforeach--}}

                                    @foreach ($kecamatan as $c)
                                    <option value="{{$c->id}}" @if($c->id == $fetch->kecamatan_id)
                                        selected
                                        @endif
                                        >{{$c->name}}</option>
                                    @endforeach

                                </select>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="submit" class="btn btn-success float-right"><i
                                        class="fas fa-save"></i>&nbsp;&nbsp;Simpan</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
                <!--/.col (left) -->
                <!-- right column -->
                <div class="col-md-6">

                </div>
                <!--/.col (right) -->
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

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $(".select2").select2({
        placeholder: "cari lokasi",

    });
    // $.validator.setDefaults({
    //     submitHandler: function() {
    //         //alert( "Form successful submitted!" );
    //         $('#quickForm').submit();
    //         console.log("Submitted!");
    //     }
    // });
    // $('#quickForm').validate({
    //     rules: {
    //         name: {
    //             required: true,
    //         }
    //     },
    //     messages: {
    //         name: {
    //             required: "&nbsp;" + "Kolom tidak boleh kosong, masukkan nama kategori",
    //         }
    //     },
    //     errorElement: 'span',
    //     errorPlacement: function(error, element) {
    //         error.addClass('invalid-feedback');
    //         element.closest('.form-group').append(error);
    //     },
    //     highlight: function(element, errorClass, validClass) {
    //         $(element).addClass('is-invalid');
    //     },
    //     unhighlight: function(element, errorClass, validClass) {
    //         $(element).removeClass('is-invalid');
    //     }
    // });
});
</script>
@endsection

@section('top-resource')
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
@endsection