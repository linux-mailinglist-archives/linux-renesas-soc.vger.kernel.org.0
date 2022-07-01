Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A4C562FF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 11:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbiGAJZg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 05:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235224AbiGAJZF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 05:25:05 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF323735BD
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 02:25:04 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id g1so1401624qkl.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 02:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6HULwk1FshibO9XrGHWCGQVE9/hkG7rSnjZGsILDl9s=;
        b=w4ohLByKrIejVLKVjAscr5jkFhfXxXTCTGnd8pTgiFDX1Zj8SsjbIrx8UaTnRQZEd8
         O4cnsYLSHKk5c9THNUxc5At1kzT4v8ZMJQ1SkNprMmBK6oaQBsMyPeeBePHBRhjby1W9
         FSXCaT1NfivbQeE8F2XGxoHGHMSOTGXSanGu949qmb50xYT47c6MWEwhJkJluEzMQgB4
         XPTDkjDVzdR4piyOoMoI2OZmO9omhGTNtD8Qb8RePkLLmf1+EoV9tAgIFgB+g+2ct+nP
         IbB5R6nFgksiWMbE/e+ypMG//7nMtuLXJU9/42Jegf3GcB8XkBLv9NVKFJSSlpUkxAfi
         WI+g==
X-Gm-Message-State: AJIora8Ht4yu/eBl3wV16oVBfbSfAoKsxXYFyKCcFi5ni9bSbHaU3hih
        dYUGcMtGsd8LWUaNBePpEK3td03Q+8KRTQ==
X-Google-Smtp-Source: AGRyM1von4YZBVLZUqi9GsH3uaviUqZQu63tEnUBkxkpiJTd1w6zfrF7LF0NxGxw9eHgIPGrwyjH7Q==
X-Received: by 2002:ae9:e402:0:b0:6a7:86a3:752e with SMTP id q2-20020ae9e402000000b006a786a3752emr9655271qkc.300.1656667503588;
        Fri, 01 Jul 2022 02:25:03 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a151300b006a91da2fc8dsm17788281qkk.0.2022.07.01.02.25.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 02:25:03 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id p136so3035305ybg.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 02:25:03 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr14162555ybq.543.1656667502875; Fri, 01
 Jul 2022 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220628173947.91519-1-phil.edworthy@renesas.com>
 <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com> <TYYPR01MB70866C84A8007E329741B9A5F5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70866C84A8007E329741B9A5F5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jul 2022 11:24:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVab5N1hH_mz4txZomHkMb_naaWB5_Lf2TZnmS5kvk_QA@mail.gmail.com>
Message-ID: <CAMuHMdVab5N1hH_mz4txZomHkMb_naaWB5_Lf2TZnmS5kvk_QA@mail.gmail.com>
Subject: Re: [RFC] soc: renesas: Add RZ/V2M SYS driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Fri, Jul 1, 2022 at 11:15 AM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 01 July 2022 09:37 Geert Uytterhoeven wrote:
> > On Tue, Jun 28, 2022 at 7:40 PM Phil Edworthy wrote:
> > > The System Configuration (SYS) module on the Renesas RZ/V2M (r9a09g011)
> > > contains registers for many different aspects of the SoC.
> > >
> > > Some of the peripherals on the SoC are only 32-bit address capable bus
> > > masters. To select the lower 4GiB or upper 4GiB of memory, the
> > > SYS PERI0_BANK and SYS_PERI1_BANK registers can be programmed to set
> > > the 33rd address bit.
> > > Due to the use of firmware with the SoC, uboot is often set up such that
> > > these peripherals can only access the upper 4GiB. In order to allow
> > > Linux to use bounce buffers for drivers, we set aside some memory in the
> > > lower 4GiB for Linux.
> > > Thus this requires the SYS PERIx_BANK registers to be reprogrammed.
> >
> > Does this interfere with the firmware?
> > If yes, why is this not bad?
> > If not, why can't U-Boot set this up correctly for Linux?
> Yes, there is potentially a problem with the firmware trying to write to
> the registers at the same time. It’s unlikely, but possible.

I'm mainly worried about the firmware relying on the u-boot settings,
and using the devices?  But I guess that won't happen, if they're assigned
to Linux?

> You make a very good point about U-Boot setting it correctly.

Typically things like this are supposed to be handled by U-Boot,
in a correct way.

> > As most RAM available to Linux is in the upper 4 GiB, wouldn't it be
> > better to use the upper 4 GiB, so bounce buffer can be avoided for most
> > transfers? Or is it impossible to set up bounce buffers in the upper 4
> > GiB?
>
> Avoiding bounce buffers would be best. I guess I have been guilty of
> trying to ease my work as some drivers need non-trivial changes. In
> particular, the usb xhci driver.
>
> Perhaps we can continue development for the time being with U-Boot
> setting the bank addr registers so the peripherals access the lower
> 4GiB and give Linux some mem in the lower 4GiB for bounce buffers.
>
> Can we look at making the drivers use the higher 4GiB later on?

Sure.

> > > --- /dev/null
> > > +++ b/drivers/soc/renesas/r9a09g011-sys.c
> > > @@ -0,0 +1,67 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Renesas RZ/V2M SYS driver
> > > + *
> > > + * Copyright (C) 2022  Renesas Electronics Corporation
> > > + */
> > > +
> > > +#include <linux/io.h>
> > > +#include <linux/of_address.h>
> > > +
> > > +#define SYS_PERI0_BANK         0x30
> > > +#define SDI0_SHIFT             0
> > > +#define SDI1_SHIFT             2
> > > +#define EMMC_SHIFT             4
> > > +#define USB_HOST_SHIFT         8
> > > +#define USB_PERI_SHIFT         10
> > > +#define PCIE_SHIFT             12
> > > +
> > > +#define SYS_PERI1_BANK         0x34
> > > +#define ETH_SHIFT              0
> >
> > These fields look like perfect users of GENMASK() and FIELD_PREP().
>
> Another macro I am not familiar with! Thanks for pointing it out.

> > > +static void write_peri_bank(void __iomem *addr, uint32_t val, int
> > shift)
> > > +{
> > > +       /* Set the write enable bits */
> > > +       writel(((3 << 16) | val) << shift, addr);
> >
> > writel((field << 16) | FIELD_PREP(field, addr_high), addr)?

Oops, this won't work, as FIELD_PREP() needs a compile-time constant.
Of course you can still pass the result of FIELD_PREP() as a parameter
to the function instead.

Or push for "[PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
helpers"[1] ;-)  Or open code the proposed field_prep().

[1] https://lore.kernel.org/all/3a54a6703879d10f08cf0275a2a69297ebd2b1d4.1637592133.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
