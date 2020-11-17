Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFA72B6A6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 17:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKQQhY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 11:37:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:59686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728164AbgKQQhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 11:37:23 -0500
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC4232467D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605631043;
        bh=i6lEy1S2D54G4In0XuRld1P0sfOxFpydoN/VPPeQXvg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tr4EIwP603CqlXAZgfWcw8TG3L81dzgbllmKkm4D3h5NT8B2wW4qJZ/c6txlF4K6n
         rLupGe6AArw2CIOAKXBO3cr0ZvzKvynM/NoofJdxFdBu+G3MvRIw1wmSrFqdetw5Bh
         MhmBrLehT2/qwUjTtc03LcSrw7XPskZQAIHPCaTs=
Received: by mail-wm1-f53.google.com with SMTP id 1so2321413wme.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 08:37:22 -0800 (PST)
X-Gm-Message-State: AOAM530azPk/B1G4blvxGOJoXAKTL/KJSub89z9sCQB3W+CI1lDQ9aYy
        r4ytl1poJJVYH27t/B/hyzwE/2Zj1Sy15lJQpjU=
X-Google-Smtp-Source: ABdhPJy5TWVLP2KS38j07+BDzSeuxxr+8fhGRgzjeCWTL5+xK9C03Zd50scJutaUBM6Tr05djGvwlkXydVY2876sw3Q=
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr496939wmj.69.1605631041306;
 Tue, 17 Nov 2020 08:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com> <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
In-Reply-To: <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 17:37:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
Message-ID: <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 4:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Nov 17, 2020 at 4:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Nov 17, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 17, 2020 at 3:39 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > On Tue, Nov 17, 2020 at 3:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > > > > On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> > > > > > <geert+renesas@glider.be> wrote:
> > > > > > > Replace using the legacy IOMEM() macro to map various registers related
> > > > > > > to INTC2 configuration by ioremap().
> > > > > > >
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > >
> > > > > > The patch looks good, but since you are already touching these __raw_writel(),
> > > > > > could you turn them into normal writel() to have a chance that this works
> > > > > > on big-endian? It could be either a follow-up or merged into the same patch.
> > > > >
> > > > > (Do you want us to support big-endian on these old platforms? ;-)
> > > > >
> > > > > At your service. Seems to work well.
> > > >
> > > > In general, my preference is that code is written in a portable way, to make
> > > > it at least plausible that it works. I don't expect anyone to actually run
> > > > big-endian code on it, but if you can confirm that it boots all the way
> > > > to not finding a compatible /sbin/init, that would be awesome.
> > >
> > > With "work well", I meant no regressions after converting from _raw_*()
> > > to normal accessors.  No idea how to boot big-endian kernels on this
> > > hardware ;-)
> >
> > There is no change when booting them, you just enable
> > CONFIG_CPU_BIG_ENDIAN and recompile the kernel.
>
> And have to select ARCH_SUPPORTS_BIG_ENDIAN first...
>
> > The bootloader remains little-endian and the first instruction in
> > the image then changes into big-endian mode. The expected
> > behavior is that it crashes as soon as it tries to get into user
>
> Cool!
>
> SH-Mobile AG5 boots until trying to power off the A3R power domain.
> After converting the __raw_*() accessors in
> drivers/soc/renesas/rmobile-sysc.c and drivers/clk/renesas/clk-sh73a0.c
> it continues until /sbin/init fails, as expected.

Ok, great!

> R-Car M2-W boots until DHCP timeout.  Could be due to either sh_eth or
> the micrel PHY driver, or MDIO (replacing io{read,write}32() by
> {read,write}l() in sh_eth.c doesn't help).

My guess would be that the sh_eth_soft_swap() logic is wrong
there, it seems to have been written in the SuperH days.

> Note that drivers/tty/serial/8250/8250_dw.c, which is used on RZ/N1,
> uses __raw_{write,read}q(), too.

This one is only used for octeon, which like superh has different
rules for endianness compared to everything else.

> So I guess it's a bit too early to enable ARCH_SUPPORTS_BIG_ENDIAN
> unconditionally.

The ARCH_SUPPORTS_BIG_ENDIAN logic is rather broken, as
it lets you build a big-endian kernel if any enabled platform sets it.
What we should probably have instead is 'depends on !CPU_BIG_ENDIAN'
in the platforms that do not support it.

> > space. Recompiling that is significantly more work.
>
> Doh, and even Debian ports doesn't support armeb anymore, else it
> would just be a debootstrap away...

Debian actually dropped all big-endian platforms other than s390
now, the last other one was mips32 (mips32el is still there for the
moment).

      Arnd
