(function ($) {
    "use strict";
    // Roles data table
    // selet2
    var ss = $("#unit").select2({
        tags: true,
    });
    var sa = $("#kelas").select2({
        tags: true,
    });

    //subunit data table
    $(document).ready(function () {
        // select data option unit
        selectunit();
        selectkelas();

        var searchable = [];
        var selectable = [];

        var dTable = $("#subunit_table").DataTable({
            order: [],
            lengthMenu: [
                [10, 25, 50, 100, -1],
                [10, 25, 50, 100, "All"],
            ],
            processing: true,
            responsive: false,
            serverSide: true,
            processing: true,
            language: {
                processing:
                    '<i class="ace-icon fa fa-spinner fa-spin orange bigger-500" style="font-size:60px;margin-top:50px;"></i>',
            },
            scroller: {
                loadingIndicator: false,
            },
            pagingType: "full_numbers",
            dom:
                "<'row'<'col-sm-2'l><'col-sm-7 text-center'B><'col-sm-3'f>>tipr",
            ajax: {
                url: "subunit/get-list",
                type: "get",
            },
            columns: [
                /*{data:'serial_no', name: 'serial_no'},*/
                {
                    data: "kd_subunit",
                    name: "kd_subunit",
                    orderable: false,
                    searchable: false,
                },
                { data: "nama_subunit", name: "nama_subunit" },
                { data: "nama_unit", name: "nama_unit" },
                { data: "kelas", name: "kelas" },

                //only those have manage_user permission will get access
                { data: "action", name: "action" },
            ],
            buttons: [
                {
                    extend: "copy",
                    className: "btn-sm btn-info",
                    title: "Users",
                    header: false,
                    footer: true,
                    exportOptions: {
                        // columns: ':visible'
                    },
                },
                {
                    extend: "csv",
                    className: "btn-sm btn-success",
                    title: "Users",
                    header: false,
                    footer: true,
                    exportOptions: {
                        // columns: ':visible'
                    },
                },
                {
                    extend: "excel",
                    className: "btn-sm btn-warning",
                    title: "Users",
                    header: false,
                    footer: true,
                    exportOptions: {
                        // columns: ':visible',
                    },
                },
                {
                    extend: "pdf",
                    className: "btn-sm btn-primary",
                    title: "Users",
                    pageSize: "A2",
                    header: false,
                    footer: true,
                    exportOptions: {
                        // columns: ':visible'
                    },
                },
                {
                    extend: "print",
                    className: "btn-sm btn-default",
                    title: "Users",
                    // orientation:'landscape',
                    pageSize: "A2",
                    header: true,
                    footer: false,
                    orientation: "landscape",
                    exportOptions: {
                        // columns: ':visible',
                        stripHtml: false,
                    },
                },
            ],
            initComplete: function () {
                var api = this.api();
                api.columns(searchable).every(function () {
                    var column = this;
                    var input = document.createElement("input");
                    input.setAttribute(
                        "placeholder",
                        $(column.header()).text()
                    );
                    input.setAttribute(
                        "style",
                        "width: 140px; height:25px; border:1px solid whitesmoke;"
                    );

                    $(input)
                        .appendTo($(column.header()).empty())
                        .on("keyup", function () {
                            column
                                .search($(this).val(), false, false, true)
                                .draw();
                        });

                    $("input", this.column(column).header()).on(
                        "click",
                        function (e) {
                            e.stopPropagation();
                        }
                    );
                });

                api.columns(selectable).every(function (i, x) {
                    var column = this;

                    var select = $(
                        '<select style="width: 140px; height:25px; border:1px solid whitesmoke; font-size: 12px; font-weight:bold;"><option value="">' +
                            $(column.header()).text() +
                            "</option></select>"
                    )
                        .appendTo($(column.header()).empty())
                        .on("change", function (e) {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );
                            column
                                .search(val ? "^" + val + "$" : "", true, false)
                                .draw();
                            e.stopPropagation();
                        });

                    $.each(dropdownList[i], function (j, v) {
                        select.append(
                            '<option value="' + v + '">' + v + "</option>"
                        );
                    });
                });
            },
        });
    });
    $("select").select2();
})(jQuery);
function add() {
    console.log("add");
    var kd_subunit = $("#kd_subunit").val();
    var nama_subunit = $("#nama_subunit").val();
    var unit = $("#unit").val();
    var kelas = $("#kelas").val();

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr("content"),
        },
    });

    $.ajax({
        type: "POST",
        url: "/subunit/add",
        data: {
            kd_subunit: kd_subunit,
            nama_subunit: nama_subunit,
            unit: unit,
            kelas: kelas,
        },
        success: function (data) {
            if (data == "fail") {
                const toast = swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    padding: "2em",
                });

                toast({
                    type: "error",
                    title: " fail",
                    padding: "2em",
                });
            } else {
                const toast = swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    padding: "2em",
                });

                toast({
                    type: "success",
                    title: " successfully",
                    padding: "2em",
                });

                $("#subunit_table").DataTable().ajax.reload(null, false);
                $("#kd_subunit").val("");
                $("#nama_subunit").val("");
                $("#unit").val("");
                $("#unit").trigger("change");
                $("#kelas").val("");
                $("#kelas").trigger("change");
            }
        },
    });
    // $("#subunit_table").DataTable().ajax.reload(null, false);
}
// del

