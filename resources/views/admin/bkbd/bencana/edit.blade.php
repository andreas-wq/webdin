@extends('admin.layouts.app')

@section('title', 'Sunting Data Bencana')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1> Data Bencana</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><small><strong>Data</strong></small></li>
                        <li class="breadcrumb-item"><small><strong>Bencana</strong></small></li>
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
                            <h3 class="card-title"><strong>Sunting Data Bencana</strong></h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form role="form" action="{{ route('admin.bencana.update') }}" id="quickForm" method="post">
                            @csrf
                            <div class="card-body">
                                <div class="row">
                                    <input type="hidden" name="id" class="form-control" id="id" value="{{$fetch->id}}">
                              
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="kecamatan_id">Lokasi</label>
                                            <select class="form-control select2  " name="desa_id"
                                                style="width: 100%;       height: 38px!important;">
                                                <option value="">cari lokasi</option>
                                                @foreach($desa as $list)
                                                <option value="{{$list->id}}" @if($list->id == $fetch->desa_id)
                                                    selected
                                                    @endif>Desa {{$list->name}} | Kecamatan :
                                                    {{$list->kecamatan->name}}</option>
                                                @endforeach
                                            </select>
        
                                        </div>
                                        <div class="form-group">
                                            <label for="kecamatan_id">Jenis Bencana</label>
                                            <select class="form-control select2bs4" name="jb_id" style="width: 100%;">
                                               
                                                @foreach($jenis_bencana as $list)
                                                <option value="{{$list->id}}" @if($list->id == $fetch->jb_id)
                                                    selected
                                                    @endif>{{$list->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Tanggal Kejadian</label>
                                            <input type="date" name="tgl_bencana" class="form-control" id="name"
                                                placeholder="Masukkan Nama Kecamatan Baru" value="{{ $fetch->tgl_bencana }}">
                                        </div>
        
                                    </div>
                                    <div class="col-md-12">
                                       <div class="card card-success">
                                        <div class="card-header">
                                            <h3 class="card-title"><strong>Akibat Bencana</strong></h3>
                                        </div>
                                        <div class="card-body text-center ">
                                            <table class="table table-sm table-bordered ">
                                                <thead>
                                                    <tr>
                                                        <th colspan="7" class="bg-dark">Manusia</th>
                                                    </tr>
                                                  <tr>
                                                    <th scope="col" colspan="2">Mengungsi</th>
                                                    <th scope="col" rowspan="2" class="align-middle">HLG</th>
                                                    <th scope="col" rowspan="2" class="align-middle">MD</th>
                                                    <th scope="col" rowspan="2" class="align-middle">LK</th>
                                                    <th scope="col" colspan="2">Terdampak</th>
                                                  </tr>
                                                  <th scope="col">KK</th>
                                                  <th scope="col">JW</th>
                                                  {{-- <th scope="col">MD</th> --}}
                                                  <th scope="col">KK</th>
                                                  <th scope="col">JW</th>
                                                  
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th><input type="text" class="" name="m_mkk"value="{{ $fetch->m_mkk }}" size="2"></th>
                                                        <th><input type="text" class=""name="m_mjw" value="{{ $fetch->m_mjw }}"size="2"></th>
                                                        <th><input type="text" class=""name="m_hlg" value="{{ $fetch->m_hlg }}"size="2"></th>
                                                        <th><input type="text" class=""name="m_md" value="{{ $fetch->m_md }}"size="2"></th>
                                                        <th><input type="text" class=""name="m_lk" value="{{ $fetch->m_lk }}"size="2"></th>
                                                        <th><input type="text" class=""name="m_tkk" value="{{ $fetch->m_tkk }}"size="2"></th>
                                                        <th><input type="text" class=""name="m_tjw" value="{{ $fetch->m_tjw }}"size="2"></th>
                                                     
    
                                                      </tr>
                                                </tbody>
                                              </table>
                                              
                                              <table class="table table-sm table-bordered ">
                                                <thead>
                                                    <tr>
                                                        <th colspan="5" class="bg-dark">Rumah</th>
                                                    </tr>
                                                  <tr>
                                                    <th scope="col" >HCR</th>
                                                  
                                                    <th scope="col" >RB</th>
                                                    <th scope="col" >RS</th>
                                                    <th scope="col" >RR</th>
                                                    <th scope="col" >TRC</th>
                                            
                                                  </tr>
                                                
                                                  
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th><input type="text" class="ss" name="r_hcr"value="{{ $fetch->r_hcr }}" size="2"></th>
                                                        <th><input type="text" class="ss"name="r_rb"value="{{ $fetch->r_rb }}" size="2"></th>
                                                        <th><input type="text" class=""  name="r_rs"value="{{ $fetch->r_rs }}"size="2"></th>
                                                        <th><input type="text" class="" name="r_rr"value="{{ $fetch->r_rr }}"size="2"></th>
                                                        <th><input type="text" class="" name="r_trc"value="{{ $fetch->r_trc }}"size="2"></th>
                                                      
                                                      </tr>
                                                </tbody>
                                              </table>

                                              {{-- DAMPAK LAIN --}}
                                              <table class="table table-sm table-bordered ">
                                                <thead>
                                                    <tr>
                                                        <th colspan="9" class="bg-dark">SARANA LAIN</th>
                                                    </tr>
                                                  <tr>
                                                    <th scope="col" rowspan="2" class="align-middle" >TRD</th>
                                                  
                                                    <th scope="col" rowspan="2" class="align-middle" >SKL</th>
                                                    <th scope="col"rowspan="2" class="align-middle" >TI</th>
                                                    <th scope="col" rowspan="2" class="align-middle">SWH(Ha)</th>
                                                    <th scope="col" rowspan="2" class="align-middle">DRT</th>
                                                    <th scope="col" rowspan="2" class="align-middle" >EMPG</th>
                                                    <th scope="col"colspan="3" >JALAN</th>
                                            
                                                  </tr>
                                                  <tr>
                                                    <th scope="col" >TRD</th>
                                                    <th scope="col" >TRC</th>
                                                    <th scope="col" >PTS</th>
                                                  </tr>
                                                
                                                  
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th><input type="text" class="ss" name="sl_trd" value="{{ $fetch->sl_trd }}" size="2"></th>
                                                        <th><input type="text" class="ss"name="sl_skl" value="{{ $fetch->sl_skl }}" size="2"></th>
                                                        <th><input type="text" class="" name="sl_ti" value="{{ $fetch->sl_ti }}" size="2"></th>
                                                        <th><input type="text" class=""name="sl_swh" value="{{ $fetch->sl_swh }}" size="2"></th>
                                                        <th><input type="text" class="" name="sl_drt"value="{{ $fetch->sl_drt }}" size="2"></th>
                                                        <th><input type="text" class=""name="sl_empg" value="{{ $fetch->sl_empg }}" size="2"></th>
                                                        <th><input type="text" class=""name="sl_jtrd" value="{{ $fetch->sl_jtrd }}" size="2"></th>
                                                        <th><input type="text" class="" name="sl_jtrc"value="{{ $fetch->sl_jtrc }}" size="2"></th>
                                                        <th><input type="text" class="" name="sl_pts"value="{{ $fetch->sl_pts }}" size="2"></th>
                                                      
                                                      </tr>
                                                </tbody>
                                              </table>
                                        </div>

                                       </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Keterangan</label>
                                            <textarea class="form-control" name="keterangan" id="exampleFormControlTextarea1" rows="3">{{ $fetch->keterangan }}</textarea>
                                          </div>
                                    </div>
                                </div>
                            
                            </div>
                   

                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="submit" name="submit" id="submit" class="btn btn-success float-right"><i
                                class="fas fa-plus-square"></i>&nbsp;&nbsp;Simpan</button>
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
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css"
    integrity="sha512-kq3FES+RuuGoBW3a9R2ELYKRywUEQv0wvPTItv3DSGqjpbNtGWVdvT8qwdKkqvPzT93jp8tSF4+oN4IeTEIlQA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.css"
    integrity="sha512-CbQfNVBSMAYmnzP3IC+mZZmYMP2HUnVkV4+PwuhpiMUmITtSpS7Prr3fNncV1RBOnWxzz4pYQ5EAGG4ck46Oig=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="/path/to/select2.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ttskch/select2-bootstrap4-theme@x.x.x/dist/select2-bootstrap4.min.css">
@endsection

@section('bottom-resource')
<!-- jquery-validation -->
<script src="{{asset('backend/plugins/jquery-validation/jquery.validate.min.js')}}"></script>
<script src="{{asset('backend/plugins/jquery-validation/additional-methods.min.js')}}"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // $('.select2').select2({
    //     placeholder: "Cari Lokasi",

    // });
    $(".select2").select2({
        theme: 'bootstrap4',
        placeholder: "cari lokasi",

    });


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
<script>

</script>
@endsection

@section('top-resource')
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<style>
    .table td {
   text-align: center;   
   .ss{
  width: 20px
   }
}
</style>
@endsection