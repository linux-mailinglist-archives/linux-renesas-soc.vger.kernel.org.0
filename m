Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB10637436
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Nov 2022 09:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbiKXIka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Nov 2022 03:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiKXIkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2022 03:40:24 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C3D79E05;
        Thu, 24 Nov 2022 00:40:24 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id i12so597526qvs.2;
        Thu, 24 Nov 2022 00:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mHrJdqmIqTbAfjlnJ1O6QyoDPtWi7jgY+Jyky+p5yk=;
        b=hjivPxAliNrh4GnjwB0ln+bw5xT9l2xjN6M6hCiVcAmf/cI+U34Ee9fVp7Wqrvvhsa
         ShrFcCLN+ww7t4KSKErAkPLzQRwclG8mUq3AUcrvZgTN0nwEJ/hrxhktUVuUNXisB1BF
         dtysfoHmr3EcfEOTnTNkubt4+YEaytrTbRvJU6L3+ARryiSxFD4cKzk6jvSIWEqQWgLn
         dxNVQ6PRGXKW8ix189FwFa78iMc2vQ/nE14bWI/cVIqVde0nDjwW4JTW7ACuedzuCWsA
         YiVCPYrojStksNCXS/C7LMRRLILtW88nxxrml/hI5fTUzuATEpwEnlNMG4HfFajsFlms
         y1vw==
X-Gm-Message-State: ANoB5ply6CkNtS52g9ypgE24fHzCWtKuv9OKUyhD4VOeCtxrHsTMoAg7
        rs5m3oft8EvUF3lAYWDpAk9Afz+/GWLdfQ==
X-Google-Smtp-Source: AA0mqf5vNnaOuQn/oE4jWlNJHewrVqOot9Pfjhm9xn7ifryICwLmC8c2WUDi+rpEsweutIlNM+DOTA==
X-Received: by 2002:a0c:ec4a:0:b0:4bb:c9fc:cae5 with SMTP id n10-20020a0cec4a000000b004bbc9fccae5mr12800092qvq.1.1669279223091;
        Thu, 24 Nov 2022 00:40:23 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id f17-20020ac84711000000b003a6328ee7acsm278138qtp.87.2022.11.24.00.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:40:22 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id y83so1054276yby.12;
        Thu, 24 Nov 2022 00:40:22 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr11765047ybp.202.1669279221988; Thu, 24
 Nov 2022 00:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20221118131641.469238-1-biju.das.jz@bp.renesas.com> <20221118131641.469238-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221118131641.469238-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Nov 2022 09:40:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWONMvHeShCK76_2G0FiYKsqTO57kKOhG0nN1Sb09+6YQ@mail.gmail.com>
Message-ID: <CAMuHMdWONMvHeShCK76_2G0FiYKsqTO57kKOhG0nN1Sb09+6YQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g011: Add PWM clock entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Fri, Nov 18, 2022 at 2:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The PWM IP on the RZ/V2M comes with 16 channels, but the ISP has
> full control of channels 0 to 7, and channel 15, therefore Linux
> is only allowed to use channels 8 to 14.
>
> The PWM channel 15 shares apb clock and reset with PWM{8..14}.
> The reset is deasserted by the bootloader/ISP.

Shouldn't you add the reset anyway, but make sure it stays deasserted
by increasing its refcount, cfr. critical clocks?

> Add PWM{8..14} clocks to CPG driver and mark apb clock as
> critical clock, so that the apb clock will be always on.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/r9a09g011-cpg.c
> +++ b/drivers/clk/renesas/r9a09g011-cpg.c
> @@ -136,6 +136,14 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
>         DEF_MOD("iic_pclk1",    R9A09G011_IIC_PCLK1,     CLK_SEL_E,    0x424, 12),
>         DEF_MOD("wdt0_pclk",    R9A09G011_WDT0_PCLK,     CLK_SEL_E,    0x428, 12),
>         DEF_MOD("wdt0_clk",     R9A09G011_WDT0_CLK,      CLK_MAIN,     0x428, 13),
> +       DEF_MOD("pwm8_15_pclk", R9A09G011_CPERI_GRPF_PCLK, CLK_SEL_E,  0x434, 0),

"cperi_grpf"?

> +       DEF_MOD("pwm8_clk",     R9A09G011_PWM8_CLK,      CLK_MAIN,     0x434, 4),
> +       DEF_MOD("pwm9_clk",     R9A09G011_PWM9_CLK,      CLK_MAIN,     0x434, 5),
> +       DEF_MOD("pwm10_clk",    R9A09G011_PWM10_CLK,     CLK_MAIN,     0x434, 6),
> +       DEF_MOD("pwm11_clk",    R9A09G011_PWM11_CLK,     CLK_MAIN,     0x434, 7),
> +       DEF_MOD("pwm12_clk",    R9A09G011_PWM12_CLK,     CLK_MAIN,     0x434, 8),
> +       DEF_MOD("pwm13_clk",    R9A09G011_PWM13_CLK,     CLK_MAIN,     0x434, 9),
> +       DEF_MOD("pwm14_clk",    R9A09G011_PWM14_CLK,     CLK_MAIN,     0x434, 10),
>         DEF_MOD("urt_pclk",     R9A09G011_URT_PCLK,      CLK_SEL_E,    0x438, 4),
>         DEF_MOD("urt0_clk",     R9A09G011_URT0_CLK,      CLK_SEL_W0,   0x438, 5),
>         DEF_MOD("ca53",         R9A09G011_CA53_CLK,      CLK_DIV_A,    0x448, 0),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
