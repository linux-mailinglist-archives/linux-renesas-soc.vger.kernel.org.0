Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567A83A2C62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 15:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhFJNGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 09:06:13 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:42508 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbhFJNGI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 09:06:08 -0400
Received: by mail-ua1-f50.google.com with SMTP id w5so1237521uaq.9;
        Thu, 10 Jun 2021 06:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pUUwNqNN82W1ihF2ghw7jgMxa3/+NRGjbN4axcAWxJg=;
        b=se1YOumDSKFqJbbaVwxgdM0CWbzfx9GiJDY/5awzaxRaxcEGYuAaM3IbgLw1++jOb/
         bPId9EhBmjad/fn1Siyw6+x3/Aivd/QIgJ8938Fr/7VXCRQFRSwZ2uoP1uJenHOoTMmk
         yBflyw6O9wF+2BMO3DVInEpUs2dDnI5PEzUhW0Ky3GdfHukL/rILTqGsqfyyvkmNepPI
         YYQ5A5OawuTYzvN2NBP9FYRDF6hQCyTtHbMtayoriRFC8fIrZQEXHO7d/vWbrSs8De2d
         1doJost8kmOgZVdEzUixG7H5S539g8VEv+gklHUAH4qkMQhSy8cEebPzm8OBH1tT+LGb
         lCfQ==
X-Gm-Message-State: AOAM531ENOMau2lKoT5/HB2m2NVpY7lWXgELNmuw6ecrN1+lhrajuVTX
        V2TVl/PLJ2BtDp1GQrPg7AavDQa+wVf2kiiCVDLZNE2rOSA=
X-Google-Smtp-Source: ABdhPJz4PaA6C9tFtb80kykQ4hMeQVD5xTTHJTOT1fvl6ZdQFfj3lut3BvF8OcP9Rr73eE9Ua/JW9NO8fOGR1VoESz0=
X-Received: by 2002:ab0:b09:: with SMTP id b9mr4181097uak.58.1623330239898;
 Thu, 10 Jun 2021 06:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609153230.6967-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609153230.6967-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 15:03:48 +0200
Message-ID: <CAMuHMdXR0y7d2hRi35YsTT2rdOtRzFirGwbVnbUVO2d3yV=mwg@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 9, 2021 at 5:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add CPG core wrapper for RZ/G2L family.
>
> Based on a patch in the BSP by Binh Nguyen
> <binh.nguyen.jz@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -182,6 +182,11 @@ config CLK_RCAR_USB2_CLOCK_SEL
>         help
>           This is a driver for R-Car USB2 clock selector
>
> +config CLK_RZG2L
> +       bool "Renesas RZ/G2L SoC clock support" if COMPILE_TEST && !ARCH_RENESAS

s/SoC/family/?

I think "if COMPILE_TEST", as all other entries are using, is sufficient.

> +       depends on ARCH_RENESAS || COMPILE_TEST

I think this can be dropped.

> +       select RESET_CONTROLLER
> +
>  # Generic

> --- /dev/null
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c

> +static struct clk
> +*rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> +                              void *data)
> +{
> +       unsigned int clkidx = clkspec->args[1];
> +       struct rzg2l_cpg_priv *priv = data;
> +       struct device *dev = priv->dev;
> +       const char *type;
> +       struct clk *clk;
> +
> +       switch (clkspec->args[0]) {
> +       case CPG_CORE:
> +               type = "core";
> +               if (clkidx > priv->last_dt_core_clk) {
> +                       dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               clk = priv->clks[clkidx];
> +               break;
> +
> +       case CPG_MOD:
> +               type = "module";
> +               if (clkidx > priv->num_core_clks + priv->num_mod_clks) {

The range of module clocks in DT specifiers starts at zero, so

    if (clkidx > priv->num_mod_clks) {


> +                       dev_err(dev, "Invalid %s clock index %u\n", type,
> +                               clkidx);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +               clk = priv->clks[priv->num_core_clks + clkidx];
> +               break;
> +
> +       default:
> +               dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (IS_ERR(clk))
> +               dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> +                       PTR_ERR(clk));
> +       else
> +               dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> +                       clkspec->args[0], clkspec->args[1], clk,
> +                       clk_get_rate(clk));
> +       return clk;
> +}

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I can fix these while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
