Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A6551337D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346138AbiD1MXV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346140AbiD1MXR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:23:17 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CC6ADD78;
        Thu, 28 Apr 2022 05:20:02 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id p4so2699570qtq.12;
        Thu, 28 Apr 2022 05:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FBGdNMyWu1mYurIv+4gkcvoSLo5FsI2lvpeE8W7gkok=;
        b=6xvAfT7fBBBOfqDEbG8WsoerJ18hiSyKiGw+ngeKmXaFa77kT5HX0N9CVGVn2JkxF5
         6BoP+GOsOGI0rCTX/Pc3O3DkaXmMKRO/fpRy92HBwZRbr7swbRP3pKsjrLrP6scCO22c
         mm7FtLu6nUEM9WppYpGnjpgIK83nlkL0Kg3lLmLNJcbAXlciCJLOLA9+JK+rMYLbmHFh
         9fz227jHMS41omhufvLKo1KP+X7/TIusoToQliX007zhE08iuf1dSN8z7sSFpdmuIC9D
         27Rg/jfngVv1oir8HFP2cDk4LPbavppLZIAKACKZU3lo1tiTxjXaeUwhhC7qP4UlCkSl
         Ew8A==
X-Gm-Message-State: AOAM531nluGQkxJ8Ft6LpW9NH153zf/FYYML+Y7hzp03JyWgfKL5oTOY
        xtcGFRzR+6wGgKgJNMFluAY97vLSMPfH6Q==
X-Google-Smtp-Source: ABdhPJzVf+cS//+ke0JmojRAEbyw9jTorbqR+5BWCxeRNBB6hYCyGzTi1RJWkAxQplmvVVcZCSEs6Q==
X-Received: by 2002:ac8:5bce:0:b0:2e1:cc45:30f5 with SMTP id b14-20020ac85bce000000b002e1cc4530f5mr23326100qtb.445.1651148401758;
        Thu, 28 Apr 2022 05:20:01 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id c21-20020a05620a135500b0069f76565069sm4074356qkl.82.2022.04.28.05.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:20:01 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f7d621d1caso50507277b3.11;
        Thu, 28 Apr 2022 05:20:01 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr30539265ywa.479.1651148400900; Thu, 28
 Apr 2022 05:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:19:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtQTGvO7vxHFnJ6uStHmoAx_sdhxRJgjYQTpq4H_gyPA@mail.gmail.com>
Message-ID: <CAMuHMdUtQTGvO7vxHFnJ6uStHmoAx_sdhxRJgjYQTpq4H_gyPA@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: renesas: r9a07g043: Add OSTM clock and reset entries
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Apr 25, 2022 at 11:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add OSTM{0,1,2} clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
> @@ -129,6 +129,12 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
>                                 0x52c, 0),
>         DEF_MOD("dmac_pclk",    R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
>                                 0x52c, 1),
> +       DEF_MOD("ostm0",        R9A07G043_OSTM0_PCLK, R9A07G043_CLK_P0,
> +                               0x534, 0),
> +       DEF_MOD("ostm1",        R9A07G043_OSTM1_PCLK, R9A07G043_CLK_P0,
> +                               0x534, 1),
> +       DEF_MOD("ostm2",        R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
> +                               0x534, 2),

Do you mind if I change the clock names to "ostm[012_pclk"
while applying, for consistency with r9a07g044-cpg.c.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
