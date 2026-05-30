from django.shortcuts import redirect, render
from .models import patientreg_tb,sponserreg_tb,userreg_tb,docreg_tb,payment_tb,records_tb,doc_patient_list_tb,sp_applicaton_tb,stories_tb,appointment_tb,docinstructions_tb,patientchat_tb
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth import logout
from django.core.mail import send_mail
from django.conf import settings 
from datetime import datetime
import datetime
# Create your views here.
def home_fun(request):
	return render(request,'index.html')

def patient_reg(request):
	if request.method=="POST":
		name=request.POST["name"]
		dob=request.POST["dob"]
		age=request.POST["age"]
		email=request.POST["email"]
		password=request.POST["password"]
		contact=request.POST["contact"]
		address=request.POST["address"]
		gender=request.POST["gender"]
		
		a=patientreg_tb(name=name,dob=dob,age=age,email=email,password=password,contact=contact,address=address,gender=gender)
		a.save()
		return render(request,'patient/patient reg.html',{'success':'Registered'})
	else:
		return render(request,'patient/patient reg.html')

def sponser_reg(request):
	if request.method=="POST":
		name=request.POST["name"]
		dob=request.POST["dob"]
		email=request.POST["email"]
		password=request.POST["password"]
		contact=request.POST["contact"]
		address=request.POST["address"]
		gender=request.POST["gender"]
		
		a=sponserreg_tb(name=name,dob=dob,email=email,password=password,contact=contact,address=address,gender=gender)
		a.save()
		return render(request,'sponser/sponser reg.html',{'success':'Registered'})
	else:
		return render(request,'sponser/sponser reg.html')

def doc_reg(request):
	if request.method=="POST":
		name=request.POST["name"]
		email=request.POST["email"]
		password=request.POST["password"]
		contact=request.POST["contact"]
		address=request.POST["address"]
		spc=request.POST["spc"]
		
		a=docreg_tb(specialisation=spc,name=name,email=email,password=password,contact=contact,address=address,)
		a.save()
		subject = 'welcome to our world'
		message = f'Hi {name},your password is:{password}'
		email_from = settings.EMAIL_HOST_USER 
		recipient_list = [email, ] 
		send_mail( subject, message, email_from, recipient_list )
		return render(request,'admin/doctor reg.html')
	else:
		return render(request,'admin/doctor reg.html')

def user_reg(request):
	if request.method=="POST":
		name=request.POST["name"]
		email=request.POST["email"]
		password=request.POST["password"]
		contact=request.POST["contact"]
		address=request.POST["address"]
		
		a=userreg_tb(name=name,email=email,password=password,contact=contact,address=address,)
		a.save()
		return render(request,'user/user reg.html',{'success':'Registered'})
	else:
		return render(request,'user/user reg.html')

def ptnt_login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["password"]
		chk=patientreg_tb.objects.filter(email=email,password=password)
		if chk:
			for x in chk:
				request.session['id']=x.id
			return render(request,'patient/ptnt loginhome.html',{'success':'Succesfully Login'})
			
		else:
			return render(request,'patient/ptnt login.html',{'error':'Incorrect password/email/Registration not accepted'})
	else:
		return render(request,'patient/ptnt login.html')

def sponser_login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["password"]
		chk=sponserreg_tb.objects.filter(email=email,password=password,admin_status="approved")
		if chk:
			for x in chk:
				request.session['id']=x.id
			return render(request,'sponser/spnsr loginhome.html',{'success':'Succesfully Login'})
			
		else:
			return render(request,'sponser/sponser login.html',{'error':'Incorrect password/email/Registration not accepted'})
	else:
		return render(request,'sponser/sponser login.html')

def user_login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["password"]
		chk=userreg_tb.objects.filter(email=email,password=password)
		if chk:
			for x in chk:
				request.session['id']=x.id
			return render(request,'user/user loginhome.html',{'success':'Succesfully Login'})
			
		else:
			return render(request,'user/user login.html')
	else:
		return render(request,'user/user login.html')

