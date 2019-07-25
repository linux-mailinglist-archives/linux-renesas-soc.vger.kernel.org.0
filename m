Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 347ED74FE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 15:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390290AbfGYNoS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 09:44:18 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34057 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390285AbfGYNoR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 09:44:17 -0400
Received: by mail-vs1-f68.google.com with SMTP id m23so33748282vso.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2019 06:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4bEfkUUJYfGvI6TKW6ozHty+vZn220gLxXD+QbuwkE=;
        b=iKz+5sz3lDIsAPShxvIuZPW5WFrpsRecZP4JHvtCJ5xFKGT5WCQW0SUWPxEHTF9dwa
         HQkhuc9EhuQ/uo/FaGW8AzVVGS1R0BrAmDH4/ysvbAquL+FfIKmmk5mg7hCOY8ZR3sA3
         r2ioLVQpTtYzFsvAclhX+ukvMNeL37NFVB9x4Wpg7dZPUOo1tuca49ACji8I34xiKBC3
         daE24Y1Wm9rcmpYJa1unIlTECQKMWTp5HuSyZpXKkhZjAl9bjorN41of1HBNIqfserEW
         DT8dVEUJYcmug1cfwy2fcUlq7tKEpO2Fv/gccMeIFRDhTdlOj2E6Sr5ffE4wjOQJapEv
         LJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4bEfkUUJYfGvI6TKW6ozHty+vZn220gLxXD+QbuwkE=;
        b=SD+Mdq1TYgQOEb2wwhroVZP7sQQXfDyk2h8OphPz4qOAyRBDmHMUcA0m7E1uXFkEc7
         AYB+Q7IYl8czXyDNVp6btFyucLb0COpDk8F/OW/owX2jONjyGoIeO7BDUVwYEL3mThW+
         H1hPctL49iLxAaaQdgPwvlOTnT/m3kep6xWzCpEopILSjC6CKk8MHRy3HECMzXb1TtFW
         /7QjYprswaYiznUZDJLr2GNLiGBZCv8A3+6bVjs+HtPiYsKeBXjcUQKk7GHzj9/SgvhI
         ZN54jQoEtlwBh7nFBkdgQA7S4czz+JbBmCrwkEbWcPfw4kPhOZXeJt8mSyBB8Dq4OhAX
         P2fg==
X-Gm-Message-State: APjAAAVr5Ffu3dDX6JmcYzr3Ut2mSnW5EdnqheUE5/ytYLmW+QPjvSOd
        jf25YZkACYWhg7gL+EaXc+H+XGbO7jWV34E85/lADw==
X-Google-Smtp-Source: APXvYqwsN3NYipZ2L8tQzc9xLMlMYic80Y3TsG8VamwC6SFVel/aQctyGDJPPeLXxRUhndnucYPhTHxT68Biqy/IzKU=
X-Received: by 2002:a67:e454:: with SMTP id n20mr57354696vsm.34.1564062256550;
 Thu, 25 Jul 2019 06:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu> <1563289264-26432-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1563289264-26432-2-git-send-email-uli+renesas@fpond.eu>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 25 Jul 2019 15:43:40 +0200
Message-ID: <CAPDyKFq2i0pRKGtMA6YESpKOAAzK-enhW7fkT6=63Ad2mQGmJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: tmio: leave clock handling to PM if enabled
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 16 Jul 2019 at 17:01, Ulrich Hecht <uli+renesas@fpond.eu> wrote:
>
> This fixes a clock imbalance that occurs because the SD clock is handled
> by both PM and the hardware driver.
> See https://www.spinics.net/lists/linux-mmc/msg44431.html for details.

This is a generic problem, when a device are being attached to a genpd
and when the genpd has got the ->stop|start() callbacks assigned, as
to manage device clocks.

Can you try to describe this problem a little bit more in detail, as I
think that's important to carry in the change log.

>
> This patch removes the clock handling from the driver's PM callbacks and

runtime PM callbacks and/or system PM callbacks?

> turns the clock off after probing.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/mmc/host/tmio_mmc_core.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 31ffcc3..26dcbba 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1260,9 +1260,14 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         /* See if we also get DMA */
>         tmio_mmc_request_dma(_host, pdata);
>
> -       pm_runtime_set_active(&pdev->dev);
> +#ifdef CONFIG_PM
> +       /* PM handles the clock; disable it so it won't be enabled twice. */
> +       if (_host->clk_disable)
> +               _host->clk_disable(_host);

The clock managed here, is that the same clock as being managed by
genpd's ->stop|start() callbacks?

> +       pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>         pm_runtime_use_autosuspend(&pdev->dev);
> +#endif

So what happens if you have CONFIG_PM set, but the device doesn't have
a genpd attached?

I am guessing the driver should handle the clock in such scenario, right?

>
>         ret = mmc_add_host(mmc);
>         if (ret)
> @@ -1302,20 +1307,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
>
>  #ifdef CONFIG_PM
> -static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
> -{
> -       if (!host->clk_enable)
> -               return -ENOTSUPP;
> -
> -       return host->clk_enable(host);
> -}
> -
> -static void tmio_mmc_clk_disable(struct tmio_mmc_host *host)
> -{
> -       if (host->clk_disable)
> -               host->clk_disable(host);
> -}
> -
>  int tmio_mmc_host_runtime_suspend(struct device *dev)
>  {
>         struct tmio_mmc_host *host = dev_get_drvdata(dev);
> @@ -1325,8 +1316,6 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
>         if (host->clk_cache)
>                 host->set_clock(host, 0);
>
> -       tmio_mmc_clk_disable(host);
> -
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_suspend);
> @@ -1340,7 +1329,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
>  {
>         struct tmio_mmc_host *host = dev_get_drvdata(dev);
>
> -       tmio_mmc_clk_enable(host);
>         tmio_mmc_hw_reset(host->mmc);
>
>         if (host->clk_cache)
> --
> 2.7.4
>

Kind regards
Uffe
