Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30B0413792
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 18:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhIUQcQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 12:32:16 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:33280 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhIUQcP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 12:32:15 -0400
Received: by mail-ua1-f44.google.com with SMTP id r8so13877698uap.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Sep 2021 09:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y51wWVbxwkZSOnGuIfpATKO/zcKtZB4BM5zX1Si1oQw=;
        b=1mS4/tcenByXWEBrjWxfmpjCRChi5g/whiBRRp252vAxaimf3kl9m9igt0iFzHXGYI
         WpZoNTdY5Twv88fBgO6zBzsrHP+N7tkMzcz3lWaxM9iA4EPTs4p/5OJImJxxh0ZTzxSG
         vJgzc39Y4sRsYyzWO/2moBIYvIG3qdWJ2NNl+BmASb8NIn1ethgQS+qDUST+wM6zN75h
         8yU/JP/DgM8IwNKCupUtX4pnA0ShYY4kF4mTEkhxf+8N3tJtnlWQw6T+9+CX/b3xOHqQ
         1rtLXYP78YUIUnwdlTcBOK/lUxGNygLA9wN3/xLl6g8ts2zjwXQ6J8TYhQzsBVV92flw
         wjkg==
X-Gm-Message-State: AOAM531E0adW/PHYIAoy8QB/KAx3ZKs2pcx0n3etksN84xscPiHelTSc
        ZPpAwRtA6PL1iDsNNMRJ16m8rZa9pf3eX78lb2BvXkuw5nY=
X-Google-Smtp-Source: ABdhPJznnsccsFE434RkQITTnSBEf93Nyq6nbs+inbzhG5kWRh7zdMhV3OuTS0u7Ewd4lJr+Vy6HYBF7Q0kNMKh7Cn0=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr16634775uad.89.1632241846523;
 Tue, 21 Sep 2021 09:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210914094650.15235-1-julien.massot@iot.bzh> <20210914094650.15235-2-julien.massot@iot.bzh>
In-Reply-To: <20210914094650.15235-2-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 21 Sep 2021 18:30:35 +0200
Message-ID: <CAMuHMdVT+OgASuzwnNHEHYpc3hc1-ObThTmdHETfxF5inePP5g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] soc: renesas: rcar-rst: Add support to set rproc
 boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Tue, Sep 14, 2021 at 11:56 AM Julien Massot <julien.massot@iot.bzh> wrote:
> R-Car Gen3 SoC series has a realtime processor, the boot
> address of this processor can be set thanks to CR7BAR register
> of the reset module.
>
> Export this function so that it's possible to set the boot
> address from a remoteproc driver.
>
> Also drop the __initdata qualifier on rcar_rst_base,
> since we will use this address later than init time.
>
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Thanks for your patch!

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -12,6 +12,8 @@
>
>  #define WDTRSTCR_RESET         0xA55A0002
>  #define WDTRSTCR               0x0054
> +#define CR7BAR                 0x0070
> +#define CR7BAREN               BIT(4)
>
>  static int rcar_rst_enable_wdt_reset(void __iomem *base)
>  {
> @@ -76,7 +78,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
>         { /* sentinel */ }
>  };
>
> -static void __iomem *rcar_rst_base __initdata;
> +static void __iomem *rcar_rst_base;
>  static u32 saved_mode __initdata;
>
>  static int __init rcar_rst_init(void)
> @@ -130,3 +132,27 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
>         *mode = saved_mode;
>         return 0;
>  }
> +
> +/*
> + * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
> + * Firmware boot address can be set before starting,
> + * the realtime core thanks to CR7BAR register.
> + * Boot address is on 32bit, and should be aligned on
> + * 4k boundary.
> + */
> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
> +{
> +       if (!rcar_rst_base)
> +               return -EIO;
> +
> +       if (boot_addr % SZ_4K) {
> +               pr_warn("Invalid boot address for remote processor, should be aligned on 4k\n");
> +               boot_addr -= boot_addr % SZ_4K;

I think it would be safer to just return -EINVAL.

> +       }
> +
> +       boot_addr |= CR7BAREN;
> +       iowrite32(boot_addr, rcar_rst_base + CR7BAR);

According to Note 2 for the CR7BAR register, you must do this in two steps,
first without CR7BAREN set, then with CR7BAREN set.
See also how CA7BAR and CA15BAR are handled in
arch/arm/mach-shmobile/pm-rcar-gen2.c.

Note that CA15/CA7 on R-Car Gen2 (and CA57/CA53 on Gen3, but
that's hidden by ACPI), unlike CR7, also need RESCNT handling.

> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(rcar_rst_set_rproc_boot_addr);
> diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
> index 7899a5b8c247..7c97c2c4bba6 100644
> --- a/include/linux/soc/renesas/rcar-rst.h
> +++ b/include/linux/soc/renesas/rcar-rst.h
> @@ -4,8 +4,10 @@
>
>  #ifdef CONFIG_RST_RCAR
>  int rcar_rst_read_mode_pins(u32 *mode);
> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr);
>  #else
>  static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
> +static inline int rcar_rst_set_rproc_boot_addr(u32 boot_addr) { return -ENODEV; }
>  #endif
>
>  #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */

In general, I think this looks like a good abstraction, which we can
also use for further abstraction of R-Car Gen2 (cfr. [1]).

I'm just wondering if we should pass the BAR offset to
rcar_rst_set_rproc_boot_addr() explicitly (and rename the function),
or have multiple functions for the different BARs.

Comments?

[1] "[PATCH/RFC 0/6] ARM: r8a73a4: Add SMP support"
    https://lore.kernel.org/linux-renesas-soc/20210204135409.1652604-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
