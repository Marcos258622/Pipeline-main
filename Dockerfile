#Imagem base que vai ser usada
FROM python:3.12-slim

#Instala o ping (a imagem slim não vem com ele) para o teste de conectividade
RUN apt-get update \
    && apt-get install -y --no-install-recommends iputils-ping \
    && rm -rf /var/lib/apt/lists/*

#Diretório de trabalho dentro do container
WORKDIR /app

#arquivo de dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copia o resto do código-fonte
COPY . .

#Porta que a aplicação usa
EXPOSE 5000

#Comando para iniciar a aplicação
CMD ["python", "app.py"]