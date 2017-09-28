from django import template

register = template.Library()

@register.filter(name='category_image')
def category_image(value):
    return value.lower() + '.png'
