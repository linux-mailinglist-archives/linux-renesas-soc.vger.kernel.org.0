Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD04538CB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 May 2022 10:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244790AbiEaIUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 May 2022 04:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244801AbiEaIUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 May 2022 04:20:35 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFD393473;
        Tue, 31 May 2022 01:20:34 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id p123so12663410qke.5;
        Tue, 31 May 2022 01:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q4AFOo/sHF3WBtIsxwpp6QKZ7AE5nHxKZnCqfdJL+sw=;
        b=US/kOb6LmE52IfJJMoLcARf62QY8FHcp+gQGV3MrYzmgdfyUn7AvBh0zjFYJjGCBhM
         n+rcghZFrPt+Eh8rjqUAW0u9i+PGq7hqwqDBOCYDAwoj2qfNCExCutgKol/9fyidQVcq
         4wzzLLqkturEnFnUCQjvkBBDgB1lUfce75zwmTJiL+xMZkUfrlCZ0v/zVSYOpdHFXp+Y
         Z4LYHMiteSrMBMPVs3z2+G29CEralOV8eWafaVdGR3Hwf4v+RJ3CcoU6IWe8TIPIwHo9
         CtNqubfE0QzRuP8lyZWnt9NCO2oDsGCXsXKb09KEt6+XKuybsANJZerjFQIWFVIzHTsP
         IDSQ==
X-Gm-Message-State: AOAM530rz9kNmSV9k7YAO8y0ohxUcVoaMcLEXSBbLISfkwwaPm8CqcwF
        tldLBk6NuKyXtci9OLZNZriFgbESDWHD6Q==
X-Google-Smtp-Source: ABdhPJxCYvG1Ky7BoAnnIuX0RtVPjEuXq5P1IhZiG8841Wqj/y9SXDCRK28Rc60PA914FUhWTMD5jg==
X-Received: by 2002:a37:6c03:0:b0:6a6:1f0f:ae0f with SMTP id h3-20020a376c03000000b006a61f0fae0fmr7004190qkc.162.1653985233083;
        Tue, 31 May 2022 01:20:33 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 23-20020a05620a06d700b0069fc13ce23dsm8666455qky.110.2022.05.31.01.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 01:20:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id l204so11936856ybf.10;
        Tue, 31 May 2022 01:20:32 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr11846749ybc.380.1653985232133; Tue, 31
 May 2022 01:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com> <OS0PR01MB592258FC31B22925E8D5D24F86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592258FC31B22925E8D5D24F86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 May 2022 10:20:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU63CmmB1MTjbbLNRyOQC8jEGrGth7M9nkrpmH3eUCSpg@mail.gmail.com>
Message-ID: <CAMuHMdU63CmmB1MTjbbLNRyOQC8jEGrGth7M9nkrpmH3eUCSpg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix reset status function
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

On Tue, May 31, 2022 at 9:58 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] clk: renesas: rzg2l: Fix reset status function
> > On Tue, May 31, 2022 at 9:17 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > As per RZ/G2L HW(Rev.1.10) manual, reset monitor register value 0
> > > means reset signal is not applied (deassert state) and 1 means reset
> > > signal is applied (assert state).
> > >
> > > reset_control_status() expects a positive value if the reset line is
> > > asserted. But rzg2l_cpg_status function returns zero for asserted
> > > state.
> > >
> > > This patch fixes the issue by adding double inverted logic, so that
> > > reset_control_status returns a positive value if the reset line is
> > > asserted.
> > >
> > > Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L
> > > SoC")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This bug has been present since v5.14, and went unnoticed so far.
> > Is it OK for you to queue this in renesas-clk-for-v5.20, or do you see a
> > reason to fast-track this fix to v5.19?
>
> renesas-clk-for-v5.20 should be fine. This issue found while adding reset support

OK.

> for VSPD. There is 1 user prior to this[1]
>
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/mmc/host/renesas_sdhi_core.c#L576

Oh, and that one works by accident, as it ignores the return value
of read_poll_timeout()...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
