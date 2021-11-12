Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4887844E797
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbhKLNnm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:43:42 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:37773 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbhKLNnm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:43:42 -0500
Received: by mail-ua1-f54.google.com with SMTP id l43so18875682uad.4;
        Fri, 12 Nov 2021 05:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7sZAmLBIGZWe3jCH7XC+K7+dfSJpViCOkZv6jZzhTEE=;
        b=P8ERwmKbOunsNx/JHQhzLLCMnzFduCWS4JqHoijG5QAOmCfEiUBrThCjP2b6adA9XN
         0Dol4OvlTXU9ouhs+dGkfHpuflBUnX+rb/6qFgw2OiS2jQ9GpXUcRf5TePKeDa45jcUh
         nlv+N50wEX7APKlCKZVFii06TXW/E4xtP4hA+1gGCy+/j6TQnwQxXIna7ntGgvs/+s16
         7SGR/+o4efmSn86Xx3RiFvj6SxuuVLlWsAJtPauE7tKbl/6+g4KhJel4LhM5Nuh8NhLS
         A92a9OTeB+lbOuR0+za3FFi/KGxHq6uym9jDN7o1Pi6mCus87P7IaAea+Ny/nva6LlPE
         L7yA==
X-Gm-Message-State: AOAM530nsayiYGidyzOTD5lv2+GO6fT87FefBoItTgO/ZDVz9QdnusW+
        AivKCuaYuITl59H2kJZy7Tei3VKflmTwDg==
X-Google-Smtp-Source: ABdhPJzOs4A37a7U7yWZTWttTQk0o6Md4Dlq9wchiZvAA4RLKK0/Tqi71htPUIjZ2CebdS/AFXdyOw==
X-Received: by 2002:a67:c11c:: with SMTP id d28mr10489717vsj.54.1636724450902;
        Fri, 12 Nov 2021 05:40:50 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id t1sm3952219vkl.56.2021.11.12.05.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:40:50 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id ay21so18814218uab.12;
        Fri, 12 Nov 2021 05:40:49 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr18174697uar.14.1636724449074;
 Fri, 12 Nov 2021 05:40:49 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:40:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK_rPAR_SMVxM7bZ8S7=Ww-1FQ2HWoxmv7LhW22QOMCA@mail.gmail.com>
Message-ID: <CAMuHMdUK_rPAR_SMVxM7bZ8S7=Ww-1FQ2HWoxmv7LhW22QOMCA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/21] clk: renesas: r8a779a0: add SDnH clock to V3U
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently a pass-through clock but we will make it a real divider clock
> in the next patches.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since RFC v1:
> * added tag from Geert
>
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> index f16d125ca009..fb7f0cf2654a 100644
> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -33,6 +33,7 @@ enum rcar_r8a779a0_clk_types {
>         CLK_TYPE_R8A779A0_PLL1,
>         CLK_TYPE_R8A779A0_PLL2X_3X,     /* PLL[23][01] */
>         CLK_TYPE_R8A779A0_PLL5,
> +       CLK_TYPE_R8A779A0_SDH,
>         CLK_TYPE_R8A779A0_SD,
>         CLK_TYPE_R8A779A0_MDSEL,        /* Select parent/divider using mode pin */
>         CLK_TYPE_R8A779A0_OSC,  /* OSC EXTAL predivider and fixed divider */
> @@ -84,6 +85,9 @@ enum clk_ids {
>         DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
>                  .offset = _offset)
>
> +#define DEF_SDH(_name, _id, _parent, _offset)   \
> +       DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SDH, _parent, .offset = _offset)
> +
>  #define DEF_SD(_name, _id, _parent, _offset)   \
>         DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SD, _parent, .offset = _offset)
>
> @@ -145,7 +149,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
>         DEF_FIXED("cp",         R8A779A0_CLK_CP,        CLK_EXTAL,      2, 1),
>         DEF_FIXED("cl16mck",    R8A779A0_CLK_CL16MCK,   CLK_PLL1_DIV2,  64, 1),
>
> -       DEF_SD("sd0",           R8A779A0_CLK_SD0,       CLK_SDSRC,      0x870),
> +       DEF_SDH("sdh0",         R8A779A0_CLK_SD0H,      CLK_SDSRC,         0x870),
> +       DEF_SD( "sd0",          R8A779A0_CLK_SD0,       R8A779A0_CLK_SD0H, 0x870),
>
>         DEF_DIV6P1("mso",       R8A779A0_CLK_MSO,       CLK_PLL5_DIV4,  0x87c),
>         DEF_DIV6P1("canfd",     R8A779A0_CLK_CANFD,     CLK_PLL5_DIV4,  0x878),
> @@ -293,6 +298,10 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
>                 div = cpg_pll_config->pll5_div;
>                 break;
>
> +       case CLK_TYPE_R8A779A0_SDH:
> +               return cpg_sdh_clk_register(core->name, base + core->offset,
> +                                          __clk_get_name(parent), notifiers);
> +
>         case CLK_TYPE_R8A779A0_SD:
>                 return cpg_sd_clk_register(core->name, base, core->offset,
>                                            __clk_get_name(parent), notifiers,
> --
> 2.30.2