$("body").on("click", ".kd_subunit", function () {
    var kd_subunit = $(this).data("id");
    swal({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Delete",
        padding: "2em",
    }).then(function (result) {
        if (result.value) {
            $.ajaxSetup({
                headers: {
                    "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
            });
            $.ajax({
                type: "POST",
                url: "/subunit/delete",
                data: {
                    kd_subunit: kd_subunit,
                },
                success: function (data) {
                    if (data == "fail") {
                        const toast = swal.mixin({
                            toast: true,
                            position: "top-end",
                            showConfirmButton: false,
                            timer: 3000,
                            padding: "2em",
                        });
                        toast({
                            type: "error",
                            title: " fail",
                            padding: "2em",
                        });
                    } else {
                        swal(
                            "Deleted!",
                            "Your file has been deleted.",
                            "success"
                        );
                        $("#subunit_table")
                            .DataTable()
                            .ajax.reload(null, false);
                    }
                },
            });
        }
    });
    //
    // $("#subunit_table").DataTable().ajax.reload(null, false);
});

// get edit

$("body").on("click", ".edit", function () {
    var kd_subunit = $(this).data("id");
    var nama_subunit = $(this).data("nama");
    var unit = $(this).data("unit");
    var kelas = $(this).data("kelas");
    $("#kd_subunit").val(kd_subunit);
    $("#nama_subunit").val(nama_subunit);
    // select
    $("#unit").val(unit);
    $("#unit").trigger("change");
    $("#kelas").val(kelas);
    $("#kelas").trigger("change");

    $("#btn").html("EDIT");
    $("#btn").attr("onclick", "update()");
});
function update() {
    console.log("update");
    var kd_subunit = $("#kd_subunit").val();
    var nama_subunit = $("#nama_subunit").val();
    var unit = $("#unit").val();
    var kelas = $("#kelas").val();

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr("content"),
        },
    });

    $.ajax({
        type: "POST",
        url: "/subunit/update",
        data: {
            kd_subunit: kd_subunit,
            nama_subunit: nama_subunit,
            unit: unit,
            kelas: kelas,
        },
        success: function (data) {
            if (data == "fail") {
                const toast = swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    padding: "2em",
                });

                toast({
                    type: "error",
                    title: " fail",
                    padding: "2em",
                });
            } else {
                const toast = swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    padding: "2em",
                });

                toast({
                    type: "success",
                    title: " successfully",
                    padding: "2em",
                });

                $("#subunit_table").DataTable().ajax.reload(null, false);
                $("#kd_subunit").val("");
                $("#nama_subunit").val("");
                $("#unit").val("");
                $("#unit").trigger("change");
                $("#kelas").val("");
                $("#kelas").trigger("change");
                $("#btn").html("ADD");
                $("#btn").attr("onclick", "add()");
            }
        },
    });
}
function selectunit() {
    console.log("selsc");

    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr("content"),
        },
    });
    $.ajax({
        url: "/select/unit",
        method: "POST",
        data: {
            kd: "tes",
        },
        async: false,
        dataType: "json",
        success: function (data) {
            var html = "";
            var i;
            html += '<option value="">pilih</option>';
            for (i = 0; i < data.length; i++) {
                html +=
                    '<option value="' +
                    data[i].kd_unit +
                    '">( ' +
                    data[i].kd_unit +
                    " ) " +
                    data[i].nama_unit +
                    "</option>";
            }

            $("#unit").html(html);
        },
    });
}

function selectkelas() {
    $.ajaxSetup({
        headers: {
            "X-CSRF-TOKEN": jQuery('meta[name="csrf-token"]').attr("content"),
        },
    });
    $.ajax({
        url: "/select/kelas",
        method: "POST",
        data: {
            kd: "tes",
        },
        async: false,
        dataType: "json",
        success: function (data) {
            var html = "";
            var i;
            html += '<option value="">pilih</option>';
            for (i = 0; i < data.length; i++) {
                html +=
                    '<option value="' +
                    data[i].kd_kelas +
                    '">( ' +
                    data[i].kd_kelas +
                    " ) " +
                    data[i].kelas +
                    "</option>";
            }

            $("#kelas").html(html);
        },
    });
}
