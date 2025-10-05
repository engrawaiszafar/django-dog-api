from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import BreedViewSet, DogViewSet

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'breeds', BreedViewSet, basename='breed')
router.register(r'dogs', DogViewSet, basename='dog')

# The API URLs are now determined automatically by the router.
urlpatterns = [
    path('', include(router.urls)),
]