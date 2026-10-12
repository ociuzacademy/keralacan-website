from datetime import datetime

from django.conf import settings
from django.contrib import messages
from django.contrib.auth import logout as auth_logout
from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.shortcuts import redirect, render

from prediction.views import _current_patient

from .models import (
    patientreg_tb,
    sponserreg_tb,
    userreg_tb,
    docreg_tb,
    payment_tb,
    records_tb,
    doc_patient_list_tb,
    sp_applicaton_tb,
    stories_tb,
    appointment_tb,
    docinstructions_tb,
    patientchat_tb,
)


# --------------------------------------------------
# HOME
# --------------------------------------------------

def home_fun(request):
    return render(request, "index.html")


# --------------------------------------------------
# PATIENT REGISTRATION
# --------------------------------------------------

def patient_reg(request):
    if request.method == "POST":
        name = request.POST["name"]
        dob = request.POST["dob"]
        age = request.POST["age"]
        email = request.POST["email"]
        password = request.POST["password"]
        contact = request.POST["contact"]
        address = request.POST["address"]
        gender = request.POST["gender"]

        patient = patientreg_tb(
            name=name,
            dob=dob,
            age=age,
            email=email,
            password=password,
            contact=contact,
            address=address,
            gender=gender,
        )
        patient.save()

        return render(
            request,
            "patient/patient reg.html",
            {"success": "Registered"},
        )

    return render(request, "patient/patient reg.html")


# --------------------------------------------------
# SPONSOR REGISTRATION
# --------------------------------------------------

def sponser_reg(request):
    if request.method == "POST":
        name = request.POST["name"]
        dob = request.POST["dob"]
        email = request.POST["email"]
        password = request.POST["password"]
        contact = request.POST["contact"]
        address = request.POST["address"]
        gender = request.POST["gender"]

        sponsor = sponserreg_tb(
            name=name,
            dob=dob,
            email=email,
            password=password,
            contact=contact,
            address=address,
            gender=gender,
        )
        sponsor.save()

        return render(
            request,
            "sponser/sponser reg.html",
            {"success": "Registered"},
        )

    return render(request, "sponser/sponser reg.html")


# --------------------------------------------------
# DOCTOR REGISTRATION
# --------------------------------------------------

def doc_reg(request):
    if request.method == "POST":
        name = request.POST["name"]
        email = request.POST["email"]
        password = request.POST["password"]
        contact = request.POST["contact"]
        address = request.POST["address"]
        specialisation = request.POST["spc"]

        doctor = docreg_tb(
            specialisation=specialisation,
            name=name,
            email=email,
            password=password,
            contact=contact,
            address=address,
        )
        doctor.save()

        subject = "Welcome to CancerCare"
        message = (
            f"Hi {name},\n\n"
            "Your doctor registration has been completed."
        )

        send_mail(
            subject,
            message,
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,
        )

        return render(
            request,
            "admin/doctor reg.html",
            {"success": "Doctor registered successfully"},
        )

    return render(request, "admin/doctor reg.html")


# --------------------------------------------------
# GENERAL USER REGISTRATION
# --------------------------------------------------

def user_reg(request):
    if request.method == "POST":
        name = request.POST["name"]
        email = request.POST["email"]
        password = request.POST["password"]
        contact = request.POST["contact"]
        address = request.POST["address"]

        user = userreg_tb(
            name=name,
            email=email,
            password=password,
            contact=contact,
            address=address,
        )
        user.save()

        return render(
            request,
            "user/user reg.html",
            {"success": "Registered"},
        )

    return render(request, "user/user reg.html")


# --------------------------------------------------
# PATIENT LOGIN
# --------------------------------------------------

def ptnt_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        patient = patientreg_tb.objects.filter(
            email=email,
            password=password,
        ).first()

        if patient:
            request.session["id"] = patient.id
            request.session["role"] = "patient"

            return render(
                request,
                "patient/ptnt loginhome.html",
                {"success": "Successfully logged in"},
            )

        return render(
            request,
            "patient/ptnt login.html",
            {
                "error": (
                    "Incorrect email/password or "
                    "registration not accepted"
                )
            },
        )

    return render(request, "patient/ptnt login.html")


