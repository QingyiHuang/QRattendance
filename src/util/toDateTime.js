//转换时间格式，方便存入数据库
export function toDateTime(value){
    let t = new Date(value);
    let Mtemp = t.getMonth() + 1;
    let Dtemp = t.getDate();
    let Htemp = t.getHours();
    let Mitemp = t.getMinutes();
    let Stemp = t.getSeconds();
    if((t.getMonth()+1) < 9){
        Mtemp = '0' + (t.getMonth() + 1)
    }
    if(t.getDate()<10){
        Dtemp = '0' + t.getDate()
    }
    if(t.getHours()<10){
        Htemp = '0' + t.getHours()
    }
    if(t.getMinutes()<10){
        Mitemp = '0' + t.getMinutes()
    }
    if(t.getSeconds()<10){
        Stemp = '0' + t.getSeconds()
    }
    return t.getFullYear() + "-" + Mtemp + "-" + Dtemp + " " + Htemp + ":" + Mitemp + ":" + Stemp;
}
//获取整年
export function getDateYearAndDD(value){
    let t = new Date(value)
    let Mtemp = t.getMonth() + 1;
    let Dtemp = t.getDate();
    if((t.getMonth()+1) < 9){
        Mtemp = '0' + (t.getMonth() + 1)
    }
    if(t.getDate()<10){
        Dtemp = '0' + t.getDate()
    }
    return t.getFullYear() + '-' + Mtemp + '-' + Dtemp;
}
//获取零碎时间
export function getDateSecond(value){
    let t = new Date(value)
    let Htemp = t.getHours();
    let Mitemp = t.getMinutes();
    let Stemp = t.getSeconds();
    if(t.getHours()<10){
        Htemp = '0' + t.getHours()
    }
    if(t.getMinutes()<10){
        Mitemp = '0' + t.getMinutes()
    }
    if(t.getSeconds()<10){
        Stemp = '0' + t.getSeconds()
    }
    return Htemp + ":" + Mitemp + ":" + Stemp;
}