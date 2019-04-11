#### Echarts.js数据可视化

```javascript
cnpm install echarts --save //安装Echarts
```

```javascript
//引入Echarts
var echarts = reuqire('echarts')

//使用
mounted(){
    var myChart = echarts.init(document.getElementById('chartContainer'))//通过vue上一个id为上述的容器来初始化echarts
    
//绘制图表
    myChart.setOption({
        title:{ text:'Echart 二维表' },
        tooltip:{},
        xAxis:{//x轴
            data:["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        }
        yAxis:{//y轴
        	
    	},
                      series:[{
        name: '销量',
        type: 'bar',
        data: [5, 20, 36, 10, 10, 20]
                      }]
    })
}
```



#### mysql 部分联结查询

```sql
UNION ALL 比 UNION 所耗资源更少，
UNION ALL 不会去掉重复项
UNION 会除掉重复
```

ie情况下
第一步：下载插件： cnpm install --save babel-polyfill

第二步：入口文件main.js引入( import 'babel-polyfill')

第三步：配置文件修改 vue-loader.conf（脚手架工具构建的项目修改这个配置文件，如果没有就修改webpack.conf.js),如下增加

``` javascript
entrymodule.exports = {    
	entry: ["babel-polyfill", "./app/js"]
}
```







> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
