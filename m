Return-Path: <linux-renesas-soc+bounces-11547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916439F6932
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6D816247A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D370A1C5CD8;
	Wed, 18 Dec 2024 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xq8+aguT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEF1C5CC2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533933; cv=none; b=CYTfPh4L4rvFgGLIBEylJ7ZIEbTi1chUoBNN2ETDpbh8hxTMbXOAZXwEf7z7c7YmY/GG9BECsWSP6BxAuGniFMcuqzNjyI72LFYnC37jDS6afevQvRpH4qKUyp+Bjlv+TGHGhlG0SneE8qy0iJrut5g8kC/PjK++0q5OFsimtAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533933; c=relaxed/simple;
	bh=UR2sJS8sBHGY8haNdyqSv82qBFW5RTZ0k0TbJZXd3XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRnYdyUQ5pPOmR/bW5gopmW58WUs9fKSRvmtsRYV/IdDcFHhOf/T7JWDKUTRkuzomgUc+GFSQgmjXHlqhpL/24oGspTnyAFqdNv/gLOBxERdosoDeBHaWlmzgx5diVp27wGgHF3C37rZMjq9XX0NabfSa+LVQab3qhyAbsybzmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xq8+aguT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734533931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fch0zJJASguSJXWndNvawQefcaxKB2ri/t1RlL+FxF4=;
	b=Xq8+aguT4Ezxt75kXVLUu9y7O3c5OLPyYZtEJyOjRP5qAMqYDPPwcQQHKJWQTP+s+c2YUn
	y/JPnf3m09Cb84Na2DTq57UjWIqcRqoCuAtcZr5rwCM8YKQ56h/bOA5jio/AnCrP0DOjCP
	tYvSN11bAZOPRIKlTR8PBwJB+tM6phk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-CYGoSVfLM0m8WdrNGrwr4A-1; Wed, 18 Dec 2024 09:58:49 -0500
X-MC-Unique: CYGoSVfLM0m8WdrNGrwr4A-1
X-Mimecast-MFC-AGG-ID: CYGoSVfLM0m8WdrNGrwr4A
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436248d1240so36218445e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 06:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533928; x=1735138728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fch0zJJASguSJXWndNvawQefcaxKB2ri/t1RlL+FxF4=;
        b=m3X/n0gIOA0dVA3YfyG7kzfOqP9C2FCgMUR4N520rumQ9W8RbnIZbuUVzLlkP+LrqK
         COs8CYYwZi/Hpt1BUvyri7DgyWQ+OIoyNkEs+eFVkdS+c3EAkwN4iJINvRMKiQl5NFsE
         HIyvtGwSxCrfUYha4wciKe5eQ1Nht5mpIw86UN+yYeaFJB3riaOko7xuA4ohbFcamyxl
         uth7Jcf1YBXslUWwBmaQk5doSYOWMwTPMWqin8vugCxb0GMA0KSnVKzmvPi6CQXLPnvg
         vFvm/VQ8lI/H+nAGtPaoami407+PaeQ7AeTyLcNlzDmK8q2fZdrBWGhcxc4tPmCjqBX2
         50rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqndp68aA1tx5OplyhU881kFtufWff4fEC+us/82OGHTy5miNA9Q1kFGIWsFAs08IDGGl4pDNRyUJcILo35jP6WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88YcsVQhGx4/OpcAFHbGzSaTwBnbvR7csPs2qoIlaaCNVbpH8
	En9pycK8sQ6BWi5z0PXufydWlTfhx7maHtb01bQBWoe9nmp0qKNlLPzhVXQtIw8lFZKS0aS4EnS
	Pic5qKsvuukO5xIPDOqtyVGBYqe1XdaTf5lMvt3ZohylR1rOs+Jp2D3/BTPtI+tHXkait
X-Gm-Gg: ASbGncsAtg5H3toyyCygLGAlBR9ghid2xH6wRXfWYcEzW+gF70fGhQMezrp/fCNr5pn
	HVSbvFbU0+ARf95Uitc+gmuDRsNxqiK5ghDlyCWDb9ZcNC1ydyVBr3hRd1eE5rZpwyk1EIpI5z2
	rTgdRm5h18Lpm77I4eTphF3LU1dgzaGMshaDD9YJmkVtZCEk/8pEoj0WdzS4JYW4jqn3ANDFQZU
	05+/DYUplZt27aDtmqs26uRcPJy/rn0JpOJ/PwAErEKAwJq5d1HHS4tWfHZr7G/mqzM1bTBnuez
	/KK/JJjQxEFIFNLSxmXR
