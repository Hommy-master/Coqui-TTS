#!/usr/bin/env python3
import os
from TTS.api import TTS

TEXT   = os.getenv("TEXT", "明天见")
REF    = os.getenv("REF", "ref.wav")
LANG   = os.getenv("LANG", "zh")
OUT    = os.getenv("OUT", "/app/out.wav")
PITCH  = os.getenv("PITCH", "+8%")      # 支持 ±20%

tts = TTS("tts_models/multilingual/multi-dataset/xtts_v2", gpu=False)
tts.tts_to_file(text=TEXT,
                speaker_wav=REF,
                language=LANG,
                pitch_transform=PITCH,
                file_path=OUT)
print(f"✅ 合成完成 -> {OUT}")