# --------------------------------------------------
# SPONSOR LOGIN
# --------------------------------------------------

def sponser_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        sponsor = sponserreg_tb.objects.filter(
            email=email,
            password=password,
            admin_status="approved",
        ).first()

        if sponsor:
            request.session["id"] = sponsor.id
            request.session["role"] = "sponsor"

            return render(
                request,
                "sponser/spnsr loginhome.html",
                {"success": "Successfully logged in"},
            )

        return render(
            request,
            "sponser/sponser login.html",
            {
                "error": (
                    "Incorrect email/password or "
                    "registration not accepted"
                )
            },
        )

    return render(request, "sponser/sponser login.html")


# --------------------------------------------------
# GENERAL USER LOGIN
# --------------------------------------------------

def user_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        user = userreg_tb.objects.filter(
            email=email,
            password=password,
        ).first()

        if user:
            request.session["id"] = user.id
            request.session["role"] = "user"

            return render(
                request,
                "user/user loginhome.html",
                {"success": "Successfully logged in"},
            )

        return render(
            request,
            "user/user login.html",
            {"error": "Incorrect email or password"},
        )

    return render(request, "user/user login.html")


# --------------------------------------------------
# DOCTOR LOGIN
# --------------------------------------------------

def dctr_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        doctor = docreg_tb.objects.filter(
            email=email,
            password=password,
        ).first()

        if doctor:
            request.session["id"] = doctor.id
            request.session["role"] = "doctor"

            return render(
                request,
                "doctor/doc loginhome.html",
                {"success": "Successfully logged in"},
            )

        return render(
            request,
            "doctor/doc login.html",
            {"error": "Incorrect email or password"},
        )

    return render(request, "doctor/doc login.html")


# --------------------------------------------------
# ADMIN LOGIN
# --------------------------------------------------

def admin_login(request):
    """
    IMPORTANT:
    The original project checks patientreg_tb for admin login.
    That is not a proper admin authentication system.
    Replace this with a Django superuser/staff authentication
    flow before using the application in production.
    """
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]

        patient = patientreg_tb.objects.filter(
            email=email,
            password=password,
        ).first()

        if patient:
            request.session["id"] = patient.id
            request.session["role"] = "admin"

            return render(request, "admin/admin home.html")

        return render(
            request,
            "admin/admin login.html",
            {"error": "Invalid login credentials"},
        )

    return render(request, "admin/admin login.html")


# --------------------------------------------------
# LOGOUT
# --------------------------------------------------

def user_logout(request):
    # Clear the application session.
    request.session.flush()

    # Django logout is aliased as auth_logout to avoid recursion.
    auth_logout(request)

    return redirect("home")


# --------------------------------------------------
# PATIENT FINANCIAL SUPPORT APPLICATION
# --------------------------------------------------

def fn_sprt(request):
    if request.method == "POST":
        patient_id = request.session.get("id")

        if not patient_id or request.session.get("role") != "patient":
            return redirect("ptnt_login")

        patient = patientreg_tb.objects.get(id=patient_id)

        name = request.POST["name"]
        contact = request.POST["contact"]
        email = request.POST["email"]
        doctor = request.POST["doctor"]
        cancer_type = request.POST["cancertype"]
        amount = request.POST["amount"]

        application = sp_applicaton_tb(
            patient_id=patient,
            name=name,
            contact=contact,
            email=email,
            doctor=doctor,
            cancertype=cancer_type,
            amount=amount,
        )
        application.save()

        return render(
            request,
            "patient/ptnt loginhome.html",
            {"success": "Application submitted successfully"},
        )

    patient_id = request.session.get("id")

    if not patient_id:
        return redirect("ptnt_login")

    patients = patientreg_tb.objects.filter(id=patient_id)
    appointments = appointment_tb.objects.filter(patient_id=patient_id)

    return render(
        request,
        "patient/financial sprt.html",
        {"cc": patients, "dd": appointments},
    )


