Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30A65BC60C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 12:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiISKGt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 06:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiISKGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 06:06:45 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E914213D61;
        Mon, 19 Sep 2022 03:06:41 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id 3so19718984qka.5;
        Mon, 19 Sep 2022 03:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1NtF7epU6M/sM/9TSpbDJEVXR5l82D2T5Zs5FGK4Z50=;
        b=BgTwW7JMen0fDGy/gqKhf08TxAIClx+E2Pgdn5jKkZt3M2YZ1aEhcLW2NmkM3iA1Bg
         oLClnhugzLz9p37XtQ6VuUM4BADudFRe55DIdWQrdEpq0z2WDRKxhWvdXx/pXKLUJWcl
         kQpAJtZJvpbgshzMTPyuod//ztSmLhmbDXfwPkOlREEM0a1NxTIyo22vVm2RcXuBUc8S
         veeUgsAzJspGbFn1X+2T+P8TrGqiDdpBPSz9OW13DNNxQNF5AkZLNsaGpTxRRwdzB0M6
         OVOT1rW8/9VqfKps82pBuC4dgxmwOG/wbPmwR2UuyROYcI5qV/J5E1DFC/Jn+id2aCo3
         fBCQ==
X-Gm-Message-State: ACrzQf0xvEdBjvWKe80moxWoB4FJGHgYuMipVzbGR6NBu8ORm8xlCTHl
        pgbl2uPMduw8cXIR4m2hqXz1RV+7kxv/vw==
X-Google-Smtp-Source: AMsMyM7BQ1RDTZ6J5JtzH4pObZz4IIX7led5oRYY4nRDllRwEvzDCQmvVP2zNJmT45f6WIl2pz5jBg==
X-Received: by 2002:a05:620a:4555:b0:6ce:1af9:83fa with SMTP id u21-20020a05620a455500b006ce1af983famr12451382qkp.24.1663582000663;
        Mon, 19 Sep 2022 03:06:40 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id p8-20020a05622a00c800b0035bb8168daesm10680079qtw.57.2022.09.19.03.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:06:40 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id c9so41729711ybf.5;
        Mon, 19 Sep 2022 03:06:40 -0700 (PDT)
X-Received: by 2002:a25:3746:0:b0:6b1:4a12:b2d5 with SMTP id
 e67-20020a253746000000b006b14a12b2d5mr10946218yba.89.1663581999762; Mon, 19
 Sep 2022 03:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220919084838.3066429-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220919084838.3066429-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 19 Sep 2022 12:06:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVF4WDA6e4bTXuqLCKCCCYYYGW6Cufi3kPFuTGt184RJA@mail.gmail.com>
Message-ID: <CAMuHMdVF4WDA6e4bTXuqLCKCCCYYYGW6Cufi3kPFuTGt184RJA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Add clk margin for sdhi hs clock
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, Sep 19, 2022 at 10:48 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SDHI high speed clock is 4 times that of the main clock. Currently,
> there is no margin added for setting the rate associated with this
> clock. On RZ/G2L platforms, due to lack of this margin leads to the
> selection of a clock source with a lower clock rate compared to a higher
> one.
>
> This patch adds a margin of (1/1024) higher to hs clock rate and there
> by avoid looking for a smaller clock option.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Add a comment explaining why margin is needed and set it to
>    that particular value.

Thanks for the update!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -128,6 +128,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>         struct clk *ref_clk = priv->clk;
>         unsigned int freq, diff, best_freq = 0, diff_min = ~0;
>         unsigned int new_clock, clkh_shift = 0;
> +       unsigned int new_clock_margin;
>         int i;
>
>         /*
> @@ -156,7 +157,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>          */
>         for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
>                 freq = clk_round_rate(ref_clk, new_clock << i);
> -               if (freq > (new_clock << i)) {
> +               /*
> +                * Add a margin of 1/1024 rate higher to the clock rate in order
> +                * to avoid looking for a slower clock on boundary cases (eg:
> +                * RZ/G2L has 3 clk sources 533.333333 MHz, 400 MHz and
> +                * 266.666666 MHz. The request for 533.333332 MHz will look for
> +                * slower option and it selects a slower 400 MHz source clock
> +                * instead of 533.333333 MHz).
> +                */
> +               new_clock_margin = (new_clock << i) + ((new_clock << i) >> 10);

Unlike in the case below, "new_clock_margin" is not the margin, but
the actual value plus the margin.  So perhaps "new_upper_limit"?

Also, this value is constant inside the loop, so its calculation can
be moved outside, and its comment can be combined with the existing
comment just before the loop.

I would also say something about rounding errors, as that is what is
really the problem (533333333 Hz / 4 * 4 = 533333332 Hz < 533333333 Hz).

> +               if (freq > new_clock_margin) {
>                         /* Too fast; look for a slightly slower option */
>                         freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
>                         if (freq > (new_clock << i))
> @@ -181,6 +191,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>  static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>                                    unsigned int new_clock)
>  {
> +       unsigned int clk_margin;
>         u32 clk = 0, clock;
>
>         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
> @@ -194,7 +205,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>         host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
>         clock = host->mmc->actual_clock / 512;
>
> -       for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
> +       /*
> +        * Add a margin of 1/1024 rate higher to the clock rate in order
> +        * to avoid clk variable setting a value of 0 due to the margin
> +        * provided for actual_clock in renesas_sdhi_clk_update().
> +        */
> +       clk_margin = new_clock >> 10;
> +       for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
>                 clock <<= 1;
>
>         /* 1/1 clock is option */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
