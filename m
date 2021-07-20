Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461DA3CF7FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 12:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236458AbhGTJzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 05:55:43 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:42790 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237560AbhGTJya (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 05:54:30 -0400
Received: by mail-ua1-f50.google.com with SMTP id z3so4468176uao.9;
        Tue, 20 Jul 2021 03:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c2RB5e6rlnT9vl2laNQtwsgHtJrL2uS5bXejYhA1v8g=;
        b=T/IZuaXbb8q7A1uhi9wZgGC7ZJeaRCuAwW8d2oNLsoj7AHAX1XV0YBrbcwof8gTN+/
         lqXSTN09geegAferxbu0XHA7W8QXfEHM6b6kKXNR/BvMxHVYpq0hrVHd3ZJqwsTroAik
         9/grKHk05VDyWjDtgcetVZ3akt96Qe47Lq/fjsQ0YJ09rZZWHmV3fTswUqBnXD3NqQzo
         YMCurKyrayYiPQQwjWUD+o9YaEKu1tktjRgW5LX6tEWchYNrFhuxHyfRWu6nt2+zVIZ8
         cmXF3Ecmm1VUEzU89UKN3lvMDNmvDnjdT1W+0eLsQen5OSpEoGaLPkbLfm6fnOz2q4/z
         9Dxg==
X-Gm-Message-State: AOAM531R+WgmN2AndSx3ms0zu1ITodDaNXlGmPrmTeeKQCPMbxCeAYt9
        /SgzDVVfXJLxEKGGZFlA0gKJJofS8SKg37h8kzM=
X-Google-Smtp-Source: ABdhPJyr9yLuIoB1k78ejPEkc4NzfhrPrV+fp7Gnyf1N6j6DHQDxoiWuqkVx7a2t2tsabdi/yHmjYJOzk8DRQs/o2Yw=
X-Received: by 2002:ab0:5a2e:: with SMTP id l43mr30056692uad.4.1626777308746;
 Tue, 20 Jul 2021 03:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Jul 2021 12:34:57 +0200
Message-ID: <CAMuHMdVH+mBWQ1KBNcrhdxoHavWpytczZmUBR_0pXu5AoULgYg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Fri, Jul 2, 2021 at 1:31 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Refactor renesas_sdhi_probe() to avoid increasing numbers of
> sdhi_quirks_match[] entry when we add other stable SoCs like
> r8a779m*.

Cool, then we won't need "[PATCH 04/14] mmc: renesas_sdhi: Add support
for R-Car H3e-2G and M3e-2G"
(https://lore.kernel.org/r/22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be).

>
> Note that the sdhi_quirks_match[] is only needed on
> renesas_sdhi_internal_dmac.c so that of_data of
> renesas_sdhi_sys_dmac.c keeps as-is.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reported-by: kernel test robot <lkp@intel.com> # build fix on RFC

I would drop this tag, as it is basically a test/review comment for
an older version of a patch.

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -406,15 +516,25 @@ static const struct soc_device_attribute soc_dma_quirks[] = {
>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  {
>         const struct soc_device_attribute *soc = soc_device_match(soc_dma_quirks);
> +       const struct soc_device_attribute *attr = soc_device_match(sdhi_quirks_match);
> +       const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
> +       const struct renesas_sdhi_quirks *quirks = NULL;
>         struct device *dev = &pdev->dev;
>
>         if (soc)
>                 global_flags |= (unsigned long)soc->data;
>
> +       of_data_quirks = of_device_get_match_data(&pdev->dev);
> +
> +       if (attr)
> +               quirks = attr->data;
> +

I think the code would be easier to read without the interleaving of
of_device_get_match_data() and soc_device_match() based matching, ...

>         /* value is max of SD_SECCNT. Confirmed by HW engineers */
>         dma_set_max_seg_size(dev, 0xffffffff);
>
> -       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
> +       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
> +                                 of_data_quirks->of_data,
> +                                 quirks ? : of_data_quirks->quirks);

... and without using the ternary operator, like:

    of_data_quirks = of_device_get_match_data(&pdev->dev);
    quirks = of_data_quirks->quirks;

    attr = soc_device_match(soc_dma_quirks);
    if (attr)
            global_flags |= (unsigned long)attr->data;

    attr = soc_device_match(sdhi_quirks_match);
    if (attr)
            quirks = attr->data;

    [...]

    return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
                              of_data_quirks->of_data, quirks);

Regardless, as this doesn't impact functionality:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
