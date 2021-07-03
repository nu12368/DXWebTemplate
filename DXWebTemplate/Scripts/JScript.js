function addPanel(url, namemenu) {
    //alert(url);
    $.ajax({
        url: url,
        success: function (data) {
            //alert(url);
            if ($('#tt').tabs('exists', namemenu)) {
                $('#tt').tabs('select', namemenu);
            } else {
                var content = '<iframe scrolling="auto" frameborder="0" src="' + url + '" width="100%" height="100%"></iframe> ';
                $('#tt').tabs('add', {
                    title: namemenu,
                    content: content,
                    closable: true,
                    extractor: function (data) {
                        data = $.fn.panel.defaults.extractor(data);
                        var tmp = $('<div></div>').html(data);
                        data = tmp.find('#tt').html();
                        tmp.remove();
                        return data;
                    }
                });
            }
        }
    });
    return false;
}

function removePanel() {
    var index = 1;
    var tab = $('#tt').tabs('getSelected');
    if (tab) {
        //var index = $('#tt').tabs('getTabIndex', tab);
        $('#tt').tabs('close', index);
    }
}

function Logout() {
    $.messager.confirm('Confirm', 'Do you want to exit ?', function (r) {
        if (r) {
            window.open("logout.aspx", "_parent");
        }
    });
}