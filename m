Return-Path: <linux-renesas-soc+bounces-23063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC0BDE84E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 520ED4F4D74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 12:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91F41C3BE0;
	Wed, 15 Oct 2025 12:43:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A942A82
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760532197; cv=none; b=pmRSsOpy2scfaON5Lg18Crhz3Wbzz2llGiQ0clfqDnMsFiv2vnQ/EXdnw1i39vrOlFTGjQq/XMkNO4gpmt6xl/oZwdupHfNt5geB69mcWcwf/ZSdu7gyw2/idIGjlrADryflFyu9Hlf87Ju8Ea6SZ9OaFVeh/QqbXOHwZ8T31tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760532197; c=relaxed/simple;
	bh=+Yoaw7rpYRqS6kyY0+V936fRl/rDGieCIgQeJif9Qus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e47BpWQ4yBwW7MoLbrdUH4oxQB0pK4kjpBhHkmL7SPKVLnrQeS+baqanhjRPYxRlJZ04N1CRlB9oSPZ5D36TqlHfd95GGrmspWhnlZBgwF1Sn9gJEdWWt/FKGqGVz7jWL4WaHs8uPh1wOTXFqTxrPkYiDoBurCbuyBHCGJMBQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-930d9fdeb96so821032241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 05:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760532195; x=1761136995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EImZFjleK3ggl+qc+EhSd4wqIwp2WAXLxGf2J2zAzc=;
        b=NHvD5IXmOcIqm3gnpdD0oQFBYmxNhWKIJbooEQt/dQCucPbtIODGa3SBGQ5ILSOYE0
         voyZI/idTgVzXZqSeRQsTcZ4GOYZ6syPLlUurQKbg8bfKC/82HoQve32TPeXsbEBdeux
         1nVoiMBMsqpE4Zeee52GaHtD1HKBIEwY8QHszJQJOSLvgIYQyYD3IzJqJSzIWXkVumd2
         1VlHQlh7U+zi58YlVcf62oC0+D9EVy/tr3WBi5s0PArzhwBnOrCmOl8d922bAuMSULJP
         QW3xPF3fgvBC+THbNLVnsFk80mqHr5FJ4N3Y9CyEIpV4tqylylwwwIn5Wpu+GW04bEh1
         Bztg==
X-Forwarded-Encrypted: i=1; AJvYcCXHztky1hbekNldKtXQl3UjwD2XptpIpb/PJ1li802LSZk6ja2n1pl1WZHRK7Qyol5o6ExxKeMSJUvzuXcdrsQWWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5vLTEqU7G3w4KWEBQZIpYu4i+2RCRsNofKcE2qB9P50iGa9/
	p07cgEviJOd+uXUp4GbNvF5uGfrjFJRg9lbIfhjDNc8Q9r+jFHFIDz2WxQ5ke+Wv
X-Gm-Gg: ASbGnctfvHq/E0UBB/RVTzFyK8H5UjiWKpXwjzcIsH0FIwFjVwpylHWpAOnUq8KS4t/
	NK/ZxbcWbVqWQCKnz6fZHjPIxo94cjm2trkaZjlOdhGGL/jrEsMXxQZ4uYb/XbunYwXFoBwu9uh
	1iJkSKIpb789OcGPqERNVhoF6BVEh/w3J1ncFbqRReDPPGMe7LntHGS/GZwWV3iRoaXQoqCFtwW
	oHKzeS4i7E6XHuJ+hcvqsspQie1BVDxINHnSKZrjWbt3fU+26WW+TCPzp50tKK45m+O5/aSaTr8
	RhuFEWvLTsfs8wj370GalUhVxISrb5b7F/vZu2wme02VVo/tjeQ8RCvckKVW1M03xH3SoumeRzX
	pRw+beh6Wnhr1Y2FWp6I5VPk5oCWq4lASFJ8MMdZd+v7sI8DOyVBRtRkxCSu1FgbYEcN4Se422g
	4eNZ86ElBW+Glu+w==
