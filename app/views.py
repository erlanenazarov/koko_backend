from django.shortcuts import render

# Create your views here.


def generate_view_params():
    pass


def index_page(request):
    params = {}
    return render(request, 'index.html', params)
