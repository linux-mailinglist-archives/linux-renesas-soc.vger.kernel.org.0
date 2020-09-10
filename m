Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311D52646CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 15:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgIJNVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 09:21:19 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34663 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730165AbgIJNUB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:20:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id h17so5337191otr.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2020 06:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ezUMqj6me3w7/jRr0vGTNgphE2EVllUuLWM7Dd1dpH0=;
        b=MpV8Oqid0JCPClNYUgO1pnR6jDxIW4ZkHB1WEQnT6sMKS7JMqsUmUQX+7ZnG4Xwp0h
         1Ha6JCkFosYeolRfhQpM9bfI2onUXrThM+M7xufRtMbrrbn7W9vDA3Dr2Yu6bkR744ss
         7sam50nFQRSDedgc5IL1bvAr6TqpHO/kWWJoXTpRCbeyFxOUq3ZrYGukXB8cTDGwxMc7
         woxJlMRe4W+4f1jyFKQs/ctREaSw5O7/0gbL/5hlA2/hPXiWFSRT4uPaN/pptVx+uFMa
         H+IsLdcvciRdnroEMTnnVET+9KKg0mVQlr8WDjt/jHKL0Rg51S6HSGf4sKHae8ldOih9
         ZgWA==
X-Gm-Message-State: AOAM53050ZTeVNYGiz+KW75Ci0pEljas42C6WMLkqmK6Jh7i3owIZzIL
        s5a68xWtgYMjQgPRAwt7pQ6bSN0RWyfUil5fzag=
X-Google-Smtp-Source: ABdhPJwOS3kfnr2bbi2N4VYf4snGT/qSb1y4iKRFVKJcqwD4QMzIj1faS2qvbTrtkIDjAFBalNe3OUkziWuSTN3Hm9w=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr789208oth.145.1599744000910;
 Thu, 10 Sep 2020 06:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599657211-17504-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:19:49 +0200
Message-ID: <CAMuHMdVSCr4UK1SZORcmhN0xy-OFw4D3g=CvPLvD0+DNFCu7qQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: cpg-mssr: Add support for R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 9, 2020 at 3:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car V3U (r8a779a0), including core, module
> clocks and register access, because register specification differs
> from R-Car Gen2/3.
>
> Inspired by patches in the BSP by LUU HOAI.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c

> +#define CPG_PLL20CR            0x0834
> +#define CPG_PLL21CR            0x0838
> +#define CPG_PLL30CR            0x083c
> +#define CPG_PLL31CR            0x0840
> +
> +static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal",  CLK_EXTAL),
> +       DEF_INPUT("extalr", CLK_EXTALR),
> +
> +       /* Internal Core Clocks */
> +       DEF_BASE(".main", CLK_MAIN,     CLK_TYPE_R8A779A0_MAIN, CLK_EXTAL),
> +       DEF_BASE(".pll1", CLK_PLL1,     CLK_TYPE_R8A779A0_PLL1, CLK_MAIN),
> +       DEF_BASE(".pll5", CLK_PLL5,     CLK_TYPE_R8A779A0_PLL5, CLK_MAIN),
> +       DEF_PLL(".pll20", CLK_PLL20,    CPG_PLL20CR),
> +       DEF_PLL(".pll21", CLK_PLL21,    CPG_PLL21CR),
> +       DEF_PLL(".pll30", CLK_PLL30,    CPG_PLL30CR),
> +       DEF_PLL(".pll31", CLK_PLL31,    CPG_PLL31CR),

Given the users of the DEF_GEN3_SD() and DEF_DIV6P1() just hardcode the
register offsets, and the CPG_PLL*CR are used in a single place only,
perhaps it makes sense to hardcode the offsets here, too, and drop the
defines?

   [...]

> +       DEF_DIV6P1("mso",       R8A779A0_CLK_MSO,       CLK_PLL5_DIV4,  0x87c),
> +       DEF_DIV6P1("canfd",     R8A779A0_CLK_CANFD,     CLK_PLL5_DIV4,  0x878),
> +       DEF_DIV6P1("csi0",      R8A779A0_CLK_CSI0,      CLK_PLL5_DIV4,  0x880),

> +/*
> + * CPG Clock Data
> + */
> +/*
> + *   MD         EXTAL          PLL1    PLL20   PLL30   PLL4    PLL5    PLL6    OSC
> + * 14 13 (MHz)                    21      31
> + * --------------------------------------------------------
> + * 0  0         16.66 x 1      x128    x216    x128    x144    x192    x128    /16
> + * 0  1         20    x 1      x106    x180    x106    x120    x160    x106    /19
> + * 1  0         Prohibited setting
> + * 1  1         33.33 / 2      x128    x216    x128    x144    x192    x128    /32

Please drop the PLL6 column, as PLL6 doesn't really exist.

> + */

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -57,6 +57,11 @@ static const u16 mstpsr[] = {
>         0x9A0, 0x9A4, 0x9A8, 0x9AC,
>  };
>
> +static const u16 mstpsr_for_v3u[] = {
> +       0x2E00, 0x2E04, 0x2E08, 0x2E0C, 0x2E10, 0x2E14, 0x2E18, 0x2E1C,
> +       0x2E20, 0x2E24, 0x2E28, 0x2E2C, 0x2E30, 0x2E34, 0x2E38,
> +};
> +
>  /*
>   * System Module Stop Control Register offsets
>   */
> @@ -66,6 +71,11 @@ static const u16 smstpcr[] = {
>         0x990, 0x994, 0x998, 0x99C,
>  };
>
> +static const u16 mstpcr_for_v3u[] = {
> +       0x2D00, 0x2D04, 0x2D08, 0x2D0C, 0x2D10, 0x2D14, 0x2D18, 0x2D1C,
> +       0x2D20, 0x2D24, 0x2D28, 0x2D2C, 0x2D30, 0x2D34, 0x2D38,
> +};

> @@ -939,6 +955,9 @@ static int __init cpg_mssr_common_init(struct device *dev,
>                 priv->control_regs = smstpcr;
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
>                 priv->control_regs = stbcr;
> +       } else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_V3U) {
> +               priv->status_regs = mstpsr_for_v3u;
> +               priv->control_regs = mstpcr_for_v3u;

Missing arrays for V3U-specific srcr and srstclr.

>         } else {
>                 error = -EINVAL;
>                 goto out_err;

The rest looks good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