def user_story(request):
	if request.method=="POST":
		ii=request.session['id']
		name=request.POST["name"]
		email=request.POST["email"]
		story=request.POST["story"]
		pic=request.FILES['imgg']

		a=stories_tb(image=pic,name=name,email=email,story=story)
		a.save()
		return render(request,'user/user loginhome.html')
	else:
		ii=request.session['id']
		a=userreg_tb.objects.all().filter(id=ii)
		return render(request,'user/user thoughts.html',{'yy':a})

def inspirational_stories(request):
	var=stories_tb.objects.all()
	return render(request,'patient/user_inspirational_stories.html',{'db':var})

def dctr_login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["password"]
		chk=docreg_tb.objects.filter(email=email,password=password)
		if chk:
			for x in chk:
				request.session['id']=x.id
			return render(request,'doctor/doc loginhome.html',{'success':'Succesfully Login'})
			
		else:
			return render(request,'doctor/doc login.html')
	else:
		return render(request,'doctor/doc login.html')

def admin_login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["password"]
		chk=patientreg_tb.objects.filter(email=email,password=password)
		if chk:
			for x in chk:
				request.session['id']=x.id
			return render(request,'admin/admin home.html')
			
		else:
			return render(request,'admin/admin login.html')
	else:
		return render(request,'admin/admin login.html')



def logout(request):
	if request.session.has_key('id'):
		del request.session['id']
		logout(request)
	return HttpResponseRedirect('/')

def fn_sprt(request):
	if request.method=="POST":
		ii=request.session['id']
		pid=patientreg_tb.objects.all().get(id=ii)
		name=request.POST["name"]
		contact=request.POST["contact"]
		email=request.POST["email"]
		doctor=request.POST["doctor"]
		cancertype=request.POST["cancertype"]
		amount=request.POST["amount"]
		a=sp_applicaton_tb(patient_id=pid,name=name,contact=contact,email=email,doctor=doctor,cancertype=cancertype,amount=amount)
		a.save()
		return render(request,'patient/ptnt loginhome.html',{'success':'Registered'})
	else:
		ii=request.session['id']
		a=patientreg_tb.objects.all().filter(id=ii)
		b=appointment_tb.objects.all().filter(patient_id=ii)
		return render(request,'patient/financial sprt.html',{'cc':a,'dd':b})

def view_rpt(request):
	var=records_tb.objects.all()	
	return render(request,'admin/view report.html',{'vv':var})

def view_app(request):
	var=sp_applicaton_tb.objects.all().filter(status="0")	
	return render(request,'sponser/view application.html',{'zz':var})

def approve_appli(request):
	ii=request.GET['id']
	iii=request.session['id']
	var=sp_applicaton_tb.objects.all().filter(id=ii).update(status="approved")
	var1=sp_applicaton_tb.objects.all().filter(id=ii)
	var2=sponserreg_tb.objects.all().filter(id=iii)
	for x in var1:
		amt= x.amount

	# var=sp_applicaton_tb.objects.all().filter(status="pending")

	return render(request,'sponser/payment.html',{'amt':amt,'idd':ii,'db':var2})

def payment(request):
	if request.method=="POST":
		ii=request.session['id']
		pid=sponserreg_tb.objects.all().get(id=ii)
		amt=request.POST["amt"]
		idd=request.POST["idd"]
		sid=patientreg_tb.objects.all().get(id=idd)
		a=payment_tb(sponser_id=pid,patient_id=sid,amount=amt,status="paid")
		a.save()
		return HttpResponseRedirect('/view_app/')
def reject(request):
	ii=request.GET['id']
	var=sp_applicaton_tb.objects.all().filter(id=ii).update(status="rejected")
	var=sp_applicaton_tb.objects.all().filter(status="pending")
	return render(request,'sponser/view application.html',{'zz':var})

def records(request):
	if request.method=="POST":
		ii=request.session['id']
		a=patientreg_tb.objects.all().get(id=ii)
		name=request.POST["name"]
		contact=request.POST["contact"]
		disease=request.POST["disease"]
		symptoms=request.POST["symptoms"]
		medicine=request.POST["medicine"]
		gender=request.POST["gender"]
		
		a=records_tb(patient_id=a, name=name,contact=contact,disease=disease,symptoms=symptoms,medicine=medicine,gender=gender)
		a.save()
		return render(request,'patient/ptnt loginhome.html',{'success':'Registered'})
	else:
		ii=request.session['id']
		a=patientreg_tb.objects.all().filter(id=ii)
		return render(request,'patient/records.html',{'mm':a})

