Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D85618AE3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 09:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgCSITG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Mar 2020 04:19:06 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39542 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgCSITG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 04:19:06 -0400
Received: by mail-oi1-f196.google.com with SMTP id d63so1783856oig.6;
        Thu, 19 Mar 2020 01:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PHHOTMHAVr2S4KOOH2EanfmchrOEz8G+tJOrFqdCMMU=;
        b=E6HFKMoxUSOjy2TqjjPMsIfHMT66MzVqUSc04C26KZEU0hgADIUz0oJIb/Ctcluz7K
         j5BouVk2UgTT/o+ZUvtBWwUwCtYyrAqPjzpDtnFX3rtkf0iEIZ/K9gDo+htBrvDVQkla
         BDtplAUFbraJL36v4XQhX9QzI2PKMdp/eKMNR2V59yv9xH4tg6o922cFmFLqCWWHdFC2
         KwY6T5zyTfMakbvnOXGZU+ngesyKnFc45w4GBnMKYrrngghVdLgkD0CxTF+pIdaTqXT8
         W16qnF/PGYJe4/w69U+xh6DGvnHRSuJtYH4uw0Rh/YcbG/4+NO83IMqbzUlOCXc2ti7g
         E1aQ==
X-Gm-Message-State: ANhLgQ1gS66II8Vsj5mJGCvRx8zRKU5fhSJsZ3indgyTioLCIVUw3PHb
        hHt5P46KTXNNDjdoM6qBrrpaliU91Sdc8Sh0LGw=
X-Google-Smtp-Source: ADFU+vtVCuX/dlfREDf0wEJ5KirUT/mS2m1kp334SMVECxLAz8K7WxnAxWoq4sfqUY/ZxPO8apzvfDLyc+E4G9+G0LM=
X-Received: by 2002:aca:5ed4:: with SMTP id s203mr1531329oib.102.1584605944151;
 Thu, 19 Mar 2020 01:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200225112354eucas1p1300749b32c6809b6a22194c1a952a68c@eucas1p1.samsung.com>
 <20200127140716.15673-1-geert+renesas@glider.be> <d1b12473-5199-1cf6-25d1-a6ce79450e8e@samsung.com>
 <CAMuHMdUGu4eStpYp5W0SKJd8yrLLDTgF4__Jq_n+Z7SWtPM+Cg@mail.gmail.com> <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
In-Reply-To: <90c006f2-8c13-2976-008f-37139ca49f37@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Mar 2020 09:18:52 +0100
Message-ID: <CAMuHMdVkhf+4CQwpf9tn3UfaMb=qoRRYS2XpwcgBMciTVmXjHA@mail.gmail.com>
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

On Thu, Mar 19, 2020 at 2:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 25.02.2020 14:40, Geert Uytterhoeven пишет:
> > On Tue, Feb 25, 2020 at 12:24 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 27.01.2020 15:07, Geert Uytterhoeven wrote:
> >>> Currently, the start address of physical memory is obtained by masking
> >>> the program counter with a fixed mask of 0xf8000000.  This mask value
> >>> was chosen as a balance between the requirements of different platforms.
> >>> However, this does require that the start address of physical memory is
> >>> a multiple of 128 MiB, precluding booting Linux on platforms where this
> >>> requirement is not fulfilled.
> >>>
> >>> Fix this limitation by obtaining the start address from the DTB instead,
> >>> if available (either explicitly passed, or appended to the kernel).
> >>> Fall back to the traditional method when needed.
> >>>
> >>> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> >>> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> >>> i.e. not at a multiple of 128 MiB.
> >>>
> >>> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>
> >>> ---
> >>> Against arm/for-next.
> >>
> >> This patch landed recently in linux-next. It breaks legacy booting from
> >> the zImage + appended DT + cmdline/memory info provided via ATAGs. I
> >> will debug it further once I find some spare time. What I noticed so
> >> far, the cmdline/memory info is not read from the ATAGs, only the values
> >> provided via appended DT are used.
> >
> > Oops, something happening like this was one of my biggest worries when
> > posting this patch... Sorry for the breakage.
> >
> > IIUIC, the kernel still boots, but just doesn't use the info passed by ATAGs?
> >
> > I'll have a closer look later today.
> > In the mean time, I've sent some debug code I used when developing
> > this patch, which may be useful, hopefully.
>
> NVIDIA Tegra is also affected by this patch. A week ago an updated
> version of the patch was pushed into linux-next and now machine doesn't
> boot at all.

I'm sorry to hear that.

Did v2 work for you?
Are you sure this updated version is the culprit? There are several other
recent changes to head.S in arm/for-next.

Do you boot a separate DTB or an appended DTB?
Do you use ATAGS?

> I couldn't find v3 on the ML, so replying to the v2. Please take a look
> and fix the problem, or revert/drop the offending patch, thanks in advance.

V3 is v2 combined with "[PATCH] ARM: boot: Fix ATAGs with appended DTB"
(https://lore.kernel.org/linux-renesas-soc/20200225144749.19815-1-geert+renesas@glider.be/).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
