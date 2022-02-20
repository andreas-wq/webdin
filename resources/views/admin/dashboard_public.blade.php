@extends('admin.layouts.app')

@section('title', 'Dashboard Admin')

@section('content')
<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Dashboard</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

        <!-- Small boxes (Stat box) -->

        <div class="row">
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{$bencana_count}}</h3>
                        <p>Jumlah Bencana</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-document"></i>
                    </div>
                    <!-- <a href="{{route('admin.article.list')}}" class="small-box-footer">More info <i
                            class="fas fa-arrow-circle-right"></i></a> -->
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h3>{{$lokasi->name}}</h3>
                        <p>Lokasi Rawan Bencana</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-document"></i>
                    </div>
                    <!-- <a href="{{route('admin.agenda.list')}}" class="small-box-footer">More info <i
                            class="fas fa-arrow-circle-right"></i></a> -->
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-4 col-6">
                <!-- small box -->
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>{{$jb->name}}</h3>
                        <p>Bencana Sering Terjadi</p>

                    </div>
                    <div class="icon">
                        <i class="ion ion-document"></i>
                    </div>
                    <!-- <a href="{{route('admin.announcement.list')}}" class="small-box-footer">More info <i
                            class="fas fa-arrow-circle-right"></i></a> -->
                </div>
            </div>

            <div class="col-lg-7">

                <section class="col-lg-12 connectedSortable ui-sortable">

                    <div class="card">
                        <div class="card-header ui-sortable-handle" style="cursor: move;">
                            <h3 class="card-title">
                                <i class="fas fa-chart mr-1"></i>
                                Grafik Data Bencana 2021

                        </div>
                        <div class="card-body">
                            <div class="tab-content p-0">
                                <div id="chart">

                                </div>

                            </div>
                        </div>
                    </div>






                </section>

            </div>
            <div class="col-lg-5">

                <section class="col-lg-12 connectedSortable ui-sortable">

                    <div class="card">
                        <div class="card-header ui-sortable-handle" style="cursor: move;">
                            <h3 class="card-title">
                                <i class="fas fa-chart mr-1"></i>
                                Grafik Data Lokasi 2021

                        </div>
                        <div class="card-body">
                            <div class="tab-content p-0">
                                <div id="pie">

                                </div>

                            </div>
                        </div>
                    </div>






                </section>

            </div>


            <?php $data='nama';?>

        </div>
        <hr>


    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endsection

@section('top-resource')
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto);
/* 
body {
  font-family: Roboto, sans-serif;
}

#chart {
  max-width: 650px;
  margin: 35px auto;
} */
</style>
@endsection

@section('bottom-resource')
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<!-- grafik pie -->
<script>
var options = {
    series: {!!json_encode($nilai)!!},
    chart: {
        width: 380,
        type: 'pie',
    },
    labels: {!!json_encode($label)!!},
    responsive: [{
        breakpoint: 480,
        options: {
            chart: {
                width: 200
            },
            legend: {
                position: 'bottom'
            }
        }
    }]
};


var chart = new ApexCharts(document.querySelector("#pie"), options);
chart.render();
</script>


<script>
var options = {
    series: {!!json_encode($series) !!},
    chart: {
        type: 'bar',
        height: 350
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false
    },
    stroke: {
        show: true,
        width: 2,
        colors: ['transparent']
    },
    xaxis: {
        categories: ['Data Bencana Subang 2021'],
    },
    yaxis: {
        title: {
            text: ''
        }
    },
    fill: {
        opacity: 1
    },
    tooltip: {
        y: {
            formatter: function(val) {
                return "" + val + ""
            }
        }
    }
};

var chart = new ApexCharts(document.querySelector("#chart"), options);
chart.render();
</script>
@endsection