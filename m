Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65371402751
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Sep 2021 12:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244061AbhIGKnE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Sep 2021 06:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244378AbhIGKnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 06:43:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343D0C0613D9
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Sep 2021 03:41:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h16so18595001lfk.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Sep 2021 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhaD61tWBABFBKPbk39Bf67VDPEJcFHjjk5fNX+E5yU=;
        b=h7YlEPMvvvWPmHN0mOYi63YLv6yVF12bWfWtFS2c/y76M7DqdhGZgUL8k/OEZ3Vn9h
         VFr38ZRutYOrE2jaJI0KzAnPQ89g3pfYAjYVs7nYK8M3SoVoRPXshdxy3l/BGhWqsxSr
         BKmujtY4i+oSjJsk+Bjz4H6+ekmJl53x5L9YaM1IFfVsjOeTNaWw+f8LM6ilMA60YHa6
         VvXR7wKrFogELILtXEQSnZ5azgT6lpAc6JXXAgrB27dXd4MyW96PZTzDFG9mtcZAulk7
         /H7wMnUESOcVAn9vb7gbNOECshMIeJzlR6Y5nkqYuKPk42GSe4Go2m1DGjd+N4MgixOC
         WpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhaD61tWBABFBKPbk39Bf67VDPEJcFHjjk5fNX+E5yU=;
        b=dVEvxnWMMigG/NFHcKYyKP0LQLMo4HrWyYXckd8lYG6DTALi4blpxXaKMxaZFi7KhE
         8aGtzd8pYUfxSx9D+e9+n/XyN3DvbJBdP5L4mn4vdLjjQ4oO999OCgbg+/HFG7pLwXUJ
         ycsO4Vgb9AnqExJNS91lc4UI52ZlbOCbB6M4ZWVHsiVyCN6qIUV9jSkBtvGUxJh1sv2M
         LR9EeMaTb/aRBe4LgKqXl6dvT84T5h1jRMFu2Ajf5+XK/7zLjMZPh88Qt+rL4KVnuCCg
         sd0Ya8vP2ExlYc671OqY2RHPD5IVTih/lmdz7kzZvyUxo0qtpzrJNhIRiM/7K+j9qK4m
         HrOw==
X-Gm-Message-State: AOAM533yirC5h5L9ztrL/PoARSCpK2VPXszqPpjFzd+dPop5yeTTxgjV
        6Mpkad0xISbbfIDqmWQJqEm49gJFcsJmbf/BlgsxLQ==
X-Google-Smtp-Source: ABdhPJx5OzN424vh3oUBOd8az3yzOHpWuZvPJYGzzfbrnfcRI/DT6ljkNdyfvmPJ0H6drgHJs7FbTfrhZnQn3vKdz38=
X-Received: by 2002:a19:ac42:: with SMTP id r2mr12064265lfc.167.1631011314103;
 Tue, 07 Sep 2021 03:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com> <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Sep 2021 12:41:18 +0200
Message-ID: <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Saravana Kannan <saravanak@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
>
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they
> get probed by their specific drivers) that also list the "simple-bus"
> (or other bus only compatible strings) in their compatible property to
> automatically populate their child devices. We still want these devices
> to get probed by their specific drivers. So, we make sure this driver
> only probes devices that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

I will run some tests as soon as I can and let you know the results.

Kind regards
Uffe

> ---
>  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..3e086a9f34cb 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,26 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -       struct device_node *np = pdev->dev.of_node;
> +       const struct device *dev = &pdev->dev;
> +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +       struct device_node *np = dev->of_node;
> +       const struct of_device_id *match;
> +
> +       match = of_match_device(dev->driver->of_match_table, dev);
> +
> +       /*
> +        * These are transparent bus devices (not simple-pm-bus matches) that
> +        * have their child nodes populated automatically.  So, don't need to
> +        * do anything more.
> +        */
> +       if (match && match->data) {
> +               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> +                       return 0;
> +               else
> +                       return -ENODEV;
> +       }
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +       const void *data = of_device_get_match_data(&pdev->dev);
> +
> +       if (data)
> +               return 0;
> +
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
>         pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
>
> +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>         { .compatible = "simple-pm-bus", },
> +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> +       { .compatible = "isa",          .data = ONLY_BUS },
> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> --
> 2.33.0.153.gba50c8fa24-goog
>
