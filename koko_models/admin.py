from django.contrib import admin
from models import *
# Register your models here.


admin.site.register(MainProduct)
admin.site.register(ProductSizes)
admin.site.register(PotatoProduct)
admin.site.register(SaladeProduct)
admin.site.register(DrinkingProduct)
admin.site.register(Contacts)


class OrderAdmin(admin.ModelAdmin):
    list_editable = ['delivered', 'accepted']
    list_display = ['name', 'address', 'phone', 'orders_html', 'score', 'accepted', 'delivered']
    list_filter = ['delivered', 'accepted', 'name', 'phone']

admin.site.register(Order, OrderAdmin)

