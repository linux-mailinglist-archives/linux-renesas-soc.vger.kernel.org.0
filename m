Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4AF16BFC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2020 12:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729890AbgBYLk3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Feb 2020 06:40:29 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46894 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgBYLk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 06:40:29 -0500
Received: by mail-ot1-f67.google.com with SMTP id g64so11734438otb.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2020 03:40:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtSL6blyPAZze6ZCRbjWDN2YMeEHTgiACm2C0IipfCg=;
        b=WabCpm5qEJdSB6QQkaazgTQt+bYtJ0Yz3t/Kao8Ck9AEJLPc5ZpDVuLqlU3YKdA8s3
         b5QcViK4znGLD25UVhOSyLyc0Y43GWvmkEPzooerG/QS6U67XngbVzgVxEqcsbZFv2gI
         6ZGEWtia0K1QbiE9/H90j/pVgPLaJUzHMxrXwR2yGQOYgB2Q2U+hXgFLCfUlGU1akXlI
         aQGTV4u4h9+MPZOVBRTXtCpJaHXXkZzs0IXb854GiWn3IsmsTDpllMwXc/HM0XacfuJn
         veQay8ITM8Lngk1lvzyYLkbBBomuIu3TqdnFPnAC8F4o7y5UdVC7p4BHuFZRwPxwhjUW
         biWA==
X-Gm-Message-State: APjAAAVJlEPWY9eURGlDSW3VaKia1T+9YFB/zq0AnN5pIoDLPgzLZpiv
        npDjmJVMOUdEbSUqApjZOPIngeAEilR9iXtVSoI=
X-Google-Smtp-Source: APXvYqyouWOxx7o+qGH6491cT0Mqwp/wv4rPE9H5nXnqyr95TiZnfee0zlwsraP4qZaWJtjNPpueTtXCFgXu01sucFg=
X-Received: by 2002:a05:6830:10e:: with SMTP id i14mr1608612otp.39.1582630828617;
 Tue, 25 Feb 2020 03:40:28 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be> <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
In-Reply-To: <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Feb 2020 12:40:17 +0100
Message-ID: <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: boot: Obtain start of physical memory from DTB
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> > Currently, the start address of physical memory is obtained by masking
> > the program counter with a fixed mask of 0xf8000000.  This mask value
> > was chosen as a balance between the requirements of different platforms.
> > However, this does require that the start address of physical memory is
> > a multiple of 128 MiB, precluding booting Linux on platforms where this
> > requirement is not fulfilled.
> >
> > Fix this limitation by obtaining the start address from the DTB instead,
> > if available (either explicitly passed, or appended to the kernel).
> > Fall back to the traditional method when needed.
> >
> > This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> > on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> > i.e. not at a multiple of 128 MiB.
> >
> > Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> > ---
> > Against arm/for-next.
>
> This patch landed recently in linux-next. It breaks legacy booting from
> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> will debug it further once I find some spare time. What I noticed so
> far, the cmdline/memory info is not read from the ATAGs, only the values
> provided via appended DT are used.

Oops, something happening like this was one of my biggest worries when
posting this patch... Sorry for the breakage.

IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?

I'll have a closer look later today.
In the mean time, I've sent some debug code I used when developing
this patch, which may be useful, hopefully.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
