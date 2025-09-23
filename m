Return-Path: <linux-renesas-soc+bounces-22228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061BB9676E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B79C1892DCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557F2459E5;
	Tue, 23 Sep 2025 14:56:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109024679A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639383; cv=none; b=s6hAoQ9CkQ9NEN1DUa+TPUBqJO9rl3wYwh3TwB5NHXfDWXHepmp7CgvvTiEVJ92cv3Wg+RKNNMnJX4TsLnsNBmOKA4wyFjbLe24mVwgfybDZfQBVlzJDryL8Q8YmMPPzQvsUf3PYw+/wEgGaFdZIobfeNx/429uBPYoIopXQeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639383; c=relaxed/simple;
	bh=7aW9e8cubUxTRqTfec2l3k6QXfECC7YsX08hk1rU+IM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfd7raYc3m7v6PJpA8WMSJUhlj9oYIpFzrnFqYGjT/hYgW+YC/kRm2+pa1HAb0RYl0OVBA3gwwfkfAOVIr0jaWyomRlA2ASH1yQe2DVNIdgWgqzA+hB6Zyx2+sWjcUjaYY0M2AleFqTfQjzfcR6puY2wRZp/XvoTPCxtva8utnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso370695e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639380; x=1759244180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3G7wjvy1OAkzNfqF3dw65SxZ83AoLDimhh6nUJP1jTY=;
        b=ibBHu65YwBByX1Z/YV01IBx/9t8cDbe2X5hkcGklNarAqu1zERk2A/7HRNhEJ0xPyd
         Tl2Md0Em6BDi4I6cSdMUGLfoAKN+3ysxEF+MKUclOyK2QKzAjNzPZt6LPf3FJy6inSdW
         Q3GA8DWuZZz16mD0BNnrmyMb+ouTCzLdnQb4Q6AGiZNaihWjbKoo9ghS0rjHkA9xEC6G
         pG5ijX2x8P8jyv+Dtm5RsQ7rSWZbzsWR1peQqvegRyADk8FmoGc/3Lurw53rq8rIusv5
         leuGtoqha8ueO8kpTJk5JEgKqC9om3gpGAwXe0JijtbmwkHhGarx+Lw2esSCODiLeH0R
         OpEA==
X-Forwarded-Encrypted: i=1; AJvYcCVUrfAZUkDADo3Nl67kHDqlC4EGpAbNF0E1xIBV2nKfkHTyUeuxVExFpT/laBZZO82MLB4lk1BZwai5PY7HEdQxpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuAmnrt9qQeRfvXPj0m0NUJj2XDCEqyw1Dp4xhaQCIydLfffN
	6PniHUwmd1ST563HRcdOjd1CaPPeB1YM4vYGcugH3SCdqVEyP0A3oQHRL10HB0+H
X-Gm-Gg: ASbGncvdyPFDBdJPqYC0Nd/In11snp8xMIaNaL6lhQZZp/5AFd0uIlaGeXwXBk1aX3q
	TCQeeAN6JNhmkI6LHOvJb/eN2KnQkUgA+ZipVqPv6qfxzeETkKMuPZRGE27onFKTpzmvmyCzWWG
	OkS8ku4w+X3R8zpV4BCpDINTgi4PgB3v4LkM+ml1curBJ74JQIH0WUv3gw1zGAmu4EqyqcGpu9E
	mmh3brrCPcj7L6CU4S/sWBYpEcCrNgeRSImBNvz+MVFeNXrKD9x9yZlz7rWtcocLoM6i3MII1dW
	PDv06saomqV7xCgwnyBHzEMd4gXlUpULHjxRun7OA3GfmVZhYec7CsXai4LYL+K/afdx8+uVvtN
	Zinb5LutmeaTBshXUu5F9aBdXGGjFfGw8JVOu3S7hiMH9EgjfXqaYhFNqGOlkQnty
