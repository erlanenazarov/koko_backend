from django.contrib import admin
from models import *
# Register your models here.


admin.site.register(MainProduct)
admin.site.register(ProductSizes)
admin.site.register(PotatoProduct)
admin.site.register(SaladeProduct)
admin.site.register(DrinkingProduct)


class OrderAdmin(admin.ModelAdmin):
    list_editable = ['delivered']
    list_display = ['name', 'address', 'phone', 'orders_html', 'score', 'delivered']
    list_filter = ['delivered', 'name', 'phone']

admin.site.register(Order, OrderAdmin)

