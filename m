Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F8416221
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 12:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEGKuS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 06:50:18 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:39834 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfEGKuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 06:50:18 -0400
Received: by mail-ua1-f68.google.com with SMTP id v7so3531050ual.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 03:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kNxVsetn9Dj/BNVG2Uz5GICb2mQyYf1NM57GDJwqiK0=;
        b=Lyb+BE9xiTLbPR32Reu8FZP8TkqO0RdUY5GZ7GQcjr/ttinfz9q3YyljPQ04+gUByU
         bAE6QXWKTUEavR2pMoEeQABrM+y3g1WM6F3Lx5EASbsHMnxzre4rvs8pKdzQpxo13y1q
         LZMk76B16CG82Y3wYbrC26KOvxZR5Xy6E+VBlj1wULWXgRPiEM5xb4OJYZl7rlooKnxJ
         uD5KHYDRWqC+Rtpy3CpjEj3/BHTZBTYqIiJQVtruksCWX8mXuS2fDg8iTsAvU1puK16C
         2bz+4ks67l9/q4Mh0/7NK1i7dKhFh9KkuG7Z6kMX4BmIkQ69h8Ga/6MfUIeJJrKL1u/q
         ChTQ==
X-Gm-Message-State: APjAAAUdCSGZdXqMSi6S6qGsgEzwSMCv/dU+FH1FWBQBqRJS7E2AZRsJ
        agtgganaCXAqfdQ1TyAtj0VABAcMOiAw6WFgCks=
X-Google-Smtp-Source: APXvYqzlZ1OPBUDMtdv41HUU+60+lDZDrbO5LgbiR9zkVPVGIns8fa9SYLiYmisL3BKMF5uUXv3NAe7kR3a+QBFQWAM=
X-Received: by 2002:ab0:d89:: with SMTP id i9mr15669045uak.96.1557226216978;
 Tue, 07 May 2019 03:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com> <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
In-Reply-To: <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 12:50:05 +0200
Message-ID: <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc:     Jonas Bonn <jonas@norrbonn.se>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tudor,

On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
> > On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
> >> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> >> Tested and verified on a Cypress s25fl512s.
> >>
> >> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> >
> > This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
> > locking") in mtd/next.
> >
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
> >>                         SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> >>         { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> >> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> >
> > Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
> > probing.
> >
> > Before/after:
> >
> >     -m25p80 spi0.0: s25fl512s (65536 Kbytes)
> >     -3 fixed-partitions partitions found on MTD device spi0.0
> >     -Creating 3 MTD partitions on "spi0.0":
> >     -0x000000000000-0x000000080000 : "loader"
> >     -0x000000080000-0x000000600000 : "user"
> >     -0x000000600000-0x000004000000 : "flash"
> >     +m25p80 spi0.0: Erase Error occurred
> >     +m25p80 spi0.0: Erase Error occurred
> >     +m25p80 spi0.0: timeout while writing configuration register
> >     +m25p80 spi0.0: quad mode not supported
> >     +m25p80: probe of spi0.0 failed with error -5
> >
> > FLASH chip is SPANSION FL512SAIFG1 311QQ063 A ©11 SPANSION
> > JEDEC id bytes: 01 02 20 4d 00 80
>
> That's curious. Did you revert this patch and probe was ok? Are you sure it is

Yes, a revert fixes the the probe.
I had tried all combinations of the 2 newly set flags, and only
SPI_NOR_HAS_LOCK is a problem.

> not related to the recent changes on spi-rspi.c?

These changes affect QSPI transfers only.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
