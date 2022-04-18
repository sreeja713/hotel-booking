from django import template
register = template.Library()

@register.filter
def get_value(value, arg):
    if value:
        return value.get(arg)
    else:
        return ""

@register.filter
def occupaid_status(value):
    if value==True:
        return "Occupied"
    else:
        return "Vaccant"