X-Received: by 2002:a05:600c:474d:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-4365535fd93mr36161135e9.10.1734533928444;
        Wed, 18 Dec 2024 06:58:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUHxMV6rWQuWpEb/AcRSu1jYelLHaVf2P02QVTOn+yTcJ5+0sg83TwpTI4+FbD9Q3+/FL0FA==
X-Received: by 2002:a05:600c:474d:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-4365535fd93mr36160865e9.10.1734533928064;
        Wed, 18 Dec 2024 06:58:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c66sm23678715e9.5.2024.12.18.06.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:58:47 -0800 (PST)
Message-ID: <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
Date: Wed, 18 Dec 2024 15:58:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Petr Mladek <pmladek@suse.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
 <Z2LZozgxxQuusHVS@pathway.suse.cz>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z2LZozgxxQuusHVS@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/12/2024 15:18, Petr Mladek wrote:
> On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
>> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
>>> Hi Jocelyn,
>>>
>>> On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
>>>>> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>>>>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>>>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>>>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>>>>>
>>>>>>>> If you're curious on how it looks like, I've put a small demo here:
>>>>>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>>>>>
>>>>>>>> Design decisions:
>>>>>>>>       * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>>>>>       * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>>>>>         It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>>>>>       * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>>>>>
>>>>>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>>>>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>>>>>> about no signal. Does this require special support from the driver?
>>>>>>
>>>>>> It doesn't require a special support from the driver. But as it is the
>>>>>> first drm client other than fbdev emulation, I'm not surprised it's
>>>>>> broken on some driver.
>>>>>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>>>>>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>>>>>
>>>>>> Do you have a serial console on this device, to check if there is
>>>>>> something in kmsg?
>>>>>
>>>>> Nothing interesting to see. Compared to the fbdev client:
>>>>>
>>>>>         rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>>>>>         [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>>>>>         rcar-du feb00000.display: [drm] Device feb00000.display probed
>>>>>        -Console: switching to colour frame buffer device 240x67
>>>>>        -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
>>>>>
>>>>> I did verify (by adding my own debug prints) that the code does
>>>>> get to the success case in drm_log_register().
>>>>> Thanks!
>>>>
>>>> Maybe you need to add console=drm_log to your kernel command line, so
>>>> the kernel will actually use this console.
>>>
>>> Thanks, that does the trick!
>>>
>>> Note that I do not need to specify any console= kernel command line
>>> parameter for the fbdev console.
>>
>> Yes, the fbcon console is tty0, which is hardcoded for historical reason.
>> Some architectures use add_preferred_console() to enable specific consoles,
>> I'm not sure it's allowed to use that from the drm_log_register() code.
> 
> add_preferred_console() is used when the console should get enabled
> intentionally. I would split the intentions into two categories:
> 
>    + requested by the end-user on the command line, see
>         __add_preferred_console(..., true) in console_setup()
> 
>    + enabled by default by a hardware definition (manufacture), see
>         add_preferred_console() in:
> 
> 	+ of_console_check(): generic solution via device tree
> 	+ acpi_parse_spcr(): generic solution via SPCR table
> 	+ *: hardcoded in few more HW-specific drivers
> 
> add_preferred_console() causes the console will always get enabled
> when it is successfully initialized.
> 
> So, should the "drm_log" console get always enabled?

drm_log is a replacement for fbcon, which is always enabled, so I think 
it should also be always enabled. Otherwise you won't get any console as 
fbcon is no more available.
drm_log doesn't really fit in the architecture/hardware model, because 
drm drivers are available for a wide range of architecture, and a GPU 
can do either fbdev/fbcon or drm_log.

> 
> 
>> I will still send a patch to add update the Kconfig help for drm_log, as
>> this command line argument is required to have it working.
> 
> I guess that the drm_log consoles should get enabled only when
> requested by the user => documenting the command line parameter
> is the right solution here.

Most embedded linux specify the console on the command line, but for 
laptop/desktop distributions, it's not the case as fbcon is the default 
since the beginning.

I see a few options here:
1) Use add_preferred_console("drm_log") if DRM_CLIENT_LOG is enabled for 
x86_64 and maybe arm64, so at least the main users are covered.
2) Have a DRM_CLIENT_LOG_PREFERRED_CONSOLE config, so that it's easier 
to setup than changing the kernel command line.
3) Use the kernel command line.

Best Regards,

-- 

Jocelyn

> 
> Best Regards,
> Petr
> 


