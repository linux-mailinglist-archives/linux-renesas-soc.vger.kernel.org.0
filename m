Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 117E94ED75E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 11:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234363AbiCaJ6h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 05:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234322AbiCaJ61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 05:58:27 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9521C2016BE;
        Thu, 31 Mar 2022 02:56:40 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id r127so19276281qke.13;
        Thu, 31 Mar 2022 02:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gg90NThCeAeGZxb8zdlM6tEKrn0mtCHmlF+3WtbPFi8=;
        b=vSrQx595N9wRtKvHWp23gvnsPCTOmSoPoeladUc2UpvzdYmXYjBsuHqfbfZEPS2OML
         NSgFcQyjXdP3OudhzRSSGKGfx20PPiI+pTHOOoEcjpW9xaPsFde3HPCb73Prd4CwVz3Q
         pX0mvA1sV8+8nQTtO0QMJpkmW7HnqQGCaMip/adDhXsAjJs5f0l8KKRxXjoiKe00MUtS
         ICBZNN/lUw4S2T8EeQd03Z7AZS5Dpcf27WI0pNEhUGh42Gs2MTwdLIkAkNmuL4EeEWJp
         MNnEzwANi2zHHNENx0bzzl2AxAgeIdeRMH2v8lS/+r5+V6pmTksi2B1/n1PoSAnJ4eRv
         ysdA==
X-Gm-Message-State: AOAM533fihxxl0jln6kJUXI4yf7b+55AHxOrICVMYTmaLwmXZsWQPae9
        GSC7tPpTjc0Njx+/edqGjRBV3xRciJThtg==
X-Google-Smtp-Source: ABdhPJwE+LBqjy/ku7958Vf96vDWbBfHenh0vLeaMl9uJH12xl/D3bXx3TcpbdACVpo6YIvK1ZvsWQ==
X-Received: by 2002:a05:620a:25d0:b0:47b:2596:de51 with SMTP id y16-20020a05620a25d000b0047b2596de51mr2692887qko.531.1648720599177;
        Thu, 31 Mar 2022 02:56:39 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id j18-20020ac85c52000000b002e1b9897ae7sm18677416qtj.10.2022.03.31.02.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 02:56:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id y38so38737356ybi.8;
        Thu, 31 Mar 2022 02:56:38 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr3540466yba.393.1648720597988;
 Thu, 31 Mar 2022 02:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com> <20220315142644.17660-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315142644.17660-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 11:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyocgrgDoXVVoATDr6md2RjgdqhmKWMpcTFKXf-1QQSA@mail.gmail.com>
Message-ID: <CAMuHMdVyocgrgDoXVVoATDr6md2RjgdqhmKWMpcTFKXf-1QQSA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] clk: renesas: Add support for RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

Hi Biju,

On Tue, Mar 15, 2022 at 3:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The clock structure for RZ/G2UL is almost identical to RZ/G2L SoC with
> fewer IP blocks. The IP blocks such as WDT1, GPT, H264, GPU and POEG are
> not present on RZ/G2UL.
>
> This patch adds minimal clock and reset entries required to boot the
> system on Renesas RZ/G2UL SMARC EVK and binds it with the RZ/G2L CPG core
> driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced R9A07G043U->R9A07G043 and r9a07g043u->r9a07g043

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c

> +const struct rzg2l_cpg_info r9a07g043_cpg_info = {
> +       /* Core Clocks */
> +       .core_clks = r9a07g043_core_clks,
> +       .num_core_clks = ARRAY_SIZE(r9a07g043_core_clks),
> +       .last_dt_core_clk = LAST_DT_CORE_CLK,
> +       .num_total_core_clks = MOD_CLK_BASE,
> +
> +       /* Critical Module Clocks */
> +       .crit_mod_clks = r9a07g043_crit_mod_clks,
> +       .num_crit_mod_clks = ARRAY_SIZE(r9a07g043_crit_mod_clks),

This may need an update if you change the Clock and Reset Definitions.

> +
> +       /* Module Clocks */
> +       .mod_clks = r9a07g043_mod_clks,
> +       .num_mod_clks = ARRAY_SIZE(r9a07g043_mod_clks),
> +       .num_hw_mod_clks = R9A07G043_LCDC_CLK_D + 1,
> +
> +       /* Resets */
> +       .resets = r9a07g043_resets,
> +       .num_resets = R9A07G043_LCDC_RESET_N + 1, /* Last reset ID + 1 */

Likewise.

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
