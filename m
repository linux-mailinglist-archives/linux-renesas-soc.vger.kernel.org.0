Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB835516F22
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 13:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376705AbiEBL7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 07:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiEBL7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 07:59:08 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E38A1AF3B;
        Mon,  2 May 2022 04:55:40 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f186so11131361qke.8;
        Mon, 02 May 2022 04:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CF9RwQrT81WWPNj57Tr31D0ck3a0O17Krj5kfVbkK6Q=;
        b=7nVEG1hmlfj8kGI/x46n+Z4sNQnhJddZvICvTmdP91GTQPZ6kfxCqNuaZy8KgaVFNL
         Ob5OatSSfIP1EMvWKm1+9DvjMlvCToWhjzKuO5fO5b9mSUgEQ4D63/N4+qKHmBh0Md8r
         C4n5y1XF+WmY5vYDlyaGocmsROyhs4B77nbN1oIR+GmCW75f4WgeKOafa7Zqrd74/o/a
         9USzsY83R4mTFmjSjVtKHeNI7z3Us3+kuuZ8ax7v7O4+OhLTP+e17P2JiWD10eIJEYyH
         B2MD9/+dJnHe1rGI4iSBFFrCmQojxupfLjdhxUCQDXkLoCJeRzEDU6W3NWFsgJWXA9w8
         0ksg==
X-Gm-Message-State: AOAM531RKh5CQ3OyyORqvOfek+bhM1fTvLSD+hMOuXnCDWhRpxwSYDS9
        ri4wOB88PFw6LfB1zxqYP4eBq/csa9hPrQ==
X-Google-Smtp-Source: ABdhPJzSpRh4qsxyc1a26myfQLPZd/Lvup3P2ytAlXG79MbDaO3tCP5FFru67bHb/LO7R6J1o8MzfA==
X-Received: by 2002:a05:620a:284a:b0:67b:637d:5858 with SMTP id h10-20020a05620a284a00b0067b637d5858mr8058177qkp.572.1651492539026;
        Mon, 02 May 2022 04:55:39 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r129-20020ae9dd87000000b0069fc13ce243sm2294123qkf.116.2022.05.02.04.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 04:55:38 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id v59so25533267ybi.12;
        Mon, 02 May 2022 04:55:38 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr9880052yba.380.1651492538324; Mon, 02
 May 2022 04:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220430114156.6260-1-biju.das.jz@bp.renesas.com> <20220430114156.6260-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220430114156.6260-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 13:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNYtY98AAxm787bSHtfjwvRYJGHqFKCFRM97E+GL9DbA@mail.gmail.com>
Message-ID: <CAMuHMdWNYtY98AAxm787bSHtfjwvRYJGHqFKCFRM97E+GL9DbA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] clk: renesas: rzg2l: Add DSI divider clk support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Sat, Apr 30, 2022 at 1:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> M3 clock is sourced from DSI Divider (DSIDIVA * DSIDIVB)
>
> This patch add support for DSI divider clk by combining
> DSIDIVA and DSIDIVB.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped the blank line abd defined variables in
>    reverse Xmas tree order in get_vclk_parent_rate()
>  * Added macro MAX_VCLK_FREQ and rate is checked against
>    this macro in determine_rate and set_rate

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19, with the rest of this series.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
