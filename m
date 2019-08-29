Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73B6A12F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 09:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfH2Hro convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 03:47:44 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42747 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfH2Hrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 03:47:43 -0400
Received: by mail-oi1-f196.google.com with SMTP id o6so1811700oic.9;
        Thu, 29 Aug 2019 00:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p4LEbbLsvpFF7jH9kHTSE0avC1YlCtP3CflXztbc43s=;
        b=kM4GiVQRNujKYhPPpy/Gu6uzAI9jcPNg3CnFexP6VLJ+1NX44666LnA+XVfDSfjXKu
         nWazwPMwyD8W/JO3CALvZyibaP638HXxGcHl3orKuBQZ77+eFQWicWs4mKa3ShMsyIWe
         mhd0se0DUswxj+wfEm6j97OQS/k6ZHgBTnOzgSSkirM4RHeuKAf6V3PdSseTDrdFJvPC
         Tqb2+BdCDbd8bvTXMoUFxF/VOLjyhIMV4LkgTbjCnWxoRO5LxGIpr3oTYY56Ytp/st0J
         tpv81W6T2dEDXaLFUv72CEdxfnF8x/+adCAtp3oc2sVH4bnXG3Hr8V9kGh8NflxAIQaG
         lfbw==
X-Gm-Message-State: APjAAAV0B9XNZVdHhPxW0o8xMrNvqUQfLgLDCQpUAUAssIMtv7g7TK/A
        goUzVhzWGocHIZkkNdBhV7P897MAjdi76SfXw0wal9hA
X-Google-Smtp-Source: APXvYqyQyUkjAPJJp2g82LOpwiPdkN4Na5zs21h0McVF0Ksd8Ij+wdlFfUg7ih9GsQPN9znYKcpLlmod1GCOFsRIY+M=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr5292700oih.153.1567064862697;
 Thu, 29 Aug 2019 00:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190828185518.4340-1-tszucs@protonmail.ch>
In-Reply-To: <20190828185518.4340-1-tszucs@protonmail.ch>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 29 Aug 2019 09:47:31 +0200
Message-ID: <CAMuHMdWcp-3B7ZZjbyo02ECyzDX_rQxXF645OCutCkjUu_jWaA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhi: fill in actual_clock
To:     =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tamás,

On Wed, Aug 28, 2019 at 9:02 PM Tamás Szűcs <tszucs@protonmail.ch> wrote:
> Save set clock in mmc_host actual_clock enabling exporting it via debugfs.
> This will indicate the precise SD clock in I/O settings rather than only the
> sometimes misleading requested clock.
>
> Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -124,7 +124,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
>         unsigned int freq, diff, best_freq = 0, diff_min = ~0;
> -       int i, ret;
> +       int i;
>
>         /* tested only on R-Car Gen2+ currently; may work for others */
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
> @@ -153,9 +153,11 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>                 }
>         }
>
> -       ret = clk_set_rate(priv->clk, best_freq);
> +       host->mmc->actual_clock =
> +               clk_set_rate(priv->clk, best_freq) == 0 ?
> +                       best_freq : clk_get_rate(priv->clk);

When clk_set_rate() returns 0 to indicate success, it may still have
rounded the requested clock rate, no?
So wouldn't it be better to always call clk_get_rate()?
>
> -       return ret == 0 ? best_freq : clk_get_rate(priv->clk);
> +       return host->mmc->actual_clock;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
