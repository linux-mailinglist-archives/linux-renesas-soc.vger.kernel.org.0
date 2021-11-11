Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E6E44D453
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 10:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhKKJv6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 04:51:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhKKJv6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:51:58 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B1FC061767
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:09 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z34so12817110lfu.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bscmqvKY3qs0pUbbPr6KH9l4LuaJZAV8odiAQTS5aUI=;
        b=bnUqmU9RMckhyuhgB5IouEkMMKDZPTtloMzcZtCFlzc9oHSQjHWMSZ9g+Wtez5SCwE
         6o/5SA/wDnQrD7zIisyn/8zravwFop45fVXuyexDJUop8HQm5UqrRaPzwqI7BxOYdl2i
         YoRNwmzFBxa7d8XmGdvRSCK8KWRAPHo+xGKb31YsZKlCQI5DAhjtkFXnqbm2L/D3zkxQ
         2usJuH14Pokm3gRBpu3v0JHA7Gnajm+0vb2q381LgiKniWd5dZVWsqJ0TxSNXew0c4Lf
         QBFIxJsTpV1ctkbWlyhU7uIAX72NCwWkjsNBYXRdptmnHD7oegOQ+i3Wdp5KIiojqqyQ
         5i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bscmqvKY3qs0pUbbPr6KH9l4LuaJZAV8odiAQTS5aUI=;
        b=jQUHkt61RPNf765pr0GcSB1KKmrwmAY2g4D/pxWbSPLJ+g/eS5UxHoBSU25a7muyYl
         WYEv5r5Rcd5Za7s1quQM7/G06iHc4COuIfH/w5+fTvw1dcPZjKE2ubqvE3s4/aeCOcIn
         gXyxGHbRgf/9TG8IBK5COHnBe1PdBgURAyRBLeTdovAJJRTTJ/R38F7C49LlPvx4Z0yr
         lmaiywNFOjFeSAKd/QiIAFQzuwvTzZ06vsMxxnhbimsKtyllcsdh6sX6W2urbV5TGi73
         5iO853E9D/eaPg9zwU+uLG0nRMzlHE/cNy9M7B/cqew69janmYoxq2US39A6l2QnnFp3
         lNkg==
X-Gm-Message-State: AOAM533mkJt0N3vD4YY3zXvKqnKcuVONgzWAVXk++ehfH0otTU1cH4nj
        uvhMp5KJWcKYF0KWLAdeWf0c6Psk5eUFazL1aHmnvA==
X-Google-Smtp-Source: ABdhPJy6OBQrkaiJBnz0O2C51my2vcC59Rwr/B4LtoL55wvLujU33ENQEZkM16r+cAIxi2G3+vJHVv1orw1v9VSgN+Y=
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr5611593lfg.184.1636624147417;
 Thu, 11 Nov 2021 01:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-20-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-20-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:48:31 +0100
Message-ID: <CAPDyKFr5OXigAF88FR7u2xaGBJ6eQajnq-wAyR2dyEBD-hL4Dg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/21] mmc: sdhi: use dev_err_probe when getting
 clock fails
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
> This is to improve deferred probe in this driver and to keep consistent
> with an up-to-date handling of a soon to be added second clock.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe



> ---
> Changes since RFC v1:
> * new patch
>
>  drivers/mmc/host/renesas_sdhi_core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 4572242f9816..230182de5e88 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -916,11 +916,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         dma_priv = &priv->dma_priv;
>
>         priv->clk = devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(priv->clk)) {
> -               ret = PTR_ERR(priv->clk);
> -               dev_err(&pdev->dev, "cannot get clock: %d\n", ret);
> -               return ret;
> -       }
> +       if (IS_ERR(priv->clk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "cannot get clock");
>
>         /*
>          * Some controllers provide a 2nd clock just to run the internal card
> --
> 2.30.2
>