# --------------------------------------------------
# ADMIN: VIEW REPORTS
# --------------------------------------------------

def view_rpt(request):
    reports = records_tb.objects.all()

    return render(
        request,
        "admin/view report.html",
        {"vv": reports},
    )


# --------------------------------------------------
# SPONSOR: VIEW APPLICATIONS
# --------------------------------------------------

def view_app(request):
    applications = sp_applicaton_tb.objects.filter(status="0")

    return render(
        request,
        "sponser/view application.html",
        {"zz": applications},
    )


# --------------------------------------------------
# SPONSOR: APPROVE APPLICATION
# --------------------------------------------------

def approve_appli(request):
    application_id = request.GET.get("id")
    sponsor_id = request.session.get("id")

    if not application_id or not sponsor_id:
        return redirect("view_app")

    application = sp_applicaton_tb.objects.filter(
        id=application_id
    ).first()

    sponsor = sponserreg_tb.objects.filter(
        id=sponsor_id
    )

    if not application:
        return redirect("view_app")

    application.status = "approved"
    application.save(update_fields=["status"])

    return render(
        request,
        "sponser/payment.html",
        {
            "amt": application.amount,
            "idd": application.patient_id_id,
            "application_id": application.id,
            "db": sponsor,
        },
    )


# --------------------------------------------------
# SPONSOR: PAYMENT
# --------------------------------------------------

def payment(request):
    if request.method == "POST":
        sponsor_id = request.session.get("id")

        if not sponsor_id or request.session.get("role") != "sponsor":
            return redirect("sponser_login")

        sponsor = sponserreg_tb.objects.filter(
            id=sponsor_id
        ).first()

        patient_id = request.POST.get("idd")
        amount = request.POST.get("amt")

        if not sponsor or not patient_id or not amount:
            return render(
                request,
                "sponser/payment.html",
                {"error": "Required payment details are missing"},
            )

        patient = patientreg_tb.objects.filter(
            id=patient_id
        ).first()

        if not patient:
            return redirect("view_app")

        payment_record = payment_tb(
            sponser_id=sponsor,
            patient_id=patient,
            amount=amount,
            status="paid",
        )
        payment_record.save()

        return redirect("view_app")

    return redirect("view_app")


# --------------------------------------------------
# SPONSOR: REJECT APPLICATION
# --------------------------------------------------

def reject_application(request):
    application_id = request.GET.get("id")

    if not application_id:
        return redirect("view_app")

    sp_applicaton_tb.objects.filter(
        id=application_id
    ).update(status="rejected")

    return redirect("view_app")


# --------------------------------------------------
# PATIENT: ADD MEDICAL RECORD
# --------------------------------------------------

def records(request):
    patient_id = request.session.get("id")

    if not patient_id or request.session.get("role") != "patient":
        return redirect("ptnt_login")

    if request.method == "POST":
        patient = patientreg_tb.objects.get(id=patient_id)

        name = request.POST["name"]
        contact = request.POST["contact"]
        disease = request.POST["disease"]
        symptoms = request.POST["symptoms"]
        medicine = request.POST["medicine"]
        gender = request.POST["gender"]

        record = records_tb(
            patient_id=patient,
            name=name,
            contact=contact,
            disease=disease,
            symptoms=symptoms,
            medicine=medicine,
            gender=gender,
        )
        record.save()

        return render(
            request,
            "patient/ptnt loginhome.html",
            {"success": "Record saved successfully"},
        )

    patient_data = patientreg_tb.objects.filter(id=patient_id)

    return render(
        request,
        "patient/records.html",
        {"mm": patient_data},
    )


# --------------------------------------------------
# ADMIN: VIEW SPONSORS PENDING APPROVAL
# --------------------------------------------------

def ver_spon(request):
    sponsors = sponserreg_tb.objects.filter(
        admin_status="pending"
    )

    return render(
        request,
        "admin/versponser.html",
        {"dd": sponsors},
    )


