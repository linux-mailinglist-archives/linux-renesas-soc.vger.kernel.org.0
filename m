Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8F6D8B9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 10:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfJPIqn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 04:46:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35016 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfJPIqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 04:46:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id z6so19467914otb.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 01:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPVe7NLWaLgM1xNxlcgYC1n8G1aLlWfHYkgZQNAiM9w=;
        b=QUvsIq4NbXRG1B0F+dMXrjoXCMPev4bg0mjWHea4rtL12hecpxx1uC+3AA98puzAlA
         QFqs5jy7epZGTmr+WyddOVIt7rQX59vTDm26Z3yKt5iEkaCbOM7jujRFaQTuWYkTcIR2
         bMycmbwHsiZgs3Dt5FXiRHa+IqbpCXaSJ+Vy6wEZDRNfmSAHv4ZKzYKdv/+mBnB6Lkuj
         Kc0eLAhkjpI7INg+zB/VmhPiCRx0j/qn6Pg9ZbrTurn4z9K85/804Zw3yFwgCnCv9HwR
         nTOM4mu/RNlIY7cxomb4N3gxg5TRAOJ3bofwndp8P6UHoeCOCxBbt3iLjDxaGjH/4Xa6
         4GBg==
X-Gm-Message-State: APjAAAWYKf5W3pRvgM4B7HVgNSVCttwnMJwqvNre32/0EkqwVtLdhpu9
        z1YhTQvymFqJpVULS8+6LrvL6ftjS6+9ppMRKqk=
X-Google-Smtp-Source: APXvYqw8NYNspDqIeRuTTrqQYRoSHEXqLf1iCWZ/1VkD7YABVAS1JC0Ocj78qaQf1zl7nbAtDvl55QijiWdkK6ACf3E=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr1931249otr.250.1571215601764;
 Wed, 16 Oct 2019 01:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191007102332.12196-1-geert+renesas@glider.be> <20191014195842.GB10366@vmlxhi-102.adit-jv.com>
In-Reply-To: <20191014195842.GB10366@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Oct 2019 10:46:30 +0200
Message-ID: <CAMuHMdWgeTfVnxhH2v_BSn8FWHH5CwjOinMvQxJa+3wVzgDZ3w@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Mon, Oct 14, 2019 at 9:58 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Mon, Oct 07, 2019 at 12:23:13PM +0200, Geert Uytterhoeven wrote:
> > This RFC patch series adds support for the R-Car M3-W+ (R8A77961) SoC
> > and the Salvator-XS board with R-Car M3-W+.  This SoC is a derivative of
> > R-Car M3-W (R8A77960), and also known as R-Car M3-W ES3.0.
> > As this is an RFC, I'm sending it to a limited audience.
> >
> > Based on experience with previous SoCs in the R-Car Gen3 family, the
> > following design decisions were made:
> >   - Use different compatible values (r8a77961-based),
>
> Given that a potentially incomplete list of M3-W compatible strings
> counts 40 occurrences [1] and this series adds only 7 [2], current RFC
> looks like the first step in a multi-phase approach. Do you plan to add
> the missing r8a77961 compatibles in the next revision or do you expect
> other people to contribute those later?

This is indeed a multi-phase approach.
I plan to add more later, and welcome other people in our team to do so, too.
However, as we currently have limited (remote) access, we cannot
add/test all other devices.
So if you have hardware access, any help is welcome.

> >   - Use different clock and SYSC DT binding definitions
> >     (R8A77961-based), but the same numerical values, to allow sharing
> >     drivers,
> >   - Share the pin control driver,
> >   - Share the clock driver,
> >   - Share the system controller driver.
> >
> > While the DT ABI is stable (hence we cannot s/r8a7796/r8a77960/ in DTS),
> > kernel source code and kernel config symbols can be changed at any
> > time.  As changing kernel config symbols impacts the user, they weren't
> > renamed yet.
> >
> > Questions:
> >   - What's the board part number of Salvator-XS with R-Car M3-W+?
>
> I guess my board is an exception, since it got the SiP simply upgraded
> from SoC ES1.x to ES3.0 by resoldering. IOW the board carries the same
> serial number as M3-ES1.1 Salvator-XS.

Yes, AFAIK, all Salvator-X and Salvator-XS boards have the same PCB
(modulo minor revision updates), and support all of H3/M3-W/M3-N SiPs
(except for H3 ES1.x, which is not supported by the -XS variant).
So upgraded boards retain their original part number.

> >   - Should the R8A77961 config symbols be dropped?
> >       - CONFIG_ARCH_R8A77961
> >       - CONFIG_CLK_R8A77961
> >       - CONFIG_PINCTRL_PFC_R8A77961
> >       - CONFIG_SYSC_R8A77961
> >
> >   - If not, should the R8A7796 config symbols be renamed?
> >       - CONFIG_ARCH_R8A7796 to CONFIG_ARCH_R8A77960?
> >       - CONFIG_CLK_R8A7796 to CONFIG_CLK_R8A77960?
> >       - CONFIG_PINCTRL_PFC_R8A7796 to CONFIG_PINCTRL_PFC_R8A77960?
> >       - CONFIG_SYSC_R8A7796 to CONFIG_SYSC_R8A77960?
> >     Due to dependencies on CONFIG_ARCH_R8A7796, this should be a single
> >     commit.
>
> [2 cents] Both adding CONFIG_*_R8A77961 and renaming CONFIG_*_R8A7796 to
> CONFIG_*_R8A77960 make sense to me.
>
> > Related questions for old R-Car H3 ES1.x support:
> >   - Should CONFIG_PINCTRL_PFC_R8A77950 be added, to allow compiling out
> >     R-Car H3 ES1.x pin control support?
>
> [2 cents] Adding CONFIG_*_R8A77950 makes sense in spite of the fact that
> R8A77950 is not documented in R-Car HW man. In fact, it is quite clear
> why R8A77950 is _not_ documented while R8A77960 _is_ documented. The
> former is obsolete (the community is nice by not obliterating its
> support) while the latter is expected to hit the market.
>
> >     If yes, should CONFIG_PINCTRL_PFC_R8A7795 be renamed to
> >     CONFIG_PINCTRL_PFC_R8A77951?
>
> In a perfect/ideal world, I would say yes.

Thanks for your feedback!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
