<template>
  <div class="codeInput">
    <div class="header">
      <div class="title">
        <h1>Партнер</h1>
      </div>
      <div class="subtitle">
        <p>Укажи код  твоей второй половинки</p>
      </div>
    </div>

    <div class="code-fields">
      <input
        v-for="(value, index) in code"
        :key="index"
        type="text"
        maxlength="1"
        v-model="code[index]"
        class="code-input"
        @input="moveFocus(index)"
        ref="inputs"
        :focus="focusedIndex === index"
      />
    </div>

    <div class="actions">
        <MainButton
        style="margin: 10px; margin-top: 60px;"
        :label="'Дальше'"
        @click="console.log('clicked')"
        :type="1"/>
        <MainButton
        style="margin: 10px; margin-top: 10px;"
        :label="'У меня нет кода'"
        @click="console.log('clicked')"
        :type="3"/>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      code: Array(6).fill(''), // Массив для хранения введенных значений
      focusedIndex: 0, // Индекс текущего фокуса
    };
  },
  methods: {
    moveFocus(index) {
      // Если введен символ, перемещаем фокус на следующий input
      if (this.code[index] !== '' && index < this.code.length - 1) {
        this.focusedIndex = index + 1;
        this.$nextTick(() => {
          this.$refs.inputs[this.focusedIndex].focus();
        });
      }
      // Если введена пустая строка, перемещаем фокус на предыдущий input
      if (this.code[index] === '' && index > 0) {
        this.focusedIndex = index - 1;
        this.$nextTick(() => {
          this.$refs.inputs[this.focusedIndex].focus();
        });
      }
    },
  },
  mounted() {
    // Устанавливаем фокус на первый input при монтировании компонента
    this.$nextTick(() => {
      this.$refs.inputs[this.focusedIndex].focus();
    });
  },
};
</script>

<style scoped>
.codeInput{
  background-image: url('../assets/images/backgrounds/codePage.jpg');
  background-size: cover;
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
.code-fields {
  display: flex;
  gap: 10px; /* Отступы между полями */
}

.code-input {
  width: 40px;
  height: 40px;
  text-align: center;
  font-size: 20px;
  border: 2px solid #ccc;
  border-radius: 5px;
}

.code-input:focus {
  border-color: #4A90E2; /* Цвет границы при фокусе */
}
</style>