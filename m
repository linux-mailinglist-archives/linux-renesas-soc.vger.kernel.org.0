Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D73484FF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jan 2022 10:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbiAEJYR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jan 2022 04:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbiAEJYP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 04:24:15 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F974C061785
        for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jan 2022 01:24:15 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f5so159419807edq.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jan 2022 01:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZAhL8Z5rng0WZNy2ynW2iZqVPg+qWEaR8nX4oo1zQU=;
        b=pUND0ycnRiGiPxx6TpuN8kVUUBkLax1m/IqBdhKhthNhTBimoM3UuAogqAhYXCxK11
         oLt2A04bYIwzzgcfEPg8yqJTrVono8AGKFf53GbYoXApyPhKYJWXe1KDDOHLPmPuEkqt
         zzkhAkicsYYOheKEEVRXqdJWxbUm4msfQ1EHXuHdmLKU/3hP8QGif1aK+pQ/f1Q0nkmW
         ALhR4HIw8L5xYreiJJ6ipFWl8CDAxBfotFfmSbVfPBJvnFTRFJV+78lqHQN3bp/AcD8c
         cEohFB+R7dtIgWjfmqT/Vy8oc2YpZz/7iIfZ4a5AIQiogWPssJAyFGZ8VQq2V1ekKodJ
         g6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZAhL8Z5rng0WZNy2ynW2iZqVPg+qWEaR8nX4oo1zQU=;
        b=xxaNQXSPWGKkobibhb2uDKlVgV4tXEPxpZGumuqRnmcIRC8g9HBn2ejfRSBtki/E8R
         kiRcTxYYrzOOjY1q4EJHryHPoRBDgIZKAQbZ7kW0Tf8hHLYZnAvNTDBY19AmqTDazM6m
         UZhak4joMMo2q/t+uQ/P4p56W/IuYUBHaD8CcYEd877NWNKFlszBbIu7FIslyyeHAW0h
         lri7WTe70gTy1bn+9JGvK47hRpT+yXx2AFLQ8xhc5YzZXf+Ya+FyhNLlzAzkukNgrFGF
         KeZkxyRydzZtjaplRdWmbuCu3CK+vWd26WPb8y902c1MhXunx5FSuscKtjI7eW27b5PT
         rjqw==
X-Gm-Message-State: AOAM533/eO9XHrzkLygVDiJI52jX91btl9rAFTX0rKh0MsdJylZMqZBo
        Q9OjeG8wdkoGtOzS1DzNWl2hiVuHS9ejY/LVjLLzk0q/n8Y=
X-Google-Smtp-Source: ABdhPJyfx7kDEB6a+g4pnomAPfhLVnL8TwNUhADSs1P6ZZzCMT2lPQxF7hDvyfVtsYAt/Y8XbPCv6BcJsUfrLsMrBlk=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr41387622ejb.492.1641374653771;
 Wed, 05 Jan 2022 01:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20211222171915.9053-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211222171915.9053-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211222171915.9053-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Jan 2022 10:24:03 +0100
Message-ID: <CAMRc=MdLqea6dka+rM8xM2TcUStWg-oBEp3XKa6A=btC3BnY-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: ts5500: Use platform_get_irq() to get the interrupt
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 22, 2021 at 6:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
>
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpio/gpio-ts5500.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
> index c91890488402..b159e92a3612 100644
> --- a/drivers/gpio/gpio-ts5500.c
> +++ b/drivers/gpio/gpio-ts5500.c
> @@ -317,22 +317,19 @@ static int ts5500_dio_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         const char *name = dev_name(dev);
>         struct ts5500_priv *priv;
> -       struct resource *res;
>         unsigned long flags;
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -       if (!res) {
> -               dev_err(dev, "missing IRQ resource\n");
> -               return -EINVAL;
> -       }
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret < 0)
> +               return ret;
>
>         priv = devm_kzalloc(dev, sizeof(struct ts5500_priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>         platform_set_drvdata(pdev, priv);
> -       priv->hwirq = res->start;
> +       priv->hwirq = ret;
>         spin_lock_init(&priv->lock);
>
>         priv->gpio_chip.owner = THIS_MODULE;
> --
> 2.17.1
>

Applied, thanks!

Bart
