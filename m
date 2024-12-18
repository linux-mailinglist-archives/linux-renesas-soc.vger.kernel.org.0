Return-Path: <linux-renesas-soc+bounces-11539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E579F6814
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F859189102C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49A335948;
	Wed, 18 Dec 2024 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gXoHjLHl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903FE219ED
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531498; cv=none; b=ScXepwzQioCOMc6VNpP0P6Mj9n3B1+vooRpfHd45nd8FAZmUyqS+VvfZGavUaejas+Ur/219m5t5IME2vW45vcHbyCT5arzRpw3sLoSjePjsftAQeLOEEE8IU0P+ESkzD3LAbsvZ7sTU/9bOppdftn+7qzAg9Iidh1gRuX6W5+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531498; c=relaxed/simple;
	bh=Tkf/BVb24bFBTtDjSZB49w3vxUtxzwA6In6ijd5QrMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeiCUOGha00BwOwfnNOMVUSAEASGwXAqOWapibUq6QGDS0PkyiC0xbByq7kc3U+LqnyV1dAXAQRa8yLV2Fca7gB1EcNGpc0m2ltLOKc6fzJ/4X8Me82OMIlljVHnJJ+2PyfUNJL+fis+9MTh02/5T1ZQ143RaYeIUAWpV6ivsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gXoHjLHl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361a50e337so45636415e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 06:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734531495; x=1735136295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cOSusqsktfDuxu16rk7M+LG/oRYwLBrKmcYhe7v+/9Q=;
        b=gXoHjLHlLZf9U8PqwIq4sUzN4XRae+910ry+BOxZsJDrOYtOBZfd6g+WsOoA39SOSQ
         090vgM7nL2kKas9cy/y/vWWakLa9t7rZti28i8cznPZ4gN1nBHe/zhnqDMVyRvEflOYx
         uMq4U5Tt4hkkhPe2S2F6YrNjSaUEpUA06MAFaVkfoBz72NQ/aKVs/IoII/F+isEzXwE/
         F2YqMuBozBX93/hBRwaMx0QwVspbAvNoLwTRrPzav1OJuTWsJsnCTDwxZnBXnYO/Umcw
         ILh9sRdGaIYRLoqjN7pHUniHMyAlZ5nTcq/ETtshOylpJKGrTFqwf3W7AUhykc7kxGG9
         mP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531495; x=1735136295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOSusqsktfDuxu16rk7M+LG/oRYwLBrKmcYhe7v+/9Q=;
        b=BscPZ5fSyHs1I3CN/JrPWbv/u5VrSZy0xVUMCXB51603fx+gISTDhgK48PZWJf5PT7
         vkLHZXDEjNy8sPz0D84ffhCp97CnWWhuR4EVUKZWAs/9h9Bqex2fjCuGBicrZvGutbKy
         HZ5hG4j6Ch+W32CsN5xrklMWYJ7J4oCwgzKfuilmTyHt7eD6OYmBRBx+9D5U3Jv+ez9e
         YgZrD2C2R9Eq6ph+T+gD35kylYMCgtIlvRupC35TMURL8WVg4KjKIdOF8tiQWcCk2vaw
         lXoLxIOvxqibhvo4vhyATgvguJuRswF7KHQsMfu02pkC2g0UqMQsgNQgHGthpsPOc7wc
         jMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOIjRRcRwrmfjqfdfsWLR9P2LnaMW0lSllE0QbCZbrZyJlMp/mX0eTHgMpDZQYAr1KouCRJ/CPzW5nX+CWL6aurA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SSr3oX8+LUvWcUBrZVjptvnISAenwsQeUbF2kJRpRhNZvYJd
	rccQbhQR8LWSVJ8u8N6eSfp4rq3TCF6M+F/KwoNOzZiW7BB6PwHNlTi+c9qaNdw=
