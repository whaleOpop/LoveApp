<template>
    <div class="gallerypage">
        <!-- <div class="back">
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
        </div> -->
        <div class="moments" ref="moments" @scroll="handleScroll">
            <div v-for="el in moments" :key="el.id" class="momentCard">
                <MomentBox :data="el"/>
            </div>
        </div>
        <div class="addNew">
            <div class="buttons" :style="{ gap: isScrolledDown ? '10px' : '0' }">
                <MainButton class="add" :label="'Добавить'" :type="1" :style="{ width: isScrolledDown ? '80%' : '100%' }"/>
                <MainButton 
                :style="{ width: isScrolledDown ? '20%' : '0%', visibility: isScrolledDown ? 'visible' : 'hidden' }" 
                class="up" 
                :label="'up'" 
                :type="2" 
                @click="scrollToTop"/>

            </div>
            
            <div class="viniete"></div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            isScrolledDown: false,
            moments:[
                {
                    id: 1,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
                {
                    id: 2,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
                {
                    id: 3,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
                {
                    id: 4,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
                {
                    id: 5,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
                {
                    id: 6,
                    date: '28 августа, 2024',
                    name: 'Сходили в парк',
                    location: 'Moscow city centre'
                },
            ]
        }
    },
    mounted() {
        // Инициализация скролла на моменте
    },
    beforeUnmount() {
        // Можно добавить дополнительные очищающие действия если нужно
    },
    methods: {
        handleScroll() {
            const momentsElement = this.$refs.moments;
            if (momentsElement) {
                this.isScrolledDown = momentsElement.scrollTop > 100;
            }
        },
        scrollToTop() {
            const momentsElement = this.$refs.moments;
            if (momentsElement) {
                momentsElement.scrollTo({ top: 0, behavior: 'smooth' });
            }
        },
    },
}
</script>


<style scoped>
.buttons{
    display: flex;
    gap: 10px;
    width: 110%;
}
.up{
    z-index: 2;
    width: 54px;
}
.add{
    z-index: 2;
    width: 110%;
}
.back{
    align-self: start;
}
.viniete{
    background: linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,0.9) 100%);
    height: 180px;
    width: 100%;
    position: fixed;
    bottom: 0;
}
.addNew{
    position: fixed;
    bottom: 60px;
    width: 80%;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.gallerypage{
  background-image: url('../assets/images/backgrounds/homePage.jpg');
  background-size: cover;
  padding: 12px;
  display: flex;
  flex-direction: column;
  align-items: center;
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

.moments{
  display: flex;
  justify-content: start;
  gap: 26px;
  width: 100%;
  flex-direction: column;
  overflow-y: scroll;
  height: 80vh;
}
.momentCard:last-child {
    margin-bottom: 100px;
}

</style>