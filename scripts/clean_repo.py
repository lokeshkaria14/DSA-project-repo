import os
import shutil

def safe_remove(path):
    if os.path.exists(path):
        print(f"Removing {path} ...")
        shutil.rmtree(path)

if _name_ == "_main_":
    safe_remove("build")
    safe_remove("data/test_repo")
    safe_remove("repo")
    print("✅ Cleanup complete.")
