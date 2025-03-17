# Використовуємо офіційний образ Python
FROM python:3.10

# Встановлюємо змінні середовища
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Створюємо робочу директорію у контейнері
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо увесь проєкт у контейнер
COPY . /app/

# Відкриваємо порт 8000
EXPOSE 8000

# Запускаємо Django-сервер
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
