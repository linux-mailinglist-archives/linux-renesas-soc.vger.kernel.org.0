Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38C0C9B87
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 12:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbfJCKCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 06:02:10 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35536 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJCKCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:09 -0400
Received: by mail-ua1-f68.google.com with SMTP id n63so702630uan.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zBQuLmzEEP5mC2BeRTIy+012Xlkl6GcCB3DclJcKQc8=;
        b=YdOPzNeyUypkY4f2+s9Pl9vnLli9mq8zx1/TCiERslbqEEeHfntoU3+ohRn7IM3tyS
         h4zOQfj0G+wk62ij1nf8QZjHa1mo8qclx2QJfxZinXA/Zkf6OHq38HC7WAu839P2C7ix
         qIyvQA4s++l9jjYS6f8E/Dnim/cmIVEtuhEsUpzG8WuhmPDpoS8XNhTjNOgyXbURkOYH
         YdQ9k7j2tl7A8bG/1MP4dCrpLpzvEwNNfvY56xL8e2UBsIT2e45k+THCR42pbXniAbRV
         huhFxtC4VSRd0MH3LROkKNZRJJ840C0Z+4lP6MJFxs9LNwGQeHl1vxsph01uAwXeEQAT
         YCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zBQuLmzEEP5mC2BeRTIy+012Xlkl6GcCB3DclJcKQc8=;
        b=VCals9+3SN5OZ8O6py0dH87Yj7L7iURoNiVEDURp+5nJ4tyM4DW53AVApPfFYtExxM
         6Kt1t6s4r2hTZplIBCmt0xMQxj40Bke1kOxu61dboR7K9RCpqIZZXt9pcxU7sPN0CpLl
         ybiE6cXhGLHgS8DgL+bet47yDY6389yf526tjVsqcLVqIirwcLuj3OocFgZyzV55l7uV
         hfvfiD8xH/G7jeqYG8RMJyXLPC8kfMGfy1BOCfvNnWxwAPvio2hEegWZrg9dv2igSXZh
         3JGN3bLGdZ95IkXPmYOpVRax/4zj1c9tXNmA32JqvZG9l7mNNVvGUVJcOWiSIWH8h+E4
         Y+3Q==
X-Gm-Message-State: APjAAAV4qBXr/zd/Ln0YKj/JqNIRZwhWc6SmQrcy17W4gU2QdCoixPPD
        8ON3bhZITYKcTbkEtLY78eDzMtTPERcSGYbzzijaQw==
X-Google-Smtp-Source: APXvYqwDpqTe8ItD2ulVQunBpElEvgrn4CneFoE5CW5QAPlP41une3yqt6CvFMmGoITPH5SepzqIq7eNuuRlO7Zk0sY=
X-Received: by 2002:ab0:1856:: with SMTP id j22mr4557733uag.19.1570096928603;
 Thu, 03 Oct 2019 03:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191002152946.11586-1-geert+renesas@glider.be>
In-Reply-To: <20191002152946.11586-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:01:32 +0200
Message-ID: <CAPDyKFprzytDRz10GMqwKuCj+9VKhKWprxZpnA0-hVCN7Ldzhg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi: Do not use platform_get_irq() to
 count interrupts
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 2 Oct 2019 at 17:29, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>
>     renesas_sdhi_internal_dmac ee140000.sd: IRQ index 1 not found
>
> Fix this by using the platform_irq_count() helper to avoid touching
> non-existent interrupts.
>
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Add Reviewed-by, Tested-by,
>   - Return failure in case num_irqs is zero, as before.
>
> This is a fix for v5.4-rc1.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 31 +++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index d4ada5cca2d14f6a..234551a68739b65b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -646,8 +646,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         struct tmio_mmc_dma *dma_priv;
>         struct tmio_mmc_host *host;
>         struct renesas_sdhi *priv;
> +       int num_irqs, irq, ret, i;
>         struct resource *res;
> -       int irq, ret, i;
>         u16 ver;
>
>         of_data = of_device_get_match_data(&pdev->dev);
> @@ -825,24 +825,31 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 host->hs400_complete = renesas_sdhi_hs400_complete;
>         }
>
> -       i = 0;
> -       while (1) {
> +       num_irqs = platform_irq_count(pdev);
> +       if (num_irqs < 0) {
> +               ret = num_irqs;
> +               goto eirq;
> +       }
> +
> +       /* There must be at least one IRQ source */
> +       if (!num_irqs) {
> +               ret = -ENXIO;
> +               goto eirq;
> +       }
> +
> +       for (i = 0; i < num_irqs; i++) {
>                 irq = platform_get_irq(pdev, i);
> -               if (irq < 0)
> -                       break;
> -               i++;
> +               if (irq < 0) {
> +                       ret = irq;
> +                       goto eirq;
> +               }
> +
>                 ret = devm_request_irq(&pdev->dev, irq, tmio_mmc_irq, 0,
>                                        dev_name(&pdev->dev), host);
>                 if (ret)
>                         goto eirq;
>         }
>
> -       /* There must be at least one IRQ source */
> -       if (!i) {
> -               ret = irq;
> -               goto eirq;
> -       }
> -
>         dev_info(&pdev->dev, "%s base at 0x%08lx max clock rate %u MHz\n",
>                  mmc_hostname(host->mmc), (unsigned long)
>                  (platform_get_resource(pdev, IORESOURCE_MEM, 0)->start),
> --
> 2.17.1
>
