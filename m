Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B053B4267
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 13:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhFYLXc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 07:23:32 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:33426 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhFYLXb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 07:23:31 -0400
Received: by mail-ua1-f53.google.com with SMTP id x22so3437999uap.0;
        Fri, 25 Jun 2021 04:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N3qim+VC6+xUi6b8xxn/Fdr1qaUBAWRr1SNW9ZZVgm8=;
        b=gfKp9P5od6E0Jzr92FFGq1w1UvoFyPdqGznLaGBSBTlKbAYW/i6T+SUfAb0YH/W2/f
         puFwVf3bxnztVEmJ5bjOlvhg1UPtu++V0cDEsowIsV1ZhpMzqBE0aF6/6/JASAbkmUDt
         QgzlH1HT4bD1Qpbd1N8E1IK+dpEL59EqGj+mb0ecekwj6kY8E2X3grB6T6PQupCzVPeW
         0hg1ezB5sDS62z+HkvxURYaBctnUYTWNPN7O4tZFCrqrPLEUl2VPTMzBonTEc3WEMtEb
         ViJW8fPDyLzQ6waSQN2l5vPxK6uW95ksI/SZsE8KBjkf2CSZ6sht3Ak80tcP+PEkwnNM
         3gdA==
X-Gm-Message-State: AOAM533NJBllwOmLFXqGN81xHK5QmrVAz9pHlBtrcywBqFeekldUyYlw
        oWZEZn9g3g89gYvU/Flkln+LE3Yx3z4uygJqoMEv0TlkKybFaw==
X-Google-Smtp-Source: ABdhPJyvtzCwpq2wCDVTh+VrObP6YMUDjEkEIr6xFlP5Dfv2wc0myxYnXqm4nGvFqgCpMmzFSYAz8KCZs/ULv2rQhrI=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr10605166ual.2.1624620070853;
 Fri, 25 Jun 2021 04:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 13:20:59 +0200
Message-ID: <CAMuHMdWmM+d2V7miepoptmaP7mmbtaWNBkJp3LqbhaiQ+18JwA@mail.gmail.com>
Subject: Re: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Jun 25, 2021 at 9:56 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Refactor of_device_id.data to avoid increasing numbers of
> sdhi_quirks_match[] entry when we add other stable SoCs like
> r8a779m*.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -941,13 +910,8 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
> -       { .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
>         { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> -       { .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
> -       { .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
> -       { .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
> -       { .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
>         { /* Sentinel. */ },
>  };
>
> @@ -957,6 +921,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         struct tmio_mmc_data *mmd = pdev->dev.platform_data;
>         const struct renesas_sdhi_quirks *quirks = NULL;
>         const struct renesas_sdhi_of_data *of_data;
> +       const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
>         const struct soc_device_attribute *attr;
>         struct tmio_mmc_data *mmc_data;
>         struct tmio_mmc_dma *dma_priv;
> @@ -966,11 +931,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         struct resource *res;
>         u16 ver;
>
> -       of_data = of_device_get_match_data(&pdev->dev);
> +       of_data_quirks = of_device_get_match_data(&pdev->dev);
> +       of_data = of_data_quirks->of_data;
>
>         attr = soc_device_match(sdhi_quirks_match);
>         if (attr)
>                 quirks = attr->data;
> +       else
> +               quirks = of_data_quirks->quirks;

Please do not use "else" statements in soc_device_match()-based
quirk handling, as that makes it less trivial to remove the quirk
handling later.

I.e. move "quirks = of_data_quirks->quirks;" up, before the call
to soc_device_match().

>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
