
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from cancercareapp import views

urlpatterns = [
    # Public
    #   # Home pages
    path('', views.home_fun, name='home'),
    path('pnt_home/', views.pnt_home, name='pnt_home'),

    # Admin
    path('admin_login/', views.admin_login, name='admin_login'),
    path('doc_reg/', views.doc_reg, name='doc_reg'),
    path('ver_spon/', views.ver_spon, name='ver_spon'),
    path('view_rpt/', views.view_rpt, name='view_rpt'),
    path('approved/', views.approved, name='sponsor_approved'),
    path('rejected/', views.rejected, name='sponsor_rejected'),

    # Patient
    path('patient_reg/', views.patient_reg, name='patient_reg'),
    path('ptnt_login/', views.ptnt_login, name='ptnt_login'),
    path('fn_sprt/', views.fn_sprt, name='fn_sprt'),
    path('records/', views.records, name='records'),
    path(
        'patient_chat/',
        views.patient_chat,
        name='patient_chat'
    ),
    path(
        'inspirational_stories/',
        views.inspirational_stories,
        name='inspirational_stories'
    ),
    path(
        'view_instructions/',
        views.view_instructions,
        name='view_instructions'
    ),

    # Sponsor
    path('sponser_reg/', views.sponser_reg, name='sponser_reg'),
    path(
        'sponser_login/',
        views.sponser_login,
        name='sponser_login'
    ),
    path('payment/', views.payment, name='payment'),
    path('view_app/', views.view_app, name='view_app'),
    path(
        'reject/',
        views.reject_application,
        name='reject_application'
    ),
    path(
        'approve_appli/',
        views.approve_appli,
        name='approve_appli'
    ),
    path(
        'view_profile/',
        views.view_profile,
        name='view_profile'
    ),

    # General user
    path('user_login/', views.user_login, name='user_login'),
    path('user_reg/', views.user_reg, name='user_reg'),
    path('user_story/', views.user_story, name='user_story'),

    # Doctor
    path('dctr_login/', views.dctr_login, name='dctr_login'),
    path('view_rec/', views.view_rec, name='view_rec'),
    path('approve/', views.approve, name='approve_record'),
    path(
        'reject_record/',
        views.reject_record,
        name='reject_record'
    ),
    path(
        'view_booking/',
        views.view_booking,
        name='view_booking'
    ),
    path(
        'doc_instructions/',
        views.doc_instructions,
        name='doc_instructions'
    ),
    path('doc_chat/', views.doc_chat, name='doc_chat'),
    path('chat/', views.chat, name='chat'),
    path('appointment/', views.appointment, name='appointment'),

    # Logout
    path('logout/', views.user_logout, name='logout'),

   
]

if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
