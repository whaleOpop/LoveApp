import axios from "axios";
import Cookies from 'js-cookie'; // Подключаем библиотеку для работы с куками

let config = {
  baseURL: 'http://alagabwq.beget.tech/api/', // Укажите правильный базовый URL вашего API
  withCredentials: true, // Включаем отправку кук в запросе
};

const _axios = axios.create(config);

_axios.interceptors.request.use(
  function(config) {
    // Получаем CSRF токен из кук
    const csrfToken = Cookies.get('csrftoken');
    if (csrfToken) {
      // Добавляем CSRF токен в заголовок запроса
      config.headers['X-CSRFToken'] = csrfToken;
    }
    // Устанавливаем заголовок Access-Control-Allow-Credentials в true
    config.withCredentials = true;
    return config;
  },
  function(error) {
    return Promise.reject(error);
  }
);

// Добавляем ответный перехватчик
_axios.interceptors.response.use(
  function(response) {
    return response;
  },
  function(error) {
    return Promise.reject(error);
  }
);

const Plugin = {};

Plugin.install = function(app) {
  app.config.globalProperties.axios = _axios;
  app.config.globalProperties.$axios = _axios;
};

export default Plugin;
