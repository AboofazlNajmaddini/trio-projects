# Ansible Configuration Management

## English

### Project Overview

An Infrastructure as Code project using Ansible to automate server configuration.
The project involves setting up an Ansible control node (host machine) and a target node (Ubuntu VM) to deploy Nginx with a custom HTML page.

---

### The Biggest Challenge: VM Resource Limitations

The main challenge in this project was **not Ansible itself**, but the **infrastructure limitations**:

| Challenge | Description | Solution |
|-----------|-------------|----------|
| **High RAM Usage** | Running a full Ubuntu VM caused excessive memory consumption | Used Ubuntu Server (minimal) instead of desktop version |
| **System Freezes/Crashes** | VM would freeze or crash due to resource constraints | Optimized VM settings, reduced allocated resources |
| **SSH Connectivity** | Establishing reliable SSH connection between host and VM | Configured bridged network, tested connectivity thoroughly |
| **Multiple Attempts** | Many failed attempts before successful configuration | Persistence and systematic troubleshooting |

---

### What I Did

1. **Set up Ansible control node** on my host machine
2. **Installed Ubuntu Server VM** as the target node (minimal installation to save resources)
3. **Configured SSH access** between host and VM
4. **Created an inventory file** defining the target host
5. **Developed two separate roles:**
   - **Role 1:** Ansible installer (**Optical**)
   - **Role 2:** Nginx installation, configuration, and HTML deployment
6. **Implemented idempotency** so repeated runs skip unnecessary tasks
7. **Tested the playbook** multiple times to verify idempotent behavior

---

### Project Structure

```
Ansible/
├── README.md               # This documentation
├── inventory               # Inventory file defining hosts
├── playbook.yml            # Main playbook
└── roles/                  # Roles directory
    ├── Ansible/            # Role 1: Ansible installer (**Optical**)
    │   └── tasks/
    │        └── main.yml   # Ansible tasks
    │   
    │       
    └── nginx/              # Role 2: Nginx setup
        ├── tasks/
        │   └── main.yml    # Nginx tasks
        └── files/
            └── index.html  # Custom HTML template

```

---

### Role Details

#### Role 1: Ansible (**Optical**)
- Updates apt cache
- Installs Ansible packages

#### Role 2: Nginx
- Installs Nginx package
- Creates custom HTML page from files
- Copies HTML file to Desktop directory
- Starts and enables Nginx service
- Verifies service is running

## فارسی

<div dir="rtl">

### خلاصه پروژه

یک پروژه زیرساخت به عنوان کد با استفاده از Ansible برای خودکارسازی پیکربندی سرور.
در این پروژه، یک گره کنترل Ansible (سیستم میزبان) و یک گره هدف (VM اوبونتو) برای استقرار Nginx با صفحه HTML سفارشی راه‌اندازی شد.

---

### بزرگترین چالش: محدودیت منابع VM

چالش اصلی این پروژه **خود Ansible نبود**، بلکه **محدودیت‌های زیرساختی** بود:

| چالش | توضیحات | راه‌حل |
|------|---------|--------|
| **مصرف بالای RAM** | اجرای VM کامل اوبونتو مصرف حافظه زیادی داشت | استفاده از Ubuntu Server (نسخه مینیمال) به جای نسخه دسکتاپ |
| **فریز شدن سیستم** | VM به دلیل کمبود منابع فریز یا کرش می‌کرد | بهینه‌سازی تنظیمات VM، کاهش منابع تخصیص داده شده |
| **اتصال SSH** | برقراری ارتباط SSH پایدار بین میزبان و VM | پیکربندی شبکه bridged، تست کامل connectivity |
| **تلاش‌های متعدد** | چندین بار تلاش ناموفق قبل از پیکربندی موفق | پشتکار و عیب‌یابی سیستماتیک |

---

### کاری که انجام دادم

1. **راه‌اندازی گره کنترل Ansible** روی سیستم میزبان
2. **نصب VM اوبونتو سرور** به عنوان گره هدف (نصب مینیمال برای صرفه‌جویی در منابع)
3. **پیکربندی دسترسی SSH** بین میزبان و VM
4. **ایجاد فایل inventory** که میزبان هدف را تعریف می‌کند
5. **توسعه دو رول جداگانه:**
   - **رول ۱:** راه‌اندازی و نصب انسیبل (درصورت نیاز)
   - **رول ۲:** نصب Nginx، پیکربندی و استقرار HTML
6. **پیاده‌سازی خاصیت idempotent** تا اجرای مجدد، تسک‌های غیرضروری را اسکیپ کند
7. **تست playbook** چندین بار برای تأیید رفتار idempotent

### جزئیات رول‌ها

#### رول ۱: Ansible installer (درصورت نیاز)
- بروزرسانی apt cache
- نصب پکیج‌های انسیبل

#### رول ۲: Nginx
- نصب پکیج Nginx
- ایجاد صفحه HTML سفارشی از template
- کپی فایل HTML به دایرکتوری وب
- شروع و فعال‌سازی سرویس Nginx
- تأیید اجرای سرویس

---

