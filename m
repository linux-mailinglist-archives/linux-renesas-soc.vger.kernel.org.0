Return-Path: <linux-renesas-soc+bounces-26193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A34CE9D24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 14:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0263013ECA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A520A221F26;
	Tue, 30 Dec 2025 13:52:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCD4594A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102768; cv=none; b=r3Gq3lf3EWxGcCpsv3993poRZYVwEXNSVF0cCUq8+HltZXOOqDONroqD5F5n2ON2EGI1jcZqaYdg3Kz+5v1pBRWER5aZgd5HwYd0+TOq+ppltoGqyv3ubiwngBhTSXF1YD1SRV6GOUaVyxvEA7M3G4Y8Pw03wfl/TGnrllmPmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102768; c=relaxed/simple;
	bh=aI8MNDO9Dig5r0Q3AuMMs1RCgF/9yrE3csjRRDxPfD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbELC3/YFfpsU5+UttPbdkFO8sA5/K6Zp7pcOQoCA0GK/uRDHbLB4f83N/KRUzuQdHXRBalgvlA90RyJIECp8hP9LTLb/LdyLPQDNod9hpuESFfzM0w6jfK12DOhCHbQdcvymwx3xpI273yb7XMqSzdegzt97ITe04toN+RSou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55999cc2a87so2394564e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 05:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102765; x=1767707565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9Iz0iaGm0eiS7oT7DLYrcws1P082xGF2BkB7BLaDLw=;
        b=F2Mmrqh5uj9Bh0nQctq0Xs/tJ/ktt8M9tPz2yWk0zLba8Fg3BcyTDz3mVhN6x0prf6
         pocI/0tYLQ5/G51W6Su/dZlTqWb/3huNpgREp946Gd+SruyeDzYtoMQU7wO2+BDpWD5S
         7Dh+qBe0fO8iMtA9BEUySMWn5og+KVh9ejjkEx9TqjE++/7jM58ZJaaf+WW4bDAiqj2T
         J/Ri8Zhs1l1kpf1XB1kqu2/JE81QYhD10Gl/fYsiFLf1vgPoHfnF0nzC6JeGY0HHzOku
         qps1yFotialAecl6RzaDxSSBYS++YTNxyDxgAHkUI0dPdcx8Zy1WXG0qqxWZc9e00gLK
         4CIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaA7KSPLsA4PdhCG2c1r/GgRO/+ylnb4v11mvynIwg38OqT+DnxfRZ5tnDHZC/Vx9PBC0Ym1FjX4n/JfBWNUGwgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GZiDGBlg1C5lh0226iCjjyVlMP+wiWv1edAf3QPkZ/hJvaII
	WtMDlzLMkMZx3NShKmvhJE3WpxaHs48iT022zfEMKZh/3l0+sN70GHHp7C7Tb0Bz
X-Gm-Gg: AY/fxX66tQ3e7ZsOLw3EfGDpXd16/kM5BuI5SM+svBRxgwGvxu7ekuHXPeMiw8DTmUo
	78CfAZD8SwUPGE3buo4OW1GBJmyIpUBWPPr6kZAXuNeLN43731cgIEQiYjbUmFBspqTmvaDZVmW
	m99CN799nhwwNp4jnMqoYfwZItfrjCyZtcqmP0ULDetqVkeSDS8+4X0NpLCIYw7pdJJySxMx6V4
	Znu5vMEQgGHEqG9jt5AxHqKk5Txlm3aielAGsiGJVx53G5pWRJY4L4bf52OwB+l7ws2gbU0/CnT
	0E5LCqLWlNc2WP9lHT7NyEYzGVaUZtm6wf/UoNIbh4HjxW0Y2JI33xfhJOnWkD77Kc1sFn+DmGX
	9c1kYEVCvuyFV18126pl0opn5gfDqljfw18PsGj1Ycg3Bs7w2KuVHpCrLQtbneDK+ldsMbN0QmN
	KGTQ0sVmNro3f+N0J2mukrF0B3sktQ+l8YRnjK61+kuh2jq0Ht
