# Versión estable de Python + Alpine (ligero)
FROM python:3.11.12-alpine3.20

# Evita que Python guarde archivos .pyc
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /app

# Instala dependencias del sistema y limpia caché
RUN apk update && \
    apk add --no-cache \
        gcc \
        musl-dev \
        postgresql-dev \
        python3-dev \
        libffi-dev && \
    pip install --upgrade pip

# Copia requirements.txt primero (para cachear la instalación)
COPY ./requirements.txt .

# Instala dependencias de Python
RUN pip install -r requirements.txt

# Copia el resto del proyecto
COPY ./ .

# Ejecuta el entrypoint (asegúrate de tener permisos)
CMD ["sh", "entrypoint.sh"]