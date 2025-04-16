# Arquivo: reporter.py
# Caminho: C:\4All_OS\modules\4All_Comms\error_reporting\reporter.py
# Descri��o: M�dulo respons�vel por coletar e enviar relat�rios de erros.
#            Armazena localmente quando offline e envia via P2P quando online.

import json
import os
from datetime import datetime
from local_storage import save_local
from p2p_node import send_to_peer
from encryption import encrypt

# Caminho para o arquivo de fila de erros
ERROR_QUEUE_FILE = os.path.join(os.path.dirname(__file__), 'error_queue.json')

def now():
    """
    Retorna a data e hora atual formatada como string.
    """
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')

def is_online():
    """
    Verifica a conectividade com a rede.
    Retorna True se online, False caso contr�rio.
    """
    # Implementar verifica��o de conectividade
    return False  # Placeholder

def report_error(user_id, description, module_name="unknown", suggestion=None):
    """
    Coleta informa��es sobre um erro e decide se deve armazen�-lo localmente ou envi�-lo via P2P.

    Par�metros:
        user_id (str): Identificador do usu�rio que reportou o erro.
        description (str): Descri��o do erro ocorrido.
        module_name (str): Nome do m�dulo onde o erro ocorreu. Padr�o � "unknown".
        suggestion (str): Sugest�o de corre��o fornecida pelo usu�rio. Opcional.
    """
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