X-Gm-Gg: ASbGnct9EO1luXLMLvZEgUasq86+xPYXTB14zqMMVhkqAcqoHjIHu38228GEyv+PBeP
	/IM3qzobKUV0S604eZdl5nn9nhvYAfx/4Qx0fZDO2/wlwjlQKcC1TDEaebzTjGlffXsuG/cUYAK
	vKFGMsxT0yb9wFpcf/JFG4x4hyXoNjDsSIolPxVyrILeqWBVbHAYNnZJ9pdoFwSG7zd2GWX483V
	m9S5WVU7jUqV0hMyIh8BImbJODL1ZcnzpYwSUhSnfNOIRkBfCjBZ+RMaw==
X-Google-Smtp-Source: AGHT+IEaISJLNAKw87VA5njzUdMOysTz70EmeTh0tRvEzKJXALSuN6Rh9dx9COPILxnSQjSbHjZIBw==
X-Received: by 2002:a05:600c:1c99:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-4365536e479mr28298645e9.16.1734531494753;
        Wed, 18 Dec 2024 06:18:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013ecsm21888165e9.16.2024.12.18.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:18:14 -0800 (PST)
Date: Wed, 18 Dec 2024 15:18:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	John Ogness <john.ogness@linutronix.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	bluescreen_avenger@verizon.net,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <Z2LZozgxxQuusHVS@pathway.suse.cz>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>

On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> > Hi Jocelyn,
> > 
> > On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > > > On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > > > > > On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > > > drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> > > > > > > This is not a full replacement to fbcon, as it will only print the kmsg.
> > > > > > > It will never handle user input, or a terminal because this is better done in userspace.
> > > > > > > 
> > > > > > > If you're curious on how it looks like, I've put a small demo here:
> > > > > > > https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> > > > > > > 
> > > > > > > Design decisions:
> > > > > > >      * It uses the drm_client API, so it should work on all drm drivers from the start.
> > > > > > >      * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
> > > > > > >        It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
> > > > > > >      * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
> > > > > > 
> > > > > > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > > > > > Unfortunately I don't see any kernel messages, and my monitor complains
> > > > > > about no signal. Does this require special support from the driver?
> > > > > 
> > > > > It doesn't require a special support from the driver. But as it is the
> > > > > first drm client other than fbdev emulation, I'm not surprised it's
> > > > > broken on some driver.
> > > > > I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
> > > > > (Qualcomm SDM845/freedreno), without requiring driver changes.
> > > > > 
> > > > > Do you have a serial console on this device, to check if there is
> > > > > something in kmsg?
> > > > 
> > > > Nothing interesting to see. Compared to the fbdev client:
> > > > 
> > > >        rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
> > > >        [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> > > >        rcar-du feb00000.display: [drm] Device feb00000.display probed
> > > >       -Console: switching to colour frame buffer device 240x67
> > > >       -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
> > > > 
> > > > I did verify (by adding my own debug prints) that the code does
> > > > get to the success case in drm_log_register().
> > > > Thanks!
> > > 
> > > Maybe you need to add console=drm_log to your kernel command line, so
> > > the kernel will actually use this console.
> > 
> > Thanks, that does the trick!
> > 
> > Note that I do not need to specify any console= kernel command line
> > parameter for the fbdev console.
> 
> Yes, the fbcon console is tty0, which is hardcoded for historical reason.
> Some architectures use add_preferred_console() to enable specific consoles,
> I'm not sure it's allowed to use that from the drm_log_register() code.

add_preferred_console() is used when the console should get enabled
intentionally. I would split the intentions into two categories:

  + requested by the end-user on the command line, see
       __add_preferred_console(..., true) in console_setup()

  + enabled by default by a hardware definition (manufacture), see
       add_preferred_console() in:

	+ of_console_check(): generic solution via device tree
	+ acpi_parse_spcr(): generic solution via SPCR table
	+ *: hardcoded in few more HW-specific drivers

add_preferred_console() causes the console will always get enabled
when it is successfully initialized.

So, should the "drm_log" console get always enabled?


> I will still send a patch to add update the Kconfig help for drm_log, as
> this command line argument is required to have it working.

I guess that the drm_log consoles should get enabled only when
requested by the user => documenting the command line parameter
is the right solution here.

Best Regards,
Petr

