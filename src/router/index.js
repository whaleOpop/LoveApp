import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import SettingsView from '../views/SettingsView.vue'
import GalleryView from '../views/GalleryView.vue'
import NewMomentView from '../views/NewMomentView.vue'
import ProfileView from '../views/ProfileView.vue'
import WhereView from '../views/WhereToGoView.vue'
import CodeInput from '../views/CodeInputView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/settings',
      name: 'settings',
      component: SettingsView,
    },
    {
      path: '/gallery',
      name: 'gallery',
      component: GalleryView,
    },
    {
      path: '/profile',
      name: 'profile',
      component: ProfileView,
    },
    {
      path: '/new',
      name: 'new',
      component: NewMomentView,
    },
    {
      path: '/where',
      name: 'where',
      component: WhereView,
    },
    {
      path: '/codeInput',
      name: 'codeInput',
      component: CodeInput,
    },
  ],
})

export default router
