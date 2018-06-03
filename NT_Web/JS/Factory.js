
function sendAjaxUrl(winObj, postData, sendUrl) {
    $.ajax({
        type: "post",
        url: sendUrl,
        data: postData,
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        },
        success: function (data, textStatus) {
            cg(data.status);
        }
    });
}

function sendAjaxUrl2(winObj, postData, sendUrl, types) {
    $.ajax({
        type: "post",
        url: sendUrl,
        data: postData,
        dataType: "json",
        error: function (XMLHttpRequest, textStatus, errorThrown) {
           // $.dialog.alert('错误信息：' + errorThrown, function () { }, winObj);
        },
        success: function (data, textStatus) {
            cg2(data, types);
        }
    });
}
//获取Url参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}
