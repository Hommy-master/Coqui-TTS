FROM python:3.11-slim

# 1. 系统依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libsndfile1 \
        ffmpeg \
        espeak-ng \
        git \
        locales && \
    locale-gen zh_CN.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# 2. 升级 pip & 安装 Coqui-TTS
RUN pip install --upgrade pip && \
    pip install coqui-tts

# 3. 工作目录 & 代码
WORKDIR /app
COPY main.py ref.wav ./

ENTRYPOINT ["python", "main.py"]