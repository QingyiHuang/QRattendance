# demo

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
