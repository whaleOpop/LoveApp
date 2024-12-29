<template>
  <div class="moment-wrapper">
    <div class="date">
        {{ data.date }}
    </div>
    <img src="https://avatars.mds.yandex.net/i?id=d457a29b0676c423e234388a1243c822_l-5018050-images-thumbs&n=13" alt="" class="moment-image">
    <h3>{{ data.name }}</h3>
    <div class="location-content">
        <svg width="7" height="10" viewBox="0 0 7 10" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M3.5 4.75C3.16848 4.75 2.85054 4.6183 2.61612 4.38388C2.3817 4.14946 2.25 3.83152 2.25 3.5C2.25 3.16848 2.3817 2.85054 2.61612 2.61612C2.85054 2.3817 3.16848 2.25 3.5 2.25C3.83152 2.25 4.14946 2.3817 4.38388 2.61612C4.6183 2.85054 4.75 3.16848 4.75 3.5C4.75 3.66415 4.71767 3.8267 4.65485 3.97835C4.59203 4.13001 4.49996 4.26781 4.38388 4.38388C4.26781 4.49996 4.13001 4.59203 3.97835 4.65485C3.8267 4.71767 3.66415 4.75 3.5 4.75ZM3.5 0C2.57174 0 1.6815 0.368749 1.02513 1.02513C0.368749 1.6815 0 2.57174 0 3.5C0 6.125 3.5 10 3.5 10C3.5 10 7 6.125 7 3.5C7 2.57174 6.63125 1.6815 5.97487 1.02513C5.3185 0.368749 4.42826 0 3.5 0Z" fill="url(#paint0_linear_154_909)"/>
            <defs>
            <linearGradient id="paint0_linear_154_909" x1="0" y1="5" x2="7" y2="5" gradientUnits="userSpaceOnUse">
            <stop stop-color="#82FCF5"/>
            <stop offset="0.335" stop-color="#C4A7FB"/>
            <stop offset="0.705" stop-color="#DDA7BD"/>
            <stop offset="1" stop-color="#F5AD73"/>
            </linearGradient>
            </defs>
        </svg>
        <p class="location">{{ data.location }}</p>
    </div>
    <button class="show">
        Посмотреть
    </button>
  </div>
</template>

<script>
export default {
    props: ['data'],
}
</script>

<style scoped>
.show{
    margin-top: 44px;
    height: 54px;
    width: 100%;
    background: linear-gradient(90deg, rgba(130,252,245,1) 0%, rgba(196,167,251,1) 34%, rgba(221,167,189,1) 65%, rgba(245,173,115,1) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-family: 'Miratrix';
    font-size: 16px;
    border: 1px solid #433E45;
    border-radius: 15px;
}
.location-content{
    display: flex;
    gap: 5px;
    margin: 10px 0;
    align-items: center;
}
.moment-image{
    height: 240px;
    border-radius: 10px;
    filter: drop-shadow(0 0 10px rgb(37, 37, 37));
    margin-bottom: 14px;
}
.moment-wrapper{
    backdrop-filter: blur(20px);
    border: 1px solid #433E45;
    border-radius: 20px;
    padding: 20px;
    display: flex;
    flex-direction: column;
}
.date{
    color: white;
    font-family: 'Miratrix';
    font-size: 14px;
    align-self: end;
    margin-bottom: 20px;
}
</style>