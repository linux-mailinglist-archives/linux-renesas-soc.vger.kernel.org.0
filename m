Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B740C7B790A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Oct 2023 09:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241572AbjJDHu2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 03:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbjJDHu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 03:50:27 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D6BA1;
        Wed,  4 Oct 2023 00:50:22 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d8168d08bebso1888426276.0;
        Wed, 04 Oct 2023 00:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696405821; x=1697010621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZrLUdUKNaqNRMGoDoXzKiAU93eO3LpyHUjLsr6Emu0=;
        b=O6XqHrmsm4sCwXzbfxacYGN+M7ncFCuw2ZrQ6AsZ4EwrZlbnIav4GltV5+hSs75ltC
         JFDOri0r2RBl+R6BK05TikjdUSOAyLAemcwZ/SdFHKByQndy/KbaydplijIiSpNb29JA
         wM+OMjWckAL2HYmj+TRlBapZ2SDZI6UrEGoJVKzyxyDOxd8fxIntu82u69xVdNnpHCox
         DbDRRu6LnxQxPNyaw0h3BGtQVIvKvh9efKQOmYDxLxL7nSVEUsXC4+EeLcKa9oMv3q67
         eNMSaDnMybRJNcGSkX15h8AKgL1kQQCJ0Pmtfd1OJKmZWruEeyGkUt8l6nMiUQdo8AII
         0LHg==
X-Gm-Message-State: AOJu0YzJijS4V5E5kf/jbL1JhwxWKQXBR0w2ctWEh4zkovHlIEiJbdy3
        GAsEembvgUxtl20es1GfKD6czmlIasUYGw==
X-Google-Smtp-Source: AGHT+IHX+cU5ArLOrmKiRqAhThtZ3/dnMBnkV0nj8mS4KtoE9J5Tl1Rc9y4+HOrkVAFb4bjintaaeA==
X-Received: by 2002:a25:8204:0:b0:cec:81af:cf92 with SMTP id q4-20020a258204000000b00cec81afcf92mr1347863ybk.36.1696405821456;
        Wed, 04 Oct 2023 00:50:21 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id w7-20020a05690202c700b00d7ba4c5e31fsm884597ybh.39.2023.10.04.00.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 00:50:21 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f1dff5298so22031357b3.3;
        Wed, 04 Oct 2023 00:50:21 -0700 (PDT)
X-Received: by 2002:a81:5bd5:0:b0:58a:83cd:115d with SMTP id
 p204-20020a815bd5000000b0058a83cd115dmr1449846ywb.50.1696405820988; Wed, 04
 Oct 2023 00:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231004064220.31452-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231004064220.31452-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Oct 2023 09:50:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXageyQyqaGXJbmmpcKyjoO-VHWGzGk_WJ1YsAne+iiSw@mail.gmail.com>
Message-ID: <CAMuHMdXageyQyqaGXJbmmpcKyjoO-VHWGzGk_WJ1YsAne+iiSw@mail.gmail.com>
Subject: Re: [PATCH] clk: vc3: Use clamp() instead of min_t()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Wed, Oct 4, 2023 at 8:42 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The min_t() is often used as a shortcut for clamp(). Secondly, the
> BIT(16) - 1 is specifically used as the value related to the bits in the
> hardware and u16 is a software type that coincidentally has the same
> maximum as the above mentioned bitfield.

Technically it is two byte-sized registers forming a 16-bit field ;-)

> Replace min_t()->clamp() in vc3_pll_round_rate().
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/clk-versaclock3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
> index 3d7de355f8f6..50772f61096f 100644
> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -402,7 +402,7 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>                 div_frc = rate % *parent_rate;
>                 div_frc *= BIT(16) - 1;
>
> -               vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
> +               vc3->div_frc = clamp(div64_ul(div_frc, *parent_rate), 0, BIT(16) - 1);

I'm not sure this is actually an improvement...

While I agree "BIT(16) - 1" matches the expression two lines above,
I find it harder to read.
Perhaps introducing a VC3_PLL2_FB_FRC_DIV_MAX definition may help.
BTW, if the hardware wouldn't use two byte-sized registers, but a real
bitifield, one could use FIELD_GET(mask, mask) instead.

Second, clamping an unsigned value to zero is futile, and opens us to
warnings like:

    warning: comparison of unsigned expression in ‘>= 0’ is always
true [-Wtype-limits]

>                 rate = (*parent_rate *
>                         (vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);
>         } else {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
