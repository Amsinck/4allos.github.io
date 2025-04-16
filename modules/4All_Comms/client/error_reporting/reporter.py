# Arquivo: reporter.py
# Caminho: C:\4All_OS\modules\4All_Comms\client\error_reporting\reporter.py
# Instruções: Este módulo coleta e envia relatórios de erros. Ele armazena localmente quando offline e envia via P2P quando online.

import json
import os
from datetime import datetime
from ..local_storage import save_local
from ..p2p_node import send_to_peer
from ..encryption import encrypt

ERROR_QUEUE_FILE = os.path.join(os.path.dirname(__file__), 'error_queue.json')

def now():`r`n    """Descrição da função."""
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')

def is_online():`r`n    """Descrição da função."""
    # Implementar verificação de conectividade
    return False  # Placeholder

def report_error(user_id, description, module_name="unknown", suggestion=None):`r`n    """Descrição da função."""
    log = {
        "user": user_id,
        "module": module_name,
        "description": description,
        "suggestion": suggestion,
        "timestamp": now()
    }

    encrypted_log = encrypt(log)

    if not is_online():
        save_local(ERROR_QUEUE_FILE, encrypted_log)
    else:
        send_to_peer("owner_id", encrypted_log)


