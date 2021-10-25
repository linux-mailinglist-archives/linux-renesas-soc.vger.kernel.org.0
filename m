Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECA043909D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Oct 2021 09:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhJYHzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Oct 2021 03:55:53 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:37595 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhJYHzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 03:55:52 -0400
Received: by mail-ua1-f53.google.com with SMTP id f4so20288153uad.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Oct 2021 00:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wCgI9RILFbfJOXUWkQmkpZLbqVFIJY8DBdRr2Dhm00I=;
        b=qWLiZ+WUPcIbjxmSvRIlXyzlMpPXGAKo9VRPD+ct03NMQTVonRnzVMnw1sgfOz5EQD
         O6zDUyZEzeGurAZoXgE67DR1E0bVo6Q9M8hlsjfejHPXC5KtgnszP/dsoz1Ry+u/YraV
         wIE4EBQx4V6ZEAmQRnWCi/cvcrbSg6pdvPZEionIjJnPJynw9D1q3LEzFFMoNdYlpgLk
         ZP9/lrx1NGDj2VHMZciRacSOxn7tPEjczbR30Ybiys3JrKTV+QRooeqhLr1vwEbrjCwh
         g9y1HN9hwS5BuhOpTqqZWrDd5xGWlI5GuSkUG/iRoyhAAUjZCAp7PZ7Fz1JGEDF6eI7d
         ERKg==
X-Gm-Message-State: AOAM5333wpD2E87Zp91XLUBYBvjoD+FEEE1oFavOaOBtf0hOf5Mu+Miy
        i1bOmrPXcbQRZhCJ1Y4FHI/WZtP/sEk7ww==
X-Google-Smtp-Source: ABdhPJw3evYsUjG+rS+iTmEGDMvrE99sxbV5HAx0x00fBk4sJ3TZGd7ISQyLbITEg0KHigHofg1m5g==
X-Received: by 2002:a67:ae47:: with SMTP id u7mr12784494vsh.7.1635148410160;
        Mon, 25 Oct 2021 00:53:30 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id i19sm3000518uat.13.2021.10.25.00.53.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 00:53:30 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id e2so20249251uax.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Oct 2021 00:53:29 -0700 (PDT)
X-Received: by 2002:ab0:2bd2:: with SMTP id s18mr13093806uar.78.1635148409467;
 Mon, 25 Oct 2021 00:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211022122101.66998-1-julien.massot@iot.bzh>
In-Reply-To: <20211022122101.66998-1-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Oct 2021 09:53:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr2W5QO0s2n+fVj6CSe1+Cmbfw0aFRkjJ2zdFaB1BSkg@mail.gmail.com>
Message-ID: <CAMuHMdXr2W5QO0s2n+fVj6CSe1+Cmbfw0aFRkjJ2zdFaB1BSkg@mail.gmail.com>
Subject: Re: [PATCH v4] soc: renesas: rcar-rst: Add support to set rproc boot address
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Fri, Oct 22, 2021 at 2:21 PM Julien Massot <julien.massot@iot.bzh> wrote:
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
> Change since v3:
>  - Change boot_addr type to u64 to match remoteproc type
>  - Modify boot_addr sanity check to also check for 32 bits address
>  - Export function using EXPORT_SYMBOL_GPL macro

Thanks for the update!

> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c

> @@ -19,9 +26,29 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
>         return 0;
>  }
>
> +/*
> + * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
> + * Firmware boot address has to be set in CR7BAR before
> + * starting the realtime core.
> + * Boot address must be aligned on a 256k boundary.
> + */
> +static int rcar_rst_set_gen3_rproc_boot_addr(u64 boot_addr)
> +{
> +       if (boot_addr & ~(u64)CR7BAR_MASK) {
> +               pr_warn("Invalid boot address got %llx\n", boot_addr);

pr_err

> +               return -EINVAL;
> +       }
> +
> +       iowrite32((u32)boot_addr, rcar_rst_base + CR7BAR);
> +       iowrite32((u32)boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);

These casts to u32 are not needed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17, with the above fixed
(no need to resend).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
