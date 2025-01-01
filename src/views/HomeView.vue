<template>
  <!-- <div class="col">
    <MainButton :label="'Войти'" :type="1"/>
    <MainButton :label="'Зарегистрироваться'" :type="2"/>
    <MainButton :label="'Нет аккаунта? Зарегистрироваться'" :type="3"/>
  </div> -->

  <div class="homepage">
    <!-- <div class="settings">
      <div class="icon-button" @click="this.$router.push('/settings')">
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M9.72933 13.5C8.80107 13.5 7.91084 13.1313 7.25446 12.4749C6.59808 11.8185 6.22933 10.9283 6.22933 10C6.22933 9.07174 6.59808 8.1815 7.25446 7.52513C7.91084 6.86875 8.80107 6.5 9.72933 6.5C10.6576 6.5 11.5478 6.86875 12.2042 7.52513C12.8606 8.1815 13.2293 9.07174 13.2293 10C13.2293 10.9283 12.8606 11.8185 12.2042 12.4749C11.5478 13.1313 10.6576 13.5 9.72933 13.5ZM17.1593 10.97C17.1993 10.65 17.2293 10.33 17.2293 10C17.2293 9.67 17.1993 9.34 17.1593 9L19.2693 7.37C19.4593 7.22 19.5093 6.95 19.3893 6.73L17.3893 3.27C17.2693 3.05 16.9993 2.96 16.7793 3.05L14.2893 4.05C13.7693 3.66 13.2293 3.32 12.5993 3.07L12.2293 0.42C12.1893 0.18 11.9793 0 11.7293 0H7.72933C7.47933 0 7.26933 0.18 7.22933 0.42L6.85933 3.07C6.22933 3.32 5.68933 3.66 5.16933 4.05L2.67933 3.05C2.45933 2.96 2.18933 3.05 2.06933 3.27L0.0693316 6.73C-0.0606684 6.95 -0.000668302 7.22 0.189332 7.37L2.29933 9C2.25933 9.34 2.22933 9.67 2.22933 10C2.22933 10.33 2.25933 10.65 2.29933 10.97L0.189332 12.63C-0.000668302 12.78 -0.0606684 13.05 0.0693316 13.27L2.06933 16.73C2.18933 16.95 2.45933 17.03 2.67933 16.95L5.16933 15.94C5.68933 16.34 6.22933 16.68 6.85933 16.93L7.22933 19.58C7.26933 19.82 7.47933 20 7.72933 20H11.7293C11.9793 20 12.1893 19.82 12.2293 19.58L12.5993 16.93C13.2293 16.67 13.7693 16.34 14.2893 15.94L16.7793 16.95C16.9993 17.03 17.2693 16.95 17.3893 16.73L19.3893 13.27C19.5093 13.05 19.4593 12.78 19.2693 12.63L17.1593 10.97Z" fill="url(#paint0_linear_154_739)"/>
          <defs>
          <linearGradient id="paint0_linear_154_739" x1="0" y1="10" x2="19.4542" y2="10" gradientUnits="userSpaceOnUse">
          <stop stop-color="#82FCF5"/>
          <stop offset="0.335" stop-color="#C4A7FB"/>
          <stop offset="0.705" stop-color="#DDA7BD"/>
          <stop offset="1" stop-color="#F5AD73"/>
          </linearGradient>
          </defs>
        </svg>
      </div>
    </div> -->
    <div class="couple-wrapper" ref="block_first">
      <div class="couple-content">
        <div class="human" @click="this.$router.push('/profile')">
          <img src="https://steamuserimages-a.akamaihd.net/ugc/2261431463909221004/CF7290FDC05473039DA56E6D03A5FB6A48DA39EA/?imw=512&imh=425&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true" alt="" class="avatar">
          <p class="name">Никита</p>
        </div>
        <div class="human" @click="this.$router.push('/profile')">
          <img src="https://avatars.mds.yandex.net/i?id=6cfafaebf9b0ae27ee16a3c44a0798f52d430a4a-11476564-images-thumbs&n=13" alt="" class="avatar">
          <p class="name">Катюха</p>
        </div>
      </div>
      <div class="stats">
        <h2>32 <span style="font-size: 16px;">дня</span></h2>
        <p>Вместе</p>
      </div>

      <div class="statbar">
        <div class="bar">
          <div class="bar-active" :style="{ width: barWidth + '%' }">
            <p class="percentage">{{ barWidth + '%' }}</p>
          </div>
        </div>
        <div class="goals">
          <p>0 дней</p>
          <p>100 дней</p>
        </div>
      </div>
    </div>

    <div class="moments">
      <div class="fake_one" ref="block_fourth"></div>
      <div class="fake_two" ref="block_third"></div>
      <div class="moment-wrapper" ref="block_second">
        <div class="title">
          <div class="emoji-icon" @click="this.$router.push('/codeInput')">
            <img src="../assets/images/icons/Smiling Face With Hearts.png" alt="">
          </div>
          <p class="titling">Вспомните ваши лучшие<br>моменты</p>
        </div>
        
        <MainButton
        style="margin: 10px; margin-top: 30px;"
        :label="'Посмотреть'"
        @click="setRandom()"
        :type="1"/>
      </div>
      
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      barWidth: '20',
    }
  },
  async mounted() {
    this.showComponentsAnimation();
  },
  methods:{
    setRandom(){
      this.barWidth = Math.floor(Math.random() * 100)
    },
    showComponentsAnimation() {
      let index = 0;
      const blocks = [
          this.$refs.block_first,
          this.$refs.block_second,
          this.$refs.block_third,
          this.$refs.block_fourth,
      ];

      const interval = setInterval(() => {
          if (index < blocks.length) {
          const block = blocks[index];
          if (block) {
              block.classList.add('block-show');
          }
          index++;
          } else {
          clearInterval(interval);
          }
      }, 100);
    },
  }
}
</script>


