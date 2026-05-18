SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT" || exit 1
export PYTHONPATH="$REPO_ROOT${PYTHONPATH:+:$PYTHONPATH}"

TAG=$1
DEVICE=$2

CUDA_VISIBLE_DEVICES=$DEVICE \
python3 src/train_objfeatvqvae.py configs/threedfront_objfeat_vqvae.yaml \
  --tag $TAG