X-Google-Smtp-Source: AGHT+IFzMn0VdKAvlViHeAcIxvQYqnnIl98Eu9zjcECFt7VLkZLzJfhdwyDJR8qWmb8J8leiAsGPkA==
X-Received: by 2002:a05:6122:1788:b0:54b:c0cb:d52e with SMTP id 71dfb90a1353d-54bcb10ebe9mr898605e0c.6.1758639377604;
        Tue, 23 Sep 2025 07:56:17 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bbc96ccacsm1160258e0c.3.2025.09.23.07.56.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:56:17 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso370621e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:56:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYtCNLHeJ/pCjVNDldTtdV9u3jmkVtk58aA0FY2um1MfGliFHkQbCjjMtYyy2PSpD36RdwDGNeoO/0FWXz+/XX3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1606:b0:5a4:4f20:2ac9 with SMTP id
 ada2fe7eead31-5a575a9c5f0mr1079121137.8.1758639376419; Tue, 23 Sep 2025
 07:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910142657.1148696-1-niklas.soderlund+renesas@ragnatech.se> <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250910142657.1148696-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 16:56:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
X-Gm-Features: AS18NWBc8on58vgX-WXiDDcyNSiELTcjMVkdNbb7hx8A_7Jlu8S8DdVVfRU0hxc
Message-ID: <CAMuHMdVKZn-YfBxvwA1wgjksvzZK=NPzaoTCPRur_Z=AneLA6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/sh_cmt: Do not power down
 channels used for events
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 10 Sept 2025 at 16:27, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The CMT do runtime PM and call clk_enable()/clk_disable() when a new
> clock event is register and the CMT is not already started. This is not
> always possible as a spinlock is also needed to sync the internals of
> the CMT. Running with PROVE_LOCKING uncovers one such issue.
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
> Fix this by unconditionally powering on and enabling the needed clocks
> for all CMT channels which are used for clock events. Do this before
> registering any clock source or event to avid having to take the
> spin lock at probe time.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Move the unconditional power on case before registering any clock
>   source or event to avoid having to use the spinlock to synchronize the
>   powerup sequence in probe.

