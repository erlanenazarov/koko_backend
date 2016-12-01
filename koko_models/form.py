# coding=utf-8
from django import forms
from models import Order


class OrderForm(forms.ModelForm):

    orders = forms.CharField(required=False, widget=forms.TextInput(attrs={'class': 'hidden'}))
    score = forms.CharField(required=False, widget=forms.TextInput(attrs={'class': 'hidden'}))

    class Meta:
        model = Order
        exclude = ()
        widgets = {
            'name': forms.TextInput(attrs={'placeholder': 'Имя'}),
            'address': forms.TextInput(attrs={'placeholder': 'Адрес'}),
            'phone': forms.TextInput(attrs={'placeholder': 'Телефон'}),
        }