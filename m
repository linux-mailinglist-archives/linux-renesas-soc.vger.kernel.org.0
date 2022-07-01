Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C998562E71
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 10:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiGAIhE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 04:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbiGAIhD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 04:37:03 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8810970E59
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:37:02 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id cs6so3524401qvb.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 01:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6xbP5PTiQoZS7m826Yo17/fn7Y0x0N2lgWgGZeXXEs=;
        b=tl/QDedkDjqZzuWyZMz3d+eMer5eHlrfmdA0E4/t7+BnJ4duhMRA7b+emppVTacpoG
         y5N9+J6Te0sMupuLWdqF5jyT8o2v+xQ9wXPxqfe5gxxGN7UJFjBRTGIr/iU2VsW81I0k
         2PX1uSkVlu0IUySV571rzoHrl6bz7MNQls6dS/UtenD1AhDC48tjVl7wXb1H4lkZznG7
         vw+e+fdnOOAJ4nKwlLLIiQpogbvwXc2i64jVvcWGMX6EAaGk5kIWu7Cm+tDS83ZPjNw8
         HmK49+oOam02vnlq/6FlAyeh3j4MLf2zvKuuXP5V/QdGr0WOf2MAVPTjWSQMoupvLjAN
         Sx6A==
X-Gm-Message-State: AJIora+eOFGFYLODHWvCfZtsBGLcEv44y9BELZG3ASFnDfgywhMpsYt9
        hxjbSwXA6quVzTnDkyA43VtZ/l3OS2wy4g==
X-Google-Smtp-Source: AGRyM1tzN+6UrkBg958nP7Ast+kYsDYW29iRcENDyR3TC2aRdNSBJYqRcDy4rEKAq//j8LkqkzlERQ==
X-Received: by 2002:ac8:4e56:0:b0:31d:38c0:b749 with SMTP id e22-20020ac84e56000000b0031d38c0b749mr1019933qtw.682.1656664621513;
        Fri, 01 Jul 2022 01:37:01 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id o4-20020ac87c44000000b003164efd0a5fsm2441551qtv.41.2022.07.01.01.37.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:37:01 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id r3so2834918ybr.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 01:37:01 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr14315948ybb.202.1656664620824; Fri, 01
 Jul 2022 01:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220628173947.91519-1-phil.edworthy@renesas.com>
In-Reply-To: <20220628173947.91519-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jul 2022 10:36:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com>
Message-ID: <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com>
Subject: Re: [RFC] soc: renesas: Add RZ/V2M SYS driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Thanks for your patch!

On Tue, Jun 28, 2022 at 7:40 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The System Configuration (SYS) module on the Renesas RZ/V2M (r9a09g011)
> contains registers for many different aspects of the SoC.
>
> Some of the peripherals on the SoC are only 32-bit address capable bus
> masters. To select the lower 4GiB or upper 4GiB of memory, the
> SYS PERI0_BANK and SYS_PERI1_BANK registers can be programmed to set
> the 33rd address bit.
> Due to the use of firmware with the SoC, uboot is often set up such that
> these peripherals can only access the upper 4GiB. In order to allow
> Linux to use bounce buffers for drivers, we set aside some memory in the
> lower 4GiB for Linux.
> Thus this requires the SYS PERIx_BANK registers to be reprogrammed.

Does this interfere with the firmware?
If yes, why is this not bad?
If not, why can't U-Boot set this up correctly for Linux?

As most RAM available to Linux is in the upper 4 GiB, wouldn't it be
better to use the upper 4 GiB, so bounce buffer can be avoided for most
transfers? Or is it impossible to set up bounce buffers in the upper 4 GiB?

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g011-sys.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2M SYS driver
> + *
> + * Copyright (C) 2022  Renesas Electronics Corporation
> + */
> +
> +#include <linux/io.h>
> +#include <linux/of_address.h>
> +
> +#define SYS_PERI0_BANK         0x30
> +#define SDI0_SHIFT             0
> +#define SDI1_SHIFT             2
> +#define EMMC_SHIFT             4
> +#define USB_HOST_SHIFT         8
> +#define USB_PERI_SHIFT         10
> +#define PCIE_SHIFT             12
> +
> +#define SYS_PERI1_BANK         0x34
> +#define ETH_SHIFT              0

These fields look like perfect users of GENMASK() and FIELD_PREP().

#define PERI0_SDI0    GENMASK(1, 0)

> +
> +#define BANK_LOWER_4GB         0
> +#define BANK_UPPER_4GB         1

I'm not sure these are useful.  The values are just the high
address bits.

> +
> +static const struct of_device_id renesas_socs[] __initconst = {
> +       { .compatible = "renesas,r9a09g011-sys" },
> +       { /* sentinel */ }
> +};
> +
> +static void write_peri_bank(void __iomem *addr, uint32_t val, int shift)
> +{
> +       /* Set the write enable bits */
> +       writel(((3 << 16) | val) << shift, addr);

writel((field << 16) | FIELD_PREP(field, addr_high), addr)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
