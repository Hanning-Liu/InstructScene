#!/usr/bin/env bash
# conda create -n instructscene python=3.9
# conda activate instructscene
set -euo pipefail

if [[ "$(uname -s)" == "Darwin" ]]; then
  echo "Installing PyTorch for macOS (Apple Silicon / Intel; Metal MPS when available)..."
  pip3 install -U torch torchvision torchaudio
else
  echo "Installing PyTorch with CUDA 12.1 wheels (Linux + NVIDIA)..."
  pip3 install -i https://download.pytorch.org/whl/cu121 -U torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0
fi

pip3 install -r settings/requirements.txt

python3 -c "import nltk; nltk.download('cmudict')"
