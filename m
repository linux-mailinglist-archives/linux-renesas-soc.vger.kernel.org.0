Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E212D435DAD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 11:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhJUJM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 05:12:58 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:33757 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhJUJM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:12:57 -0400
Received: by mail-ua1-f44.google.com with SMTP id i15so11970023uap.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PgB+dbOE70eGxu6zey353QkaSYAScxZXhXBf5X1ki0=;
        b=pI2IMqP/145tVgPFoQQpnJs2BxjcoI21WvYZsfSHdLjGgUQli3f9D0DBTs3qOmodYg
         wfMBKTr8YugaBnIN2555LL0Vb3IP0/ops2fhqCDhO3H1tYuxlHXIqp7ttnb+U2eNS0LE
         ZFeJlaLKpSNfYI0MseoFab4QZCItqxUqjZH7ONjFPoKVe1QFPFS8rRQi1zCzvwj9jtf4
         e8257yFjhgf/GNz+93tKtjhMRRq7CjuHc2rb4q6jSWwtcKJJAlXkrnN3A0rr+eUen9vr
         y2YcamwfYxPccN41KHy8WLEGKEEnUZybkAcRCXgQ8EMSGkB/36hVXB+mzI9VXVAbOKqt
         5oig==
X-Gm-Message-State: AOAM532UhZPOCcNulE8PxyyaL8IH5JT8b4GGNx8Ft/vjtxJ2ERNp7T7t
        se4Iwqz1o16Z0PudnIU+g73nDB0pYPEFUQ==
X-Google-Smtp-Source: ABdhPJyfHMvMNKPiQszjFw+s6sVqizfm+86TH37RbKQK3960ta+odCgxN55kzEt+VEIDtFcIPzQLHg==
X-Received: by 2002:ab0:6393:: with SMTP id y19mr4584371uao.94.1634807439651;
        Thu, 21 Oct 2021 02:10:39 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a135sm2813387vki.23.2021.10.21.02.10.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 02:10:39 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id f3so11848498uap.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:10:39 -0700 (PDT)
X-Received: by 2002:a67:d583:: with SMTP id m3mr4228825vsj.41.1634807438953;
 Thu, 21 Oct 2021 02:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211012121117.61864-1-julien.massot@iot.bzh>
In-Reply-To: <20211012121117.61864-1-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 11:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
Message-ID: <CAMuHMdUyO+L40hP5+uzeyY+Tn-9un-ignekzzqx=5Nd6DkJSxg@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-rst: Add support to set rproc boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Tue, Oct 12, 2021 at 2:12 PM Julien Massot <julien.massot@iot.bzh> wrote:
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
> Change since v2:
> - Reordered rcar_rst_set_gen3_rproc_boot_addr and variable to avoid forward declaration
> - Turned const struct rst_config structs back to __initconst
> - Check for 256KiB boundary and not 4KiB
> - Rephrase comment about boot address on Gen 3

Thanks for the update!

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c

> @@ -19,9 +25,30 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
>         return 0;
>  }
>
> +/*
> + * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
> + * Firmware boot address has to be set in CR7BAR before
> + * starting the realtime core.
> + * Boot address must be aligned on a 256k boundary.
> + */
> +static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)

phys_addr_t?

> +{
> +       if (boot_addr % SZ_256K) {
> +               pr_warn("Invalid boot address for CR7 processor,"
> +                      "should be aligned on 256KiB got %x\n", boot_addr);

Please don't split printed messages, for easier searching.

> +               return -EINVAL;
> +       }
> +
> +       iowrite32(boot_addr, rcar_rst_base + CR7BAR);
> +       iowrite32(boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
> +
> +       return 0;
> +}
> +
>  struct rst_config {
>         unsigned int modemr;            /* Mode Monitoring Register Offset */
>         int (*configure)(void __iomem *base);   /* Platform specific config */
> +       int (*set_rproc_boot_addr)(u32 boot_addr);

phys_addr_t

>  };
>
>  static const struct rst_config rcar_rst_gen1 __initconst = {

> @@ -130,3 +157,12 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
>         *mode = saved_mode;
>         return 0;
>  }
> +
> +int rcar_rst_set_rproc_boot_addr(u32 boot_addr)

phys_addr_t

> +{
> +       if (!rcar_rst_set_rproc_boot_addr_func)
> +               return -EIO;
> +
> +       return rcar_rst_set_rproc_boot_addr_func(boot_addr);
> +}
> +EXPORT_SYMBOL(rcar_rst_set_rproc_boot_addr);

EXPORT_SYMBOL_GPL?

Do you have a public user of this code, too?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