def ver_spon(request):
	var=sponserreg_tb.objects.all().filter(admin_status="pending")	
	return render(request,'admin/versponser.html',{'dd':var})

def approved(request):
	ii=request.GET['id']
	var=sponserreg_tb.objects.all().filter(id=ii).update(admin_status="approved")
	return HttpResponseRedirect('/ver_spon/')

def rejected(request):
	ii=request.GET['id']
	var=sponserreg_tb.objects.all().filter(id=ii).update(admin_status="rejected")
	return HttpResponseRedirect('/ver_spon/')
# def view_rec(request):
# 	ii=request.session['id']
# 	var2=doc_patient_list_tb.objects.all().filter(doctor_id=ii)
# 	for x in var2:
# 		idd=x.patient_id
# 		print("___________",idd)

# 		var=records_tb.objects.all().filter(patient_id=idd)
# 		print("_______+++________",var)	
# 	return render(request,'doctor/view records.html',{'aa':var})
def view_rec(request):
	if request.method=="POST":
		ii=request.session['id']
		var2=doc_patient_list_tb.objects.all().filter(doctor_id=ii)
		name=request.POST["name"]
		var=records_tb.objects.all().filter(patient_id=name)
		if var:
			return render(request,'doctor/view records.html',{'aa':var,'nn':var2})
		else:
			return render(request,'doctor/view records.html',{'aa':var,'nn':var2,'error':'records not exists'})
	else:
		ii=request.session['id']
		var2=doc_patient_list_tb.objects.all().filter(doctor_id=ii)
		var=records_tb.objects.all()
		print("_______+++________",var)	
		return render(request,'doctor/view records.html',{'aa':var,'nn':var2})

def approve(request):
	ii=request.GET['id']
	var=records_tb.objects.all().filter(id=ii).update(status="approved")
	var=records_tb.objects.all().filter(status="pending")
	return render(request,'doctor/view records.html',{'aa':var})

def reject(request):
	ii=request.GET['id']
	var=records_tb.objects.all().filter(id=ii).update(status="rejected")
	var=records_tb.objects.all().filter(status="pending")
	return render(request,'doctor/view records.html',{'aa':var})

def appointment(request):
	if request.method=="POST":
		ii=request.session['id']
		pid=patientreg_tb.objects.all().get(id=ii)
		name=request.POST["name"]
		contact=request.POST["contact"]
		email=request.POST["email"]
		doctorname=request.POST["doctorname"]
		did=docreg_tb.objects.all().get(id=doctorname)
		time=request.POST["time"]
		a=appointment_tb(patient_id=pid,doctor_id=did,name=name,contact=contact,email=email,doctorname=doctorname,time=time)
		a.save()
		var=doc_patient_list_tb.objects.all().filter(patient_id=pid,doctor_id=did)
		if var:
			return render(request,'patient/ptnt loginhome.html')
		else:
			a=doc_patient_list_tb(patient_id=pid,doctor_id=did)
			a.save()
			return render(request,'patient/ptnt loginhome.html')
	else:
		ii=request.session['id']
		a=patientreg_tb.objects.all().filter(id=ii)
		b=docreg_tb.objects.all()

		return render(request,'patient/appointment.html',{'jj':a,'nn':b})

def view_booking(request):
	ii=request.session['id']
	var=appointment_tb.objects.all().filter(doctor_id=ii)	
	return render(request,'doctor/view booking.html',{'uu':var})

def view_profile(request):
	var=patientreg_tb.objects.all().filter(status=0)	
	return render(request,'sponser/view patient profile.html',{'tt':var})		

