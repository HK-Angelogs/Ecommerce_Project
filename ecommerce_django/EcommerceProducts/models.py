from django.db import models
from django.conf import settings

# Create your models here.

# Categories
class Categories(models.Model):
    name = models.CharField(max_length=50)
    # Self-referential ForeignKey allows subcategories
    parent = models.ForeignKey('self', related_name='children', on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name_plural = "Categories"

    def __str__(self):
        full_path = [self.name]
        k = self.parent
        while k is not None:
            full_path.append(k.name)
            k = k.parent
        return ' -> '.join(full_path[::-1])

#All of Our Products
class Products(models.Model):
    name = models.CharField(max_length=50)
    price = models.DecimalField(default=0, decimal_places=2, max_digits=10)
    category = models.ForeignKey(Categories, on_delete=models.CASCADE, default =1)
    description = models.TextField(default='', blank=True, null=True)
    image = models.ImageField(upload_to='uploads/product/')

    def __str__(self):
        return self.name

class BrowsingHistory(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey(Products, on_delete=models.CASCADE)
    viewed_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-viewed_at']
        verbose_name_plural = "Browsing Histories"

    def __str__(self):
        return f"{self.user} viewed {self.product.name}"