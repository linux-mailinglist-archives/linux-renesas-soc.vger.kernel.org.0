Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2A75F073A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 11:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiI3JJX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Sep 2022 05:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbiI3JJV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 05:09:21 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49908B7EF;
        Fri, 30 Sep 2022 02:09:21 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id u28so2426529qku.2;
        Fri, 30 Sep 2022 02:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kV6B9e3C/pAo7AcuiwNZqIcKqfAsPDnilgjS0AwmIPM=;
        b=NR2xt2db4N3jgtH2NQVhuXnAqe4hDnOEjteY1ahrK3g8+mQGO2+spFdyiG2jYjD66j
         ScpNxNx/iC02EYh5I2+y1pvvc2FpR/+6lVr6nGGumvHKLknhd5VJDkI7D+F6nCwUVUhd
         OwZemUGv3ONJuZKxIQHKGN3G27Dqfa0jyQ/NMQXT7C9/GUm1JbKb5/bKcXzyDnJuvfBu
         /z/gpz2Pqe8iO60U/vrPMLFviSY8IS+OymWmFTgHjomoNo7uh0EFQFilaFWYwbkZrZtl
         fAVdNzI5OUlpoAIGljbp55w8/yPFjceTci2eyUnoI15JtLmyl58lquvnCzVA69roXfNy
         HmXQ==
X-Gm-Message-State: ACrzQf3PYUBYgoACp6f02g9ueWJgRvnUyvM9x7aZ5d/GabP8NrR3FcDC
        +mcizPFidCIUxbJ7gYegFswRJvEjnp94rg==
X-Google-Smtp-Source: AMsMyM7g8VABViK08vwPtrocxWEWz28bOd2zrslWLSssWpE1BXKVMyij0kDe1mT4Lcsi18gTQGofmQ==
X-Received: by 2002:a05:620a:2807:b0:6cf:cb30:8ff5 with SMTP id f7-20020a05620a280700b006cfcb308ff5mr5189818qkp.206.1664528959921;
        Fri, 30 Sep 2022 02:09:19 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b006b5e296452csm2165157qkn.54.2022.09.30.02.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 02:09:19 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 203so4527776ybc.10;
        Fri, 30 Sep 2022 02:09:18 -0700 (PDT)
X-Received: by 2002:a25:ae57:0:b0:6bc:d5f6:148d with SMTP id
 g23-20020a25ae57000000b006bcd5f6148dmr5130990ybe.36.1664528958734; Fri, 30
 Sep 2022 02:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Sep 2022 11:09:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+0Umi1RiLxdR5MCV2FZvi7a9HuS8EFJtx7JksQBP4eg@mail.gmail.com>
Message-ID: <CAMuHMdU+0Umi1RiLxdR5MCV2FZvi7a9HuS8EFJtx7JksQBP4eg@mail.gmail.com>
Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
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

On Wed, Sep 28, 2022 at 1:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> with a lower clock rate compared to a higher one.
> For eg: The rounding error (533333333 Hz / 4 * 4 = 533333332 Hz < 5333333
> 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
>
> This patch fixes this issue by adding a margin of (1/1024) higher to
> the clock rate.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
>  * Moved upper limit calculation inside the for loop as it caused
>    regression on R-Car M2-W board.
>  * Removed Rb tag from Wolfram as there is some new changes.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Still works fine on R-Car Gen2/Gen3, so:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
