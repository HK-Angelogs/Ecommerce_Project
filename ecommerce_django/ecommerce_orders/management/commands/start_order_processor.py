from django.core.management.base import BaseCommand
from ecommerce_orders.models import Order
import time
import sys

class Command(BaseCommand):
    help = 'Simulates a background worker processing orders FIFO'

    def handle(self, *args, **options):
        self.stdout.write(self.style.SUCCESS('Starting Order Processor... Waiting for orders...'))
        
        while True:
            # 1. Fetch the oldest "Pending" order (First In, First Out)
            order = Order.objects.filter(status='Pending').order_by('created').first()
            
            if order:
                self.stdout.write(self.style.WARNING(f'--- Processing Order #{order.id} ---'))
                
                # Step 1: Processing
                time.sleep(5) # Wait 5 seconds
                order.status = 'Processing'
                order.save()
                self.stdout.write(f'Order #{order.id}: Status updated to PROCESSING')

                # Step 2: Delivered
                time.sleep(5) # Wait 5 seconds
                order.status = 'Delivered'
                order.save()
                self.stdout.write(f'Order #{order.id}: Status updated to DELIVERED')

                # Step 3: Received
                time.sleep(5) # Wait 5 seconds
                order.status = 'Received'
                order.save()
                self.stdout.write(self.style.SUCCESS(f'Order #{order.id}: COMPLETED (Received)\n'))
                
            else:
                # No orders? Sleep briefly to save CPU resources
                time.sleep(2)