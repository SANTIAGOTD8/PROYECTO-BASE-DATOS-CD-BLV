1. Imagen base oficial (ligera y optimizada)
FROM python:3.11-slim

2. Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

3. Evitar que Python escriba archivos .pyc y forzar logs en tiempo real
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

4. Copiar e instalar dependencias primero (aprovecha la caché de capas de Docker)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

5. Copiar el resto del código del proyecto al directorio de trabajo
COPY . .

6. Exponer el puerto en el que escucha tu aplicación (ejemplo: 8000)
EXPOSE 8000

7. Comando para ejecutar la aplicación al arrancar el contenedor
CMD ["python", "app/main.py"]