# --------------------------------------------------
# ADMIN: APPROVE SPONSOR
# --------------------------------------------------

def approved(request):
    sponsor_id = request.GET.get("id")

    if not sponsor_id:
        return redirect("ver_spon")

    sponserreg_tb.objects.filter(
        id=sponsor_id
    ).update(admin_status="approved")

    return redirect("ver_spon")


# --------------------------------------------------
# ADMIN: REJECT SPONSOR
# --------------------------------------------------

def rejected(request):
    sponsor_id = request.GET.get("id")

    if not sponsor_id:
        return redirect("ver_spon")

    sponserreg_tb.objects.filter(
        id=sponsor_id
    ).update(admin_status="rejected")

    return redirect("ver_spon")


# --------------------------------------------------
# DOCTOR: VIEW PATIENT RECORDS
# --------------------------------------------------

def view_rec(request):
    doctor_id = request.session.get("id")

    if not doctor_id or request.session.get("role") != "doctor":
        return redirect("dctr_login")

    doctor_patients = doc_patient_list_tb.objects.filter(
        doctor_id=doctor_id
    )

    patient_ids = doctor_patients.values_list(
        "patient_id",
        flat=True,
    )

    patient_records = records_tb.objects.filter(
        patient_id__in=patient_ids
    )

    if request.method == "POST":
        patient_id = request.POST.get("name")

        if patient_id:
            patient_records = patient_records.filter(
                patient_id=patient_id
            )

        if not patient_records.exists():
            return render(
                request,
                "doctor/view records.html",
                {
                    "aa": patient_records,
                    "nn": doctor_patients,
                    "error": "Records do not exist",
                },
            )

    return render(
        request,
        "doctor/view records.html",
        {
            "aa": patient_records,
            "nn": doctor_patients,
        },
    )


# --------------------------------------------------
# DOCTOR: APPROVE MEDICAL RECORD
# --------------------------------------------------

def approve(request):
    record_id = request.GET.get("id")
    doctor_id = request.session.get("id")

    if not record_id or not doctor_id:
        return redirect("view_rec")

    patient_ids = doc_patient_list_tb.objects.filter(
        doctor_id=doctor_id
    ).values_list("patient_id", flat=True)

    records_tb.objects.filter(
        id=record_id,
        patient_id__in=patient_ids,
    ).update(status="approved")

    return redirect("view_rec")


# --------------------------------------------------
# DOCTOR: REJECT MEDICAL RECORD
# --------------------------------------------------

def reject_record(request):
    record_id = request.GET.get("id")
    doctor_id = request.session.get("id")

    if not record_id or not doctor_id:
        return redirect("view_rec")

    patient_ids = doc_patient_list_tb.objects.filter(
        doctor_id=doctor_id
    ).values_list("patient_id", flat=True)

    records_tb.objects.filter(
        id=record_id,
        patient_id__in=patient_ids,
    ).update(status="rejected")

    return redirect("view_rec")


# --------------------------------------------------
# PATIENT: BOOK APPOINTMENT
# --------------------------------------------------

def appointment(request):
    patient_id = request.session.get("id")

    if not patient_id or request.session.get("role") != "patient":
        return redirect("ptnt_login")

    if request.method == "POST":
        patient = patientreg_tb.objects.get(id=patient_id)

        name = request.POST["name"]
        contact = request.POST["contact"]
        email = request.POST["email"]
        doctor_id = request.POST["doctorname"]
        appointment_time = request.POST["time"]

        doctor = docreg_tb.objects.get(id=doctor_id)

        booking = appointment_tb(
            patient_id=patient,
            doctor_id=doctor,
            name=name,
            contact=contact,
            email=email,
            doctorname=doctor_id,
            time=appointment_time,
        )
        booking.save()

        doc_patient_list_tb.objects.get_or_create(
            patient_id=patient,
            doctor_id=doctor,
        )

        return render(
            request,
            "patient/ptnt loginhome.html",
            {"success": "Appointment booked successfully"},
        )

    patients = patientreg_tb.objects.filter(id=patient_id)
    doctors = docreg_tb.objects.all()

    return render(
        request,
        "patient/appointment.html",
        {"jj": patients, "nn": doctors},
    )


