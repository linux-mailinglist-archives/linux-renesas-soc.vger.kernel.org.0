Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307B0392D85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 14:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbhE0MG0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 08:06:26 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:35737 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234540AbhE0MG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 08:06:26 -0400
Received: by mail-vs1-f48.google.com with SMTP id x22so236297vsn.2;
        Thu, 27 May 2021 05:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uh4zzMKY6luxk0/SSNclejeRcmWG2GmwP9Z21NWThdc=;
        b=asW3k569xrt+g9/xBoM3MSOxqw+0cWd14K6oi1Wl3YNxZqS2q569Pga0JdbTa25w21
         YcodyfhNLPuUtzEsspO1dbMv9TQ/kSEiQsa6qxVvV6goaponRUkXg02xR52X/kVxsiyU
         K5Li9uInR0M/PFGYPWdS97hK7SiVmx+juwkLizPeV/wjMBXbE1NqKngzY+spnqldSMCm
         gs7qmUv72ybHsCFZrLFGcls1TBgCerkPb0bBf0kd0efe8ZwwoYuan5AbBmFacKIgHXoj
         jYwWiS7230iEH2sJBTRFjbgbBtz5KXtrli8LOsxIl0+GJDxcXFZ6/Ugbbw8PuLSnaTBn
         Vqbg==
X-Gm-Message-State: AOAM530c6j/Y4vJLigg2kcF7oxi9XuwzzLtQRQdYcZQtr0SoSdfDf8c6
        OyHzPaaa1lXWbOQKtQp4TPC6uRa/3Bvz0XDOtBU=
X-Google-Smtp-Source: ABdhPJzBFvcXREuBIQYuRn70o9fXD4fkLjhIMPBlK3HLIgpWiKiyIy29QjGBrmD2cFoYRf6BqEL19Uz/PEFSKm9Yabc=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr1556875vsq.40.1622117091488;
 Thu, 27 May 2021 05:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 14:04:39 +0200
Message-ID: <CAMuHMdXd==dM2QJN5gg0ka_7-HDQbeKZK66nmyASFJAnsVsSQA@mail.gmail.com>
Subject: Re: [PATCH 13/16] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add CPG core wrapper for RZ/G2L family.
>
> Based on a patch in the BSP by Binh Nguyen
> <binh.nguyen.jz@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- /dev/null
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c

> +static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
> +{
> +       struct mstp_clock *clock = to_mod_clock(hw);
> +       struct cpg_mssr_priv *priv = clock->priv;
> +       unsigned int reg = MSSR_OFF(clock->bit) * 4;

The "* 4" here makes it difficult to review the module clock tables.

E.g.

       DEF_MOD("gic",          R9A07G044_CLK_GIC600,
                               R9A07G044_CLK_P1,
                               MSSR(5, BIT(0), (BIT(0) | BIT(1)))),

The "5" means the CLK_ON_GIC600 register is at offset CLK_ON_R(5 * 4)
 = 0x514.  Removing the "* 4" means you could use
"MSSR(0x14, BIT(0), (BIT(0) | BIT(1))" instead.

Unless it has unpleasant side effects, I'd even consider putting
the full CLK_ON offset there, i.e.
"MSSR(0x514, BIT(0), (BIT(0) | BIT(1))" and change the macros like:

    #define CLK_ON_R(reg)          (reg)
    #define CLK_MON_R(reg)         (0x680 - 0x500 + (reg))

> --- /dev/null
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h

> +#define CLK_ON_R(reg)          (0x500 + reg)
> +#define CLK_MON_R(reg)         (0x680 + reg)
> +#define CLK_RST_R(reg)         (0x800 + reg)
> +#define CLK_MRST_R(reg)                (0x980 + reg)

The last three don't seem to be documented?


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
