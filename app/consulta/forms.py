from django import forms
from .models import Pedidos


class CadastroForm(forms.ModelForm):
    class Meta:
        model = Pedidos
        fields = (
            'pedido_id',
            'nome_cliente',
            'status',
            'prazo', 'cidade', 'estado',
            'cep_origem',
            'endereco_origem',
            'cep_destino',
            'endereco_destino'
        )