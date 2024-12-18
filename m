Return-Path: <linux-renesas-soc+bounces-11529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2129F627C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 11:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E3716CC42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183AB199939;
	Wed, 18 Dec 2024 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fpmUSicH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D5B198E75
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516881; cv=none; b=SOedviLfvfniBJB2RrC5z59wGF+z3GfQYSH0DURmnpjeSI/0qR0pryT61mycIw8wQjglVml5E5jFkoJf7Jq6jZH6ADPpPWWS41g0rJCVxALebDZUtASCaw7hRj0Rm69XbSak4K6/T7c2Yjhkj4DlylBh9UhSY2J/bRsHFFWDkLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516881; c=relaxed/simple;
	bh=r7Mcj9fMjM6pWYfQ1L7AL5GNsDXbSapWfBH1aBwnsNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXVI959Ek9KXy+JPTlbb3BWvuwsjieqsHvy5TsvfcdORNJCc0nc+/l5mfBJUYJMW0s/naP2Hh5se/77VYlUdGLcReymV7R7al83jnpneOA/s1SjgwnN279LxgHOQz7Zo47tftmXCP1d0wdoTnTCBReLZ4E6VpxvzO/V5c0Bmg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fpmUSicH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734516878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBGu2KOb4IgBv3uEmXMWgs1fb3G8K3utYYOyJ/CpZkU=;
	b=fpmUSicHz6Yxik7Ce03wqJczKJFELlXJ7N6Szey2JZtkxBry3SpByO2k1bF9qjFXbr3/7H
	nszgabVpvt0kDmH/XHcY5aP5T4r4FJzizv7I4Qcckr38+hsdE1MnZW+mJ3RiqZXXXSPE1E
	5plmhgs414t10XDHsi/BdL45/cEtjy0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-QdBX1K2PNRCpLZ1-55snkQ-1; Wed, 18 Dec 2024 05:14:36 -0500
X-MC-Unique: QdBX1K2PNRCpLZ1-55snkQ-1
X-Mimecast-MFC-AGG-ID: QdBX1K2PNRCpLZ1-55snkQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361f371908so21635755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 02:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516875; x=1735121675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBGu2KOb4IgBv3uEmXMWgs1fb3G8K3utYYOyJ/CpZkU=;
        b=CUAQtoby3BEVnktSnqeWblUhR/zewndAwvgcLJXRq88+1WctUPve8crd5jJkR0lji0
         l9SU0dZOGhpxpPxgJnVCy+GEidPJ88tnzZFUKLG+5WwWQ4uwUTJQvQ5YKcKheKwpecTw
         LUW2EF1PItAMPEI/+cT/oZj/E0Lq3lNZV+D2786k4gRjG5z/jD3W8279+enD88I5wDxQ
         iDwKBingOWhVdWb24gkpldkdBJ2ETIy6fRfbMk59VM2KodYRcgj+JwidETthFcjv7wYJ
         02MKAN9641DHDu9yg4bPza2afi9f+dHX3hsVOCq5l7i6eq/01/ITZXoYk05v+Oy0eGRi
         HOWA==
X-Forwarded-Encrypted: i=1; AJvYcCWAxVra96joHdkTrJsDH2VWQfRUfdenWideKc4EBla7SrZleyX2XAKUnjvUOOE4nk2JwB7mJsaayZRuFzB9bCTdWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CWMHJNYwxie73AN9MT5OYIvNuYsDy1WDEHpJNh22EXDh+46Q
	n+lzetbeVZj4VuBkil4Ft8E/jQmnQW4+cjSyVPbevX7eGjOdV2PgK812Gg+gI1O8nbJ8+7ec9Bk
	GJ/qkR3M77WmYodli7qUk3aoh95iowZTy2V2at9bBwdERpDWQxG7Xs4McSnaVYbPB8Kny
X-Gm-Gg: ASbGnctkdd17eKDDj1VKeRuA03DP/LosDhADbhvkvFzgf45DEtUwr6D09k+FrrAWEsI
	Ov2aqmgl2sJRgJZNtcjS4yUrYg3iVX01+z+lgCcGN4n9/OqvMm8mERcpPMfxIzvT5nWUNyClPna
	OeG+NMI1jQ8R6lc9zXjN5HNV5Rg1MTlDGF5sjRuAqMn6tM9SJ+38X2IanArtknusaCM/Q+lMj8Z
	eEMrBX0Xt1eqPRj2cPaRGzP83wQ+2HH61cp32Zy5qzXj4zYx9o/1bqM+xN+AgeCtbstSpcXfO2H
	pAIT+VsixR3zcg6a9TzX
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id ffacd0b85a97d-388e4d8edf2mr2025162f8f.44.1734516874639;
        Wed, 18 Dec 2024 02:14:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFEiaP5T6kOStWVjcP3at+Jf03VWaZaNLHjGjBcrqmhuYhyjkR3wz7Dka1Wg9fgkGmlREj7A==
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id ffacd0b85a97d-388e4d8edf2mr2025135f8f.44.1734516874216;
        Wed, 18 Dec 2024 02:14:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b01b7esm15415895e9.13.2024.12.18.02.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:14:33 -0800 (PST)
Message-ID: <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
Date: Wed, 18 Dec 2024 11:14:32 +0100
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
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> Hi Jocelyn.
> 
> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>
>>>> If you're curious on how it looks like, I've put a small demo here:
>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>
>>>> Design decisions:
>>>>     * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>     * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>       It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>     * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>
>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>> about no signal. Does this require special support from the driver?
>>
>> It doesn't require a special support from the driver. But as it is the
>> first drm client other than fbdev emulation, I'm not surprised it's
>> broken on some driver.
>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>
>> Do you have a serial console on this device, to check if there is
>> something in kmsg?
> 
> Nothing interesting to see. Compared to the fbdev client:
> 
>       rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>       rcar-du feb00000.display: [drm] Device feb00000.display probed
>      -Console: switching to colour frame buffer device 240x67
>      -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
> 
> I did verify (by adding my own debug prints) that the code does
> get to the success case in drm_log_register().
> Thanks!

Maybe you need to add console=drm_log to your kernel command line, so 
the kernel will actually use this console.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


