Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC91F7F930
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 15:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394017AbfHBNZ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 09:25:29 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:36096 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394352AbfHBNZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 09:25:23 -0400
Received: by mail-ua1-f65.google.com with SMTP id v20so29677122uao.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Aug 2019 06:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DpmRsZ8XRLjkBgn2eysbWMYPveZeqSIdsBj5/7g7Hm8=;
        b=u5rXuwP6gZv6gTacH+dWvofWdRIX1Apo6hRnLvdQN7VyWXM1ez1NIJ0CSO98O7y7Oa
         CK+UPkguthJ8HppDkaOk/8ncEe2VNcQzqXdqBjsmmJr6jrCRMDKjvFZyF25nQBrooJi3
         UhGlSJKbpLDBBUi2uGg2zfpJhF0xacqr0Ro5gv/JEd53Dwn+ZD1r1IyquX4X9GdcZpD9
         k4lYgsZBCLjkhxdDNLnwmnT1Qr435zJQse4OrzhYiDifTzHdsW6NN2jJ2H40KXWQhlD1
         UEUBD6FkB/V+Ui1SZhOm/406beISscArdccdHMX+ycYByaMYyj6FODhZjdKdDTkTWiha
         VcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DpmRsZ8XRLjkBgn2eysbWMYPveZeqSIdsBj5/7g7Hm8=;
        b=Ier4ibx/0Gm2vhC0AcCZFKkvsFZTZdGLz9IDJj8DUe+rJiO9MgAdNDM8oQi//OMflv
         3NQRmKVm9/tvUOp03vRaeSuW1jg33Ps2Ph6YvxxNmpPYaJM22MlGAPOqFNmwm5tRnCaU
         mAZNNgKwuqFV8LAW7FI0BBsyAtW5bCXou4PuAyy+nm9E2FLlygXO+/l/pUY11lEwRtg3
         C6ZSSdKj/202EfJqjU4IPgWqekWxhQIVe3w2+Qy5ncdhJQWxy4MllWh8Ytext2gsslZU
         0zK6xKQfiydFZkHkYukU1uYqYeNSdRifwvsTuNl0r/u966bglD1/VueXXQWziRGpT64l
         YIDA==
X-Gm-Message-State: APjAAAU10v89QUHXC00L+KcmHJUziKqGq14LzqrWXW4mZSjWe1yxP1Od
        wlLF5eqHI9dVZcGZQzXnehWRn3XHpObMmWnAelWtrA==
X-Google-Smtp-Source: APXvYqwPKY9lyrjODfvoE3nMCjdP6RU7XHZGY3jnctVCYxbcaeQLEbkx1HjksQ4/tN0jH1NX6N9oDR8xpFujtbjwlQI=
X-Received: by 2002:ab0:4108:: with SMTP id j8mr80695504uad.104.1564752322958;
 Fri, 02 Aug 2019 06:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu> <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 2 Aug 2019 15:24:46 +0200
Message-ID: <CAPDyKFotQvTAC8OVVRiEqLc0ij3XNVdL3eyNHioK0YEWxvER0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: leave clock handling to runtime PM if enabled
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 31 Jul 2019 at 18:17, Ulrich Hecht <uli+renesas@fpond.eu> wrote:
>
> This fixes a clock imbalance that occurs on Renesas systems because the S=
D
> clock is handled by both runtime PM and the hardware driver. After a
> suspend/resume cycle both enable the same clock, resulting in an enable
> count of 2 even if the clock is only used by one device.
>
> See https://www.spinics.net/lists/linux-mmc/msg44431.html for details.
>
> This patch removes the clock handling from the driver's runtime PM
> callbacks and turns the clock off after probing if the device has a power
> domain attached.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> ---
>  drivers/mmc/host/tmio_mmc_core.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 31ffcc3..733ff96 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1260,9 +1260,14 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_hos=
t)
>         /* See if we also get DMA */
>         tmio_mmc_request_dma(_host, pdata);
>
> -       pm_runtime_set_active(&pdev->dev);
> +#ifdef CONFIG_PM
> +       /* PM handles the clock; disable it so it won't be enabled twice.=
 */
> +       if (_host->clk_disable && pdev->dev.pm_domain)

Hmm.

This seems to work for most cases of yours, but it's fragile, because
how do you know that the pm_domain above is managing the clock? You
don't.

> +               _host->clk_disable(_host);
> +       pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>         pm_runtime_use_autosuspend(&pdev->dev);
> +#endif
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> @@ -1325,7 +1330,8 @@ int tmio_mmc_host_runtime_suspend(struct device *de=
v)
>         if (host->clk_cache)
>                 host->set_clock(host, 0);
>
> -       tmio_mmc_clk_disable(host);
> +       if (!dev->pm_domain)
> +               tmio_mmc_clk_disable(host);
>
>         return 0;
>  }
> @@ -1340,7 +1346,9 @@ int tmio_mmc_host_runtime_resume(struct device *dev=
)
>  {
>         struct tmio_mmc_host *host =3D dev_get_drvdata(dev);
>
> -       tmio_mmc_clk_enable(host);
> +       if (!dev->pm_domain)
> +               tmio_mmc_clk_enable(host);
> +
>         tmio_mmc_hw_reset(host->mmc);
>
>         if (host->clk_cache)
> --
> 2.7.4
>

I am going to think a bit more about this, but at this point, my
gut-feeling is that may need to add some helper functions to let genpd
and/or the pm_clk framework, to share some internal information with
drivers.

Kind regards
Uffe
