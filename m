Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8714E3A99B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhFPL7T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:59:19 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:47047 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhFPL7T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:59:19 -0400
Received: by mail-vs1-f52.google.com with SMTP id z15so838715vsn.13;
        Wed, 16 Jun 2021 04:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6dEULrRQ8uXvER/nUGrYSi+bBawcYQZSbgmeM/kVt4s=;
        b=bZAAO4D8YcuXOqaC3TF6obBNegVEGFWRmMMD1dckMVAY5cmvsKeBYkPFYKkTU1/FfE
         bAES0NJz8kXJqIHHfuvzsTxbIyJ7ywIuA0tERvup7sJIUcr1p01sE4jPne+rjDcJOorl
         lJi2/YcCv5AvaUsAhniZ9SBEUsG9JWiOIx8ZhFuJSP3lsvlSo0zNvMBFNjAFOaQRD55A
         lV8k6Z1ssnZFXMpsFY2l0p3YZAv3K+J1bRU4E99DueZk5eCe8nSR5hF4yPGGSElFu0so
         w/vpP/+/GoQ5rVVKOyhO1Ns5u+v7WSeWarLed/p51yl+0RIE10KJcFHYC1cKxJyGYZh7
         1QpQ==
X-Gm-Message-State: AOAM533Ti+jw6A+5PNdBkeHB13cP2Fr5HzDfgMm8Bx7l0lK4UHa7SnsH
        it+QydIqD4xe3G/zus5JZ/allzsU54ykNZDRCbUqD7pSCtYxAg==
X-Google-Smtp-Source: ABdhPJzm0htqvNm/teKEG3kWMWwOLpT90lcsoLpNuw0zW6q3nRp03IxLxhRxDxKSkhFMio1uthXQ7JiqTpwk4smCcPA=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr10562353vsr.40.1623844632518;
 Wed, 16 Jun 2021 04:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <1623749970-38020-1-git-send-email-yang.lee@linux.alibaba.com> <1623749970-38020-2-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1623749970-38020-2-git-send-email-yang.lee@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jun 2021 13:57:01 +0200
Message-ID: <CAMuHMdW_5Nec7p-+msKyvt9Tubd8Ag2gj+qqc+SCG50sPK7EYw@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] clk: renesas: fix return value and unused assignment
To:     yang.lee@linux.alibaba.com
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yang,

On Tue, Jun 15, 2021 at 11:39 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> Currently the function returns NULL on error, so exact error code is lost.
> This patch changes return convention of the function to use ERR_PTR()
> on error instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/clk/renesas/renesas-rzg2l-cpg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> index 1fcea17..5bc7e87 100644
> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -183,7 +183,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>         pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
>         if (!pll_clk) {
>                 clk = ERR_PTR(-ENOMEM);
> -               return NULL;
> +               return clk;
>         }

Why not simply "return ERR_PTR(-ENOMEM);"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