Thanks for your patch, which is now commit cfbc0f1d24030ff9
("clocksource/drivers/sh_cmt: Do not power down channels used for
events") in clockevents/timers/drivers/next.

Unfortunately this commit introduces an s2ram regression on e.g.
Atmark Techo Armadillo-800EVA with R-Mobile A1: the system wakes
up immediately.  There is no evidence of a wake-up event shown in
/sys/kernel/debug/wakeup_sources.  This happens with or without
console_suspend enabled.

Reverting this commit fixes the issue.  I suspect the system wakes up
because the periodic clock event fires, and causes an interrupt.

> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -5,6 +5,7 @@
>   *  Copyright (C) 2008 Magnus Damm
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/clocksource.h>
> @@ -623,51 +624,6 @@ static void sh_cmt_stop_clocksource(struct sh_cmt_ch=
annel *ch)
>         pm_runtime_put(&ch->cmt->pdev->dev);
>  }
>
> -static int sh_cmt_start_clockevent(struct sh_cmt_channel *ch)
> -{
> -       int ret =3D 0;
> -       unsigned long flags;
> -
> -       raw_spin_lock_irqsave(&ch->lock, flags);
> -
> -       if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> -               pm_runtime_get_sync(&ch->cmt->pdev->dev);
> -               ret =3D sh_cmt_enable(ch);
> -       }
> -
> -       if (ret)
> -               goto out;
> -
> -       ch->flags |=3D FLAG_CLOCKEVENT;
> - out:
> -       raw_spin_unlock_irqrestore(&ch->lock, flags);
> -
> -       return ret;
> -}
> -
> -static void sh_cmt_stop_clockevent(struct sh_cmt_channel *ch)
> -{
> -       unsigned long flags;
> -       unsigned long f;
> -
> -       raw_spin_lock_irqsave(&ch->lock, flags);
> -
> -       f =3D ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE);
> -
> -       ch->flags &=3D ~FLAG_CLOCKEVENT;
> -
> -       if (f && !(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> -               sh_cmt_disable(ch);
> -               pm_runtime_put(&ch->cmt->pdev->dev);
> -       }
> -
> -       /* adjust the timeout to maximum if only clocksource left */
> -       if (ch->flags & FLAG_CLOCKSOURCE)
> -               __sh_cmt_set_next(ch, ch->max_match_value);
> -
> -       raw_spin_unlock_irqrestore(&ch->lock, flags);
> -}
> -
>  static struct sh_cmt_channel *cs_to_sh_cmt(struct clocksource *cs)
>  {
>         return container_of(cs, struct sh_cmt_channel, cs);
> @@ -774,19 +730,30 @@ static struct sh_cmt_channel *ced_to_sh_cmt(struct =
clock_event_device *ced)
>
>  static void sh_cmt_clock_event_start(struct sh_cmt_channel *ch, int peri=
odic)
>  {
> -       sh_cmt_start_clockevent(ch);
> -
>         if (periodic)
>                 sh_cmt_set_next(ch, ((ch->cmt->rate + HZ/2) / HZ) - 1);
>         else
>                 sh_cmt_set_next(ch, ch->max_match_value);
>  }
>
> +static void sh_cmt_clock_event_stop(struct sh_cmt_channel *ch)
> +{
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&ch->lock, flags);
> +
> +       /* adjust the timeout to maximum if only clocksource left */
> +       if (ch->flags & FLAG_CLOCKSOURCE)
> +               __sh_cmt_set_next(ch, ch->max_match_value);
> +
> +       raw_spin_unlock_irqrestore(&ch->lock, flags);
> +}
> +
>  static int sh_cmt_clock_event_shutdown(struct clock_event_device *ced)
>  {
>         struct sh_cmt_channel *ch =3D ced_to_sh_cmt(ced);
>
> -       sh_cmt_stop_clockevent(ch);
> +       sh_cmt_clock_event_stop(ch);
>         return 0;
>  }
>
> @@ -797,7 +764,7 @@ static int sh_cmt_clock_event_set_state(struct clock_=
event_device *ced,
>
>         /* deal with old setting first */
>         if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ce=
d))
> -               sh_cmt_stop_clockevent(ch);
> +               sh_cmt_clock_event_stop(ch);
>
>         dev_info(&ch->cmt->pdev->dev, "ch%u: used for %s clock events\n",
>                  ch->index, periodic ? "periodic" : "oneshot");
> @@ -968,6 +935,32 @@ static int sh_cmt_setup_channel(struct sh_cmt_channe=
l *ch, unsigned int index,
>         ch->match_value =3D ch->max_match_value;
>         raw_spin_lock_init(&ch->lock);
>
> +       if (clockevent) {
> +               /*
> +                * To support clock events the CMT must always be ready t=
o
> +                * accept new events, start it and leave no way for it to=
 be
> +                * turned off.
> +                *
> +                * This is OK as we can't never unregister a CMT device. =
If this
> +                * is fixed in future an equal unconditional shutdown is =
needed.
> +                *
> +                * We don't need to hold the channel lock here as we have=
 not
> +                * yet register any clock source or event so there is no
> +                * possible race. And holding the spinlock at probe time
> +                * produces lockdep warnings.
> +                */
> +               pm_runtime_get_sync(&ch->cmt->pdev->dev);
> +               ret =3D sh_cmt_enable(ch);
> +               if (ret)
> +                       return ret;
> +
> +               /*
> +                * Flag that the channel is used as a clock event, it's n=
ot
> +                * allowed to be powered off!
> +                */
> +               ch->flags |=3D FLAG_CLOCKEVENT;
> +       }
> +
>         ret =3D sh_cmt_register(ch, dev_name(&cmt->pdev->dev),
>                               clockevent, clocksource);
>         if (ret) {
> --
> 2.51.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

