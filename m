Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16BF264B78C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 15:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbiLMOiT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 09:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbiLMOiQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 09:38:16 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BF9D2FD;
        Tue, 13 Dec 2022 06:38:15 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id h16so11951959qtu.2;
        Tue, 13 Dec 2022 06:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5aYjTNJZYeeZ1RYF7eUge01EmrTIBiLJUd67L8iu/E=;
        b=nvUa9IIf5J5v1hJFfWqOxXhofyLEL8CGueUpGFjoNYa86YYHJbkYfddEnUviguAWI8
         yk77Z26iAS0qwdqF2XwwXaLcbooIht5bYbvjaGJfFtPD+Wy55HKYQulgUtz67x6l+Fh+
         LEhBapnjMcW+spQz1JfDkYHt6fPnxbXAmA160M68Ui0PjnHopbKpzcpgAf7bSLmoOLYi
         hJSb8QUg1bZJa8MLeLyJeVySXwm+v7rjhqtYQmWm3uOx19ff7jXXu3ws7XHawVGPw0ED
         HC+Dl4C+1GWisOef9/BttzdShKARlsTm3CjwN0kwbS1qWBRbYHY1O2hUb0S5Oar4XrJR
         Zsvg==
X-Gm-Message-State: ANoB5pkt9ln0VTW19VMtr+PdNvSV6UeRAMnOi8Z0z5k7RjvjDwYGHiiL
        Vw0aFev5Noi1Xdon7xZMarBy1AExFM2HFQ==
X-Google-Smtp-Source: AA0mqf7/u4gqFa7xRPLjsdBOhqwO8DD35xxHrG8biy07J/Mlq6ipLu9CjpEhu0vCkREOZ5fEnfzCYA==
X-Received: by 2002:a05:622a:408e:b0:3a5:c775:59ec with SMTP id cg14-20020a05622a408e00b003a5c77559ecmr30826246qtb.28.1670942294752;
        Tue, 13 Dec 2022 06:38:14 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id b2-20020ac844c2000000b00342f8d4d0basm7698040qto.43.2022.12.13.06.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 06:38:14 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3bf4ade3364so194369057b3.3;
        Tue, 13 Dec 2022 06:38:14 -0800 (PST)
X-Received: by 2002:a81:148c:0:b0:3e5:f2ca:7be8 with SMTP id
 134-20020a81148c000000b003e5f2ca7be8mr24137887ywu.358.1670942293763; Tue, 13
 Dec 2022 06:38:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670492384.git.geert+renesas@glider.be> <a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be>
In-Reply-To: <a174da512fb1cba0a001c9aed130a2adca14e60a.1670492384.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Dec 2022 15:38:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjQNq61sKLsUVjpDgJnftkZDZB-CL4UDAdiyrARz92iQ@mail.gmail.com>
Message-ID: <CAMuHMdUjQNq61sKLsUVjpDgJnftkZDZB-CL4UDAdiyrARz92iQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rcar-gen4: Add support for fractional multiplication
To:     geert+renesas@glider.be
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 8, 2022 at 2:07 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> R-Car Gen4 PLLs support fractional multiplication, which can improve
> accuracy when configuring a specific frequency.
>
> Add support for fractional multiplication to the custom clock driver
> for PLLs, which is currently used only for PLL2 on R-Car V4H.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c

> @@ -101,17 +126,31 @@ static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>                                 unsigned long parent_rate)
>  {
>         struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
> -       unsigned int mult;
> +       unsigned long prate = parent_rate * 2;
> +       u32 cr0 = readl(pll_clk->pllcr0_reg);
> +       unsigned int ni, nf;
> +       int error;

"error" is unused, and should be dropped.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
