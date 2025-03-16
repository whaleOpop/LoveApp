<template>
  <div class="codeInput">
    <div></div>
    <div></div>
    <div></div>
    <div class="header">
      <div class="title">
        <h1>Партнер</h1>
      </div>
      <div class="subtitle">
        <p>Укажи код твоей второй половинки</p>
      </div>
    </div>

    <div class="code-input">
      <input
        v-for="(index) in 5"
        :key="index"
        v-model="code[index]"
        type="tel"
        maxlength="1"
      />
      
    </div>
    <KeyBoard style="margin-top: 20px;" @updated="key => handleInput(key)"/>
    
    <div class="actions">
      <div class="nextButton" ref="next">
        <MainButton
        @click="toggleModal"
        style="margin: 10px; margin-top: 60px;"
        :label="'Дальше'"
        :isLoading="true"
        :type="1"/>
      </div>
      <MainButton
      style="margin: 10px; margin-top: 10px;"
      :label="'У меня нет кода'"
      @click="console.log('clicked')"
      :type="3"/>
    </div>

    <div class="overlay" ref="overlay" v-if="showModal"></div>
    <div class="modal-app" v-if="showModal" ref="modal">
      <div>
        <div class="modal-wrapper">
          <div class="close">
            <svg @click="toggleModal" width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M1.4 14L0 12.6L5.6 7L0 1.4L1.4 0L7 5.6L12.6 0L14 1.4L8.4 7L14 12.6L12.6 14L7 8.4L1.4 14Z" fill="white"/>
            </svg>

          </div>
          <img src="https://avatars.mds.yandex.net/i?id=6cfafaebf9b0ae27ee16a3c44a0798f52d430a4a-11476564-images-thumbs&n=13" alt="" class="avatar">
          <h2>{{'name'}}</h2>
          <p>Ваш партнер?</p>
        </div>
       
        <MainButton
        style="margin: 10px; margin-top: 10px;"
        :label="'Да, все верно'"
        @click="console.log('clicked')"
        :type="1"/>
        <MainButton
        style="margin: 10px; margin-top: 10px;"
        :label="'Ввести код заноко'"
        @click="console.log('clicked')"
        :type="3"/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      code: [],
      showModal: false,
    };
  },
  watch: {
    code: {
      handler() {
        const nextButton = this.$refs.next;
        if (this.code.join('').length === 6) {
          nextButton.classList.add('block-show');
        } else {
          nextButton.classList.remove('block-show');
        }
      },
      deep: true,
    },
  },
  methods: {
    handleInput(value) {
      window.Telegram.WebApp.HapticFeedback.impactOccurred('light');
      if(value!='0' && value!='ok' && value!='c' && this.code.length <= 5){
        this.code.push(value)
      }
      else if(value=='c'){
        this.code = []
      }
      
    },
    handleBackspace() {
      if (!this.code[index] && index > 0) {
        this.$refs[`input-${index - 1}`][0].focus();
      }
    },


    toggleModal(){
      window.Telegram.WebApp.HapticFeedback.notificationOccurred('success');
      if (this.showModal) {
          const modalwindow = this.$refs.modal;
          modalwindow.classList.remove('show-app');
          const modaloverlay = this.$refs.overlay;
          modaloverlay.classList.remove('showOverlay');

          setTimeout(() => {
              this.showModal = false
          }, 400);
      } else {
          this.showModal = true
          setTimeout(() => {
              const modalwindow = this.$refs.modal;
              modalwindow.classList.add('show-app');
              const modaloverlay = this.$refs.overlay;
              modaloverlay.classList.add('showOverlay');
          }, 10);
      }
    },
  },
};
</script>


<style scoped>
.subtitle{
  margin-bottom: 40px;
}
.codeInput{
  background-image: url('../assets/images/backgrounds/codePage.jpg');
  background-size: cover;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: end;
}
h1{
  font-weight: 500;
}
.header{
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
}
.code-input {
  display: flex;
  justify-content: center;
  width: 100%;
  gap: 8px;
}
input {
  width: 44px;
  height: 58px;
  font-size: 28px;
  padding: 0;
  font-family: 'Montserrat';
  text-align: center;
  background-color: transparent;
  border: 1px solid white;
  border-radius: 10px;
  color: white;
  outline: none;
}

.block-show{
  transform: translateY(0) !important;
}
.nextButton{
  transform: translateY(1000px);
  transition: transform .5s ease;
}


.modal-app{
  background: #1F1723;
  border-radius: 20px 20px 0 0;
  padding: 20px 0;
  position: absolute;
  width: 100%;
  height: 500px;
  bottom: -500px;
  transform: translateY(0px);
  z-index: 10;
  transition: transform .5s cubic-bezier(1.000, -0.440, 0.615, 0.745);
}
.show-app{
  transform: translateY(-400px);
  transition: transform .5s ease;
}
.showOverlay{
  opacity: 1 !important;
  transition: transform .5s cubic-bezier(0.410, 0.245, 0.000, 1.365);
}
.overlay{
  opacity: 0;
  position: absolute;
  z-index: 9;
  top: 0;
  background-color: rgba(0, 0, 0, 0.551);
  height: 100vh;
  width: 100vw;
  transition: all .4s ease;
}

.avatar{
  object-fit: cover;
  width: 120px;
  height: 120px;
  border-radius: 70px;
  background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
  padding: 2px;
}

.modal-wrapper{
  display: flex;
  align-items: center;
  flex-direction: column;
  margin-bottom: 70px;
}
.close{
  display: flex;
  justify-content: end;
  width: 90%;
  margin-bottom: 30px;
}
</style>