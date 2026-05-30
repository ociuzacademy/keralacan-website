from django.urls import path
from cancercareapp import views
from django.conf.urls.static import static

from django.conf import settings

urlpatterns=[

path('',views.home_fun),

#---------------admin--------------------

path('admin_login/',views.admin_login),
path('doc_reg/',views.doc_reg),
path('ver_spon/',views.ver_spon),
path('view_rpt/',views.view_rpt),
path('view_rec/',views.view_rec),
path('approved/',views.approved),
path('rejected/',views.rejected),

#---------------patient--------------------


path('patient_reg/',views.patient_reg),
path('ptnt_login/',views.ptnt_login),
path('fn_sprt/',views.fn_sprt),
path('records/',views.records),
path('patient_chat/',views.patient_chat),
path('inspirational_stories/',views.inspirational_stories),



#---------------sponser--------------------


path('sponser_reg/',views.sponser_reg),
path('sponser_login/',views.sponser_login),
path('payment/',views.payment),
path('view_app/',views.view_app),
path('reject/',views.reject),
path('approve_appli/',views.approve_appli),

#---------------user--------------------

path('user_login/',views.user_login),
path('user_reg/',views.user_reg),
path('user_story/',views.user_story),

#---------------doctor--------------------


path('dctr_login/',views.dctr_login),
path('doc_chat/',views.doc_chat),
path('chat/',views.chat),

path('approve/',views.approve),



path('appointment/',views.appointment),
path('view_booking/',views.view_booking),
path('view_profile/',views.view_profile),
path('doc_instructions/',views.doc_instructions),
path('view_instructions/',views.view_instructions),
path('logout/',views.logout),






]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)