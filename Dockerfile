FROM runpod/worker-comfyui:5.8.5-flux1-dev

# Download CHROMA with curl (follow redirects) + verify file size
RUN curl -L -o /comfyui/models/unet/chroma-unlocked-v35.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v35.safetensors" && \
    SIZE=$(stat -c%s /comfyui/models/unet/chroma-unlocked-v35.safetensors) && \
    echo "CHROMA size: $SIZE bytes" && \
    test $SIZE -gt 10000000000 && echo "CHROMA verified OK" || (echo "CHROMA TOO SMALL - CORRUPTED" && exit 1)
