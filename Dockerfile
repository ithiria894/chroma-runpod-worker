FROM runpod/worker-comfyui:5.8.5-base

# Download CHROMA model (uncensored Flux fork)
RUN wget -q --show-progress -O /comfyui/models/checkpoints/chroma-unlocked-v35.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v35.safetensors" && \
    echo "CHROMA checkpoint downloaded"

# Download required text encoders
RUN wget -q --show-progress -O /comfyui/models/clip/t5xxl_fp8_e4m3fn.safetensors \
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors" && \
    echo "T5-XXL downloaded"

# Download VAE (from public mirror, no auth needed)
RUN wget -q --show-progress -O /comfyui/models/vae/ae.safetensors \
    "https://huggingface.co/cocktailpeanut/xulf-dev/resolve/main/ae.safetensors" && \
    echo "VAE downloaded"
