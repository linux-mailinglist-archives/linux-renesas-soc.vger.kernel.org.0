Return-Path: <linux-renesas-soc+bounces-17430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5FAC2182
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 12:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 090091B67636
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 10:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AABA22A4E9;
	Fri, 23 May 2025 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RMgPcdtV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F86229B2A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997529; cv=none; b=AfN4MMR4GnVIt3xZ2zZvY4qa/3WxhZEsjUlRsg+E/TSMuFwEF1Mn1ZFhz18FOMxuygMfOS3DFsWwNUTPizeOg11Go/S60Nch/bNoyuomDJ/lESlt2M51tAX2wvd/4IxjJ23lxaW1zchUlvPV2qeXzyZ77iAcP8iZCzCf0LjGW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997529; c=relaxed/simple;
	bh=j1XZzWdwtTmEvvN2qv3t6z37DY91Kr1PWlQJJLrpV1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMPp06tPCEpKTwcawLp0+zhMhcT6exa+VqE1DhebCBNZOqs4BqbrCRCkQHxwGxYQusK3WxlLfBBtKfTwTicmyIYggtXNDtZ0aSySXtoW96FGK1sKD8z/z3Yt4Qw9nyTb7CWDyPXzBu9nue4RvP6+pe9LAYqQ3j5R0wmLkfWGTus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RMgPcdtV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso6820491a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747997525; x=1748602325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwP8jYnybIYdZwiFlF4p0pHyTP1yOv6D4gpD/fnEuLY=;
        b=RMgPcdtVQFRHdCZBiBKbtXQG0qgQDhPDt74zDK4mNDBZ7sYmm+FzV0Z1DZgY6j37xe
         123Ske63/i4rSU2z5SlP0szNl0B+YECVWvMx1/tQKz0qJ3COzgGz4lA3osbiZkNX0C/l
         tOkoV+0oDUOajEvaw6DeddEriNwIueCo8cCMkoijQpy5QkLJlAv56KkWHEhCOyqEz0yZ
         4hfO3Vj4XD/m3HB3RNRyfdpHttBJ96fQhSiLlyZnXqVgMUvVU5ONK43IzesqtQ0kyye9
         5INYQUVR0dXL0AoplQZJW9b1KVTPOX3NnfdLby7Ay1N+tdY94glxR/O2oM7MyZqD76Am
         IHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997525; x=1748602325;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwP8jYnybIYdZwiFlF4p0pHyTP1yOv6D4gpD/fnEuLY=;
        b=WE1Yp3Lf+FwsIQY0UuegfZw2/SF/GPz3oULpp52mzNPMiE7l3U4QMauVNUYb3t4yDZ
         v8RamB5TFDUajmymy/xopYv5s4GPJTIE0rhNu3SHH7w/7C+TbRrfP/QSkf8dhhDGQp50
         0n1NbKERhQctz6L9nHzygTNdD9mgEo6xcdnoeMRSuoapWZSVHKFLgazv5Rxk8fClWcYr
         1NT1kq+AXDfrHkPwS8MzpEU+vrCZXxWJ4ceXvO7lf3iaUf9xzo3wM9NKe8cx+HSjVN8P
         ADtTZl94z53QHhs9lZrPuZmv1cqomP3xT9FZutpymaH67P/FuL57vgT+Qw+XuUwW1VZc
         SWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUddm49WsLJpRb8yrmRfNhb5Zk9aBHha91OvbYSUMQ37al0qKEX+9e2RuAdwSvzbQEWXUwXZh+z5FyLlV+EQKi2xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP6U4TX+hjlnIMwsg/J38P8PEB0qPZM0qOX4jWT/OV6Qj32O2J
	12KEVHifjEog36p1eQByfgIvkLfpsCeNZsE+vpjtqyTJuBz7gxiGYsk1kp5vreO7xko=
