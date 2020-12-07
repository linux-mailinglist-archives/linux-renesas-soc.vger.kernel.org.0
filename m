Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04452D1558
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Dec 2020 17:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgLGP6b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 10:58:31 -0500
Received: from mail-oo1-f65.google.com ([209.85.161.65]:34302 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgLGP6b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 10:58:31 -0500
Received: by mail-oo1-f65.google.com with SMTP id t63so734019ooa.1;
        Mon, 07 Dec 2020 07:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oIC9pRuaPIJn4lXLFyyVqpM55/v1ynsM88+vIja88PQ=;
        b=sc/KMzxKjc4CwyTdRzmKgnsrlRQAoMZT/eaXXEO4h3kX3rIyN7s666RXoKp5xeIfbl
         uUF3KpUeW7m3pd5pmGA4FJ9oULTLaVeK7oWU0bUrvjsC56ViF9nOu3cWssldeHE5ZBYI
         KK5Mk5FbGVteyTdYulDTgnh6Nfy48mQ5fVjSB1C1avUsQMvNRZomCXW8TDMs9vop9Vil
         0C5LvrEUsfgl43E6VS3KiZ2sWamfL6bFCTwTVpq01+ibDVe9A65YK+vbbrQGUm4aMQ3f
         ebd8zVoyNQLN4R2aKG/mQfe5DdH7FW4LANXEkm78U+bfW3UDFpYL07OfF5phXVWHZBsG
         6PaQ==
X-Gm-Message-State: AOAM53296z9t71AyWVKO0to0UVFxLw0iIZps37pmEdp0Q+Wr4zERsuSC
        tHXBcc7lkCX/SXaJHOYdt97c+QhlyDF+gml3BlA=
X-Google-Smtp-Source: ABdhPJzTH1jbnRJIkpm6e419HsfR0PH6qihDiZwU+/xI7HPos/eIoAc4s6712BpictOtoKMadPBgZ7HepRSMHWI2Q9Q=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr13306587oon.1.1607356664371;
 Mon, 07 Dec 2020 07:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20201205021921.1456190-1-niklas.soderlund+renesas@ragnatech.se> <20201205021921.1456190-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201205021921.1456190-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Dec 2020 16:57:33 +0100
Message-ID: <CAMuHMdWeOED=nckbaKEt3QRd5wiCyNZ6OBwk7m4vR15=AT7now@mail.gmail.com>
Subject: Re: [PATCH 1/2] clocksource/drivers/sh_cmt: Fix potential deadlock
 when calling runtime PM
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Sat, Dec 5, 2020 at 3:20 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The ch->lock is used to protect the whole enable() and read() of
> sh_cmt's implementation of struct clocksource. The enable()
> implementation calls pm_runtime_get_sync() which may result in the clock
> source to be read() triggering a cyclic lockdep warning for the
> ch->lock.
>
> The sh_cmt driver implement its own balancing of calls to
> sh_cmt_{enable,disable}() with flags in sh_cmt_{start,stop}(). It does
> this to deal with that start and stop are shared between the clock
> source and clock event providers. While this could be improved on
> verifying corner cases based on any substantial rework on all devices
> this driver supports might prove hard.
>
> As a first step separate the PM handling for clock event and clock
> source. Always put/get the device when enabling/disabling the clock
> source but keep the clock event logic unchanged. This allows the sh_cmt
> implementation of struct clocksource to call PM without holding the
> ch->lock and avoiding the deadlock.
>
> Triggering and log of the deadlock warning,
>
>   # echo e60f0000.timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
>   [   46.948370] ======================================================
>   [   46.954730] WARNING: possible circular locking dependency detected

[...]

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for looking into this!

> --- a/drivers/clocksource/sh_cmt.c
> +++ b/drivers/clocksource/sh_cmt.c
> @@ -319,7 +319,6 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
>  {
>         int k, ret;
>
> -       pm_runtime_get_sync(&ch->cmt->pdev->dev);
>         dev_pm_syscore_device(&ch->cmt->pdev->dev, true);
>
>         /* enable clock */
> @@ -394,7 +393,6 @@ static void sh_cmt_disable(struct sh_cmt_channel *ch)
>         clk_disable(ch->cmt->clk);
>
>         dev_pm_syscore_device(&ch->cmt->pdev->dev, false);
> -       pm_runtime_put(&ch->cmt->pdev->dev);
>  }
>
>  /* private flags */
> @@ -562,10 +560,16 @@ static int sh_cmt_start(struct sh_cmt_channel *ch, unsigned long flag)
>         int ret = 0;
>         unsigned long flags;
>
> +       if (flag & FLAG_CLOCKSOURCE)
> +               pm_runtime_get_sync(&ch->cmt->pdev->dev);
> +
>         raw_spin_lock_irqsave(&ch->lock, flags);
>
> -       if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE)))
> +       if (!(ch->flags & (FLAG_CLOCKEVENT | FLAG_CLOCKSOURCE))) {
> +               if (flag & FLAG_CLOCKEVENT)
> +                       pm_runtime_get_sync(&ch->cmt->pdev->dev);

This change emphasizes the (pre-existing) issue with clock events:
pm_runtime_get_sync() is called while holding a spinlock, leading to the
following splat on r8a7740/armadillo:

    sh_cmt e6138000.timer: ch0: used for periodic clock events
    =============================
    [ BUG: Invalid wait context ]
    5.10.0-rc5-armadillo-00566-g8eaa6103691d-dirty #225 Not tainted
    -----------------------------
    swapper/1 is trying to lock:
    c254cd2c (&dev->power.lock){....}-{3:3}, at: __pm_runtime_resume+0x54/0x80
    other info that might help us debug this:
    context-{5:5}
    3 locks held by swapper/1:
     #0: c254ccd0 (&dev->mutex){....}-{4:4}, at: device_driver_attach+0x18/0x5c
     #1: c0bed230 (clockevents_lock){....}-{2:2}, at:
clockevents_register_device+0x5c/0x10c
     #2: c26a5038 (&ch->lock){....}-{2:2}, at: sh_cmt_start+0x18/0x1b0

As this is a pre-existing issue:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>                 ret = sh_cmt_enable(ch);
> +       }
>
>         if (ret)
>                 goto out;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