def doc_instructions(request):
    if request.method == "POST":
        ii = request.session['id']  # doctor id from session
        patient_id = request.POST["patientname"]
        pid = patientreg_tb.objects.get(id=patient_id)
        did = docreg_tb.objects.get(id=ii)

        cancertype = request.POST["cancertype"]
        diet = request.POST["diet"]
        exercise = request.POST["exercise"]

        a = docinstructions_tb(
            patient_id=pid,
            doctor_id=did,
            name=pid.name,
            cancertype=cancertype,
            diet=diet,
            exercise=exercise
        )
        a.save()

        return render(request, 'doctor/doc loginhome.html', {'success': 'Instruction Saved'})
    else:
        ii = request.session['id']
        c = doc_patient_list_tb.objects.filter(doctor_id=ii)
        a = appointment_tb.objects.filter(doctor_id=ii)
        return render(request, 'doctor/doctor instructions.html', {'oo': a, 'pp': c})
	
def view_instructions(request):
    patient_id = request.session.get('id')
    if not patient_id:
        return redirect('ptnt_login')  # redirect if not logged in

    instructions = docinstructions_tb.objects.filter(patient_id=patient_id)

    return render(request, 'patient/view instructions.html', {'instructions': instructions})

def patient_chat(request):
	if request.method=="POST":
		ii=request.session['id']
		msg=request.POST["msg"]
		print(msg)

		name=request.POST["doctorname"]
		var=docreg_tb.objects.all().filter(name=name)
		for x in var:
			idd=x.id
		did=docreg_tb.objects.all().get(id=idd)
		pid=patientreg_tb.objects.all().get(id=ii)
		DT = datetime.datetime.now()
		date = DT.strftime("%Y-%m-%d")
		time = DT.strftime("%H:%M:%S")
		print(time,date)

		a=patientchat_tb(doctor_id=did,patient_id=pid,msg=msg,date=date,time=time)
		a.save()
		ii=request.session['id']
		# var=docchat_tb.objects.all().filter(patient_id=ii)	
		var2=patientchat_tb.objects.all().filter(patient_id=ii)
		return render(request,'patient/patient chat.html',{'qq':var,'hh':var2})		
		
		# return render(request,'patient/ptnt loginhome.html')
	else:
		ii=request.session['id']
		a=appointment_tb.objects.all().filter(patient_id=ii)
		# var=docchat_tb.objects.all().filter(patient_id=ii)	
		var2=patientchat_tb.objects.all().filter(patient_id=ii)
		return render(request,'patient/patient chat.html',{'zz':a,'hh':var2})



def chat(request):
	ii=request.session['id']
	a=patientchat_tb.objects.all().filter(doctor_id=ii,replay="0")
	return render(request,'doctor/view patientlist.html',{'db':a})

def doc_chat(request):
	if request.method=="POST":
		ii=request.session['id']
		msg=request.POST["msg"]
		print(msg)

		name=request.POST["pid"]
		apid=request.POST["apid"]
		print("_________________________",name)
		did=docreg_tb.objects.all().get(id=ii)
		# pid=patientreg_tb.objects.all().get(id=name)
		# obj=addcustomer_tb.objects.latest('id')
  #       id_no=int(obj.id)
           
  #           uid=addcustomer_tb.objects.get(id=id_no)
		a=patientchat_tb.objects.all().filter(id=apid,doctor_id=did,patient_id=name).update(replay=msg)
		# var=docchat_tb.objects.all().filter(patient_id=ii)	
		var2=patientchat_tb.objects.all().filter(doctor_id=ii)
		# return render(request,'doctor/doctorchat.html',{'hh':var2})		
		return HttpResponseRedirect('/chat/')
		
		# return render(request,'patient/ptnt loginhome.html')
	else:
		ii=request.session['id']
		aa=request.GET['id']
		var=patientchat_tb.objects.all().filter(id=aa)
		for x in var:
			idd=x.patient_id.id
		# a=appointment_tb.objects.all().filter(patient_id=ii)
		# var=docchat_tb.objects.all().filter(patient_id=ii)	
		var2=patientchat_tb.objects.all().filter(doctor_id=ii)
		return render(request,'doctor/doctorchat.html',{'idd':idd,'apid':aa,'hh':var2})