X-Gm-Gg: ASbGnctK56miIPuYO70gUWv6D08mjJ8y+vccACU6+CyeRtRzUacEbI4uZTtLd64P0c1
	9zhiB375HIdUJhan6CUEwtIa/ssEwv1xyvz+aQ4+v10p5hZmhXOn/wwSUhnbD8s7jHi9dSuqxAa
	KYm/JrQvfXQhC6hJedA6zDIcT+ADtPcL13dvoB5EjONeXqu7ImMxZU5wVB3CbPsNKRTpDwBHM5F
	5zpbg7xBIWCpbIegmFwCSE58sep7sKr2VyQJXZg4dDVJ5+qOZ7lomL3dPjGIvCLCXOSYbrqLILn
	ncuCdXfrH/+cfDYeSmqoYoFJlqNLKKisBG4Grn2q24+msQwLAtL6fNi/iKj2ebMTId2yYA==
X-Google-Smtp-Source: AGHT+IEC4yMEc83C32Rd4QKL4hSK5Wu12v5T+oSzGSvYSxS2+OO278DiRhv1/vjRF4GiSVkrB+WCww==
X-Received: by 2002:a05:6402:2709:b0:601:9dc3:2796 with SMTP id 4fb4d7f45d1cf-6019dc32a0bmr19644753a12.6.1747997525189;
        Fri, 23 May 2025 03:52:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e019asm11583614a12.36.2025.05.23.03.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 03:52:04 -0700 (PDT)
Message-ID: <47853bb8-db03-42b1-bcc2-3338fc208abb@tuxon.dev>
Date: Fri, 23 May 2025 13:52:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 dakr@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 bhelgaas@google.com
References: <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
 <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev>
 <CAPDyKFpbeLJUiB_xQbqDib+-8Q3AcJNVg+DuEcqmVGMbFdNxwA@mail.gmail.com>
 <fgl4w5uhxci7rrbdigtni72vveb2gqemh6iccz4qruqkek5rja@rzwkcjg6hkid>
 <3b1963ba-f93f-48f2-8fb0-a485dd80ffcb@tuxon.dev>
 <CAPDyKFqrAS4iV59S-zJ9H7_3VuGr9JdZABhfUGBwTzQNDCasaw@mail.gmail.com>
 <482b55c9-a210-4b2d-8405-e9f30d48a8fd@tuxon.dev>
 <CAPDyKFpLF2P438GGWSgbXzpT7JNdUjtZ2ZxYf1_4=fNUX3s-KQ@mail.gmail.com>
 <4fzotopz57igmiyssgkogfbup6uu7qgza3t53t5qsouegmj7ii@wfiz4g3eiffs>
 <CAPDyKFoxs6wDCLp5EGHVqkqSstBLNmngps2KfanRezV_EN8tuA@mail.gmail.com>
 <hd3hobuaunmn2uqzl72yv7nz2ms25fczc264wmt6o7twrxdhsy@mm22ujnawutc>
 <CAPDyKFpRUhTK=UfcEdRdT0f5EVoGN5okLosd9_tYjdGKr0qvkA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFpRUhTK=UfcEdRdT0f5EVoGN5okLosd9_tYjdGKr0qvkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 23.05.2025 12:47, Ulf Hansson wrote:
