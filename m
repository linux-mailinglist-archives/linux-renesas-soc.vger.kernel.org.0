Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E192B6919
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 16:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgKQPwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 10:52:43 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44941 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgKQPwm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 10:52:42 -0500
Received: by mail-ot1-f67.google.com with SMTP id f16so19811017otl.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 07:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPg28XebXDGr5bkuB4sn9mX89mw5s0XT9UaZNKJAdyk=;
        b=m5w3lZhWegbDfgp55Blq1nkJZaVbfy/29xdsInNn/6MRwSGeiDRBrlTznJ6cIOLw7D
         kL/5cKyvSvr4eiiSGSMepvxC6euL183qjw3GWkHSw4FnQuIt4JPmt3KXjZ3MSaU5JcLv
         wVCxOuYbaAuMoOIZZ8U/jOBwBU4G7XrDd/ILNQ29ZiqdGW1dRROKdwencKSTxrv9lz8+
         QobOPBvsCcvsLzst5L7BweE1KjgIftQdIYaoDlI4hoYG+hZbLwyZPYhBE6oik/a9hB+w
         ZzHyFujd+k9zo8w9yzdfjk7w9hfF8+OmD/lUwzGrF1YPX4A27JfXiLr5k+48kiOjs/a7
         v9lw==
X-Gm-Message-State: AOAM531Hu2QpLlbX6hF3PPzaskA9MFqXT78uPMp6g6zjTGKtFr9igR59
        fEbdb8AsZKPQ6M3CyQTwkG8z9ZqbAwV51jjl5mM=
X-Google-Smtp-Source: ABdhPJzucfxeCsfOe3lHLyhJfJJzqVD84dEQ/T16YVPJ1pz4XJpxVFK9w/cEKbgau8oS/yC6CAn/Kfw6Ut2dnP01m5I=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr3398070otc.145.1605628361470;
 Tue, 17 Nov 2020 07:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com> <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
In-Reply-To: <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Nov 2020 16:52:30 +0100
Message-ID: <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Nov 17, 2020 at 4:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Nov 17, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Nov 17, 2020 at 3:39 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Tue, Nov 17, 2020 at 3:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > > On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> > > > > <geert+renesas@glider.be> wrote:
> > > > > > Replace using the legacy IOMEM() macro to map various registers related
> > > > > > to INTC2 configuration by ioremap().
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > The patch looks good, but since you are already touching these __raw_writel(),
> > > > > could you turn them into normal writel() to have a chance that this works
> > > > > on big-endian? It could be either a follow-up or merged into the same patch.
> > > >
> > > > (Do you want us to support big-endian on these old platforms? ;-)
> > > >
> > > > At your service. Seems to work well.
> > >
> > > In general, my preference is that code is written in a portable way, to make
> > > it at least plausible that it works. I don't expect anyone to actually run
> > > big-endian code on it, but if you can confirm that it boots all the way
> > > to not finding a compatible /sbin/init, that would be awesome.
> >
> > With "work well", I meant no regressions after converting from _raw_*()
> > to normal accessors.  No idea how to boot big-endian kernels on this
> > hardware ;-)
>
> There is no change when booting them, you just enable
> CONFIG_CPU_BIG_ENDIAN and recompile the kernel.

And have to select ARCH_SUPPORTS_BIG_ENDIAN first...

> The bootloader remains little-endian and the first instruction in
> the image then changes into big-endian mode. The expected
> behavior is that it crashes as soon as it tries to get into user

Cool!

SH-Mobile AG5 boots until trying to power off the A3R power domain.
After converting the __raw_*() accessors in
drivers/soc/renesas/rmobile-sysc.c and drivers/clk/renesas/clk-sh73a0.c
it continues until /sbin/init fails, as expected.

R-Car M2-W boots until DHCP timeout.  Could be due to either sh_eth or
the micrel PHY driver, or MDIO (replacing io{read,write}32() by
{read,write}l() in sh_eth.c doesn't help).

Note that drivers/tty/serial/8250/8250_dw.c, which is used on RZ/N1,
uses __raw_{write,read}q(), too.

So I guess it's a bit too early to enable ARCH_SUPPORTS_BIG_ENDIAN
unconditionally.

> space. Recompiling that is significantly more work.

Doh, and even Debian ports doesn't support armeb anymore, else it
would just be a debootstrap away...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
