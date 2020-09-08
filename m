Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C391260B54
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 08:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgIHGz7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 02:55:59 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:32840 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728881AbgIHGz6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 02:55:58 -0400
Received: by mail-oi1-f193.google.com with SMTP id 3so15570387oih.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2020 23:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJTsgbvkrR55QPK4iMxy3L+SUKV5ZOurBGQJbCqx1Pw=;
        b=A4lg5q+/cwwXabugETmCr8DbW8rvtEhnjW/Rg1KYPlYtrxyIa8xHmewBBLFy4Slb6y
         eJRGbfABoFUknyB1OCEXesXzPb1rWzQIX1JWiyhmVEAMtkCrhoe4/seZB7ZXFB6Y+B4w
         Cd396mk0/KxPKJgQ7CRpYdsp98HR84Q28HkSyOVcve5GPXL5zRBvUlQqZnSIBxVTx6jq
         obqg1iK8MNkuXkOlQN7fsUl8y3E8l0uD9XNM330dV09fNnMAf+oL7PpOzcxGrYoXB7Im
         Xp0O2pPYNg7p2gj2B8BfqXug+Mtixf38x0WlJz2YKRvaQx4kd6nsLuItStlTsTQsN3Uw
         1j3w==
X-Gm-Message-State: AOAM532tDdU4xOya4hyfvgv72FgxTm2o98x3gTkAK31/F3w05vPSO4E/
        LRuDptrCQwWVHydL8h27CCY+h5u4LFaOubNbmPA=
X-Google-Smtp-Source: ABdhPJwGW/vpQWBtdw4OMrAQudRV7xtV+t1XkVvrnCmEqvnWBrsVrW+cVXr1U3tz2MOKTGwZJdkPHa2D918iAUdtO9g=
X-Received: by 2002:aca:4441:: with SMTP id r62mr1688357oia.153.1599548156491;
 Mon, 07 Sep 2020 23:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200902153606.13652-1-geert+renesas@glider.be> <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ44wuYp1aWZ-mYkJJAZUXfAZ9XVYf0rDKT8GH_JE8ezQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 08:55:45 +0200
Message-ID: <CAMuHMdXBpLSdRiVkfpO-F7HpJLDqFW1LKfZnCS8nzH_ncq8ZQA@mail.gmail.com>
Subject: Re: [PATCH v9] ARM: boot: Validate start of physical memory against DTB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus,

On Thu, Sep 3, 2020 at 10:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> I am trying to understand this thing, it looks useful!

Thanks for your (initial ;-) comments!

> On Wed, Sep 2, 2020 at 5:36 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > @@ -254,8 +254,56 @@ not_angel:
>
> This looks like it happens before CONFIG_ARM_ATAG_DTB_COMPAT
> meaning it will not use the DTB that is augmented with ATAGs,
> especially not ATAG_MEM (0x54410002) correct?
>
> That seems sad, because that would actually be useful to me.
>
> Can you see if it is possible to put this in after the ATAGs have
> been merged into the DTB?

Right, this is done before the DTB is augmented with ATAGs.
Hence if the memory node in DT is bogus, my validation code may
do the wrong thing, and return a bogus address, too :-(

> >  #ifdef CONFIG_AUTO_ZRELADDR
> > +#ifdef CONFIG_USE_OF
> >                 /*
> > -                * Find the start of physical memory.  As we are executing
> > +                * Find the start of physical memory.
> > +                * Try the DTB first, if available.
> > +                */
> > +               adr     r0, LC1
> > +               ldr     sp, [r0]        @ get stack location
> > +               add     sp, sp, r0      @ apply relocation
> > +
> > +#ifdef CONFIG_ARM_APPENDED_DTB
> > +               /*
> > +                * Look for an appended DTB. If found, use it and
> > +                * move stack away from it.
> > +                */
> > +               ldr     r6, [r0, #4]    @ get &_edata
> > +               add     r6, r6, r0      @ relocate it
> > +               ldmia   r6, {r0, r5}    @ get DTB signature and size
> > +#ifndef __ARMEB__
> > +               ldr     r1, =0xedfe0dd0 @ sig is 0xd00dfeed big endian
> > +               /* convert DTB size to little endian */
> > +               eor     r2, r5, r5, ror #16
> > +               bic     r2, r2, #0x00ff0000
> > +               mov     r5, r5, ror #8
> > +               eor     r5, r5, r2, lsr #8
> > +#else
> > +               ldr     r1, =0xd00dfeed
> > +#endif
>
> We now have two and even three copies of this code,
> sort of.

Indeed.

> Then at the end after deciding to use the appended
> device tree we get the DTB size *again* and moves
> the sp beyond the DTB permanently as we do not
> want to damage the DTB of course.
>
> To me it looks like the DTB size gets added to sp
> a second time? First it is bumped by your code,
> then when the appended DTB is detected and
> augmented further down, it gets bumped again
> for no reason here:
>
> /* relocate some pointers past the appended dtb */
> add    r6, r6, r5
> add    r10, r10, r5
> add    sp, sp, r5
> dtb_check_done:
>
> I don't know if I'm right, I may be confused...

Before that, it has started with a "fresh" stack pointer:

    restart:        adr     r0, LC1
                    ldr     sp, [r0]
                    ldr     r6, [r0, #4]
                    add     sp, sp, r0

So the addition is done only once (ignoring the "temporarily
relocate..." cakewalk, doing "add sp, sp, r5", and "sub sp, sp, r5"
later).

> It would be better if we could avoid copy/paste and
> merge the code in here so we first check if there is a
> DTB, else there is not much to do, and if there is, we
> get the size, move the sp and do both operations:
>
> 1. Check for ATAGs and augment the DTB
> 2. Check for memory size in the DTB
>
> This way the ATAG-augmented DTB can be used
> for checking for the memory start.
>
> I understand that you need the physical address
> before turning on the caches, so what I am thinking
> is if it is possible to move the check for appended
> DTB and ATAG augmentation business up before
> the cache enablement in a separate patch and then
> modify it from there. Then you could potentially
> merge these two things.
>
> Maybe there is something conceptually wrong with
> this that I have overlooked... :/

I agree there are plenty of opportunities to improve of head.S.
Unfortunately there are also plenty of opportunities to break someone's
boot process ;-(

Nicolas' patch to reshuffle the registers looks like a good first step...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