# --------------------------------------------------
# DOCTOR: VIEW BOOKINGS
# --------------------------------------------------

def view_booking(request):
    doctor_id = request.session.get("id")

    if not doctor_id or request.session.get("role") != "doctor":
        return redirect("dctr_login")

    bookings = appointment_tb.objects.filter(
        doctor_id=doctor_id
    )

    return render(
        request,
        "doctor/view booking.html",
        {"uu": bookings},
    )


# --------------------------------------------------
# SPONSOR: VIEW PATIENT PROFILES
# --------------------------------------------------

def view_profile(request):
    if request.session.get("role") != "sponsor":
        return redirect("sponser_login")

    patients = patientreg_tb.objects.filter(status=0)

    return render(
        request,
        "sponser/view patient profile.html",
        {"tt": patients},
    )


# --------------------------------------------------
# DOCTOR: ADD PATIENT INSTRUCTIONS
# --------------------------------------------------

def doc_instructions(request):
    doctor_id = request.session.get("id")

    if not doctor_id or request.session.get("role") != "doctor":
        return redirect("dctr_login")

    if request.method == "POST":
        patient_id = request.POST["patientname"]

        doctor = docreg_tb.objects.get(id=doctor_id)
        patient = patientreg_tb.objects.get(id=patient_id)

        # Confirm that this patient is assigned to this doctor.
        assigned = doc_patient_list_tb.objects.filter(
            doctor_id=doctor_id,
            patient_id=patient_id,
        ).exists()

        if not assigned:
            return render(
                request,
                "doctor/doctor instructions.html",
                {
                    "error": "This patient is not assigned to you",
                    "pp": doc_patient_list_tb.objects.filter(
                        doctor_id=doctor_id
                    ),
                    "oo": appointment_tb.objects.filter(
                        doctor_id=doctor_id
                    ),
                },
            )

        instruction = docinstructions_tb(
            patient_id=patient,
            doctor_id=doctor,
            name=patient.name,
            cancertype=request.POST["cancertype"],
            diet=request.POST["diet"],
            exercise=request.POST["exercise"],
        )
        instruction.save()

        return render(
            request,
            "doctor/doc loginhome.html",
            {"success": "Instruction saved successfully"},
        )

    doctor_patients = doc_patient_list_tb.objects.filter(
        doctor_id=doctor_id
    )
    bookings = appointment_tb.objects.filter(
        doctor_id=doctor_id
    )

    return render(
        request,
        "doctor/doctor instructions.html",
        {"oo": bookings, "pp": doctor_patients},
    )


# --------------------------------------------------
# PATIENT: VIEW DOCTOR INSTRUCTIONS
# --------------------------------------------------

def view_instructions(request):
    patient_id = request.session.get("id")

    if not patient_id or request.session.get("role") != "patient":
        return redirect("ptnt_login")

    instructions = docinstructions_tb.objects.filter(
        patient_id=patient_id
    )

    return render(
        request,
        "patient/view instructions.html",
        {"instructions": instructions},
    )


# --------------------------------------------------
# PATIENT: CHAT WITH DOCTOR
# --------------------------------------------------

