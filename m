Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAA93AC9B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbhFRLXe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:23:34 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:37723 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhFRLXd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:23:33 -0400
Received: by mail-ua1-f47.google.com with SMTP id f34so3256565uae.4;
        Fri, 18 Jun 2021 04:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LUEdaM1hppiNrgci9zgX87f5flI84RrFcNouNxBCARM=;
        b=VMjj+D641hTnyVNwzkJetQyb3NdFPfEQ/2PcQM3Ez3Q7IzRzkxcCXB5mYEazQ69LG8
         fCbhxayPBi45sPBuyFx9uVnAmzXLBPzq0r3N9JSPyjrJLOb7EeNbv2Qfk2JCmBJEuub1
         l1Cj9MwlgKYZnNRsfKLJyQdn9gWt0O0ZzpkeqEdyYVN3oP3A5EflHnz4qFG7nfraQzMb
         hYK01DZs4uZL1MOhq7zFWgjQkgwkYJuGnIxApj8VdloIR33m+dd3GyP69ihMSkbrxRJT
         gz3s/m+Nu7ntTQePI5YEBkzRJMbCVajIjsVmBGxX0DPZpw1O8qTQRfAsvkFNE6JWrlvq
         46Vw==
X-Gm-Message-State: AOAM530uvXX2yD/Mc44WtnUJFSPIM5W5OAITyet9d0+eTMAmOI8ocapd
        sZ2h33vZVyEW06gFmMHIj7CKpe5F8m22UMOeLQ8=
X-Google-Smtp-Source: ABdhPJyooSRBNffX2OYV1jgVsZM9h+Rg5u4fSdcU7u4MbNErD9e3yzpFvVUx42I4K4FOiQUMrw6MShg+1ceE1Jt0nyc=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr11421814ual.2.1624015284122;
 Fri, 18 Jun 2021 04:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <YMtYs7LVveYH4eRe@mwanda> <YMtY7nOtqEvTokh7@mwanda>
In-Reply-To: <YMtY7nOtqEvTokh7@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 13:21:13 +0200
Message-ID: <CAMuHMdWw99xv6=HtKFN4mJy_to5xOO-659dc_owR3+mmt8zjMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: Avoid mixing error pointers and NULL
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

On Thu, Jun 17, 2021 at 4:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> These functions accidentally return both error pointers and NULL when
> there is an error.  It doesn't cause a problem but it is confusing and
> seems unintentional.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -124,7 +124,7 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
>                                                  core->flag, &priv->rmw_lock);
>
>         if (IS_ERR(clk_hw))
> -               return NULL;
> +               return ERR_CAST(clk_hw);
>
>         return clk_hw->clk;
>  }
> @@ -174,17 +174,14 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
>         struct clk_init_data init;
>         const char *parent_name;
>         struct pll_clk *pll_clk;
> -       struct clk *clk;
>
>         parent = clks[core->parent & 0xffff];
>         if (IS_ERR(parent))
>                 return ERR_CAST(parent);
>
>         pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> -       if (!pll_clk) {
> -               clk = ERR_PTR(-ENOMEM);
> -               return NULL;
> -       }
> +       if (!pll_clk)
> +               return ERR_PTR(-ENOMEM);

This part I already have, by virtue of
https://lore.kernel.org/r/1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
