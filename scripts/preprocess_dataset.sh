SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT" || exit 1
export PYTHONPATH="$REPO_ROOT${PYTHONPATH:+:$PYTHONPATH}"

echo "Pickling 3D-Front dataset for faster data loading..."
python3 dataset/get_3dfront_pkl.py

echo "Pickling 3D-FUTURE dataset for faster data loading..."
python3 dataset/get_3dfuture_pkl.py bedroom
python3 dataset/get_3dfuture_pkl.py livingroom
python3 dataset/get_3dfuture_pkl.py diningroom
