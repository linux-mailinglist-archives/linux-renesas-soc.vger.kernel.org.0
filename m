Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23EA145A76B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 17:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238157AbhKWQVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 11:21:42 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:41647 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238824AbhKWQVj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 11:21:39 -0500
Received: by mail-vk1-f170.google.com with SMTP id 188so9773680vku.8;
        Tue, 23 Nov 2021 08:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=esyW0OAzYg3/RWIR9cYT0r1LL6UkCXN7FUP4GXrGayk=;
        b=XZUzDsnYJVNcrgneOIbznKsK362tY8/g9SfVU6frC40wpvu9oSRJKBEC0+rOyKuOeS
         5H6csPMu6fTXMWXTrzwpQuauSJl5tkv7zWXBNNNHa4OxbSfrwF8M9OEg+88fPBb8duIo
         zsu48DGvHGxNjaEISVi4S+tk92IClCNZlfs8vFzlIWWpVa0FQB51P7dMAVZ+JBwD7URO
         iOSyLj2ze2LuXWOLcfEY2RHG1y33XW9G3uR7keoZhs1af49KWvgLdZIqIp4A9tbwHUoU
         B1MaMCe4Bj72TMz2q43BtAjbHdpxu6KPBnW2YYR+A80bwtN92pXWyPpfLh0jWnG3PLgm
         fSBw==
X-Gm-Message-State: AOAM531hvm0gHdGNzKbi5qldGAHjvQR61tfd4TCcqEwNAk5n570Qe6BD
        49hCHdVX5wDHjNoBTvGRSxRlz8jsY9oI0Q==
X-Google-Smtp-Source: ABdhPJyttauTbJRNlJcCw1ZZ8ZAqRaYOoEUYSRCPT9BbCMn1tgD8ve+9YyUbR7LHKoc9HV8EBeNyrw==
X-Received: by 2002:a05:6122:2227:: with SMTP id bb39mr12529373vkb.9.1637684310608;
        Tue, 23 Nov 2021 08:18:30 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id i24sm6508017vkk.5.2021.11.23.08.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 08:18:30 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id l24so44945915uak.2;
        Tue, 23 Nov 2021 08:18:29 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr10672924vsb.9.1637684309252;
 Tue, 23 Nov 2021 08:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-11-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-11-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 17:18:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgDRAMp5nAK2S4QcBXYysupQj+iAdTUN0orxzBLKrOQA@mail.gmail.com>
Message-ID: <CAMuHMdWgDRAMp5nAK2S4QcBXYysupQj+iAdTUN0orxzBLKrOQA@mail.gmail.com>
Subject: Re: [PATCH 10/16] soc: renesas: r8a779f0-sysc: Add r8a779f0 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for your patch!

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for R-Car S4-8 (R8A779F0) SoC power areas and register
> access. This register specification is similar with R-Car V3U.

similar to

> So, introduces rcar-gen4-sysc.c for both V3U and S4-8.

introduce.

That makes perfect sense, as "the R-Car V3U SoC is based on the R-Car
Gen 4 architecture".
(https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving)

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -359,6 +359,9 @@ config SYSC_R8A77970
>  config SYSC_R8A779A0
>         bool "System Controller support for R-Car V3U" if COMPILE_TEST
>
> +config SYSC_R8A779F0
> +       bool "System Controller support for R-Car S4-8" if COMPILE_TEST
> +

Please retain sort order (alphabetically).

>  config SYSC_RMOBILE
>         bool "System Controller support for R-Mobile" if COMPILE_TEST
>
> diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
> index 9b29bed2a597..f6c5f8c3818c 100644
> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -25,11 +25,12 @@ obj-$(CONFIG_SYSC_R8A77980) += r8a77980-sysc.o
>  obj-$(CONFIG_SYSC_R8A77990)    += r8a77990-sysc.o
>  obj-$(CONFIG_SYSC_R8A77995)    += r8a77995-sysc.o
>  obj-$(CONFIG_SYSC_R8A779A0)    += r8a779a0-sysc.o
> +obj-$(CONFIG_SYSC_R8A779F0)    += r8a779f0-sysc.o
>  ifdef CONFIG_SMP
>  obj-$(CONFIG_ARCH_R9A06G032)   += r9a06g032-smp.o
>  endif
>
>  # Family
>  obj-$(CONFIG_RST_RCAR)         += rcar-rst.o
> -obj-$(CONFIG_SYSC_RCAR)                += rcar-sysc.o
> +obj-$(CONFIG_SYSC_RCAR)                += rcar-sysc.o rcar-gen4-sysc.o

This means all R-Car kernels will always include support for both
R-Car Gen1/2/3 and R-Car Gen4.
I think this should be split.

The rest looks good to me, but I think it wouldn't hurt to split this
patch in two parts: one patch to generalize r8a779a0-sysc.c for R-Car
Gen4, and a second patch to introduce support for R-Car S4-8.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
