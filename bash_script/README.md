# Bash Script for System Monitoring and Nginx Setup

<div dir="rtl">

## اسکریپت Bash برای مانیتورینگ سیستم و راه‌اندازی Nginx

</div>

## English

### Project Overview

A comprehensive Bash script that monitors system resources (CPU, RAM, Disk) and automates Nginx installation and configuration. This project was tested inside a custom Ubuntu Docker image.

### Challenges Faced & Solutions

Since I was new to Bash scripting, I faced several challenges and used **ChatGPT** to overcome them:

| Challenge | Solution |
|-----------|----------|
| **Monitoring CPU usage** | Learned to use `top`, `mpstat`, and `/proc/stat` to calculate CPU usage percentages |
| **Checking RAM usage** | Used `free -m` and `awk` to extract used and free memory values |
| **Disk space reporting** | Implemented `df -h` with proper parsing to show human-readable disk usage |
| **Service status checking** | Used `systemctl` commands with proper exit code handling |
| **Testing environment** | Created a custom Ubuntu Docker image to test the script in isolation |

### What I Did

1. **Wrote a Bash script** with modular functions for each task
2. **Added extensive comments** to make the code readable and maintainable
3. **Used functions** to organize code logically
4. **Implemented error handling** for graceful failures
5. **Created a custom Docker image** based on Ubuntu with necessary packages
6. **Tested the script** inside the Docker container to verify functionality



## فارسی

<div dir="rtl">

### خلاصه پروژه

یک اسکریپت Bash جامع که منابع سیستم (CPU، RAM، دیسک) را مانیتور کرده و نصب و پیکربندی Nginx را خودکار می‌کند. این پروژه داخل یک Docker اوبونتو سفارشی تست شده است.

### چالش‌ها و راه‌حل‌ها

از آنجایی که در Bash اسکریپت‌نویسی تازه‌کار بودم، با چندین چالش روبرو شدم و از **ChatGPT** برای حل آنها استفاده کردم:

| چالش | راه‌حل |
|------|--------|
| **مانیتورینگ CPU** | یادگیری استفاده از `top`، `mpstat` و `/proc/stat` برای محاسبه درصد مصرف CPU |
| **بررسی RAM** | استفاده از `free -m` و `awk` برای استخراج مقادیر حافظه استفاده شده و آزاد |
| **گزارش دیسک** | پیاده‌سازی `df -h` با پردازش مناسب برای نمایش مصرف دیسک به صورت خوانا |
| **بررسی وضعیت سرویس** | استفاده از دستورات `systemctl` |
| **محیط تست** | ساختن یک Docker اوبونتو سفارشی برای تست|

### کاری که انجام دادم

1. **نوشتم یک اسکریپت Bash** با توابع ماژولار برای هر وظیفه
2. **اضافه کردم کامنت‌های گسترده** برای خوانایی و نگهداری آسان کد
3. **استفاده کردم از توابع** برای سازماندهی منطقی کد
4. **پیاده‌سازی کردم مدیریت خطا** برای شکست‌های کنترل شده
5. **یک Docker سفارشی ساختم** بر پایه اوبونتو با پکیج‌های لازم
6. **تست کردن اسکریپت** داخل کانتینر Docker برای تأیید عملکرد
</div>
