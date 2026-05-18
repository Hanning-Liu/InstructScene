"""Warning filters that must run before `import torch` (heavy imports may trigger cuda autocast)."""
import warnings
from builtins import UserWarning


def suppress_cuda_autocast_no_cuda_warning() -> None:
    warnings.filterwarnings(
        "ignore",
        message=r"User provided device_type of 'cuda', but CUDA is not available\..*",
        category=UserWarning,
    )
