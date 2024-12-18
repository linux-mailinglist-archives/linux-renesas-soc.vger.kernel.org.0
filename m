Return-Path: <linux-renesas-soc+bounces-11532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C49F6516
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 12:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEB927A3C36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 11:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574741A2380;
	Wed, 18 Dec 2024 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ME/hTpgs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809AE1A08B1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734522107; cv=none; b=qw+vrXO1CqAN4izm+QCQdiA1hdjNp67gPvyn2VSfTEqRhPvZShbGfWH1WQCJvWNBu0YLCLsAnAlWWeLyUSuUty0L/ToiiqKEpCvamMizqmlPtzuk6iVxO09M/qJ6t9VuBYIlyo6zD3e1Ojm4zeehyyuVtZaEfuTraz9e7xbcBuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734522107; c=relaxed/simple;
	bh=VHHBHAURYCmWfnBSr8tQ5z7CKlWtJ5SAMR/qb3KuLUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VuWLKLVithnbHzbc7l1ydiqnXpTRt5NKUYd6e80kgnPkGvqFUNnNuv/CdyivSgq6vogHU4NHFuLozlWH4yysQuTbilnqAdSZvs8mu7u0Sf/ynaJQFhPjyJ29jf7/XoPEps80RLiokTPPJjI/Sw/epHMSD5m0Uy12eAT88sMHaTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ME/hTpgs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734522104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8w4RSJ8nHm6xZnbZl8MO53LyH2t95hK0oK0jZZXulZ4=;
	b=ME/hTpgsfKHLqJe9pRui2xxghlsEUETCXjQxrd2A+e3YFjCFsRXfEO3pJMY97I4aqPmlVN
	pSraiMHzn7c+OLAJL45AqNF6VPPehDxF4u87i+smLoocUGRYh+D0SClmGBB9GVKoo1Am9o
	knWS7Oqlw+4wfK0TKAKlrzLLKnnwHz4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-3rSh4_9wPDKoq-2BA122Cg-1; Wed, 18 Dec 2024 06:41:43 -0500
X-MC-Unique: 3rSh4_9wPDKoq-2BA122Cg-1
X-Mimecast-MFC-AGG-ID: 3rSh4_9wPDKoq-2BA122Cg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38639b4f19cso4397148f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 03:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522102; x=1735126902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8w4RSJ8nHm6xZnbZl8MO53LyH2t95hK0oK0jZZXulZ4=;
        b=QQkdaIBpprnuWDJIS4EGfhjc+WZX1SKH6imXrqLQ+uBXzJN/ub4MJLG4mwq6yEv5Eh
         dEoI5agRXuPQd9vJWRXu0cFK1gzeA5U8slMVn1IlNKhhDqsWubtch6V6YbK9fm32KBd2
         zFfKP7HKjUEHlUYzsrbKy96+MZY4P9XqKhL7+Srw5ZfuhK6aQR75SfwcezAS4KoBjsPA
         uxPUge9G04m8fTq1MEpGGOzJQA4JWbii0ZdfCm8uIgN6gWzj8rJ0+hnM4XRPmUl5JjcU
         VIbQNdLfgeSxgQncN/HVSJHnY/IooLb7yCw6mhyY4em3MWRE5wnYT6iBnupSjGHjGJ/U
         Jz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBDW88zRdSxKw/IvQ5U2wA0Um4uaIhGGfY05yeLZl1HzEoNfDEQ0RuZYOBLmOidTVK1xIPZl+j1S4mdC6gVjPFMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/0KDUnK8/CU82L3OdGophzAYxs1ftJFvo2Y3m4ljReyyydURz
	bfFVfDOU+QSxdGVZ9qbOVIyym7gVbLLzFmNwVi6fwz8zQdfQD4F/STeLjNDIiuHxFBp6UvVpR/Y
	FHmfjt3gKPmwg0g8aQxqAo1L0eul9Z1iSbliIvuvRGiVZJnAzNRLYDKyZ/xWmE5ejcSyted5jza
	DC
X-Gm-Gg: ASbGnct++B0QTb2UD/X6mMzFJ3264FSAD3r6d74OGqbOhmTryHdz/i/f2hfUi6PlryB
	YqM60mgbZ0vhJOhz2cNU0aOobtDLoLOB4rynh4Ft3XGeEllOJaI9RDiN9fNDJaOdogiM7xbuvG/
	pJxzMxVKdqbpWmBuretQA1rpHqBu4NDs8Zn74A7roh2UcsXyD4ziMLXLiQkYe/KgPOUW4HG28Tz
	Wqq5eiYk/jgIC+Njddm/GCYFzBbsH30Ww2JKOmYsXMAqKKpobu9trXWcB1zoU154FlzRaoLVZT8
	IlyfAazIcJE+EI1Qag83
X-Received: by 2002:a05:6000:1a8e:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-388e4db8a93mr2188147f8f.52.1734522101862;
        Wed, 18 Dec 2024 03:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXwpUv6qcQVeCE77pziR/wtsBppfqPmsEt6PaG1JXb/0c4W+XnvCzSR8Ny47ykr835iY1UfQ==
X-Received: by 2002:a05:6000:1a8e:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-388e4db8a93mr2188100f8f.52.1734522101347;
        Wed, 18 Dec 2024 03:41:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b01b7esm17783255e9.13.2024.12.18.03.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 03:41:40 -0800 (PST)
Message-ID: <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
Date: Wed, 18 Dec 2024 12:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
>>> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>>>
>>>>>> If you're curious on how it looks like, I've put a small demo here:
>>>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>>>
>>>>>> Design decisions:
>>>>>>      * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>>>      * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>>>        It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>>>      * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>>>
>>>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>>>> about no signal. Does this require special support from the driver?
>>>>
>>>> It doesn't require a special support from the driver. But as it is the
>>>> first drm client other than fbdev emulation, I'm not surprised it's
>>>> broken on some driver.
>>>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>>>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>>>
>>>> Do you have a serial console on this device, to check if there is
>>>> something in kmsg?
>>>
>>> Nothing interesting to see. Compared to the fbdev client:
>>>
>>>        rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>>>        [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>>>        rcar-du feb00000.display: [drm] Device feb00000.display probed
>>>       -Console: switching to colour frame buffer device 240x67
>>>       -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
>>>
>>> I did verify (by adding my own debug prints) that the code does
>>> get to the success case in drm_log_register().
>>> Thanks!
>>
>> Maybe you need to add console=drm_log to your kernel command line, so
>> the kernel will actually use this console.
> 
> Thanks, that does the trick!
> 
> Note that I do not need to specify any console= kernel command line
> parameter for the fbdev console.

Yes, the fbcon console is tty0, which is hardcoded for historical reason.
Some architectures use add_preferred_console() to enable specific 
consoles, I'm not sure it's allowed to use that from the 
drm_log_register() code.

I will still send a patch to add update the Kconfig help for drm_log, as 
this command line argument is required to have it working.

Best regards,

-- 

Jocelyn

> 
> With
> 
>      CONFIG_VT_CONSOLE=y
>      CONFIG_DRM_CLIENT_DEFAULT_FBDEV=y
> 
> I see all console messages on both the emulated fbdev console and on
> the serial console by default.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


