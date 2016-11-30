import datetime
import json
from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render

# Create your views here.
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from KokoChicken import settings
from koko_models.models import *


def generate_view_params():
    pass


def index_page(request):
    params = {}

    if 'cart_items' in request.COOKIES:
        cart_items = json.loads(request.COOKIES['cart_items'])
    else:
        cart_items = []

    chicken_favs = []
    potatoes_favs = []
    salades_favs = []
    drinkings_favs = []

    cart_sum = 0

    if cart_items.__len__() > 0:
        for cart_item in cart_items:
           cart_sum += int(cart_item['quantity']) * int(cart_item['price'])

           if cart_item['type'] == 'chicken':
               chicken_favs.append(MainProduct.objects.filter(id=cart_item['id']).first())
           elif cart_item['type'] == 'potato':
               potatoes_favs.append(PotatoProduct.objects.filter(id=cart_item['id']).first())
           elif cart_item['type'] == 'salade':
               salades_favs.append(SaladeProduct.objects.filter(id=cart_item['id']).first())
           elif cart_item['type'] == 'drinking':
               drinkings_favs.append(DrinkingProduct.objects.filter(id=cart_item['id']).first())

    params['chickens'] = MainProduct.objects.all()
    params['potatoes'] = PotatoProduct.objects.all()
    params['salades'] = SaladeProduct.objects.all()
    params['drinkings'] = DrinkingProduct.objects.all()
    params['chicken_favs'] = chicken_favs
    params['potatoes_favs'] = potatoes_favs
    params['salades_favs'] = salades_favs
    params['drinkings_favs'] = drinkings_favs
    params['cart_items'] = cart_items
    params['cart_sum'] = cart_sum

    return render(request, 'index.html', params)


@csrf_exempt
def add_to_cart(request):
    if request.is_ajax():
        item = request.POST.get('item')
        if 'cart_items' in request.COOKIES:
            cart_items = json.loads(request.COOKIES['cart_items'])
        else:
            cart_items = []
        if item:
            item = json.loads(item)
            is_new = True
            for cart_item in cart_items:
                if cart_item['type'] != item['type']:
                    continue

                if item['type'] == 'chicken' or item['type'] == 'potato':
                    if cart_item['id'] == item['id'] and cart_item['size'] == item['size']:
                        cart_item['quantity'] = str(int(cart_item['quantity']) + int(item['quantity']))
                        updated_item = cart_item
                        cart_items.remove(cart_item)
                        cart_items.append(updated_item)
                        is_new = False
                        break
                else:
                    if cart_item['id'] == item['id']:
                        cart_item['quantity'] = str(int(cart_item['quantity']) + int(item['quantity']))
                        updated_item = cart_item
                        cart_items.remove(cart_item)
                        cart_items.append(updated_item)
                        is_new = False
                        break

            if is_new:
                cart_items.append(item)

        result_response = JsonResponse(dict(success=True))
        result_response = set_cookie(result_response, 'cart_items', json.dumps(cart_items))

        return result_response
    else:
        return HttpResponseRedirect(reverse('index'))


@csrf_exempt
def remove_from_cart(request):
    pass


def list_cart(request):
    if 'cart_items' in request.COOKIES:
        return JsonResponse(dict(items=json.loads(request.COOKIES['cart_items'])))
    else:
        return JsonResponse(dict(items=[]))


def set_cookie(response, key, value, days_expire=7):
    if days_expire is None:
        max_age = 365 * 24 * 60 * 60  # one year
    else:
        max_age = days_expire * 24 * 60 * 60
    expires = datetime.datetime.strftime(datetime.datetime.utcnow() + datetime.timedelta(seconds=max_age),
                                         "%a, %d-%b-%Y %H:%M:%S GMT")
    response.set_cookie(key, value, max_age=max_age, expires=expires, domain=settings.SESSION_COOKIE_DOMAIN,
                        secure=settings.SESSION_COOKIE_SECURE or None)
    return response