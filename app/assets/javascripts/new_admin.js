$(document).ready(function () {
    $('body.admin aside#adminSide nav ul li').hover(function () {
        $(this).children('ul').show();
    }, function () {
        $(this).children('ul').hide();
    });
    $('body.admin textarea').ready(function () {
        tinyMCE.init({
            mode: 'textareas',
            theme: 'advanced',
            plugins: "autolink,advlist,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
            theme_advanced_buttons1: "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2: "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,media,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            object_resizing: false,
            relative_urls: false,
            editor_deselector: "mceNoEditor"
        });
    });
    $("table.datatable").each(function () {
        var columnSorts = [];

        $.each($(this).find("thead tr th"), function (index, value) {
            if ($(value).attr("data-sortable") == "false") {
                columnSorts.push({"bSortable": false});
            } else {
                if ($(value).attr("data-sort-type") != null) {
                    columnSorts.push({"sType": "date"});
                } else {
                    if ($(value).attr("hidden-column") == "true") {
                        columnSorts.push({"bVisible": false, "aTargets": 2});
                    } else {
                        columnSorts.push(null);
                    }
                }
            }
        });

        var columnsToSortBy = [
            [0, 'asc']
        ];
        if (sortingColumn = parseInt($(this).attr("data-column-to-sort-by"))) {
            columnsToSortBy = [
                [sortingColumn, 'desc']
            ];
        }

        var options = {
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": parseInt($(this).attr("data-display-count")) || 25,
            "aoColumns": columnSorts,
            "aaSorting": columnsToSortBy,
            "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                var temp
                if (iDisplayIndex % 2 == 1) {
                    temp = "odd"
                }
                else {
                    temp = "even"
                }
                var open
                if (aData[11] >= 1) {
                    open = " open"
                }
                else {
                    open = ""
                }

                nRow.className = temp + open;
                return nRow;
            }

        };

        var ajax_source = $(this).attr("data-ajax-source");
        if (ajax_source) {
            options["bProcessing"] = true;
            options["bServerSide"] = true;
            options["sAjaxSource"] = ajax_source;
        }

        $(this).dataTable(options);
    });

    $("table.datatable2").each(function () {
        var columnSorts = [];

        $.each($(this).find("thead tr th"), function (index, value) {
            if ($(value).attr("data-sortable") == "false") {
                columnSorts.push({"bSortable": false});
            } else {
                if ($(value).attr("data-sort-type") != null) {
                    columnSorts.push({"sType": "date"});
                } else {
                    columnSorts.push(null);
                }
            }
        });

        var columnsToSortBy = [
            [0, 'asc']
        ];
        if (sortingColumn = parseInt($(this).attr("data-column-to-sort-by"))) {
            columnsToSortBy = [
                [sortingColumn, 'desc']
            ];
        }

        var options = {
            "bJQueryUI": true,
            "sPaginationType": "full_numbers",
            "iDisplayLength": parseInt($(this).attr("data-display-count")) || 25,
            "aoColumns": columnSorts,
            "aaSorting": columnsToSortBy
        };

        var ajax_source = $(this).attr("data-ajax-source");
        if (ajax_source) {
            options["bProcessing"] = true;
            options["bServerSide"] = true;
            options["sAjaxSource"] = ajax_source;
        }

        $(this).dataTable(options);


    });

    $("#datatable_submit").click(function (event) {
        $("#search_form").data()['send_to_server'] = "1";
        $("#search_form").submit();
    });

});


