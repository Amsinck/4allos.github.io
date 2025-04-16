from .error_reporting.reporter import report_error


# Exemplo de relatório de erro:
report_error(current_user_id(), 'Descrição de teste', 'test_module', 'Sem sugestão')
