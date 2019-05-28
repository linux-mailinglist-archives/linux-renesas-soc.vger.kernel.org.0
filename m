Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2042C1BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 10:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfE1Ixc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 04:53:32 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42242 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfE1Ixc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 04:53:32 -0400
Received: by mail-ua1-f68.google.com with SMTP id e9so7517000uar.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2019 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xchp1Fh0EF7XuLzS0G/bR655Y1y9gCu7TStLp1bR9ZY=;
        b=n0buMJ40YR10Yjp/ZspVoheRtegFp4v0i+wRs+E8mIxuMw9nUUg/BxXMadwapa+DuI
         NwLbkQ39AWeETt3ig+0B60SNN40KdEo3ETsBhoclhV0t10DBpL3iObAjmNQ9JNigRiAp
         uRNLvqtbm4adMbgsfuHi3TzaKOsIZUh8EYvZE9JTvvKwIuIBMdKDiNtnNqcdXIGKtwuO
         KL4lGraCieDjCA1/4gHtbERypY3oB3E502V71365Q2LuMasyH34E2/wRQnusFI+LwoWi
         7zXY4ImUljWsiU53rNpI3mxKgU/zylP149EZKJl0zs6DqxZEZLhtEgB2zAOyTFsrPit1
         WkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xchp1Fh0EF7XuLzS0G/bR655Y1y9gCu7TStLp1bR9ZY=;
        b=QZeSiZ71yrL23EcoZjt/Ng7cBBJUG73FAcUm4oJ8jeCH9exZAZebKuTZDhYlekxo2E
         EBTPGYpGb/HrzGLyuSi6jUis+/R7vjB0wAXovCJugf6YdjQO/637sYZxbkcT0cCJQXS6
         azYehAdY/t/OwkWsBqylIsbCb+5gXX0kYie1d9kKvf5US6S6q4nCU6wAukc7lUz1ydvO
         XFNgHEjYaVtehtUimjGxQlcX7B3JMfUJzAKSFhj0mffErRgWPvqhBNw6uReWElkkbzLw
         vjXX53WxaQTJZ+4cjQBzozt0b+NKVh1j/2EThedwmnFDXz9FlJssg1UENZmgwOudSchV
         AEeg==
X-Gm-Message-State: APjAAAWl/OdbN9Lh6pGlWbkAmYv1RLZsDxDrqu6tZ29y5euz6iEQMKcJ
        9F7Hxm0KVOyuaiP9UcjWy+H2fqssTd83SSVMnInC1SiG
X-Google-Smtp-Source: APXvYqwLMyZj9OM4jkhOUFNJZiiMsWMgM69CKybhUQBlfDVqkkXDEWLMlDOpkA+I0mZRhkFp/BeHDjRvwEDTVU4S7o4=
X-Received: by 2002:ab0:7453:: with SMTP id p19mr23974458uaq.15.1559033610738;
 Tue, 28 May 2019 01:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 28 May 2019 10:52:54 +0200