def patient_chat(request):
    patient_id = request.session.get("id")

    if not patient_id or request.session.get("role") != "patient":
        return redirect("ptnt_login")

    if request.method == "POST":
        message = request.POST.get("msg", "").strip()
        doctor_name = request.POST.get("doctorname")

        if not message or not doctor_name:
            appointments = appointment_tb.objects.filter(
                patient_id=patient_id
            )
            messages = patientchat_tb.objects.filter(
                patient_id=patient_id
            )

            return render(
                request,
                "patient/patient chat.html",
                {
                    "zz": appointments,
                    "hh": messages,
                    "error": "Please enter a message and select a doctor",
                },
            )

        doctor = docreg_tb.objects.filter(
            name=doctor_name
        ).first()

        if not doctor:
            return redirect("patient_chat")

        patient = patientreg_tb.objects.get(id=patient_id)

        now = datetime.now()

        chat_message = patientchat_tb(
            doctor_id=doctor,
            patient_id=patient,
            msg=message,
            date=now.strftime("%Y-%m-%d"),
            time=now.strftime("%H:%M:%S"),
        )
        chat_message.save()

        return redirect("patient_chat")

    appointments = appointment_tb.objects.filter(
        patient_id=patient_id
    )
    messages = patientchat_tb.objects.filter(
        patient_id=patient_id
    )

    return render(
        request,
        "patient/patient chat.html",
        {"zz": appointments, "hh": messages},
    )


# --------------------------------------------------
# DOCTOR: VIEW PATIENT CHAT LIST
# --------------------------------------------------

def chat(request):
    doctor_id = request.session.get("id")

    if not doctor_id or request.session.get("role") != "doctor":
        return redirect("dctr_login")

    messages = patientchat_tb.objects.filter(
        doctor_id=doctor_id,
        replay="0",
    )

    return render(
        request,
        "doctor/view patientlist.html",
        {"db": messages},
    )


# --------------------------------------------------
# DOCTOR: REPLY TO PATIENT CHAT
# --------------------------------------------------

def doc_chat(request):
    doctor_id = request.session.get("id")

    if not doctor_id or request.session.get("role") != "doctor":
        return redirect("dctr_login")

    if request.method == "POST":
        message = request.POST.get("msg", "").strip()
        patient_id = request.POST.get("pid")
        chat_id = request.POST.get("apid")

        if not message or not patient_id or not chat_id:
            return redirect("chat")

        updated = patientchat_tb.objects.filter(
            id=chat_id,
            doctor_id=doctor_id,
            patient_id=patient_id,
        ).update(replay=message)

        return redirect("chat")

    chat_id = request.GET.get("id")

    if not chat_id:
        return redirect("chat")

    message = patientchat_tb.objects.filter(
        id=chat_id,
        doctor_id=doctor_id,
    ).select_related("patient_id").first()

    if not message:
        return redirect("chat")

    doctor_messages = patientchat_tb.objects.filter(
        doctor_id=doctor_id
    )

    return render(
        request,
        "doctor/doctorchat.html",
        {
            "idd": message.patient_id.id,
            "apid": message.id,
            "hh": doctor_messages,
        },
    )


# --------------------------------------------------
# GENERAL USER: POST A STORY
# --------------------------------------------------

def user_story(request):
    user_id = request.session.get("id")

    if not user_id or request.session.get("role") != "user":
        return redirect("user_login")

    if request.method == "POST":
        name = request.POST["name"]
        email = request.POST["email"]
        story = request.POST["story"]
        picture = request.FILES.get("imgg")

        if not picture:
            user = userreg_tb.objects.filter(id=user_id)

            return render(
                request,
                "user/user thoughts.html",
                {
                    "yy": user,
                    "error": "Please select an image",
                },
            )

        story_record = stories_tb(
            image=picture,
            name=name,
            email=email,
            story=story,
        )
        story_record.save()

        return render(
            request,
            "user/user loginhome.html",
            {"success": "Story submitted successfully"},
        )

    user = userreg_tb.objects.filter(id=user_id)

    return render(
        request,
        "user/user thoughts.html",
        {"yy": user},
    )


# --------------------------------------------------
# PATIENT: VIEW INSPIRATIONAL STORIES
# --------------------------------------------------

def inspirational_stories(request):
    stories = stories_tb.objects.all()

    return render(
        request,
        "patient/user_inspirational_stories.html",
        {"db": stories},
    )

def pnt_home(request):
    patient = _current_patient(request)
    if patient is None:
        messages.error(request, "Please sign in with a patient account to view prediction history.")
        return redirect("/")
    return render(request, "patient/ptnt loginhome.html", {"patient": patient})