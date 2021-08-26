Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED773F8D3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Aug 2021 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243206AbhHZRna (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Aug 2021 13:43:30 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:37526 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbhHZRn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 13:43:29 -0400
Received: by mail-vs1-f42.google.com with SMTP id i23so2643079vsj.4;
        Thu, 26 Aug 2021 10:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EaP8H97USi1py9j5WZ3rX1EoctUz2y+NM+vfk1Qh8sQ=;
        b=WA16IkGbhGkHtHso/FaDa7UVGrDRw2MMlOH46jvWjFd0pkylSy3oujAlgnp5VFU7P7
         CtTmm9D4NcVO5xMf+t9Dfef1Yvr0IL+tFdGH3RLQsdchQGs0EFCnbGbpMNfKhy499wck
         5A1rs1yNdNUslyI4AzWyIIKrR1Dr1UQlG/ckNwQlnRPizmjM6hu3OodI+Q6UYXPcoCRZ
         wxNOzzH0hBXn1kIeDx4IG+OZLZ7mAn/98mNMegvG6lB3Gj6rLO7lxH74D8/dBkjYh+ho
         USfHcATvLSnQF8z0GIZmx7qhYrBFO+uz35xOmK4O6o0XJ+mcEoR2ZaNZWn5iLjyAkYhD
         8JZg==
X-Gm-Message-State: AOAM530+w+z8SfSfSo1cz7g5KOIlv8S8haMQB1bg2OauAZ6DPhh+b/xt
        RhfbYFFkQDkHBpqKiBixBSxAOGp11sa42uOgXrc=
X-Google-Smtp-Source: ABdhPJxqA+Fj1ffZwFjnhSgRXx4HPY8vkWEkoAoUUlCZvNRj2BFGZoE7zC7jq/5wqaMiDJcveG3UIMN93bpAVcGCkAs=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3761633vsl.9.1629999761799;
 Thu, 26 Aug 2021 10:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210826141721.495067-1-aford173@gmail.com>
In-Reply-To: <20210826141721.495067-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Aug 2021 19:42:29 +0200
Message-ID: <CAMuHMdV5iTg6yyM5E8OH6basnTxmvS9UrY2V+oxDrBe1kfhiOw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL
 pointer dereference
To:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 26, 2021 at 4:17 PM Adam Ford <aford173@gmail.com> wrote:
> The probe was manually passing NULL instead of dev to devm_clk_hw_register.
> This caused a Unable to handle kernel NULL pointer dereference error.
> Fix this by passing 'dev'.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Fixes: a20a40a8bbc2cf4b ("clk: renesas: rcar-usb2-clock-sel: Fix error
handling in .probe()")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Mike/Stephen: Can you please take this one directly, as we're
already at rc7.
Thanks!

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> @@ -187,7 +187,7 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>         init.ops = &usb2_clock_sel_clock_ops;
>         priv->hw.init = &init;
>
> -       ret = devm_clk_hw_register(NULL, &priv->hw);
> +       ret = devm_clk_hw_register(dev, &priv->hw);
>         if (ret)
>                 goto pm_put;
>
> --
> 2.25.1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
