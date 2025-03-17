<template>
    <div class="codeInput">
      <div></div>
      <div></div>
      <div></div>
      <div class="header">
        <div class="title">
          <h1>День X</h1>
        </div>
        <div class="subtitle">
          <p>Пожалуйтса, укажи<br>первый день вашей пары</p>
        </div>
      </div>
  
      <div class="code-input">
        <h3 id="input">{{ date }}</h3>
        
      </div>
      <KeyBoard style="margin-top: 20px;" @updated="key => handleInput(key)"/>
      
      <div class="actions">
        <div class="nextButton" ref="next">
          <MainButton
          @click="this.$router.push('/')"
          style="margin: 10px; margin-top: 30px;"
          :label="'Дальше'"
          :isLoading="false"
          :type="1"/>
        </div>
        <MainButton
        @click="this.$router.push('/codeInput')"
        style="margin: 10px; margin-top: 10px;"
        :label="'Назад'"
        :type="3"/>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        date: '',
        showModal: false,
      };
    },
    watch: {
        date: {
            handler(newValue) {
                let cleanedValue = newValue.replace(/\D/g, '');
                if (cleanedValue.length > 4) {
                    cleanedValue = cleanedValue.slice(0, 2) + '.' + cleanedValue.slice(2, 4) + '.' + cleanedValue.slice(4, 8);
                } else if (cleanedValue.length > 2) {
                    cleanedValue = cleanedValue.slice(0, 2) + '.' + cleanedValue.slice(2, 4);
                }
                this.date = cleanedValue;
                const nextButton = this.$refs.next;
                if (cleanedValue.length === 8) {
                    nextButton.classList.add('block-show');
                } else {
                    nextButton.classList.remove('block-show');
                }
            },
        },
    },
    methods: {
      handleInput(value) {
        window.Telegram.WebApp.HapticFeedback.impactOccurred('light');
        if(value!='ok' && value!='c' && this.date.length <= 7){
          this.date = this.date + value;
        }
        else if(value=='c'){
            this.date = this.date.slice(0, -1);
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
  .actions{
    margin-bottom: 30px;
  }
  .subtitle{
    margin-bottom: 40px;
    text-align: center;
  }
  .codeInput{
    background-image: url('../assets/images/backgrounds/datePage.jpg');
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
  #input {
    width: 250px;
    height: 58px;
    font-size: 28px;
    padding: 0;
    font-family: 'Montserrat';
    text-align: center;
    background-color: transparent;
    color: white;
    border: none;
    border-bottom: 1px solid white;
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