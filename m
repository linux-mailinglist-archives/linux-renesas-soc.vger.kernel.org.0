Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 750925EC566
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 16:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiI0OEk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 10:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbiI0OEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 10:04:39 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B82B193F1;
        Tue, 27 Sep 2022 07:04:34 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id h21so6054728qta.3;
        Tue, 27 Sep 2022 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7Pna9ljbZXViN8j+f7BtxGJuAhLdWXRbz1JOEgk/nnw=;
        b=hur1Jl4MO36li4nHO3JAch/Q105KI8Ed4wIHW76SsUKMMnWsF137Tae2RdaVubkFgp
         2ruwcZX5fODcud0dGdupLC+2CbPm0cOMGl9uqP/gV7QsqdWabrovFURayZWYWs+rS2i+
         M8d7rgx4lWq1ixgaV1l23ymp8El8XNxhMtmj3ecuzLk8m+44M3DWNBBdCzvWB3g6WLmX
         vLtq0Xd7ZAJQwZ7rl4fiWu3i3z5nd3n6sds0XxqG83jIUG+W+no+mZTJf8xQNfR3QUjc
         AEgEdxnJMyrz2e4NRZDnNhxhisI6PY6J33qAraaHmYEKO0iMSRgXqeCZwwygPTXelc7A
         XsJQ==
X-Gm-Message-State: ACrzQf3Sd3hS6O2lxYowXcqZVzbuHLRJDjprcXvzwmemuCIqDZG1xQQa
        gScBO/LhzEPsb7fTKYJf/QlR1PBzu0TGsQ==
X-Google-Smtp-Source: AMsMyM6Be6nh2OtBXdMi408NtkzRx0xaQIrKJgN3/xUDUuuFiCpWkt9zgWf7h63IDICSgi92UjSOBg==
X-Received: by 2002:ac8:7f8e:0:b0:35c:ff82:6290 with SMTP id z14-20020ac87f8e000000b0035cff826290mr22036332qtj.254.1664287473427;
        Tue, 27 Sep 2022 07:04:33 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id bp12-20020a05620a458c00b006b9c9b7db8bsm989904qkb.82.2022.09.27.07.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:04:33 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-345528ceb87so101146767b3.11;
        Tue, 27 Sep 2022 07:04:32 -0700 (PDT)
X-Received: by 2002:a81:6756:0:b0:345:525e:38 with SMTP id b83-20020a816756000000b00345525e0038mr25501328ywc.47.1664287472505;
 Tue, 27 Sep 2022 07:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Sep 2022 16:04:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXa3d=0r73HV+1JjYeVN+FoyJs==zTo983wiNB12KJM2w@mail.gmail.com>
Message-ID: <CAMuHMdXa3d=0r73HV+1JjYeVN+FoyJs==zTo983wiNB12KJM2w@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Sep 26, 2022 at 7:10 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> with a lower clock rate compared to a higher one.
> For eg: The rounding error (533333333 Hz / 4 * 4 = 533333332 Hz < 5333333
> 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
>
> This patch fixes this issue by adding a margin of (1/1024) higher to
> the clock rate.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v3->v4:
>  * Added Tested-by tag from Wolfram.
>  * Updated commit description and code comment with real example.

Thanks for the update!

Unfortunately this patch causes a change in the clock frequencies
used on R-Car M2-W:

    -clk_summary:          sd0                 97500000
    +clk_summary:          sd0                 32500000
    -clk_summary:             sdhi0            97500000
    +clk_summary:             sdhi0            32500000

    -clk_summary:             sd3              12786885
    +clk_summary:             sd3              12187500
    -clk_summary:                sdhi3         12786885
    +clk_summary:                sdhi3         12187500

    -clk_summary:             sd2              12786885
    +clk_summary:             sd2              12187500
    -clk_summary:                sdhi2         12786885
    +clk_summary:                sdhi2         12187500

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -153,10 +154,17 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>          * greater than, new_clock.  As we can divide by 1 << i for
>          * any i in [0, 9] we want the input clock to be as close as
>          * possible, but no greater than, new_clock << i.
> +        *
> +        * Add an upper limit of 1/1024 rate higher to the clock rate to fix
> +        * clk rate jumping to lower rate due to rounding error (eg: RZ/G2L has
> +        * 3 clk sources 533.333333 MHz, 400 MHz and 266.666666 MHz. The request
> +        * for 533.333333 MHz will selects a slower 400 MHz due to rounding
> +        * error (533333333 Hz / 4 * 4 = 533333332 Hz < 533333333 Hz)).
>          */
> +       new_upper_limit = (new_clock << i) + ((new_clock << i) >> 10);

Mea culpa: while new_clock is a constant inside the loop, i is not!
So it should be moved back inside the loop below.
With that change, R-Car M2-W is happy again, and I noticed no
regression on R-Car H3 ES2.0.

>         for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
>                 freq = clk_round_rate(ref_clk, new_clock << i);
> -               if (freq > (new_clock << i)) {
> +               if (freq > new_upper_limit) {
>                         /* Too fast; look for a slightly slower option */
>                         freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
>                         if (freq > (new_clock << i))
                                     ^^^^^^^^^^^^^^^^
Probably this should become new_upper_limit too, for consistency?
It doesn't seem to matter in my testing, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
