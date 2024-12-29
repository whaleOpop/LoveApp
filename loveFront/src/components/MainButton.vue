<template>
    <div>
        <button class="main" v-if="type==1">{{label}}</button>

        <button class="secondary" v-if="type==2">{{label}}</button>

        <button class="outline" v-if="type==3">{{label}}</button>
    </div>
</template>

<script>
export default {
    props: ['type', 'label']
}
</script>

<style scoped>
.main{
    font-family: "Miratrix";
    font-size: 16px;
    background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
    border: none;
    height: 54px;
    padding: 15px 20px;
    border-radius: 15px;
    color: black;
    width: 100%;
}

.secondary{
    font-family: "Miratrix";
    font-size: 16px;
    background: transparent;
    border: 1px solid white;
    height: 54px;
    padding: 15px 20px;
    border-radius: 15px;
    color: white;
    width: 100%;
}


.outline{
    font-family: 'Montserrat';
    font-size: 12px;
    background: transparent;
    border: none;
    height: 54px;
    padding: 15px 20px;
    border-radius: 15px;
    color: #C0B6C8;
    width: 100%;
}

</style>