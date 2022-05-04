Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA2D519A4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346580AbiEDIsg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235435AbiEDIsf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:35 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4427024599;
        Wed,  4 May 2022 01:45:00 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id e15so381754qtp.3;
        Wed, 04 May 2022 01:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KF3NbRxsStZo4Wnyj8g7u4ZVnDbE1OyrA0WdmmyWWlk=;
        b=vCzc3SnIGZpTyUrhR8faSJ+vPoFWsmW55+k+Y8yvFrCgT6IN9BW1Sl0asbc2kv++2l
         fl1d7Zu/K//hKvCbde2NJD7eXScDifWJTiQ79G6RCObQkhsMirTyjKWOPq+Lua8V3/hf
         DZigxAGIy4T2AWoTZ6N3QztTpmdc841UfarSFB3T0IVxmpzlbsgrppXGg2FkpNJHM74L
         /Unu2n9I3XyYhySDUEHAtCYz7huSMC/KUcymxDt9qFv0PxW3HX32zV+DM31WPA1VOVQz
         6TMNeWvHDOSWKoLBYNr8N/pFGG/5F11LFeJqKptz+Zz2L0xxmnW5UlhaUmyfH0m5CaJI
         3toQ==
X-Gm-Message-State: AOAM532trp0EA/+Bb4Glcr6EW6Xt3XCY2udnAF8q+n/0UIpulk+ZIXdx
        myPBX9bFf6Fl7BUevQcnkv8BvvgzJ+9zjA==
X-Google-Smtp-Source: ABdhPJxbxzpm+AEpns/HCKquMAwFuT3MEoGMQm3nYEFTBjJIfdtWo6FvFCdamWZ5eJHMbVaVPRRpbg==
X-Received: by 2002:a05:622a:110f:b0:2f3:3f89:d38 with SMTP id e15-20020a05622a110f00b002f33f890d38mr18028069qty.346.1651653899264;
        Wed, 04 May 2022 01:44:59 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id w3-20020ac843c3000000b002f39b99f68dsm6930683qtn.39.2022.05.04.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:58 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7d19cac0bso7669047b3.13;
        Wed, 04 May 2022 01:44:58 -0700 (PDT)
X-Received: by 2002:a0d:d953:0:b0:2f7:d5ce:f204 with SMTP id
 b80-20020a0dd953000000b002f7d5cef204mr18013635ywe.502.1651653897977; Wed, 04
 May 2022 01:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-10-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-10-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUL+NpdtdX78_RwSn0b8OrAqj7pru4P2WgVPPPD0bvurg@mail.gmail.com>
Message-ID: <CAMuHMdUL+NpdtdX78_RwSn0b8OrAqj7pru4P2WgVPPPD0bvurg@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] clk: renesas: rzg2l: Add support for RZ/V2M
 reset monitor reg
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

Hi Phil,

On Tue, May 3, 2022 at 2:02 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The RZ/V2M doesn't have a matching set of reset monitor regs for each reset
> reg like the RZ/G2L. Instead, it has a single CPG_RST_MON reg which has a
> single bit per module.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - If no clk mon regs and no clk monitor bit specified, return an error

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1177,8 +1177,16 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
>         const struct rzg2l_cpg_info *info = priv->info;
>         unsigned int reg = info->resets[id].off;
>         u32 bitmask = BIT(info->resets[id].bit);
> +       s8 monbit = info->resets[id].monbit;
>
> -       return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
> +       if (info->has_clk_mon_regs) {
> +               return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
> +       } else if (monbit >= 0) {
> +               u32 monbitmask = BIT(monbit);
> +
> +               return !!(readl(priv->base + CPG_RST_MON) & monbitmask);
> +       }
> +       return -ENOTSUPP;

I had my doubts about -ENOTSUPP, but
drivers/reset/core.c:reset_control_status() confirms it's the right
error code to return.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
