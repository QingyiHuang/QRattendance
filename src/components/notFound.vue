<template>
    <div class="banTextOnblur">
        <div class="circle">
            <h4>
                404 notFound !
            </h4>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.circle{
    margin: 0 auto;
    margin-top: 80px;
    width: 300px;
    height: 300px;
    border-radius: 50%;
    border: 8px solid mediumseagreen;
    cursor: pointer;
    background-color: rgba(0,0,0,.7);
    text-align: center;
    color: #fff;
    line-height: 300px;
    overflow-wrap: break-word;
    font-size: 2em;
    transition: all 0.25s ease-in;
    -moz-transition: all 0.25s ease-in;
    -webkit-transition: all 0.25s ease-in;
}
.circle:hover{
    border: 8px solid rgba(0,0,0,.7);
    background-color: mediumaquamarine;
}
.banTextOnblur{/*禁止文本被选中*/
    -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Chrome/Safari/Opera */
    -khtml-user-select: none; /* Konqueror */
    -moz-user-select: none; /* Firefox */
    -ms-user-select: none; /* Internet Explorer/Edge */
    user-select: none; /* Non-prefixed version, currently
    not supported by any browser */
}
.banTextOnblur> p:first-child{
    margin-top: 100px;
    font-size: 2em;
    color: rgba(0,0,0,.9);
}
</style>
