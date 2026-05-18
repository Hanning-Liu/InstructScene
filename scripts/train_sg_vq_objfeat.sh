SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT" || exit 1
export PYTHONPATH="$REPO_ROOT${PYTHONPATH:+:$PYTHONPATH}"

ROOM_TPYE=$1
TAG=$2
DEVICE=$3

CUDA_VISIBLE_DEVICES=$DEVICE \
python3 src/train_sg.py configs/${ROOM_TPYE}_sg_diffusion_vq_objfeat.yaml \
  --tag $TAG
