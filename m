Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF50B4695DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243278AbhLFMqS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:46:18 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:34322 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243223AbhLFMqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:46:16 -0500
Received: by mail-ua1-f51.google.com with SMTP id n6so19274474uak.1;
        Mon, 06 Dec 2021 04:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZinrwU3GhnnnOlksQsuvBgeRa1fK5jzAPrFF7INP8Y=;
        b=2a3iLE3yNDC9W9BYnUDVeb2i3mY6aP+E9ZXXeOJ/6D0BgpV3LZm8AawVxhpoQ8PV/B
         H0sxch3Lj/5LAlI9NnhXCDVtNkT9zbIOLJXIPFtGByxMrbF/ltTnI4Awoi2hCJPEEUCS
         KFssu3Ec+4HrFIu356KyhvDQnJJOk+szML8eDrgKPc7+z7IeqCNAdrPpknyFQIx+FCC7
         M7rKzFHkFXEUaJ8N8ML+v6IOaUstgq/XUeIzPmFBWNoyJorPEQJ4Y+Tb50Jbrrg4pc4a
         h2ivR3zYj4LBR7SI2urYFJeF2G1FblGWiFaJ06xYBOi1J/qOUEXy9MaYPA58hemEtoge
         AUXQ==
X-Gm-Message-State: AOAM532b/zMmpOfiKbtTiIjyA139hHJp6ZtwO9x3eC7N9o5sJYwI+xK5
        UY80vyao0yDujRx+ErHYpChH0/0Y2Hss3g==
X-Google-Smtp-Source: ABdhPJw7bLYxeSgnIlpLcBMb5ky5s4/7KUAs0AXcBVdn/UDhwZuutLMpGmhJv6h/NRLGEyq8Yt0NQg==
X-Received: by 2002:ab0:1566:: with SMTP id p35mr39787579uae.20.1638794566698;
        Mon, 06 Dec 2021 04:42:46 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id i24sm4094170vkk.5.2021.12.06.04.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 04:42:46 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id n6so19274337uak.1;
        Mon, 06 Dec 2021 04:42:46 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr39302663uai.89.1638794566075;
 Mon, 06 Dec 2021 04:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com> <20211201073308.1003945-9-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211201073308.1003945-9-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Dec 2021 13:42:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwYqDO2q=SYC=r299QB0TRgga4-ijDCdA7tordBw1OUg@mail.gmail.com>
Message-ID: <CAMuHMdXwYqDO2q=SYC=r299QB0TRgga4-ijDCdA7tordBw1OUg@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] clk: renesas: rcar-gen4-cpg: Introduce R-Car
 Gen4 CPG driver
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> According to the official website [1], the R-Car V3U SoC is based
> on the R-Car Gen4 architecture. So, introduce R-Car Gen4 CPG
> driver.
>
> [1]
> https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c

> +/*
> + * RPC Clocks
> + */
> +#define CPG_RPCCKCR 0x874

This is also defined in rcar-gen4-cpg.h, so I will drop it while applying.

> +

> --- /dev/null
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * R-Car Gen4 Clock Pulse Generator
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __CLK_RENESAS_RCAR_GEN4_CPG_H__
> +#define __CLK_RENESAS_RCAR_GEN4_CPG_H__
> +
> +enum rcar_gen4_clk_types {
> +       CLK_TYPE_GEN4_MAIN = CLK_TYPE_CUSTOM,
> +       CLK_TYPE_GEN4_PLL1,
> +       CLK_TYPE_GEN4_PLL2,
> +       CLK_TYPE_GEN4_PLL2X_3X, /* r8a779a0 only */
> +       CLK_TYPE_GEN4_PLL3,
> +       CLK_TYPE_GEN4_PLL5,
> +       CLK_TYPE_GEN4_PLL6,
> +       CLK_TYPE_GEN4_SDSRC,
> +       CLK_TYPE_GEN4_SDH,
> +       CLK_TYPE_GEN4_SD,
> +       CLK_TYPE_GEN4_MDSEL,    /* Select parent/divider using mode pin */
> +       CLK_TYPE_GEN4_Z,
> +       CLK_TYPE_GEN4_OSC,      /* OSC EXTAL predivider and fixed divider */
> +       CLK_TYPE_GEN4_RPCSRC,
> +       CLK_TYPE_GEN4_RPC,
> +       CLK_TYPE_GEN4_RPCD2,
> +
> +       /* SoC specific definitions start here */
> +       CLK_TYPE_GEN4_SOC_BASE,
> +};
> +
> +#define DEF_GEN4_SDH(_name, _id, _parent, _offset)     \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_SDH, _parent, .offset = _offset)
> +
> +#define DEF_GEN4_SD(_name, _id, _parent, _offset)      \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_SD, _parent, .offset = _offset)
> +
> +#define DEF_GEN4_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_MDSEL,       \
> +                (_parent0) << 16 | (_parent1),         \
> +                .div = (_div0) << 16 | (_div1), .offset = _md)
> +
> +#define DEF_GEN4_OSC(_name, _id, _parent, _div)                \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_OSC, _parent, .div = _div)
> +
> +#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)  \
> +       DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)

Is there any specific reason _type is not fixed to CLK_TYPE_GEN4_Z,
like before? Perhaps you have a future use-case in mind?

> +
> +struct rcar_gen4_cpg_pll_config {
> +       u8 extal_div;
> +       u8 pll1_mult;
> +       u8 pll1_div;
> +       u8 pll2_mult;
> +       u8 pll2_div;
> +       u8 pll3_mult;
> +       u8 pll3_div;
> +       u8 pll5_mult;
> +       u8 pll5_div;
> +       u8 pll6_mult;
> +       u8 pll6_div;
> +       u8 osc_prediv;
> +};
> +
> +#define CPG_RPCCKCR    0x874
> +#define SD0CKCR1       0x8a4

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17 when the above has been sorted
out.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
