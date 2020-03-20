Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F54718CF3E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2020 14:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgCTNoD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Mar 2020 09:44:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38602 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgCTNoC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Mar 2020 09:44:02 -0400
Received: by mail-ot1-f65.google.com with SMTP id t28so5983074ott.5;
        Fri, 20 Mar 2020 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HTiNRBW6uZ5w4Aw+oJKhvSzAGoLn1XvNb66iGTV4mFU=;
        b=BWFUy2LJdC2XryMQEDPo4WYsqAE/wqwfgj3JM9Y2PKU5e6mE/ycY12KtmtnSDLnxUx
         FMiYehejpMv+cxSC1D4QUhKz9QSTn6cZmsri6ZI/SSbWcLh7Cndmu23q2y++WLdexXQR
         bnO5cXQ58dW+BHQ32vV+rATzHP0vXRLWtdpK/p+HXqc1Yg0DJnclXCcwdfK9dugK93TW
         4BFTrMDDMgyVNQ9QIDLziFyS+UEhI0ErAscp3Ns30XsB12ad9h4XfFT8S/fK2f5w1Egj
         uAlWNrv15YrQf/tzDpJD5GTqGiMn3UtB0+ysbEIRDnugLkBzN0TmDhdnQEWwcKSLRj61
         y0sw==
X-Gm-Message-State: ANhLgQ36C0gxLx2x9bcPAZcc3oLobA8OjwdTyjNGNhr3b1yYxPw40Mx9
        YsxA7aYazafEYrgo1/yrhnRA39rMM87eKcdhWck=
X-Google-Smtp-Source: ADFU+vvEmg/6HsmpxKKaMImY62zgJb2bd3AJh/9jTVUjPK3jVM6yuBr7QDpI3y7cw9SFs4dn0QsgJ13LDN+MQ4od7LE=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr6703347ota.250.1584711840156;
 Fri, 20 Mar 2020 06:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be> <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
 <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com> <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
 <75358399-c292-4e60-abdc-bd0729cf5c08@gmail.com> <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
In-Reply-To: <CAMuHMdX9PH+WUvONz2C8D1fRrZXn5rEND-p_my2mYvoyxF_gWA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Mar 2020 14:43:48 +0100
Message-ID: <CAMuHMdVwxi57jMrVoH8P2ms0j9YrZvc1Zi+BVR3VDo8QJHaU-w@mail.gmail.com>
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
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dmitry et al,

On Fri, Mar 20, 2020 at 10:18 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Mar 19, 2020 at 3:35 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> > 19.03.2020 11:18, Geert Uytterhoeven пишет:
> > > On Thu, Mar 19, 2020 at 2:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> > >> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> > >>> On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> > >>> <m.szyprowski@samsung.com> wrote:
> > >>>> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> > >>>>> Currently, the start address of physical memory is obtained by masking
> > >>>>> the program counter with a fixed mask of 0xf8000000.  This mask value
> > >>>>> was chosen as a balance between the requirements of different platforms.
> > >>>>> However, this does require that the start address of physical memory is
> > >>>>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> > >>>>> requirement is not fulfilled.
> > >>>>>
> > >>>>> Fix this limitation by obtaining the start address from the DTB instead,
> > >>>>> if available (either explicitly passed, or appended to the kernel).
> > >>>>> Fall back to the traditional method when needed.
> > >>>>>
> > >>>>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > >>>>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > >>>>> i.e. not at a multiple of 128 MiB.
> > >>>>>
> > >>>>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > >>>>> ---
> > >>>>> Against arm/for-next.
> > >>>>
> > >>>> This patch landed recently in linux-next. It breaks legacy booting from
> > >>>> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> > >>>> will debug it further once I find some spare time. What I noticed so
> > >>>> far, the cmdline/memory info is not read from the ATAGs, only the values
> > >>>> provided via appended DT are used.
> > >>>
> > >>> Oops, something happening like this was one of my biggest worries when
> > >>> posting this patch... Sorry for the breakage.
> > >>>
> > >>> IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> > >>>
> > >>> I'll have a closer look later today.
> > >>> In the mean time, I've sent some debug code I used when developing
> > >>> this patch, which may be useful, hopefully.
> > >>
> > >> NVIDIA Tegra is also affected by this patch. A week ago an updated
> > >> version of the patch was pushed into linux-next and now machine doesn't
> > >> boot at all.

> > I recalled that CONFIG_THUMB2_KERNEL=y is set in my kernel's config and
> > disabling thumb2 build fixes the problem. Please correct it in the next
> > version of the patch, thanks in advance.
>
> Interesting.  I enabled CONFIG_THUMB2_KERNEL=y, and it doesn't make
> a difference for the few board combos I've tried (with/without appended DTB).
> So it must be related to ATAGS.  Will dive deeper...

I managed to reproduce it without ATAGS.

Turns out to be a bad interaction with commit 184bf653a7a452c1 ("ARM:
decompressor: factor out routine to obtain the inflated image size"),
which removed one entry from the data array at LC0.  While that commit
updated all then-existing users, merging Ard's pull request didn't take
into account that a new user had emerged, which also needed updating.

When CONFIG_THUMB2_KERNEL=y, the stack pointer becomes 2-byte
instead of 4-byte aligned, causing a crash.
When CONFIG_THUMB2_KERNEL=n, it still works, probably by accident.

                adr     r0, LC0
                ldr     r1, [r0]        @ get absolute LC0
-               ldr     sp, [r0, #28]   @ get stack location
+               ldr     sp, [r0, #24]   @ get stack location

in arch/arm/boot/compressed/head.S fixes the issue for me.

Will send v4 shortly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
