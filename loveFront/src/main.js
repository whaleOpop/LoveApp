import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import MainButton from "../src/components/MainButton.vue"; 
import SwitchBox from "../src/components/SwitchBox.vue"; 
import MomentBox from "../src/components/MomentBox.vue"; 


const app = createApp(App)


app.component('MainButton', MainButton);
app.component('SwitchBox', SwitchBox);
app.component('MomentBox', MomentBox);

app.use(router)

app.mount('#app')
