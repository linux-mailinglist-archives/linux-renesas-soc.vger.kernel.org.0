Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED34429393
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 17:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243089AbhJKPjz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 11:39:55 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:35826 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242579AbhJKPjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 11:39:55 -0400
Received: by mail-ua1-f42.google.com with SMTP id q13so13578183uaq.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 08:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qj9tv6+9YOf1hzYlb4gFZ09PL0cbL+bUcVUmAeXCYQU=;
        b=6284ktuc7W2F4vULGClq0q3MpStsmGkfGYNGObKH4S8YVibqV6yf4LwX4OjryW69WY
         o6rZd2BMsXM4kDjtgtfuP7TLBgT9uoMxzjG8V0BZ0Vay+z/ht0MWHKWMpqdl6voJu3Gh
         ReELvRKnTDhDfvygGNccWr7OemBDTAoDkN10STmrZMa8gaztRxBx15JhF2X17jLX95Ii
         WE50NZT7gx0VOXvK7G5fFlgERmqzDvMX48b/CWYYFxViTSTikMOjeXbrLGoIM9AkIOLM
         UWR28M8oW3pWzqDYmz7TGvjQuprn7D/xPK7HoVzRiMnstf9mXmeMl0Z481fOo+KcajaE
         ZypA==
X-Gm-Message-State: AOAM530sxiNYuyqLCb5ceVZu9bROPm0J+E9xBNmHAS4XQJQsxEKwmBvQ
        09vRudcQyr6Fn+lYkesLs0+97tb9jXVllQ4ErCA=
X-Google-Smtp-Source: ABdhPJzTM7steHKxkEvyZlUZk4+cpjkWhi6EmuTXIgE3+8ePvcKePPru4siW1uJnBkgFsqw3wdccKvX2mBQdPQZZpRk=
X-Received: by 2002:a67:d583:: with SMTP id m3mr23680870vsj.41.1633966674480;
 Mon, 11 Oct 2021 08:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210922145212.333541-1-julien.massot@iot.bzh>
In-Reply-To: <20210922145212.333541-1-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Oct 2021 17:37:43 +0200
Message-ID: <CAMuHMdUYyKg-DkCYex6zxuUrEJHEgbMq5Bz-yP7tscOv+Bri7w@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: rcar-rst: Add support to set rproc boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Wed, Sep 22, 2021 at 4:52 PM Julien Massot <julien.massot@iot.bzh> wrote:
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
> ---
>
> Change since RFC:
> Introduce set_rproc_boot_addr function pointer, so that
> it can be reused for other R-Car SoC generation.

Thanks for the update!

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
> @@ -19,25 +21,29 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
>         return 0;
>  }
>
> +static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr);

I think you can avoid this forward declaration, by reordering definitions.

> +
>  struct rst_config {
>         unsigned int modemr;            /* Mode Monitoring Register Offset */
>         int (*configure)(void __iomem *base);   /* Platform specific config */
> +       int (*set_rproc_boot_addr)(u32 boot_addr);
>  };
>
> -static const struct rst_config rcar_rst_gen1 __initconst = {
> +static const struct rst_config rcar_rst_gen1 = {
>         .modemr = 0x20,
>  };
>
> -static const struct rst_config rcar_rst_gen2 __initconst = {
> +static const struct rst_config rcar_rst_gen2 = {
>         .modemr = 0x60,
>         .configure = rcar_rst_enable_wdt_reset,
>  };
>
> -static const struct rst_config rcar_rst_gen3 __initconst = {
> +static const struct rst_config rcar_rst_gen3 = {
>         .modemr = 0x60,
> +       .set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
>  };
>
> -static const struct rst_config rcar_rst_r8a779a0 __initconst = {
> +static const struct rst_config rcar_rst_r8a779a0 = {
>         .modemr = 0x00,         /* MODEMR0 and it has CPG related bits */
>  };

I prefer to keep these in __init, as there are multiple instances.
If you need to access some fields later, just make non-__init copies
during initialization.

>
> @@ -76,13 +82,13 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
>         { /* sentinel */ }
>  };
>
> -static void __iomem *rcar_rst_base __initdata;
> +static void __iomem *rcar_rst_base;
>  static u32 saved_mode __initdata;
> +static const struct rst_config *cfg;

You don't need a pointer to the whole config struct, just a function pointer:

    static int int (*rcar_rst_set_rproc_boot_addr)(u32 boot_addr);

> @@ -130,3 +136,33 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
>         *mode = saved_mode;
>         return 0;
>  }
> +
> +/*
> + * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
> + * Firmware boot address can be set before starting,
> + * the realtime core thanks to CR7BAR register.

That sentence sounds weird to me.

> + * Boot address is on 32bit, and should be aligned on
> + * 4k boundary.

256 KiB

> + */
> +int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)

Missing static?

> +{
> +       if (boot_addr % SZ_4K) {

SZ_256K, as noted in your follow-up.

> +               pr_warn("Invalid boot address for CR7 processor,"
> +                      "should be aligned on 4k got %x\n", boot_addr);

256 KiB

> +               return -EINVAL;
> +       }
> +
> +       iowrite32(boot_addr, rcar_rst_base + CR7BAR);
> +       iowrite32(boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
> +
> +       return 0;
> +}
> +
> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
> +{
> +       if (!rcar_rst_base || !cfg->set_rproc_boot_addr)

This can just check the rcar_rst_set_rproc_boot_addr pointer.

> +               return -EIO;
> +
> +       return cfg->set_rproc_boot_addr(boot_addr);
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

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
