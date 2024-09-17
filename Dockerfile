# Используем официальный образ Python
FROM python:3.9

# Устанавливаем рабочий каталог
WORKDIR /app

# Копируем файлы проекта в рабочий каталог
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения
COPY ./app /app

# Открываем порт для FastAPI
EXPOSE 8000

# Команда для запуска приложения
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
