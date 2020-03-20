Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB7E18CA0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 10:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCTJTK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 05:19:10 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34397 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgCTJTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 05:19:10 -0400
Received: by mail-ot1-f65.google.com with SMTP id j16so5332591otl.1;
        Fri, 20 Mar 2020 02:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WN9UfvYf0lvNC9mxWTqFaq0Qp0Vsh7kPQa4AQHkdeXg=;
        b=t1r+WAPCpyKLC+RucG+l+XBoA06GFlP/X4pnXCM2+Pv44VYqsMNroqfTbX14YkZatM
         +G5f3Rdr2MPTG61TQb2Xkl6akzjy8ozWCYSVKRWQmUcS/NzLV2xUayEM7narcEV0TEot
         mtQ9kiUFO/BeuKiUna3ShD04KzRFQhgkAnrALNhN9afKAJMKyRrTXQUBien8HMo5EzYU
         r2pwVJkLWqd7uctxOGWpHp1IbyKpVwBjy5xqnD99Ej6JvhopgZqsSsxrb9biYgn1QtHX
         y7yN5568anm/Q0wLG29FFHLV92BjfHksrrzMWQtkijYrlmOzoHbOWZan5nv+b5GeW7Ru
         45yA==
X-Gm-Message-State: ANhLgQ2oLSdDJ4fQleRMSbwaxhKNVdzef36WXZ3Hxisk8Ygragkv9P9M
        4jd2LvoOmrPC2EhMQyQZVYpGzvqg0k0k1D0avOY=
X-Google-Smtp-Source: ADFU+vt+8iCcmQlShj3SkV8Wy2b8mhszkQOhM+PCwNvG6MRm1/8p99Gy8bsv9fZ9sr/JtEhLq0oc0wiUNzWCOjWQP8o=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr5857263ota.250.1584695949403;
 Fri, 20 Mar 2020 02:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be> <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com> <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
In-Reply-To: <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 10:18:57 +0100
Message-ID: <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Eric Miao <eric.miao@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dmitry,

On Thu, Mar 19, 2020 at 3:35 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 19.03.2020 11:18, Geert Uytterhoeven пишет:
> > On Thu, Mar 19, 2020 at 2:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> >> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> >>> On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> >>>>> Currently, the start address of physical memory is obtained by masking
> >>>>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>>>> was chosen as a balance between the requirements of different platforms.
> >>>>> However, this does require that the start address of physical memory is
> >>>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>>>> requirement is not fulfilled.
> >>>>>
> >>>>> Fix this limitation by obtaining the start address from the DTB instead,
> >>>>> if available (either explicitly passed, or appended to the kernel).
> >>>>> Fall back to the traditional method when needed.
> >>>>>
> >>>>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >>>>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >>>>> i.e. not at a multiple of 128 MiB.
> >>>>>
> >>>>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>>>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> >>>>> ---
> >>>>> Against arm/for-next.
> >>>>
> >>>> This patch landed recently in linux-next. It breaks legacy booting from
> >>>> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> >>>> will debug it further once I find some spare time. What I noticed so
> >>>> far, the cmdline/memory info is not read from the ATAGs, only the values
> >>>> provided via appended DT are used.
> >>>
> >>> Oops, something happening like this was one of my biggest worries when
> >>> posting this patch... Sorry for the breakage.
> >>>
> >>> IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> >>>
> >>> I'll have a closer look later today.
> >>> In the mean time, I've sent some debug code I used when developing
> >>> this patch, which may be useful, hopefully.
> >>
> >> NVIDIA Tegra is also affected by this patch. A week ago an updated
> >> version of the patch was pushed into linux-next and now machine doesn't
> >> boot at all.
> >
> > I'm sorry to hear that.
> >
> > Did v2 work for you?
>
> Same as it was for Marek.
>
> > Are you sure this updated version is the culprit? There are several other
> > recent changes to head.S in arm/for-next.
>
> Yes
>
> > Do you boot a separate DTB or an appended DTB?
>
> Appended
>
> > Do you use ATAGS?
>
> Yes

Thanks for the info!

> I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
> disabling thumb2 build fixes the problem. Please correct it in the next
> version of the patch, thanks in advance.

Interesting.  I enabled CONFIG_THUMB2_KERNEL=y, and it doesn't make
a difference for the few board combos I've tried (with/without appended DTB).
So it must be related to ATAGS.  Will dive deeper...

P.S. I never realized CONFIG_THUMB2_KERNEL=y had such a big size
impact: my kernel shrunk by ca. 1 MiB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
