Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA7416407
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 14:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfEGMxK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 08:53:10 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35628 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfEGMxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 08:53:10 -0400
Received: by mail-vs1-f67.google.com with SMTP id s4so6103710vsl.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 May 2019 05:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ksDxWT8TpcQLcxcJbwsbzpbA+5sHWxlau7ieo4SeWo8=;
        b=n5Ba5Mb7S/9euuA7RNUOXIH63Hi/0rAZJVyosEDLxXVWKVA3ErhI8/Q9lg6Bhvh9oj
         PulbfJWCA8Id1ezOqhe/zEObLzFcM/QWpeSMO8d5Ts2X9JwDWWOZb/jbaB5UYLMlK0IA
         lXmk8WYyH18CQvQnQ50JLkNXM0QSMVZrwejy2QJ2kOOXImDWv7/ZLy8TyJePeBDeGqHk
         B8f5jAjc1q/HegZtddDwW+AQMlJhpNkpJqFm4ZN7JEzuRRKwso19I9r+s0Cd+Pbe+HwR
         ISQySDBXDPDpOsg1jx/pyT78MiC3j2qOMGMdhkLrrEtoRl0sMzTI2oqXICFLWreY2JjT
         6QAA==
X-Gm-Message-State: APjAAAUtOvFFGn/nvXP7blw2NeMmNPlp7Q94+n9oAEdJwXOsH9fMx3Q3
        9I5G/Gl6nu9qD2P4NLmdKviFXzGea9VCVQxPLt0=
X-Google-Smtp-Source: APXvYqwvomkoI4cacmn/V2CCF0iEOqtns3XDrT0Z8NRMXceiJ/82GKiFOc8oTWh+rCZwt8g5GefGOORrKHKrN1e12wA=
X-Received: by 2002:a67:e407:: with SMTP id d7mr3471798vsf.166.1557233588729;
 Tue, 07 May 2019 05:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se> <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com> <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
In-Reply-To: <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 May 2019 14:52:56 +0200
Message-ID: <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To:     Jonas Bonn <jonas@norrbonn.se>
Cc:     Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jonas,

On Tue, May 7, 2019 at 1:14 PM Jonas Bonn <jonas@norrbonn.se> wrote:
> On 07/05/2019 12:50, Geert Uytterhoeven wrote:
> > On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
> >> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
> >>> On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
> >>>> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
> >>>> Tested and verified on a Cypress s25fl512s.
> >>>>
> >>>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> >>>
> >>> This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
> >>> locking") in mtd/next.
> >>>
> >>>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>>> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
> >>>>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> >>>>          { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> >>>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> >>>> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >>>> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> >>>
> >>> Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
> >>> probing.
> >>>
> >>> Before/after:
> >>>
> >>>      -m25p80 spi0.0: s25fl512s (65536 Kbytes)
> >>>      -3 fixed-partitions partitions found on MTD device spi0.0
> >>>      -Creating 3 MTD partitions on "spi0.0":
> >>>      -0x000000000000-0x000000080000 : "loader"
> >>>      -0x000000080000-0x000000600000 : "user"
> >>>      -0x000000600000-0x000004000000 : "flash"
> >>>      +m25p80 spi0.0: Erase Error occurred
> >>>      +m25p80 spi0.0: Erase Error occurred
> >>>      +m25p80 spi0.0: timeout while writing configuration register
> >>>      +m25p80 spi0.0: quad mode not supported
> >>>      +m25p80: probe of spi0.0 failed with error -5
> >>>
>
> In drivers/mtd/spi-nor/spi-nor.c you have:
>
> static int spi_nor_init(struct spi_nor *nor)
> {
>          int err;
>
>          /*
>           * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>           * with the software protection bits set
>           */
>          if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
>              JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
>              JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>              nor->info->flags & SPI_NOR_HAS_LOCK) {
>                  write_enable(nor);

With more debug prints:

    m25p80 spi0.0: spi_nor_init:3925: write_enable() returned 0

>                  write_sr(nor, 0);

    m25p80 spi0.0: spi_nor_init:3927: write_sr() returned 0

>                  spi_nor_wait_till_ready(nor);

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
                                     ...
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: spi_nor_init:3929: spi_nor_wait_till_ready() returned -5

>          }
>
>          if (nor->quad_enable) {
>                  err = nor->quad_enable(nor);

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: timeout while writing configuration register
    m25p80 spi0.0: spi_nor_init:3937: spansion_quad_enable() returned -5

>                  if (err) {
>                          dev_err(nor->dev, "quad mode not supported\n");
>                          return err;
>                  }
>          }
>
> This is the only meaningful thing that I can see may have changed with
> this flag.  We now have an additional write_enable before quad_enable.
> What happens if you swap those two blocks above so that quad_enable is
> called first?

With the two blocks swapped:

    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x0
    m25p80 spi0.0: spi_nor_init:3919: spansion_quad_enable() returned 0
    m25p80 spi0.0: spi_nor_init:3937: write_enable() returned 0
    m25p80 spi0.0: spi_nor_init:3939: write_sr() returned 0
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
                                                                  ...
    m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
    m25p80 spi0.0: Erase Error occurred
    m25p80 spi0.0: spi_nor_init:3941: spi_nor_wait_till_ready() returned -5
    m25p80 spi0.0: s25fl512s (65536 Kbytes)
    3 fixed-partitions partitions found on MTD device spi0.0
    Creating 3 MTD partitions on "spi0.0":
    0x000000000000-0x000000080000 : "loader"
    0x000000080000-0x000000600000 : "user"
    0x000000600000-0x000004000000 : "flash"

Note that spi_nor_wait_till_ready() still fails.

While the device (which contains the boot loader) now appears to be
detected fine, reading returns bogus repetitive data, for all partitions:

    # hd /dev/mtd0 | head
    00000000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
|3333333333;.....|
    00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
    *
    00001000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
|3333333333;.....|
    00001010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
|................|
    *

If I remove the call to "write_sr(nor, 0)", everything works as
before, regardless
of swapping the blocks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
