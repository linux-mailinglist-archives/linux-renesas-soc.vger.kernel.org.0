Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C687244E775
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhKLNhu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:37:50 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:39688 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLNhu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:37:50 -0500
Received: by mail-vk1-f180.google.com with SMTP id 84so5117098vkc.6;
        Fri, 12 Nov 2021 05:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgBIX6Gzq10Uj5C6HNQgMZtS7+v2L10cHeJjjK+3VKs=;
        b=qP+UxVcqEhbzQ0d+Le+eMsNLHAbQe2YeOYy/kz7XfL227S6rLcH793MuSa88Lm6m7w
         T/jexkOS0SzJAzDY0FKDMiIX+5BrAl1CM1do2CDbptiPf1Tp7cv4bNxTI6OmWZrDiXCN
         w2EG2sxEFAnABpF247lD6bROQze9ZfHj0KGJ0pZxqR2fACekE0aTXi4c0BW+nDyiIw8v
         aBiE/iqQ5sRXHcTy+z/oBCkPy5IvipEER5io1xyL9UUWxXxX1aDElLWubOcFM1jErnEe
         heGTHGh1aKAOzEDUe/dc5rxQGr45ObwUdm4yaz3EM8wnqWs9KfezjYGRMVSigo/0UjVw
         0dSQ==
X-Gm-Message-State: AOAM5302Cf9Es5p1Mg53jSFVZfRuKsYjhyhD5a1ph6tFsX9DDMmFw1sY
        QHQYUfugz16SoDdW9QO1s9vkMH9x7vFT3g==
X-Google-Smtp-Source: ABdhPJzY/EAPopkq2GDrfLAqLCWyQfqDvJxHgjXUvteLuweRS6cMZlH3DVWWghkNqkbMpPY0c/nHUA==
X-Received: by 2002:a05:6122:201b:: with SMTP id l27mr23847268vkd.1.1636724098883;
        Fri, 12 Nov 2021 05:34:58 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id q9sm3983729vkn.44.2021.11.12.05.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:34:58 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id bc10so5106774vkb.1;
        Fri, 12 Nov 2021 05:34:57 -0800 (PST)
X-Received: by 2002:a05:6122:20a7:: with SMTP id i39mr22979125vkd.15.1636724097576;
 Fri, 12 Nov 2021 05:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-21-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-21-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:34:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-Eow6LL2ks46KqDYPwkxvLKpHvGYiWNWc_qCFEUL1zQ@mail.gmail.com>
Message-ID: <CAMuHMdW-Eow6LL2ks46KqDYPwkxvLKpHvGYiWNWc_qCFEUL1zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 20/21] mmc: sdhi: parse DT for SDnH
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> If there is a SDnH clock provided in DT, let's use it instead of relying
> on the fallback.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

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

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
