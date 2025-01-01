<template>
  <div class="navMenu">
    <div class="element" @click="clicked(), this.$router.push('/')">
        <p :class="{ 'el': $route.path === '/', 'el-dis': $route.path !== '/' }">Пара</p>
        <div :class="{ 'underline': $route.path === '/', 'underline-dis': $route.path !== '/' }"></div>
    </div>
    <div class="element" @click="clicked(), this.$router.push('/gallery')">
        <p :class="{'el' : $route.path === '/gallery', 'el-dis' : $route.path !== '/gallery'}">Галерея</p>
        <div :class="{ 'underline': $route.path === '/gallery', 'underline-dis': $route.path !== '/gallery' }"></div>
    </div>
    <div class="element" @click="clicked(), this.$router.push('/where')">
        <p :class="{ 'el': $route.path === '/where', 'el-dis': $route.path !== '/where' }">Места</p>
        <div :class="{ 'underline': $route.path === '/where', 'underline-dis': $route.path !== '/where' }"></div>
    </div>
  </div>
</template>

<script>
export default {
    methods:{
        clicked(){
            window.Telegram.WebApp.HapticFeedback.impactOccurred('medium');
        }
    }
}
</script>

<style scoped>
.underline{
    position: absolute;
    bottom: -5px;
    background-color: #E8AA9D;
    height: 3px;
    width: 20px;
    border-radius: 2px 2px 0 0;
}
.underline-dis{
    position: absolute;
    bottom: -5px;
    background-color: transparent;
    height: 3px;
    width: 20px;
    border-radius: 2px 2px 0 0;
}
.navMenu{
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 30px 0;
    height: 20px;
}
.element{
    width: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}
.el{
    text-align: center;
    font-size: 18px;
    font-family: 'Miratrix';
    color: #ffffff;
}

.el-dis{
    text-align: center;
    font-size: 18px;
    font-family: 'Miratrix';
    color: #413149;
}
</style>