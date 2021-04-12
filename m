Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1E735BFC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 11:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237429AbhDLJGk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 05:06:40 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:37589 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239393AbhDLJCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:02:47 -0400
Received: by mail-vs1-f43.google.com with SMTP id 2so6264518vsh.4;
        Mon, 12 Apr 2021 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w0nzjzfCk4z/DdLip364m435OvUY4gxFoWEexjtunJU=;
        b=sJb4HvFHls/K0miarzNokuya7Jg6kF3OhflM9ibdCnsPNh2q4zCp8UeKXIX/vDdceA
         Drw7Oa0ynTF85R2nfk+lMS+zb8GlvazZs/NQg9g4pUbPVNsAH4wk2Qc7ArpooiE+stxR
         pjUgyJxphJkyzCtCVNnb2TphFh4sZgcVEreWXqbvHEJw7Ay4y3XcRcMyN9JW80ScwnAo
         hQiU566czmZjPoGoZpyViKV1bS94YZ6GfPN2AHcILFbGPLSmQAtX+zsWvh/xmhl81blc
         ybWPpwY/2eilfIQcWJysdFKnmI6h1iQ3kI5AnbqoD/mRdqz0sVHNjALK/Nueq+hF0qyq
         +aSw==
X-Gm-Message-State: AOAM530LleXCVfjV4YldwMWpJC9WmCMXTiEijUki1g4T3hj7qHl6QbVH
        7T5LNbkVQGYr1vNMJl6BVM+dKuUPXKp6UfgdRRw=
X-Google-Smtp-Source: ABdhPJxPezqnGLgade3Fg9fCpJVbM8VsEsOkFluSzHkUwjr3zbmXkNKrQ+8OVtBaJ9BEKnKX3UuVpjWBCY0a0EWWBbM=
X-Received: by 2002:a67:f5ca:: with SMTP id t10mr18301625vso.40.1618218149193;
 Mon, 12 Apr 2021 02:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210412075053.28727-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20210412075053.28727-1-dinghao.liu@zju.edu.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 11:02:17 +0200
Message-ID: <CAMuHMdVBh7D+QH4ikiAbG8b0UGmH__43MhKwXXAMwYS5JUPy8Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Fix error handling in rcar_usb2_clock_sel_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dinghao,

On Mon, Apr 12, 2021 at 9:51 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
> When clk_get_rate() fails, a pairing PM usage counter decrement
> and disable is required to prevent refcount leak. It's the same
> for the subsequent error paths. When of_clk_add_hw_provider()
> fails, we need to unregister clk_hw.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Thanks for your patch, which looks correct to me.

> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> @@ -180,7 +180,8 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>
>         if (!priv->extal && !priv->xtal) {
>                 dev_err(dev, "This driver needs usb_extal or usb_xtal\n");
> -               return -ENOENT;
> +               ret = -ENOENT;
> +               goto pm_put;
>         }

As the code above doesn't rely on the device being powered yet, you
could move the pm_runtime_{enable,get_sync}() calls below the clock
checks instead.

>
>         platform_set_drvdata(pdev, priv);
> @@ -194,10 +195,23 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
>         priv->hw.init = &init;
>
>         clk = clk_register(NULL, &priv->hw);
> -       if (IS_ERR(clk))
> -               return PTR_ERR(clk);
> +       if (IS_ERR(clk)) {
> +               ret = PTR_ERR(clk);
> +               goto pm_put;
> +       }
> +
> +       ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &priv->hw);
> +       if (ret)
> +               goto clk_unregister;
> +
> +       return 0;
>
> -       return of_clk_add_hw_provider(np, of_clk_hw_simple_get, &priv->hw);
> +clk_unregister:
> +       clk_hw_unregister(&priv->hw);

The error path can be simplified by replacing the call to clk_register()
by a call to devm_clk_register(), to match the style of the other
initialization steps.

> +pm_put:
> +       pm_runtime_put(dev);
> +       pm_runtime_disable(dev);
> +       return ret;

This part has to stay, of course.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
