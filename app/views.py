# coding=utf-8
import datetime
import json
import threading
from django.core.mail import EmailMessage
from django.core.paginator import Paginator
from django.http import JsonResponse, HttpResponseRedirect
from django.shortcuts import render

# Create your views here.
from django.template import loader
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from KokoChicken import settings
from koko_models.form import OrderForm
from koko_models.models import *
from KokoChicken.settings import *

PRODUCTS_PER_PAGE = 4


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

    params['chickens'] = Paginator(MainProduct.objects.all(), PRODUCTS_PER_PAGE).page(1)
    params['potatoes'] = Paginator(PotatoProduct.objects.all(), PRODUCTS_PER_PAGE).page(1)
    params['salades'] = Paginator(SaladeProduct.objects.all(), PRODUCTS_PER_PAGE).page(1)
    params['drinkings'] = DrinkingProduct.objects.all()
    params['chicken_favs'] = chicken_favs
    params['potatoes_favs'] = potatoes_favs
    params['salades_favs'] = salades_favs
    params['drinkings_favs'] = drinkings_favs
    params['cart_items'] = cart_items
    params['cart_sum'] = cart_sum
    params['order_form'] = OrderForm()

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
    if request.is_ajax():
        item = request.POST.get('item')
        if 'cart_items' in request.COOKIES:
            cart_items = json.loads(request.COOKIES['cart_items'])
        else:
            cart_items = []

        if item:
            item = json.loads(item)
            for cart_item in cart_items:
                if cart_item['type'] != item['type']:
                    continue

                if item['type'] == 'chicken' or item['type'] == 'potato':
                    if cart_item['id'] == item['id'] and cart_item['size'] == item['size']:
                        cart_items.remove(cart_item)
                        break
                else:
                    if cart_item['id'] == item['id']:
                        cart_items.remove(cart_item)
                        break

        result_response = JsonResponse(dict(success=True))
        result_response = set_cookie(result_response, 'cart_items', json.dumps(cart_items))

        return result_response
    else:
        return HttpResponseRedirect(reverse('index'))


def cart_list(request):
    params = {}
    cart_sum = 0

    if 'cart_items' in request.COOKIES:
        cart_items = json.loads(request.COOKIES['cart_items'])
    else:
        cart_items = []

    if cart_items.__len__() > 0:
        for cart_item in cart_items:
           cart_sum += int(cart_item['quantity']) * int(cart_item['price'])

    params['cart_items'] = cart_items
    params['cart_sum'] = cart_sum

    return render(request, 'cart_list.html', params)


def paginate_products(request):
    page = request.GET.get('page')
    type = request.GET.get('type')
    cart_items = []

    if 'cart_items' in request.COOKIES:
        cart_items = json.loads(request.COOKIES['cart_items'])

    if type == 'chicken':
        paginator = Paginator(MainProduct.objects.all(), PRODUCTS_PER_PAGE)
        products = paginator.page(page)

        chicken_favs = []
        for cart_item in cart_items:
            if cart_item['type'] == 'chicken':
                for p in products:
                    if p.id == int(cart_item['id']):
                        chicken_favs.append(p)
                        break

        return render(request, 'paginate_chicken.html', dict(products=products, chicken_favs=chicken_favs))
    elif type == 'potato':
        paginator = Paginator(PotatoProduct.objects.all(), PRODUCTS_PER_PAGE)
        products = paginator.page(page)

        potatoes_favs = []
        for cart_item in cart_items:
            if cart_item['type'] == 'potato':
                for p in products:
                    if p.id == int(cart_item['id']):
                        potatoes_favs.append(p)
                        break

        return render(request, 'paginate_potato.html', dict(products=products, potatoes_favs=potatoes_favs))
    elif type == 'salade':
        paginator = Paginator(SaladeProduct.objects.all(), PRODUCTS_PER_PAGE)
        products = paginator.page(page)

        salades_favs = []
        for cart_item in cart_items:
            if cart_item['type'] == 'salade':
                for p in products:
                    if p.id == int(cart_item['id']):
                        salades_favs.append(p)
                        break
        return render(request, 'paginate_salade.html', dict(products=products, salades_favs=salades_favs))


@csrf_exempt
def set_cart_item_quantity(request):
    if request.is_ajax():
        item = request.POST.get('item')
        if 'cart_items' in request.COOKIES:
            cart_items = json.loads(request.COOKIES['cart_items'])
        else:
            cart_items = []

        if item:
            item = json.loads(item)
            if hasattr(item, 'size'):
                for cart_item in cart_items:
                    if cart_item['id'] == item['id'] and cart_item['type'] == item['type'] and cart_item['size'] == item['size']:
                        updated_item = item
                        updated_item['price'] = cart_item['price']
                        updated_item['title'] = cart_item['title']
                        cart_items.remove(cart_item)
                        cart_items.append(updated_item)
            else:
                for cart_item in cart_items:
                    if cart_item['id'] == item['id'] and cart_item['type'] == item['type']:
                        updated_item = item
                        updated_item['price'] = cart_item['price']
                        updated_item['title'] = cart_item['title']
                        cart_items.remove(cart_item)
                        cart_items.append(updated_item)

            result_response = JsonResponse(dict(success=True))
            result_response = set_cookie(result_response, 'cart_items', json.dumps(cart_items))

            return result_response
        else:
            result_response = JsonResponse(dict(success=False))
            result_response = set_cookie(result_response, 'cart_items', json.dumps(cart_items))

            return result_response

    else:
        return HttpResponseRedirect(reverse('index'))


def create_order(request):
    if request.is_ajax():
        cart_items = json.loads(request.COOKIES['cart_items'])

        score = 0
        for cart_item in cart_items:
            score += float(cart_item['price']) * float(cart_item['quantity'])

        form = OrderForm(request.POST)

        if form.is_valid():
            instance = form.instance
            instance.score = score
            instance.save()

            t = loader.get_template('cart_list_admin.html')

            c = dict(cart_items=cart_items, id=instance.id)
            content = t.render(c, request)

            instance.orders = content
            instance.save()

            t_email = loader.get_template('order_email.html')
            c_email = dict(cart_items=cart_items, name=instance.name, phone=instance.phone,
                           address=instance.address, score=score)

            t_content = t_email.render(c_email, request)
            thread = threading.Thread(target=send_notification_email, args=('Новый заказ', t_content, EMAIL_TO))
            thread.start()

            return JsonResponse(dict(success=True))

        return JsonResponse(dict(success=False))
    else:
        return HttpResponseRedirect(reverse('index'))


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


def send_notification_email(title, body, to):
    email = EmailMessage(title, body=body, to=[to])
    email.content_subtype = 'html'
    email.send()