<style scoped>
.block-show{
    scale: 1 !important;
    opacity: 1 !important;

    transition: all .2s ease;
}
.couple-content{
  display: flex;
  gap: 60px;
  margin-top: -60px;
}
.name{
  font-size: 16px;
  color: white;
  margin-top: 8px;
}
.col{
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.avatar{
  object-fit: cover;
  width: 120px;
  height: 120px;
  border-radius: 70px;
  background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
  padding: 2px;
}
.human{
  display: flex;
  flex-direction: column;
  align-items: center;
}

.homepage{
  /* background-image: url('../assets/images/backgrounds/homePage.jpg');
  background-size: cover; */
  padding: 12px;
}
.couple-wrapper{
  display: flex;
  flex-direction: column;
  align-items: center;
  backdrop-filter: blur(20px);
  padding-bottom: 15px;
  border: 1px solid #433E45;
  border-radius: 20px;
  margin-top: 70px;

  scale: 0.5;
  opacity: 0;
}
.stats{
  display: flex;
  flex-direction: column;
  align-items: center;
}

.statbar{
  margin-top: 32px;
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 5px;
  align-items: center;
}
.bar-active{
  background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
  height: 24px;
  border-radius: 12px;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.bar{
  background-color: rgba(156, 186, 183, 0.31);
  height: 24px;
  width: 90%;
  border-radius: 12px;
}
.percentage{
  color: white;
  font-size: 10px;
  font-family: 'Montserrat';
  position: absolute;
  right: 10px;
}
.goals{
  display: flex;
  justify-content: space-between;
  width: 90%;
}
.goals p{
  font-size: 12px;
  color: white;
  font-family: 'Miratrix';
}
.moments{
  display: flex;
  align-items: center;
  flex-direction: column;
  margin-bottom: 70px;
  margin-top: 50px;
  position: relative;
}

.moment-wrapper{
  width: 100%;
  background-color: #413149;
  border-radius: 20px;
  z-index: 3;
  
  scale: 0.5;
  opacity: 0;
}


.icon-button{
  height: 54px;
  width: 54px;
  /* backdrop-filter: blur(20px); */
  background-color: black;
  border: 1px solid #433E45;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 27px;
}

.settings{
  display: flex;
  justify-content: end;
  margin-bottom: 75px;
}

.title{
  margin: 10px;
  display: flex;
  gap: 10px;
  align-items: center;
  justify-content: start;
}
.emoji-icon{
  height: 48px;
  width: 48px;
  background-color: #1F1723;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.emoji-icon img{
  height: 25px;
}
.titling{
  font-size: 16px;
  font-family: 'Miratrix';
  color: white;
}

.fake_one{
  width: 85%;
  height: 30px;
  border-radius: 20px 20px 0 0;
  background-color: #1F1723;
  position: absolute;
  z-index: 1;
  top: -24px;

  scale: 0.5;
  opacity: 0;
}

.fake_two{
  width: 94%;
  height: 30px;
  border-radius: 20px 20px 0 0;
  background-color: #2F2335;
  position: absolute;
  z-index: 2;
  top: -12px;

  scale: 0.5;
  opacity: 0;
}
</style>