X-Google-Smtp-Source: AGHT+IFA65Zt4uVPz0wxe1Cg+wTNGPUUGYR5U5g8XiIWp9FgiJDh4Yy2sRtBRtFbfRSfAVTRBGRvRw==
X-Received: by 2002:a05:6102:5086:b0:535:af8c:ba68 with SMTP id ada2fe7eead31-5d5e23b904amr9889968137.33.1760532194704;
        Wed, 15 Oct 2025 05:43:14 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d8109b5csm5019336e0c.25.2025.10.15.05.43.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:43:14 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89018ea5625so1639280241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 05:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULTK3byDI/TicaGqFPtLh9dO9d4PVNxb/EKWpBawifa5De8F6auSgHIO2ky8BVW+MJO6I4y/MqzAwKahHB8ZwaRA==@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:535:af8c:ba68 with SMTP id
 ada2fe7eead31-5d5e23b904amr9889952137.33.1760532194287; Wed, 15 Oct 2025
 05:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251012091000.1160751-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 14:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJfSoU-160BmD-obd7YZRdKT4z-P1YnrvvR1dq7XKaDg@mail.gmail.com>
X-Gm-Features: AS18NWCUqZtnjb3YrOJg9WSKYkypgBOIOyBo-RtC55Gk-E59ZzxvngTKEVnZ788
Message-ID: <CAMuHMdXJfSoU-160BmD-obd7YZRdKT4z-P1YnrvvR1dq7XKaDg@mail.gmail.com>
Subject: Re: [RFC] clocksource/drivers/sh_cmt: Always leave device running
 after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Sun, 12 Oct 2025 at 11:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The CMT device can be used as both a clocksource and a clockevent
> provider. The driver tries to be smart and power itself on and off, as
> well as enabling and disabling its clock when it's not in operation.
> This behavior is slightly altered if the CMT is used as an early
> platform device in which case the device is left powered on after probe,
> but the clock is still enabled and disabled at runtime.
>
> This have worked for a long time, but recent improvements in PREEMPT_RT

has

> and PROVE_LOCKING have highlighted an issue. As the CMT register itself

registers

> as a clockevent provided, clockevents_register_device(), it needs to use

provider

> raw spinlocks internally as this is the context of which the clockevent
> framework interacts with the CMT driver. However in the context of
> holding a raw spinlock the CMT driver can't really manage its power
> state or clock with calls to pm_runtime_*() and clk_*() as these calls
> end up in other platform drivers using regular spinlocks to control
> power and clocks.
>
> This mix of spinlock contexts trips a lockdep warning.
>
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     [ BUG: Invalid wait context ]
>     6.17.0-rc3-arm64-renesas-03071-gb3c4f4122b28-dirty #21 Not tainted
>     -----------------------------
>     swapper/1/0 is trying to lock:
>     ffff00000898d180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_res=
ume+0x38/0x88
>     ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400=
001/0xDCC63000, Driver version 5.0
>     other info that might help us debug this:
>     ccree e6601000.crypto: ARM ccree device initialized
>     context-{5:5}
>     2 locks held by swapper/1/0:
>      #0: ffff80008173c298 (tick_broadcast_lock){-...}-{2:2}, at: __tick_b=
roadcast_oneshot_control+0xa4/0x3a8
>      #1: ffff0000089a5858 (&ch->lock){....}-{2:2}
>     usbcore: registered new interface driver usbhid
>     , at: sh_cmt_start+0x30/0x364
>     stack backtrace:
>     CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.17.0-rc3-arm64-ren=
esas-03071-gb3c4f4122b28-dirty #21 PREEMPT
>     Hardware name: Renesas Salvator-X 2nd version board based on r8a77965=
 (DT)
>     Call trace:
>      show_stack+0x14/0x1c (C)
>      dump_stack_lvl+0x6c/0x90
>      dump_stack+0x14/0x1c
>      __lock_acquire+0x904/0x1584
>      lock_acquire+0x220/0x34c
>      _raw_spin_lock_irqsave+0x58/0x80
>      __pm_runtime_resume+0x38/0x88
>      sh_cmt_start+0x54/0x364
>      sh_cmt_clock_event_set_oneshot+0x64/0xb8
>      clockevents_switch_state+0xfc/0x13c
>      tick_broadcast_set_event+0x30/0xa4
>      __tick_broadcast_oneshot_control+0x1e0/0x3a8
>      tick_broadcast_oneshot_control+0x30/0x40
>      cpuidle_enter_state+0x40c/0x680
>      cpuidle_enter+0x30/0x40
>      do_idle+0x1f4/0x26c
>      cpu_startup_entry+0x34/0x40
>      secondary_start_kernel+0x11c/0x13c
>      __secondary_switched+0x74/0x78
>
> For non-PREEMPT_RT builds this is not really an issue, but for
> PREEMPT_RT builds where normal spinlocks can sleep this might be an
> issue. Be cautious and always leave the power and clock running after
> probe.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks, I gave this a try on various boards, no issues seen.
I also force-disabled the TMU on R-Mobile A1, to make sure its known
splat is not hiding any other locking problems.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

