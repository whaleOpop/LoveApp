<template>
  
    <div class="settingspage">
        <div class="back">
            <div class="icon-button" @click="this.$router.push('/')">
                <svg width="18" height="12" viewBox="0 0 18 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 5H3.83L7.41 1.41L6 0L0 6L6 12L7.41 10.58L3.83 7H18V5Z" fill="url(#paint0_linear_154_816)"/>
                    <defs>
                    <linearGradient id="paint0_linear_154_816" x1="0" y1="6" x2="18" y2="6" gradientUnits="userSpaceOnUse">
                    <stop stop-color="#82FCF5"/>
                    <stop offset="0.335" stop-color="#C4A7FB"/>
                    <stop offset="0.705" stop-color="#DDA7BD"/>
                    <stop offset="1" stop-color="#F5AD73"/>
                    </linearGradient>
                    </defs>
                </svg>
            </div>
        </div>
        <div class="settings">
            <h2>Настройки</h2>
            <div class="parameters">
                <div class="row">
                    <p class="param">Виброотклик</p>
                    <SwitchBox :type="1"/>
                </div>
                <div class="row">
                    <p class="param">Уведомления</p>
                    <SwitchBox :type="2"/>
                </div>
                <div class="row">
                    <p class="param">Анимации</p>
                    <SwitchBox :type="3"/>
                </div>
            </div>

            <div class="message">
                <p class="mes">
                    Наш проект находится на стадии альфа версии. Если ты нашел какую-то проблему или баг, то, пожалуйста, сообщи нам по кнопке ниже
                </p>
                <button class="connect">связаться с нами</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>
.connect{
    height: 54px;
    width: 80%;
    background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-family: 'Miratrix';
    font-size: 16px;
    border: 1px solid #433E45;
    border-radius: 15px;
}
.message{
    margin-top: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
}
.mes{
    font-size: 16px;
    text-align: center;
}
.parameters{
    margin-top: 24px;
}
.row{
    display: flex;
    width: 100%;
    justify-content: space-between;
    height: 50px;
    align-items: center;
}
.param{
    font-size: 16px;
}
.settingspage{
  background-color: #1C171E;
  padding: 12px;
  height: 100vh;
}

.icon-button{
  height: 54px;
  width: 54px;
  /* backdrop-filter: blur(20px); */
  background-color: transparent;
  border: 1px solid #433E45;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 27px;
}

.settings{
  display: flex;
  justify-content: start;
  margin-top: 26px;
  flex-direction: column;
}
</style>