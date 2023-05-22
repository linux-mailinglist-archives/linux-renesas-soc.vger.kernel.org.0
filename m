Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB1470BEC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 14:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbjEVMw0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 08:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjEVMwZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 08:52:25 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF3892;
        Mon, 22 May 2023 05:52:24 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-561c1768bacso79771637b3.1;
        Mon, 22 May 2023 05:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759944; x=1687351944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctm1DKvTZj7hLz3AqtI5kCtrJBMKGOQ4SPUJ7xCGoy4=;
        b=dTCwPYtcaytWQcxB/rMV0F+GIlLm5lQb6PNVVWJE2PWA3MgZ1+SbiFDvITwSjQ70Nb
         kkopsI+uY+kccNoEbdisJpaXKZ7AkZygppAK+PnIf3qk3wEuxXb027H+Af93hXM6tMUb
         1X920E1CatniWEC5KWEUKpNDWKj0LpWOniRAmYYW3cjf227hmW7r1jYfUIQsVerBQ20B
         +rGVtdSC54XeXp304kV2x4IQOGCmviBx5iuKL3Hffe8F4sE4qAlTghAGs4I4A8Y0ohqd
         i26/TjcXuhypAoQcb6de0L7o8GTkuV18HEccwIlWRpC8QZrd23Oab9kvke5iymbwxVhs
         Op+w==
X-Gm-Message-State: AC+VfDy6jGmOeNo6OjLnjVlCTB29gXBGb9kx/sx+iH7GJbWUhKDFgQ95
        RrZDqIS4EaZl1VHP6EEzT4WvXSoGmkl38w==
X-Google-Smtp-Source: ACHHUZ7EfsOq1VuOvRmdWtaAvhOpCNjdCzQXLcPZLbiaK5j4B+EY4Ue+uxmWczpcmk+NGWnMZQRC6w==
X-Received: by 2002:a81:7508:0:b0:561:a422:f3cd with SMTP id q8-20020a817508000000b00561a422f3cdmr10876901ywc.30.1684759943893;
        Mon, 22 May 2023 05:52:23 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id o9-20020a817309000000b00556aa81f615sm2023521ywc.68.2023.05.22.05.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 05:52:22 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561c1768bacso79771177b3.1;
        Mon, 22 May 2023 05:52:22 -0700 (PDT)
X-Received: by 2002:a0d:d44a:0:b0:561:da0d:6488 with SMTP id
 w71-20020a0dd44a000000b00561da0d6488mr11245505ywd.50.1684759942356; Mon, 22
 May 2023 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230518152334.514922-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518152334.514922-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 14:52:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7VgoOxo8LHgJvJEc7ZSoAbqTUgU390Cb9-V-8fGEjag@mail.gmail.com>
Message-ID: <CAMuHMdU7VgoOxo8LHgJvJEc7ZSoAbqTUgU390Cb9-V-8fGEjag@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

Hi Biju,

On Thu, May 18, 2023 at 5:23 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per RZ/G2L HW(Rev.1.30 May2023) manual, there is no "write enable"
> bits for CPG_SIPLL5_CLK1 register. So fix the CPG_SIPLL5_CLK register
> write by removing "write enable" bits.
>
> Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -603,10 +603,8 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>         }
>
>         /* Output clock setting 1 */
> -       writel(CPG_SIPLL5_CLK1_POSTDIV1_WEN | CPG_SIPLL5_CLK1_POSTDIV2_WEN |
> -              CPG_SIPLL5_CLK1_REFDIV_WEN  | (params.pl5_postdiv1 << 0) |
> -              (params.pl5_postdiv2 << 4) | (params.pl5_refdiv << 8),
> -              priv->base + CPG_SIPLL5_CLK1);
> +       writel((params.pl5_postdiv1 << 0) | (params.pl5_postdiv2 << 4) |
> +              (params.pl5_refdiv << 8), priv->base + CPG_SIPLL5_CLK1);
>
>         /* Output clock setting, SSCG modulation value setting 3 */
>         writel((params.pl5_fracin << 8), priv->base + CPG_SIPLL5_CLK3);

Matches the documentation, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But I guess the actual CPG_SIPLL5_CLK1_*_WEN bit definitions
should be removed, too? I can do that while applying...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
