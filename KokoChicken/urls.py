"""KokoChicken URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin

from app.views import *

urlpatterns = [
    url(r'^jet/', include('jet.urls', 'jet')),  # Django JET URLS
    url(r'^admin/', admin.site.urls),
    url(r'^$', index_page, name='index'),
    url(r'^cart/add$', add_to_cart, name='add_to_cart'),
    url(r'^cart/remove$', remove_from_cart, name='remove_from_cart'),
    url(r'^cart/list$', cart_list, name='cart_list'),
    url(r'^paginate$', paginate_products, name='paginate_products'),
    url(r'^cart/item/quantity', set_cart_item_quantity, name='cart_item_quantity'),
    url(r'^order/create$', create_order, name='create_order'),
    url(r'^notifications/get$', get_notifications, name='get_notifications'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
