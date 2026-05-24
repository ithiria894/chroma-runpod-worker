FROM runpod/worker-comfyui:5.8.5-flux1-dev

# Download CHROMA with huggingface_hub for reliable download + verification
RUN pip install -q huggingface_hub && python3 -c "from huggingface_hub import hf_hub_download; import os; path = hf_hub_download(repo_id='lodestones/Chroma', filename='chroma-unlocked-v35.safetensors', local_dir='/comfyui/models/unet/'); size = os.path.getsize(path); print(f'CHROMA: {size/1024**3:.2f} GB'); assert size > 10000000000, f'Too small: {size}'"
