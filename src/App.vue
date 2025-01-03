<template>
  <div>
    <div v-if="loaded">
      <NavBar v-if="navShow"/>
      <RouterView />
    </div>
    <div v-else>
      <model-viewer class="model"
        :src="modelSrc"
        
        :camera-orbit="cameraOrbit"
        disable-tap
        camera-controls
        disable-zoom
        auto-rotate
        touch-action="pan-y"
        max-camera-orbit="60deg"></model-viewer>
    </div>
  </div>
  
 
</template>

<script>
export default {
  data(){
    return{
      loaded: 0,
      modelSrc: null,
      cameraOrbit: '0deg 0deg 0deg',  // начальное значение для camera-orbit
      rotationAngle: 0,  // начальный угол вращения
      startTime: 2000,  // время начала анимации
      duration: 1500,
    }
  },
  async mounted() {
    const modelPath = await import('@/assets/test.glb');
    this.modelSrc = modelPath.default;
    this.startRotation();
    setTimeout(() => {
      this.loaded = 1;
    }, 2200);
  },
  computed: {
    navShow() {
      return this.$route.path === '/' || this.$route.path === '/gallery' || this.$route.path === '/where';
    }
  },
  methods:{
    startRotation() {

      const easeOut = (t) => {
        return 1 - Math.pow(1 - t, 2.5); // Кривая ease-out
      };

      // Анимация вращения
      const animate = (timestamp) => {
        if (!this.startTime) this.startTime = timestamp; // Сохраняем время начала анимации

        const elapsedTime = timestamp - this.startTime; // Время, прошедшее с начала анимации

        const progress = Math.min(elapsedTime / this.duration, 1); // Прогресс анимации от 0 до 1
        const easedProgress = easeOut(progress); // Применяем easing

        // Увеличиваем угол вращения с учетом easing
        this.rotationAngle = easedProgress * 360;

        // Обновляем свойство camera-orbit
        this.cameraOrbit = `${this.rotationAngle}deg 110deg 50deg`;

        // Если анимация не завершена, продолжаем
        if (progress < 1) {
          requestAnimationFrame(animate); // Следующий кадр анимации
        }
      };

      // Запускаем анимацию
      requestAnimationFrame(animate);
    }
  }
}
</script>


<style scoped>
.model{
  height: 100vh;
  width: 100vw;
  scale: .3;
}
div{
  background-color: #100B12;
  height: 100svh;
  overflow: hidden;
}

</style>
