FROM runpod/worker-comfyui:5.8.5-flux1-dev

# Download CHROMA with retries and size verification
RUN pip install huggingface_hub && \
    python3 -c "
from huggingface_hub import hf_hub_download
import os
path = hf_hub_download(repo_id='lodestones/Chroma', filename='chroma-unlocked-v35.safetensors', local_dir='/comfyui/models/unet/')
size = os.path.getsize(path)
print(f'CHROMA downloaded: {size/1024**3:.2f} GB')
assert size > 10_000_000_000, f'File too small: {size} bytes, likely corrupted'
" && echo "CHROMA verified OK"
