# 3D-FRONT and InstructScene Dataset

We provide the preprocessed instruction-scene paired dataset used in the paper and rendered images for evaluation on [HuggingFace](https://huggingface.co/datasets/chenguolin/InstructScene_dataset).
These files should be downloaded, uncompressed, and put under this directory.
```bash
# Optional: Hugging Face mirror (e.g. mainland China): export HF_ENDPOINT=https://hf-mirror.com

hf download chenguolin/InstructScene_dataset InstructScene.zip --repo-type dataset --local-dir .
hf download chenguolin/InstructScene_dataset 3D-FRONT.zip --repo-type dataset --local-dir .
unzip -o InstructScene.zip
unzip -o 3D-FRONT.zip
```

Then, this directory should be organized as follows:
```bash
3D-FRONT
├── 3D-FRONT
    ├── 0a8d471a-2587-458a-9214-586e003e9cf9.json
    ├── ...
├── 3D-FRONT-texture
    ├── 0a5adcc7-f17f-488f-9f95-8690cbc31321
        ├── texture.png
    ├── ...
    ├── categories.py
    ├── texture_info.json
├── 3D-FUTURE-model
    ├── 0a0f0cf2-3a34-4ba2-b24f-34f361c36b3e
        ├── image.jpg
        ├── model.mtl
        ├── clip_vitb32.npy  # added by us; CLIP feature from `image.jpg`
        ├── openshape_pointbert_vitg14.npy  # added by us; OpenShape feature from `model.obj` point cloud
        ├── raw_model.obj
        ├── texture.png
    ├── ...
    ├── categories.py
    ├── model_info.json
├── 3D-FRONT-readme.md

InstructScene
├── 3D-FUTURE-chatgpt  # descriptions for each object
    ├── 0a2de904-3744-4d31-a3b7-e603982d89be.txt
    ├── ...
├── threed_front_bedroom
    ├── _test_blender_rendered_scene_256_topdown  # a collection of topdown rendered images for test scenes
        ├── 0b4abd30-b157-4ecf-a077-989285598cf2_SecondBedroom-6482_topdown.png
        ├── ...
    ├── _train_blender_rendered_scene_256_topdown  # a collection of topdown rendered images for training scenes
        ├── 0e5fe624-43b3-42b3-831d-bd1a8efebd89_MasterBedroom-1895_topdown.png
        ├── ...
    ├── 0a9f5311-49e1-414c-ba7b-b42a171459a3_SecondBedroom-18509  # a scene
        ├── blender_rendered_scene_256  # eight views / topdown view of the scene
            ├── 000.png
            ├── ...
            ├── 007.png
            ├── topdown.png
        ├── boxes.npz  # scene and object info (e.g., translation, scale, rotation of each object bbox)
        ├── descriptions.pkl  # cached by `Add_Description` in `src/data/threed_front_dataset_base.py`
        ├── models_info.pkl  # captions and quantize indices for each object in the scene
        ├── openshape_pointbert_vitg14.npy  # concatenated OpenShape features for each object in the scene; same object order as `boxes.npz` and `models_info.pkl`
        ├── relations.npy  # cached by `Add_SceneGraph` in `src/data/threed_front_dataset_base.py`
    ├── ...
    ├── dataset_stats.txt  # includes object classes in the room type, min/max values of bbox attributes and OpenShape features, etc.
├── threed_front_diningroom
    ├── ...
├── threed_front_livingroom
    ├── ...
├── threed_front.pkl  # cached by `script/preprocess_dataset.sh`
├── threed_future_model_bedroom.pkl  # cached by `script/preprocess_dataset.sh`
├── threed_future_model_diningroom.pkl  # cached by `script/preprocess_dataset.sh`
├── threed_future_model_livingroom.pkl  # cached by `script/preprocess_dataset.sh`
```
