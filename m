Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA6244D455
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 10:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhKKJwE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 04:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhKKJwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:52:03 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3836C061766
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:14 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 207so10785426ljf.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OCREGG06PLhapCFom87STE1uw55Yr5x9ePMRWOvmT3k=;
        b=J/P1hPH6j7wvhRvFyZd3TqxaZ6OSx5WqY79nSlVHc4q6aeCj4OCVN+lpKr5aO4eqav
         IPFsV0kv/g4BObRIKl9w8qk9UoqVi/8vR/0nRghSEKV4z0cZMzgvCU/vUJ7HbB4o2Y3d
         1qSTNUQddXh+8wvVo08Dz/WCCuaeIEfsODFVrgBdmxHrNzPpnF8nAwkGfo1be2/P1DNp
         Xa6sgTl0U0KkhVEVBO6ghGt/4WR1iUFpPVd4/CI3RhmNeK8iTFleaaIdQB3M8BFB9yx7
         1HSWsHio+2uDFqg0+fkcemqvzpCwM+W5Cjtt7mdn76KfyXVA1YsmlqpdRaqlvEfNuY4x
         j7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCREGG06PLhapCFom87STE1uw55Yr5x9ePMRWOvmT3k=;
        b=YZM1q5WTy45yFQVC7bBkx2EwU21V5smVjhZJ4p/Hx960zWoTmq1Mx5+2n7cKcinwqD
         kiAZc3ye4e93XqcaTDiaHA3rvtkNz/IS7QY88pNWvtpM6/lmx7SkIA4ZRbO/nWt9LhsR
         wpukN5CWJmG+hiGRfnFGfKoLtrdERWW1zSzPprp/AijsP2SrZz1rjhqPXoqfMg6PQwpK
         gxNLO73cA+NjU+Aai0+gj8KLlW/RqHcIebjUjjyHdKamAnUCsAhUWR3kY4WjK7zhyM5X
         Phl7Nu+GWztonUlvpofG2rymM9aUfcKLiYHzXZ6T+hxZVLj3fg1sjNBwcZFJcsuKrKJU
         rgqw==
X-Gm-Message-State: AOAM530PIBTj5fceSIAj6kttESbxfSFFMl+J1LMdJ0e0xZUwsiNJdhZG
        Tuqq+aaFsKki+cUwO+v2Y8gJAX/uuUdEXCSKU4AQLw==
X-Google-Smtp-Source: ABdhPJxkX3V93M0k93HKNu7+qIoL9WfO3AxPfyLW/zo4eZiEbynnSydtnx20bP3Pjol+PTMrmXAci3syYf02ZC4ce3U=
X-Received: by 2002:a2e:7114:: with SMTP id m20mr5714665ljc.229.1636624153256;
 Thu, 11 Nov 2021 01:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-21-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-21-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:48:36 +0100
Message-ID: <CAPDyKFrW1T-4UeS6R2j8+2LKJ5D0iELXJ_Q+Mmq=Mk6CfjDPQA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] mmc: sdhi: parse DT for SDnH
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 10 Nov 2021 at 20:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> If there is a SDnH clock provided in DT, let's use it instead of relying
> on the fallback.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>
> Changes since RFC v1:
> * added tag from Geert
> * use dev_err_probe()
>
>  drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 230182de5e88..db053fba5330 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -919,6 +919,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (IS_ERR(priv->clk))
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "cannot get clock");
>
> +       priv->clkh = devm_clk_get_optional(&pdev->dev, "clkh");
> +       if (IS_ERR(priv->clkh))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(priv->clkh), "cannot get clkh");
> +
>         /*
>          * Some controllers provide a 2nd clock just to run the internal card
>          * detection logic. Unfortunately, the existing driver architecture does
> @@ -957,7 +961,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 dma_priv->dma_buswidth = of_data->dma_buswidth;
>                 host->bus_shift = of_data->bus_shift;
>                 /* Fallback for old DTs */
> -               if (of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
> +               if (!priv->clkh && of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
>                         priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
>
>         }
> --
> 2.30.2
>