X-Google-Smtp-Source: AGHT+IEaezTf8DxMtZdPX61m/71fiXz5JV2iEXsvipu5D3CZ0ymQhP37R2e5L9U4i1a8Yl1rmqXSxw==
X-Received: by 2002:a05:6122:f84:b0:55f:f2f3:699b with SMTP id 71dfb90a1353d-5615be1b04emr9655847e0c.11.1767102764796;
        Tue, 30 Dec 2025 05:52:44 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b90esm10287787e0c.2.2025.12.30.05.52.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:52:44 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9412cb281acso1986224241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 05:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX06kpvl5bF0PKuiDBQyHvqJky+IvuuBBFoJqQQbtVFe1MAX5fegavF7uw4hhvAl7TVb0j3VIJOfMx5mSUqNCmwOA==@vger.kernel.org
X-Received: by 2002:a05:6102:fa3:b0:5dd:b318:8a6 with SMTP id
 ada2fe7eead31-5eb1a656bf6mr10186669137.12.1767102763806; Tue, 30 Dec 2025
 05:52:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202221341.1856773-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251202221341.1856773-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 14:52:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuLwC_BR_aJwzgnvLqi4HQbtkB_67ESAm8xtTwoTQ3zw@mail.gmail.com>
X-Gm-Features: AQt7F2qVZmLopW__zoxab3_qNFhrxKKK5-hfw2_HIu2OxeDn-S9AH-exBFu5lSA
Message-ID: <CAMuHMdXuLwC_BR_aJwzgnvLqi4HQbtkB_67ESAm8xtTwoTQ3zw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sh_tmu: Always leave device running
 after probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, 2 Dec 2025 at 23:14, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The TMU device can be used as both a clocksource and a clockevent
> provider. The driver tries to be smart and power itself on and off, as
> well as enabling and disabling its clock when it's not in operation.
> This behavior is slightly altered if the TMU is used as an early
> platform device in which case the device is left powered on after probe,
> but the clock is still enabled and disabled at runtime.
>
> This has worked for a long time, but recent improvements in PREEMPT_RT
> and PROVE_LOCKING have highlighted an issue. As the TMU registers itself
> as a clockevent provider, clockevents_register_device(), it needs to use
> raw spinlocks internally as this is the context of which the clockevent
> framework interacts with the TMU driver. However in the context of
> holding a raw spinlock the TMU driver can't really manage its power
> state or clock with calls to pm_runtime_*() and clk_*() as these calls
> end up in other platform drivers using regular spinlocks to control
> power and clocks.
>
> This mix of spinlock contexts trips a lockdep warning.
>
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     [ BUG: Invalid wait context ]
>     6.18.0-arm64-renesas-09926-gee959e7c5e34 #1 Not tainted
>     -----------------------------
>     swapper/0/0 is trying to lock:
>     ffff000008c9e180 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_res=
ume+0x38/0x88
>     other info that might help us debug this:
>     context-{5:5}
>     1 lock held by swapper/0/0:
>     ccree e6601000.crypto: ARM CryptoCell 630P Driver: HW version 0xAF400=
001/0xDCC63000, Driver version 5.0
>      #0: ffff8000817ec298
>     ccree e6601000.crypto: ARM ccree device initialized
>      (tick_broadcast_lock){-...}-{2:2}, at: __tick_broadcast_oneshot_cont=
rol+0xa4/0x3a8
>     stack backtrace:
>     CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-arm64-renesas=
-09926-gee959e7c5e34 #1 PREEMPT
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
>      sh_tmu_clock_event_set_oneshot+0x84/0xd4
>      clockevents_switch_state+0xfc/0x13c
>      tick_broadcast_set_event+0x30/0xa4
>      __tick_broadcast_oneshot_control+0x1e0/0x3a8
>      tick_broadcast_oneshot_control+0x30/0x40
>      cpuidle_enter_state+0x40c/0x680
>      cpuidle_enter+0x30/0x40
>      do_idle+0x1f4/0x280
>      cpu_startup_entry+0x34/0x40
>      kernel_init+0x0/0x130
>      do_one_initcall+0x0/0x230
>      __primary_switched+0x88/0x90
>
> For non-PREEMPT_RT builds this is not really an issue, but for
> PREEMPT_RT builds where normal spinlocks can sleep this might be an
> issue. Be cautious and always leave the power and clock running after
> probe.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks, splat gone on R-Mobile A1, and no regressions seen on other
platforms using the TMU (R-Car H1, rts7751r2d/qemu).

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

