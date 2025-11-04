FROM python:3.11-slim

# 1. 系统依赖
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libsndfile1 \
        ffmpeg \
        espeak-ng \
        git \
        wget \
        curl \
        locales && \
    locale-gen zh_CN.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# 2. 安装 huggingface_hub CLI 和 Python 包
RUN pip install --upgrade pip && \
    pip install coqui-tts huggingface_hub

# 3. 工作目录
WORKDIR /app
COPY main.py ref.wav ./

# 4. 使用 huggingface-cli 下载模型
RUN huggingface-cli download coqui/XTTS-v2 --local-dir ./xtts-v2

ENTRYPOINT ["python", "main.py"]