> On Fri, 23 May 2025 at 01:06, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>
>> On Fri, May 23, 2025 at 12:09:08AM +0200, Ulf Hansson wrote:
>>> On Thu, 22 May 2025 at 20:47, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>>>>
>>>> On Thu, May 22, 2025 at 06:28:44PM +0200, Ulf Hansson wrote:
>>>>> On Thu, 22 May 2025 at 16:08, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>>>>
>>>>>> Hi, Ulf,
>>>>>>
>>>>>> On 22.05.2025 14:53, Ulf Hansson wrote:
>>>>>>>
>>>>>>> That said, I think adding a devm_pm_domain_attach() interface would
>>>>>>> make perfect sense. Then we can try to replace
>>>>>>> dev_pm_domain_attach|detach() in bus level code, with just a call to
>>>>>>> devm_pm_domain_attach(). In this way, we should preserve the
>>>>>>> expectation for drivers around devres for PM domains. Even if it would
>>>>>>> change the behaviour for some drivers, it still sounds like the
>>>>>>> correct thing to do in my opinion.
>>>>>>
>>>>>> This looks good to me, as well. I did prototype it on my side and tested on
>>>>>> all my failure cases and it works.
>>>>>
>>>>> That's great! I am happy to help review, if/when you decide to post it.
>>>>
>>>> So you are saying you'd be OK with essentially the following (with
>>>> devm_pm_domain_attach() actually being elsewhere in a real patch and not
>>>> necessarily mimicked by devm_add_action_or_reset()):
>>>
>>> Correct!
>>>
>>>>
>>>> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
>>>> index cfccf3ff36e7..1e017bfa5caf 100644
>>>> --- a/drivers/base/platform.c
>>>> +++ b/drivers/base/platform.c
>>>> @@ -1376,6 +1376,27 @@ static int platform_uevent(const struct device *dev, struct kobj_uevent_env *env
>>>>         return 0;
>>>>  }
>>>>
>>>> +
>>>> +static void platform_pm_domain_detach(void *d)
>>>> +{
>>>> +       dev_pm_domain_detach(d, true);
>>>> +}
>>>
>>> Well, I would not limit this to the platform bus, even if that is the
>>> most widely used.
>>>
>>> Let's add the new generic interface along with
>>> dev_pm_domain_attach|detach* and friends instead.
>>>
>>> Then we can convert bus level code (and others), such as the platform
>>> bus to use it, in a step-by-step approach.
>>
>> Right, this was only a draft:
>>
>> "... with devm_pm_domain_attach() actually being elsewhere in a real
>> patch and not necessarily mimicked by devm_add_action_or_reset() ..."
>>
>>>
>>>> +
>>>> +static int devm_pm_domain_attach(struct device *dev)
>>>> +{
>>>> +       int error;
>>>> +
>>>> +       error = dev_pm_domain_attach(dev, true);
>>>> +       if (error)
>>>> +               return error;
>>>> +
>>>> +       error = devm_add_action_or_reset(dev, platform_pm_domain_detach, dev);
>>>> +       if (error)
>>>> +               return error;
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>>  static int platform_probe(struct device *_dev)
>>>>  {
>>>>         struct platform_driver *drv = to_platform_driver(_dev->driver);
>>>> @@ -1396,15 +1417,12 @@ static int platform_probe(struct device *_dev)
>>>>         if (ret < 0)
>>>>                 return ret;
>>>>
>>>> -       ret = dev_pm_domain_attach(_dev, true);
>>>> +       ret = devm_pm_domain_attach(_dev);
>>>>         if (ret)
>>>>                 goto out;
>>>>
>>>> -       if (drv->probe) {
>>>> +       if (drv->probe)
>>>>                 ret = drv->probe(dev);
>>>> -               if (ret)
>>>> -                       dev_pm_domain_detach(_dev, true);
>>>> -       }
>>>>
>>>>  out:
>>>>         if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
>>>> @@ -1422,7 +1440,6 @@ static void platform_remove(struct device *_dev)
>>>>
>>>>         if (drv->remove)
>>>>                 drv->remove(dev);
>>>> -       dev_pm_domain_detach(_dev, true);
>>>>  }
>>>>
>>>>  static void platform_shutdown(struct device *_dev)
>>>>
>>>>
>>>> If so, then OK, it will work for me as well. This achieves the
>>>> same behavior as with using devres group. The only difference is that if
>>>> we ever need to extend the platform bus to acquire/release more
>>>> resources they will also have to use devm API and not the regular one.
>>>
>>> Sounds reasonable to me! Thanks for a nice discussion!
>>>
>>> When it comes to the devm_pm_runtime_enable() API, I think we
>>> seriously should consider removing it. Let me have a closer look at
>>> that.
>>
>> I think once we sort out the power domain detach being out of order with
>> regard to other devm-managed resources in bus code you need to analyze
>> this again and you will find out that much as with IRQs, devm API for
>> runtime PM is useful for majority of cases. Of course there will be
>> exceptions, but by and large it will cut down on boilerplate code.
> 
> Well, the problem is that the interface is just too difficult to
> understand how to use correctly.
> 
> A quick look for deployments in drivers confirms my worries.

Maybe we can add something like:

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e64f3d7b47..568a8307863b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10100,6 +10100,7 @@ F:
Documentation/devicetree/bindings/power/power?domain*
 T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
 F:     drivers/pmdomain/
 F:     include/linux/pm_domain.h
+K:      \bpm_runtime_\w+\b

in MAINTAINERS file so that any new patch using the RPM will also be sent
to PM maintainers and checked accordingly?

Thank you,
Claudiu


