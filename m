Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD032CEB3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 10:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgLDJoK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 04:44:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35687 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgLDJoK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:44:10 -0500
Received: by mail-ot1-f66.google.com with SMTP id t18so4626799otk.2;
        Fri, 04 Dec 2020 01:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vWnMuYS3DqYvyte2bJR+CQw9EeKiRYtc7g55CoJJvhY=;
        b=l+elcDQ/K9JuTc9SR4JYD4YIcTwxyy92JGGraI8Y6oc/gTNAHrj5tIFmmyFIEBsLk+
         l/REVHMXCyIaiMBVMsJPnMMaSDx1rZ1qm/baC1Q7ta1eJhIA8FpuWCAq725S9AXk5YSw
         Ug1lxFBCVXXmz3CzpuNYpr11O9c4aXkNkA0zpKFLuc5uVDZVEcLaZMZfQanOjACXjR+b
         mWQLwrypxNAcZKsWJNwTGQDOav41PpTRKJFqbvBCjs7t0rXYzK8xIPW7Pu70ibASPMxK
         ebCFgRcVkegA2/pX/jMv9GNWNPVFBAdJXdvIrX1l/A+L9nZ+gkDKiH8C3oh33QqdjMXQ
         E+CA==
X-Gm-Message-State: AOAM530Ubm4GNor9mYs5LPSa1YsgSzvcXVTUsrDnBT+CyBsZ/Lghy394
        C/iqLYyeAr/w6kf3dBrMjgAfgAFnnJ5LMudZ4EmZSSfZ
X-Google-Smtp-Source: ABdhPJwa2nHZxZfwgznkfp4cNPcEXFV9DPoRmPn1AE2ri2l4LBz9GBMkyMKpdQXRMVrJiVY7AnVg4oB9zB7xPivnnuY=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2983512oth.250.1607075009366;
 Fri, 04 Dec 2020 01:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201203121916.2870975-1-geert+renesas@glider.be>
 <20201203121916.2870975-2-geert+renesas@glider.be> <CAMj1kXEKdRGQXFh9qMgrWcZnoW5s8Bj5TaKqStU=w1qJ-Nu9zA@mail.gmail.com>
In-Reply-To: <CAMj1kXEKdRGQXFh9qMgrWcZnoW5s8Bj5TaKqStU=w1qJ-Nu9zA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Dec 2020 10:43:17 +0100
Message-ID: <CAMuHMdVBCVWWNqFfziGy5RbDRyudV9wm3m62BA4mvmgtvA4Axw@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] ARM: uncompress: Add be32tocpu macro
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ard,

On Thu, Dec 3, 2020 at 1:50 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Thu, 3 Dec 2020 at 13:19, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > DTB stores all values as 32-bit big-endian integers.
> > Add a macro to convert such values to native CPU endianness, to reduce
> > duplication.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v10:
> >   - New.
> > ---
> >  arch/arm/boot/compressed/head.S | 26 ++++++++++++--------------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
> > index 835ce64f1674c9a2..aabdc544c03aafdc 100644
> > --- a/arch/arm/boot/compressed/head.S
> > +++ b/arch/arm/boot/compressed/head.S
> > @@ -165,6 +165,16 @@
> >                 orr     \res, \res, \tmp1, lsl #24
> >                 .endm
> >
> > +               .macro  be32tocpu, val, tmp
> > +#ifndef __ARMEB__
> > +               /* convert to little endian */
> > +               eor     \tmp, \val, \val, ror #16
> > +               bic     \tmp, \tmp, #0x00ff0000
> > +               mov     \val, \val, ror #8
> > +               eor     \val, \val, \tmp, lsr #8
> > +#endif
> > +               .endm
> > +
>
> Thanks for cleaning this up.
>
> This patch is fine as is.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Thanks, submitted to rmk's patch tracker.

> However, I would like to note that, since we are touching this code,
> we might do it properly. (Given the v10, feel free to ignore or defer
> to a later time)

[...]

Thanks for the suggestion, adding to my list.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
