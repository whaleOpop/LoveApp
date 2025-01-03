<template>
    <div>
      <div v-if="type == 1" @click="toggle" :class="{'switch-background-active' : isVolume, 'switch' : !(isVolume)}">
        <div class="span" v-if="type == 1" :class="{'switch-active' : isVolume, 'switch-disabled' : !isVolume}">
          <div class="switch-icon"></div>
        </div>
      </div>
      <div v-if="type == 2" @click="toggle" :class="{'switch-background-active' : isVibro, 'switch' : !(isVibro)}">
        <div class="span" v-if="type == 2" :class="{'switch-active' : isVibro, 'switch-disabled' : !isVibro}">
          <div class="switch-icon"></div>
        </div>
      </div>
      <div v-if="type == 3" @click="toggle" :class="{'switch-background-active' : isHardGraphic, 'switch' : !(isHardGraphic)}">
        <div class="span" v-if="type == 3" :class="{'switch-active' : isHardGraphic, 'switch-disabled' : !isHardGraphic}">
          <div class="switch-icon"></div>
        </div>
      </div>
    </div>
  </template>
  
  <style scoped>
  .switch-background-active{
    background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
    width: 58px;
    height: 32px;
    cursor: pointer;
    transition: .4s;
    border-radius: 10px;
    position: relative;
    display: flex;
    align-items: center;
  }
  
  .switch {
    position: relative;
    width: 58px;
    height: 32px;
    cursor: pointer;
    background: linear-gradient(180deg, rgba(67,65,69,1) 0%, rgba(66,64,68,1) 21%, rgba(53,48,65,1) 47%, rgba(51,44,58,1) 81%, rgba(28,27,28,1) 100%);
    -webkit-transition: .4s;
    transition: .4s;
    border-radius: 10px;
    display: flex;
    align-items: center;
  }
  .switch-active{
    position: absolute;
    left: 55%;
    height: 20px;
    width: 20px;
    border-radius: 5px;
    background-color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: left .3s cubic-bezier(0.560, 1.555, 0.305, 0.940);
  }
  .switch-disabled{
    position: absolute;
    left: 10%;
    height: 20px;
    width: 20px;
    border-radius: 5px;
    background-color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: left .3s cubic-bezier(0.560, 1.555, 0.305, 0.940);
  }
  
  </style>
  
  <script>
  export default {
    props: {
      type: {
        type: Number,
        default: 0
      }
    },
    data(){
      return{
        isVolume: true,
        isVibro: false,
        isHardGraphic: true,
      }
    },
    methods: {
      toggle(){
        window.Telegram.WebApp.HapticFeedback.impactOccurred('light');
        if (this.type == 1) {
          this.isVolume = !this.isVolume
        } else if(this.type == 2) {
          this.isVibro = !this.isVibro
        } else{
          this.isHardGraphic = !this.isHardGraphic
        }
      },
    }
  };
  </script>