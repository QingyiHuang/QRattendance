
//我们已经在mainjs中use了vuex
//通过store.state获取对象，
//通过store.commit方法触发状态更变
//该签到系统需要管理的状态是当前登陆用户的名字，登陆状态这两种东西。
export default {
    //state
    state:{
        username:'未登陆',
        isLogin:false,
    },
    //mutation改变数据的方法
    mutations:{
        cName(state,uname){
            localStorage.setItem('userName',uname)
            state.username = uname
        },
        cLogin(state,flag){
            localStorage.setItem('isLogin',flag)
            state.isLogin = flag
        }
    },
    //action 触发改变，外部dispatch去触发mutations 内部commit
    actions:{
        changeUserName(store,uname){
            store.commit('cName',uname)
        },
        changeLogin(store,flag){
            store.commit('cLogin',flag)
        }
    },
    //getters 设施，获取数据的方式，获取state的方法
    getters:{
        getUserName(state){
            if(!state.username){
                return state.username = JSON.parse(localStorage.getItem('userName'))
            }else{
                return state.username
            }
        },
        getLoginStatus(state){
            if(!state.isLogin){
                return state.isLogin = JSON.parse(localStorage.getItem('isLogin'))
            }else{
                return state.isLogin
            }
        }
    }
}