Message-ID: <CAPDyKFq9eynLBSK0QhW01rjndNWLeq7ZMaj8nJwv66oBQtRy1Q@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver implementations
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Apr 2019 at 00:29, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Both the Renesas and Uniphier implementations perform actions which
> affect runtime PM before calling into the core tmio_mmc_host_probe()
> which enabled runtime PM. Move pm_runtime_enable() from the core and
> tmio_mmc_host_probe() into each drivers probe() so it can be called
> before any clocks or other resources are switched on.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c |  6 ++++++
>  drivers/mmc/host/tmio_mmc.c          |  5 +++++
>  drivers/mmc/host/tmio_mmc_core.c     | 11 +++++++++--
>  drivers/mmc/host/uniphier-sd.c       |  3 +++
>  4 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 5e9e36ed2107a01c..db73f9f1b186f0ff 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -770,6 +770,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         /* All SDHI have SDIO status bits which must be 1 */
>         mmc_data->flags |=3D TMIO_MMC_SDIO_STATUS_SETBITS;
>
> +       pm_runtime_enable(&pdev->dev);
> +
>         ret =3D renesas_sdhi_clk_enable(host);
>         if (ret)
>                 goto efree;
> @@ -850,6 +852,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  efree:
>         tmio_mmc_host_free(host);
>
> +       pm_runtime_disable(&pdev->dev);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_probe);
> @@ -861,6 +865,8 @@ int renesas_sdhi_remove(struct platform_device *pdev)
>         tmio_mmc_host_remove(host);
>         renesas_sdhi_clk_disable(host);
>
> +       pm_runtime_disable(&pdev->dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index 93e83ad25976e756..8539e10784b40961 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -172,6 +172,8 @@ static int tmio_mmc_probe(struct platform_device *pde=
v)
>         host->mmc->f_max =3D pdata->hclk;
>         host->mmc->f_min =3D pdata->hclk / 512;
>
> +       pm_runtime_enable(&pdev->dev);
> +
>         ret =3D tmio_mmc_host_probe(host);
>         if (ret)
>                 goto host_free;
> @@ -191,6 +193,7 @@ static int tmio_mmc_probe(struct platform_device *pde=
v)
>         tmio_mmc_host_remove(host);
>  host_free:
>         tmio_mmc_host_free(host);
> +       pm_runtime_disable(&pdev->dev);
>  cell_disable:
>         if (cell->disable)
>                 cell->disable(pdev);
> @@ -207,6 +210,8 @@ static int tmio_mmc_remove(struct platform_device *pd=
ev)
>         if (cell->disable)
>                 cell->disable(pdev);
>
> +       pm_runtime_disable(&pdev->dev);
> +
>         return 0;
>  }
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 130b91cb0f8a3fd1..26c148d3c8a2e655 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1152,6 +1152,15 @@ void tmio_mmc_host_free(struct tmio_mmc_host *host=
)
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_free);
>
> +/**
> + * tmio_mmc_host_probe() - Common probe for all implementations
> + * @_host: Host to probe
> + *
> + * Perform tasks common to all implementations probe functions.
> + *
> + * The caller should have called pm_runtime_enable() prior to calling
> + * the common probe function.
> + */
>  int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  {
>         struct platform_device *pdev =3D _host->pdev;
> @@ -1260,7 +1269,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host=
)
>         pm_runtime_set_active(&pdev->dev);
>         pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
>         pm_runtime_use_autosuspend(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
>
>         ret =3D mmc_add_host(mmc);
>         if (ret)
> @@ -1296,7 +1304,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *hos=
t)
>
>         pm_runtime_dont_use_autosuspend(&pdev->dev);
>         pm_runtime_put_sync(&pdev->dev);
> -       pm_runtime_disable(&pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
>
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-s=
d.c
> index 91a2be41edf6196b..49aad9a79c18d24a 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -631,6 +631,7 @@ static int uniphier_sd_probe(struct platform_device *=
pdev)
>         host->clk_disable =3D uniphier_sd_clk_disable;
>         host->set_clock =3D uniphier_sd_set_clock;
>
> +       pm_runtime_enable(&pdev->dev);
>         ret =3D uniphier_sd_clk_enable(host);
>         if (ret)
>                 goto free_host;
> @@ -652,6 +653,7 @@ static int uniphier_sd_probe(struct platform_device *=
pdev)
>
>  free_host:
>         tmio_mmc_host_free(host);
> +       pm_runtime_disable(&pdev->dev);
>
>         return ret;
>  }
> @@ -662,6 +664,7 @@ static int uniphier_sd_remove(struct platform_device =
*pdev)
>
>         tmio_mmc_host_remove(host);
>         uniphier_sd_clk_disable(host);
> +       pm_runtime_disable(&pdev->dev);
>
>         return 0;
>  }
> --
> 2.21.0
>
