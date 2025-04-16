# ================================================
# ARQUIVO: monitor_manuals.py
# CAMINHO: C:\4All_OS\privado\monitor_manuals.py
# FINALIDADE:
#   Monitora alterações nos arquivos Markdown do diretório 'pt'
#   e executa automaticamente 'update_manuals.py' para atualizar
#   traduções e o SUPER-MANUAL.
# =================================================

import time
import os
import subprocess
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class ManualEventHandler(FileSystemEventHandler):
    def on_modified(self, event):`r`n    """Descri��o da fun��o."""
        if event.src_path.endswith(".md"):
            print(f"Alteração detectada em {event.src_path}. Atualizando manuais...")
            subprocess.run(["python", "update_manuals.py"], cwd=os.path.dirname(__file__))

if __name__ == "__main__":
    path = os.path.join(os.path.dirname(__file__), "..", "pt")
    event_handler = ManualEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path=path, recursive=True)
    observer.start()
    print(f"Monitorando alterações em: {path}")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

