//转换时间格式，方便存入数据库
export function toDateTime(value){
    let t = new Date(value);
    return t.getFullYear() + "-" + (t.getMonth() + 1) + "-" + t.getDate() + " " + t.getHours() + ":" + t.getMinutes() + ":" + t.getSeconds();
}