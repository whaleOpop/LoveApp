<template>
  <div class="keyboard">
    <div class="numbers">
        <div class="keyRow">
            <div class="keyNum" @click="newValue('1')"><p>1</p></div>
            <div class="keyNum" @click="newValue('2')"><p>2</p></div>
            <div class="keyNum" @click="newValue('3')"><p>3</p></div>
        </div>
        <div class="keyRow">
            <div class="keyNum" @click="newValue('4')"><p>4</p></div>
            <div class="keyNum" @click="newValue('5')"><p>5</p></div>
            <div class="keyNum" @click="newValue('6')"><p>6</p></div>
        </div>
        <div class="keyRow">
            <div class="keyNum" @click="newValue('7')"><p>7</p></div>
            <div class="keyNum" @click="newValue('8')"><p>8</p></div>
            <div class="keyNum" @click="newValue('9')"><p>9</p></div>
        </div>
        <div class="keyRow">
            <div class="keyNum" @click="newValue('c')"><p>c</p></div>
            <div class="keyNum" @click="newValue('0')"><p>0</p></div>
            <div class="keyNum" @click="newValue('ok')"><p>ok</p></div>
        </div>
    </div>
  </div>
</template>

<script>
export default {
methods:{
    newValue(value){
        this.$emit('updated', value);
    }
}
}
</script>

<style scoped>
p{
    font-size: 26px;
    color: white;
}
.keyNum{
    /* border: 1px solid white; */
    border-radius: 50%;
    height: 80px;
    width: 80px;
    display:flex;
    align-items: center;
    justify-content: center;
    backdrop-filter: blur(10px);
}
.keyRow{
    display: flex;
}
.keyboard{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>