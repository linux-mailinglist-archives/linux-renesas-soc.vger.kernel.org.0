Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B64C5B7929
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 20:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbiIMSIS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 14:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbiIMSIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 14:08:02 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C157AAF48B;
        Tue, 13 Sep 2022 10:12:22 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id a20so6504162qtw.10;
        Tue, 13 Sep 2022 10:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dOteLWUmDmTKb9ikXuajLb+AhY1FeIW9xpMvZvif+dc=;
        b=pINrNB1XAYgDFOlNlIHsBwpJ9WSCP1f6DvwOddSOxSBNyh6ApZDDQIO+AfYfBNVavE
         cNupM4mopqDU/jdQJClCyFqsHB6BJsVbOVIWFuYh+1lawCcFdbpveeWF5TuWJjkgObPb
         8gEP4Hh/SkgtOhvS4NuLNgR3+cOgRFmIVOJZn/sYYVsZG0u9REY8gDHlNp2Fnn+X7n13
         SWu3fhSk0RdwvV7pwgzPWHdBMRThcvLtf0/anu7WSLM18s3tIs1hmetIRFjwYm2j8bOA
         yMAX0smx5jRgbtgadtoUXuYNAGPIVjie2kQHd77GZ+4+SerDQlB9q2v+YEuhvH/o6r8f
         uvLw==
X-Gm-Message-State: ACgBeo1kqvRZFTdMRuoe7YAaPVJBSW4RGJJEyti7c6lxAzzq1FNgqyMA
        0GrwL32StxkQBGEgI4BfVc2ADNNb0KBIkhwu
X-Google-Smtp-Source: AA6agR7jSlvw2+v0nWPbOmHt9AvFT3sDhGby5KxJqSexyYeZbprnvbcQuxMZx7IRFgfXGiBeptERjQ==
X-Received: by 2002:ac8:7e84:0:b0:35b:a902:57c3 with SMTP id w4-20020ac87e84000000b0035ba90257c3mr14534665qtj.37.1663089141407;
        Tue, 13 Sep 2022 10:12:21 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id z12-20020a05622a124c00b003434f7483a1sm9536677qtx.32.2022.09.13.10.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 10:12:21 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3321c2a8d4cso148749037b3.5;
        Tue, 13 Sep 2022 10:12:20 -0700 (PDT)
X-Received: by 2002:a0d:d913:0:b0:349:b150:1605 with SMTP id
 b19-20020a0dd913000000b00349b1501605mr76727ywe.384.1663089140577; Tue, 13 Sep
 2022 10:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Sep 2022 18:12:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
Message-ID: <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs clock
To:     biju.das.jz@bp.renesas.com
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 13, 2022 at 5:15 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SDHI high speed clock is 4 times that of the main clock. Currently,
> there is no margin added for setting the rate associated with these
> clocks. On RZ/G2L platforms, the lack of these margins leads to the
> selection of a clock source with a lower clock rate compared to a higher
> one.
>
> RZ/G2L example case:
> SD0 hs clock is 533333333 Hz and SD0 main clock is 133333333 Hz.
> When we set the rate for the main clock 133333333, the request rate for
> the parent becomes 533333332 (133333333 * 4) and the SD0 hs clock is
> set as 400000000 Hz.
>
> This patch adds a margin of (1/1024) higher hs clock and main clock rate.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -147,6 +147,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>         }
>
>         new_clock = wanted_clock << clkh_shift;
> +       new_clock += new_clock >> 10;

This changes the requested clock rate. Is that really a good idea?

Isn't it sufficient to change the test "if (freq > (new_clock << i))"
slightly?

>
>         /*
>          * We want the bus clock to be as close as possible to, but no
> @@ -172,6 +173,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>
>         clk_set_rate(ref_clk, best_freq);
>
> +       best_freq += best_freq >> 10;

Can you please elaborate why this is needed?
It looks counter-intuitive to me.

>         if (priv->clkh)
>                 clk_set_rate(priv->clk, best_freq >> clkh_shift);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
