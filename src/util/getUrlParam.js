//获取浏览器地址栏里的
export function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);//抓取参数，将参数获取
    if (r != null) return unescape(r[2]);
    return null;
}
  