from django.db import models

# Create your models here.
class patientreg_tb(models.Model):
	name=models.CharField(max_length=100,default='')
	dob=models.CharField(max_length=100,default='')
	age=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	password=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	address=models.CharField(max_length=100,default='')
	gender=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='0')
	
class sponserreg_tb(models.Model):
	name=models.CharField(max_length=100,default='')
	dob=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	password=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	address=models.CharField(max_length=100,default='')
	gender=models.CharField(max_length=100,default='')
	admin_status=models.CharField(max_length=100,default='pending')	

class docreg_tb(models.Model):
	name=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	password=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	address=models.CharField(max_length=100,default='')
	specialisation=models.CharField(max_length=100,default='')


class userreg_tb(models.Model):
	name=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	password=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	address=models.CharField(max_length=100,default='')

class records_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE, blank=True, null=True)
	name=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	disease=models.CharField(max_length=100,default='')
	symptoms=models.CharField(max_length=100,default='')
	medicine=models.CharField(max_length=100,default='')
	gender=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='pending')

class stories_tb(models.Model):
	name=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	story=models.CharField(max_length=100,default='')
	image=models.ImageField(upload_to = 'files' ,default='0')


# class verifysponser_tb(models.Model):
# 	sponser_id=models.ForeignKey(sponserreg_tb,on_delete=models.CASCADE)

# class viewrec_tb(models.Model):
# 	patient_id=models.ForeignKey(records_tb,on_delete=models.CASCADE)

	
class sp_applicaton_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	name=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	doctor=models.CharField(max_length=100,default='')
	cancertype=models.CharField(max_length=100,default='')
	amount=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='0')
	sponser_email=models.CharField(max_length=100,default='0')

class appointment_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	doctor_id=models.ForeignKey(docreg_tb,on_delete=models.CASCADE)
	name=models.CharField(max_length=100,default='')
	contact=models.CharField(max_length=100,default='')
	email=models.CharField(max_length=100,default='')
	doctorname=models.CharField(max_length=100,default='')
	time=models.CharField(max_length=100,default='')




class docinstructions_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	doctor_id=models.ForeignKey(docreg_tb,on_delete=models.CASCADE)
	name=models.CharField(max_length=100,default='')
	cancertype=models.CharField(max_length=100,default='')
	diet=models.CharField(max_length=100,default='')
	exercise=models.CharField(max_length=100,default='')

class patientchat_tb(models.Model):
	doctor_id=models.ForeignKey(docreg_tb,on_delete=models.CASCADE)
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	msg=models.CharField(max_length=100,default='')
	replay=models.CharField(max_length=100,default='0')
	time=models.CharField(max_length=100,default='0')
	date=models.CharField(max_length=100,default='0')
# Create your models here.
class doc_patient_list_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	doctor_id=models.ForeignKey(docreg_tb,on_delete=models.CASCADE)

class payment_tb(models.Model):
	patient_id=models.ForeignKey(patientreg_tb,on_delete=models.CASCADE)
	sponser_id=models.ForeignKey(sponserreg_tb,on_delete=models.CASCADE)
	amount=models.CharField(max_length=100,default='')
	status=models.CharField(max_length=100,default='')
	# msg=models.CharField(max_length=100,default='')