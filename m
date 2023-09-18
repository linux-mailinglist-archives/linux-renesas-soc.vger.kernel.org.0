Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B927A48B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 13:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbjIRLoC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 07:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241879AbjIRLn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 07:43:58 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65390101;
        Mon, 18 Sep 2023 04:43:47 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59c215f2f4aso25062167b3.1;
        Mon, 18 Sep 2023 04:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695037426; x=1695642226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJJOzR+YVeocDIgokR8jWUc83rIvpyDkrWoxfJG2Icw=;
        b=pLzMWkviKebk+IzeFiUiLzbkYvtABQ2mJ0mNBiNHp246jt3rOOiQI04oHMWS2Bh5Yi
         6v+1kCovK5ujgvJ/kAUOMBSvDklv4EJ7QpWER655OsvcFwOMnwr38Gv6DFDzfY0GePPb
         +BhW5fAdfs8Om82VdhKIobmncmDRzGWVM5yABD0lixhfMV0k/jK3bkx/ec2PzP5gpHzH
         F9D5N64W+Yw/s7ES5cEdviPCGykwodJk39CMk7EHmz8Im+Yd4DR6ZpCQW5TbhIEbMG5p
         Ax+JYdtYrJeuiE+aCc/VsMhimapoy6uBrxhmj7LvUN5INJUJ+8B6Wzmm5O53CHpKJyrt
         HTRw==
X-Gm-Message-State: AOJu0YzLc6sLlHgzyaHTLfZ7/E2gpqaVJZ0tZzglU1+J3CUXOOOqIcRa
        ISoIeyEdZlNVCbhGVm4M/UeSICP+mtvgaw==
X-Google-Smtp-Source: AGHT+IFsVqTEIGgtnkFZBA9OGZqubR/hrR0RbiIrziH7xKVj43CemDNvYBC+pBZngVErosQXDg8SXA==
X-Received: by 2002:a81:7209:0:b0:59b:5696:c33 with SMTP id n9-20020a817209000000b0059b56960c33mr8105951ywc.46.1695037426318;
        Mon, 18 Sep 2023 04:43:46 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id p62-20020a819841000000b0059b50f126fbsm1621417ywg.114.2023.09.18.04.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 04:43:46 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59c215f2f4aso25061917b3.1;
        Mon, 18 Sep 2023 04:43:45 -0700 (PDT)
X-Received: by 2002:a0d:df10:0:b0:59b:f744:f158 with SMTP id
 i16-20020a0ddf10000000b0059bf744f158mr8461214ywe.15.1695037425699; Mon, 18
 Sep 2023 04:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230917095832.39007-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20230917095832.39007-1-marek.vasut+renesas@mailbox.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Sep 2023 13:43:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuHN-+=Wjt3mwH9HScuk_EDwW_=bW=KNXhk21MYuOTvQ@mail.gmail.com>
Message-ID: <CAMuHMdWuHN-+=Wjt3mwH9HScuk_EDwW_=bW=KNXhk21MYuOTvQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Constify r8a7795_*_clks
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thanks for your patch!

On Sun, Sep 17, 2023 at 11:58 AM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Make r8a7795_core_clks and r8a7795_mod_clks arrays const and align them
> with the other clock tables in other *cpg-mssr.c . No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Indeed, these are no longer modified since commit b1dec4e78599a2ce
("clk: renesas: rcar-gen3: Disable R-Car H3 ES1.*").

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.7.

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -51,7 +51,7 @@ enum clk_ids {
>         MOD_CLK_BASE
>  };
>
> -static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
> +static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         /* External Clock Inputs */
>         DEF_INPUT("extal",      CLK_EXTAL),
>         DEF_INPUT("extalr",     CLK_EXTALR),
> @@ -128,7 +128,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>         DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
>  };
>
> -static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
> +static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
>         DEF_MOD("3dge",                  112,   R8A7795_CLK_ZG),
>         DEF_MOD("fdp1-1",                118,   R8A7795_CLK_S0D1),
>         DEF_MOD("fdp1-0",                119,   R8A7795_CLK_S0D1),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
