Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C724DDBB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 15:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbiCROce convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 10:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237314AbiCROce (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 10:32:34 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE9A90FE2;
        Fri, 18 Mar 2022 07:31:14 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id jq9so6615143qvb.0;
        Fri, 18 Mar 2022 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jP9TvkuCSsb0OcWWPjFrD6QtbUKa4Jb9v30XMjZh+kg=;
        b=TMaXVuW/D8u7F/urs6gwwYH1V8xsd51cvqcsZqbLH7QS5+CKGJXKG5/PFekcT110fC
         HdFyLGuti9Ln50wRNUCsyiL2MAzJ8hh5BWV90vsAiivYaKbBdzCTM0Ipm08uEavQ9W/Z
         dbYHOMRovDmIkALtuVMidFoI+FZHmCN8BvG/hSrwBusVcJQWiMuS0hLppZuWFvAUuqJt
         CPG1OLKutkao/XVl22QRUgeOTM8VYcXnsFdOJQ2tk5H7Do+Bi9oQOST5WW+Ep+lSDtwG
         33KaxvFyQ2tCg9kkhogHKPFrXP1A9gt+uB8cGwHBkOmbRVZZEz/Y02h8p0gP/gmpXC64
         Pd/w==
X-Gm-Message-State: AOAM531oS7PMm+DpKkHAE531gQPplrrvO7CZU3Q6Aycs5embP7a+Fqbu
        rSJGqluUSdVWrQK6W92oZbJpwL3Eva3QA++A
X-Google-Smtp-Source: ABdhPJxoNfgq8RJ2DHdgHLMX38/LpKVR8D511qlFlcKFext/8hjpeR8EICeMQpB9tqVPBz6+sHR9zA==
X-Received: by 2002:ad4:594e:0:b0:441:4d5:6a62 with SMTP id eo14-20020ad4594e000000b0044104d56a62mr1237883qvb.110.1647613872718;
        Fri, 18 Mar 2022 07:31:12 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id f18-20020a05622a105200b002e1eb06ece3sm5383091qte.31.2022.03.18.07.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 07:31:12 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id v35so16108650ybi.10;
        Fri, 18 Mar 2022 07:31:12 -0700 (PDT)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr10480438ybn.6.1647613871770; Fri, 18
 Mar 2022 07:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220314220012.218731-1-marek.vasut@gmail.com>
In-Reply-To: <20220314220012.218731-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 15:31:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5xqr4tVJefg7shTgtxMe+h8YrHrGdgkcgx5sCbuAjiA@mail.gmail.com>
Message-ID: <CAMuHMdU5xqr4tVJefg7shTgtxMe+h8YrHrGdgkcgx5sCbuAjiA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a7795: Add ZG clocks
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Marek,

On Mon, Mar 14, 2022 at 11:00 PM <marek.vasut@gmail.com> wrote:
> This patch adds ZG clocks used by the PowerVR GPU.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -83,6 +83,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>         /* Core Clock Outputs */
>         DEF_GEN3_Z("z",         R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
>         DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
> +       DEF_GEN3_Z("zg",        R8A7795_CLK_ZG,    CLK_TYPE_GEN3_Z,  CLK_PLL4, 2, 0),

The "2" is not correct: /sys/kernel/debug/clk/clk_summary should tell
you it is running at 1200 MHz instead of 600 MHz.  The correct value
is "4", as PLL4 is divided by 4 and by the ZG/3DGE divider, cfr. the
documentation for the PLL4CR.STC6 field.

The "0" is also not correct, as it refers to the bit field starting
in the FRQCRC register starting at bit 0, which is not the ZG but
the Z2 divider, cfr. the line above.
The actual ZG divider field was never documented, and the documentation
states the divider is fixed[1].  However, the BSP assumes the field
does exist, and is located in the FRQCRB register[2], starting at
bit 24[3].

Older BSP versions assumed a fixed clock[4].

What do we do? Follow the current BSP, or the documentation?
Do you have a use case for changing the divider to lower\
the ZG clock rate?
Note that we do not need to change the divider to increase the ZG
clock rate to 700 MHz for High Performance mode on R-Car M3-W/W+/N,
as that would be done by making PLL4 configurable, cfr. PLL0 and PLL2.

>         DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
>         DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
>         DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
> @@ -129,6 +130,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>  };
>
>  static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
> +       DEF_MOD("3dge",                  112,   R8A7795_CLK_ZG),
>         DEF_MOD("fdp1-2",                117,   R8A7795_CLK_S2D1), /* ES1.x */
>         DEF_MOD("fdp1-1",                118,   R8A7795_CLK_S0D1),
>         DEF_MOD("fdp1-0",                119,   R8A7795_CLK_S0D1),

This part looks good to me.

The same comments apply to patches 2/3 and 3/3 of this series.

[1] Section 8.3.1 ("Changing Frequency"): "R-Car H3, R-Car H3-N, R-Car
M3-W, R-Car M3-W+, and R-Car M3-N do not support to change division
ratio of ZGϕ."
[2] https://github.com/renesas-rcar/linux-bsp/blob/rcar-5.1.4/drivers/clk/renesas/rcar-gen3-cpg.c#L365
[3] https://github.com/renesas-rcar/linux-bsp/blob/rcar-5.1.4/drivers/clk/renesas/r8a7795-cpg-mssr.c#L86
[4] https://github.com/renesas-rcar/linux-bsp/blob/rcar-3.5.3/drivers/clk/renesas/r8a7795-cpg-mssr.c#L80

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
