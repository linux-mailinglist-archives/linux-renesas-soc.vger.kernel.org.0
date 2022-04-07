Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1954F7BED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Apr 2022 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiDGJoY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Apr 2022 05:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbiDGJoX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:44:23 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4850215EDDA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:42:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b43so6682602ljr.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vBIFCqrRmqJXlZXuO4tI37xf4KvAArxDsIUEJCsxt3w=;
        b=ExtlPPrTavaYpUApNQWB9ohbQnmwEiM1l50L4c0QKIZX7k45kIJ1hETfMpkwVub9L2
         7l3jZrqkh/iuxZe5y13mVqqSuDYpaEpuR7sqpqR9Dtq0o5VxabSuuA6V5ODh9HLq+VHO
         QjEYkmNKlIBbZ5bISLetorU81WPZgi/EvnsnmtcFJ7hZRl5v233DugL+V2hA5+E50hv9
         F4uhxf5WWtEj2uUmV/7cjE/gHcLrm4KgewlpM7lhSrI4nFora3TfQ/Nm/Hq4fHQxUdX5
         v7JEfXhxICvdCpm1ZAdtE7WUdALXYn1BHbY/oLK6fwM+llccjHBV3lUiU8byoGBGillc
         hbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vBIFCqrRmqJXlZXuO4tI37xf4KvAArxDsIUEJCsxt3w=;
        b=vrJOWwdDTtd04P/wlwyXAI93RXjAWG82YD6QeHeUa/ZilBfoq5CPTmaFNTVYwU+12+
         3ZkgoUm6L7bkmgmhdsHyNLLvfQbEoUx09h0Gj42VxZj3X9RQ+34lJE4P0wAztlgr5rRU
         LdA0TFSJJtlhVBcxbdfZ/z9nvKSFOkJ58dKf3z3cmuOTUg9bmSNe5tumcZ1+TH7qT9Tx
         brRQzoPFZr26aygSpvErLUntLUYBAJf12wZGYpRvQdJCz0c0A4RRAJuaINHSBsbK3myn
         dhVn/PfLbOEk7LSkd5/2EjpqJZcElgKZR1/TiSTeXe9vy5MIlaZDXGb7zMiVjC5JCmB5
         Q97w==
X-Gm-Message-State: AOAM5320PnS/vrK7oDYNKsCQvVuQM1tqClYrpp5I/GUgwdA6nSXsXKru
        eVfHTRjVbY9I8gdTksblcqAIPrL9Wvt0NmYwQ62XqqPjcFA=
X-Google-Smtp-Source: ABdhPJy7GXnQH6nJZ2YovLffW5rT5Ub1jGpiDgNYAJJP1lSnd7a/G8rzzFbSEsx46su97PKCEWJ2Lh1Lkjgp9SNF5Cc=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr8189270ljq.300.1649324541547; Thu, 07
 Apr 2022 02:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220407063114.1433-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 7 Apr 2022 11:41:45 +0200
Message-ID: <CAPDyKFp6_3_pQTtNpOA56QM6s2tvUKa_gZn=JCYY0kKTAoe49w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: move platform_data header to proper location
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 7 Apr 2022 at 08:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> We have a dedicated directory for platform_data meanwhile, don't spoil
> the MMC directory with it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I can pick this up through my mmc tree, but I need an ack from the
sh-maintainers to do it.

Kind regards
Uffe

> ---
>
> I don't have the HW to test this but the buildbots are happy with this
> change. I checked that they actually tested the SH builds. To make the
> patch more readable, I used the -M (rename) feature of git-format-patch.
>
>  arch/sh/boards/board-sh7757lcr.c                | 2 +-
>  arch/sh/boards/mach-ecovec24/setup.c            | 2 +-
>  arch/sh/boot/romimage/mmcif-sh7724.c            | 2 +-
>  drivers/mmc/host/sh_mmcif.c                     | 2 +-
>  include/linux/{mmc => platform_data}/sh_mmcif.h | 2 --
>  5 files changed, 4 insertions(+), 6 deletions(-)
>  rename include/linux/{mmc => platform_data}/sh_mmcif.h (99%)
>
> diff --git a/arch/sh/boards/board-sh7757lcr.c b/arch/sh/boards/board-sh7757lcr.c
> index c32b4c6229d3..f39c8196efdf 100644
> --- a/arch/sh/boards/board-sh7757lcr.c
> +++ b/arch/sh/boards/board-sh7757lcr.c
> @@ -16,7 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
> -#include <linux/mmc/sh_mmcif.h>
> +#include <linux/platform_data/sh_mmcif.h>
>  #include <linux/sh_eth.h>
>  #include <linux/sh_intc.h>
>  #include <linux/usb/renesas_usbhs.h>
> diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
> index 4c9522dd351f..674da7ebd8b7 100644
> --- a/arch/sh/boards/mach-ecovec24/setup.c
> +++ b/arch/sh/boards/mach-ecovec24/setup.c
> @@ -19,7 +19,7 @@
>  #include <linux/memblock.h>
>  #include <linux/mfd/tmio.h>
>  #include <linux/mmc/host.h>
> -#include <linux/mmc/sh_mmcif.h>
> +#include <linux/platform_data/sh_mmcif.h>
>  #include <linux/mtd/physmap.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
> diff --git a/arch/sh/boot/romimage/mmcif-sh7724.c b/arch/sh/boot/romimage/mmcif-sh7724.c
> index 6595b6b45bf1..d30123d859e0 100644
> --- a/arch/sh/boot/romimage/mmcif-sh7724.c
> +++ b/arch/sh/boot/romimage/mmcif-sh7724.c
> @@ -8,7 +8,7 @@
>   * for more details.
>   */
>
> -#include <linux/mmc/sh_mmcif.h>
> +#include <linux/platform_data/sh_mmcif.h>
>  #include <mach/romimage.h>
>
>  #define MMCIF_BASE      (void __iomem *)0xa4ca0000
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 5f9ebf045b1c..dc17bf5bc3b4 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -43,13 +43,13 @@
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
>  #include <linux/mmc/sdio.h>
> -#include <linux/mmc/sh_mmcif.h>
>  #include <linux/mmc/slot-gpio.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/pagemap.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/sh_mmcif.h>
>  #include <linux/pm_qos.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sh_dma.h>
> diff --git a/include/linux/mmc/sh_mmcif.h b/include/linux/platform_data/sh_mmcif.h
> similarity index 99%
> rename from include/linux/mmc/sh_mmcif.h
> rename to include/linux/platform_data/sh_mmcif.h
> index e25533b95d9f..6eb914f958f9 100644
> --- a/include/linux/mmc/sh_mmcif.h
> +++ b/include/linux/platform_data/sh_mmcif.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * include/linux/mmc/sh_mmcif.h
> - *
>   * platform data for eMMC driver
>   *
>   * Copyright (C) 2010 Renesas Solutions Corp.
> --
> 2.30.2
>
