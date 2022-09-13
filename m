Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFA35B69F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 10:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiIMI6N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 04:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbiIMI6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 04:58:11 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90914AD5A;
        Tue, 13 Sep 2022 01:58:07 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id q8so8671344qvr.9;
        Tue, 13 Sep 2022 01:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NqfKDDpfP3wxZcuAPA1SqLUtXilWF/8jLyjHuXOtH7I=;
        b=huzbk8uUPHlIGw+YDNVkVwwaILWrkaxrxGJWzJSruHQoggJ8vYTcshu/UtgIXX2Srh
         whUWRdjPxAyTQqC+c4An+DATFD+ui939n6/TaeDNnnVaaU93HKZJ+RdfTYlV99Ai5Kq/
         KRT62stL2T7b3FGwnbneR4n1mMhH0Dc6RX6Bmm7R7LrFeopd9c8lYh+xS/SjIUSij/Ue
         gewfnaebEi0gWOY7fbiaPHRv2NC8hwtDnDqoi7FKIjLCr9041VoDsWVLjb885UVaz069
         nx08+H++ElyJMGCUuKiDFAORm2W/nWGSLpbG9VH4AQJJ1haHUUExmnLhmX+RZsBvd7Cj
         0bgw==
X-Gm-Message-State: ACgBeo0KqIrbVAlEd4j8KUPLca8ck1UL9T81paNwf+VPQoOMrahDU0Pk
        jHmVqy80AaJb4KYy7jkWRWIhrJa31y0mHFIF
X-Google-Smtp-Source: AA6agR6sm2lKY+JA3k5mlxAVz5J52+i9ijPZkTKPD4Y+WKA4rAAL23NMrA67YEhm1KyMI8npYpW1WA==
X-Received: by 2002:a05:6214:e88:b0:4ac:baf7:cdb3 with SMTP id hf8-20020a0562140e8800b004acbaf7cdb3mr5457292qvb.101.1663059486822;
        Tue, 13 Sep 2022 01:58:06 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id p13-20020ac8460d000000b003436103df40sm8030222qtn.8.2022.09.13.01.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 01:58:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3487d84e477so131507767b3.6;
        Tue, 13 Sep 2022 01:58:05 -0700 (PDT)
X-Received: by 2002:a81:4983:0:b0:345:20ee:589d with SMTP id
 w125-20020a814983000000b0034520ee589dmr25456140ywa.383.1663059485244; Tue, 13
 Sep 2022 01:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Sep 2022 09:57:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
Message-ID: <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
To:     biju.das.jz@bp.renesas.com
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

Hi Biju,

Thanks for your patch!

On Tue, Sep 13, 2022 at 9:44 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the HW manual (Rev.1.10 Apr, 2022) clock rate for 533MHz PLL2 and
> PLL3 clocks should be 533 MHz, but with current multiplier and divider
> values this resulted to 533.333333 MHz.
>
> This patch updates the multiplier and divider values for 533 MHz PLL2 and
> PLL3 clocks so that we get the exact (533 MHz) values.

Does this matter? Is there anything that doesn't work (well) because
of this?

> Fixes: 373bd6f487562e ("clk: renesas: r9a07g044: Add SDHI clock and reset entries")
> Fixes: f294a0ea9d12a6 ("clk: renesas: r9a07g044: Add clock and reset entries for SPI Multi I/O Bus Controller")
> Fixes: 31d5ef2f565d23 ("clk: renesas: r9a07g044: Add M4 Clock support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -113,10 +113,10 @@ static const struct {
>                 DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
>                 DEF_SAMPLL(".pll1", CLK_PLL1, CLK_EXTAL, PLL146_CONF(0)),
>                 DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
> -               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 1, 3),
> +               DEF_FIXED(".pll2_533", CLK_PLL2_533, CLK_PLL2, 533, 1600),

I highly doubt the actual hardware is not using a by-3 divider....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
