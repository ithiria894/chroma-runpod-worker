FROM runpod/worker-comfyui:5.8.5-flux1-dev

# Base image already has: VAE (ae.safetensors), T5-XXL, CLIP-L, and Flux.1-dev
# We just add CHROMA UNet on top

# Download CHROMA model (uncensored Flux fork) into diffusion_models dir
RUN wget -q --show-progress -O /comfyui/models/unet/chroma-unlocked-v35.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v35.safetensors" && \
    echo "CHROMA checkpoint downloaded"
