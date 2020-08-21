Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6653A24D623
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 15:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgHUNdE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 09:33:04 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:36107 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgHUNdD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 09:33:03 -0400
Received: by mail-oo1-f65.google.com with SMTP id y30so343660ooj.3;
        Fri, 21 Aug 2020 06:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE/9d808AHOdfGXnnBLFXkEx9td59TWxZ9l7paPbsT4=;
        b=k72shL9ePq1yrUu29v4Qmwdt8Zcmi6YE7Jw96hhur2CwtRUer+urRbQQbXz3+kOGGw
         y5vyboMxTdZPp1I0Yj/nE/hTmquny4GuAwPEWp1w0S5Vfkz/d06FHY2de8Ul5pHYM2rM
         UznN6NZ2Rnuv7H5qu6jZaVDzy1l3hV5yCdh4oyBDl3tKX2XHucKpWWXU1qr4YT+zuIaM
         KOA/46ZdzLzVizdbQHRbiTMKVXz+hD+3QSjWmuvuJF5ggh/fHFa4mRgDdHHsNjvvE/ce
         xFSkavtR3Yo7mNCrjb07ThNfUS//EL3peMjFZp17t7DdpH5eXpVLRuIMzJJK+eE+V/I7
         8pTQ==
X-Gm-Message-State: AOAM532oMwknupth+5oXca7OCiGA0hIyM81TpMh6y+msH5yRxXhLDRRO
        3FHkapUDEPHNgTKTGPRcqS34SexcI4IRZkBbU1yZlpA5
X-Google-Smtp-Source: ABdhPJxtKIuavgaEgjb3cdb9IXDngLMsaZHqmlIrF5H15c623DVRE2x4PTTIxCyoNY/l+m6Fxc7gW0O8P4U7CUQw8Ds=
X-Received: by 2002:a4a:275e:: with SMTP id w30mr2078545oow.40.1598016782424;
 Fri, 21 Aug 2020 06:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200816193316.7641-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200816193316.7641-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 15:32:51 +0200
Message-ID: <CAMuHMdWVOv3LC_wWi1r9EHtnmT=w8d1HgDTP3aPD7uEZcb5ZYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r8a7742-iwg21m: Add SPI NOR support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Sun, Aug 16, 2020 at 9:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for the SPI NOR device used to boot up the system
> to the System on Module DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
> +++ b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi

> @@ -70,4 +80,28 @@
>                 groups = "mmc1_data4", "mmc1_ctrl";
>                 function = "mmc1";
>         };
> +
> +       qspi_pins: qspi {
> +               groups = "qspi_ctrl", "qspi_data2";
> +               function = "qspi";
> +       };
> +};
> +
> +&qspi {
> +       pinctrl-0 = <&qspi_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +
> +       /* WARNING - This device contains the bootloader. Handle with care. */
> +       flash: flash@0 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;

#{address,size}-cells are not needed, unless you list legacy partitions
(i.e. partitions not contained in a "partitions" container).

> +               compatible = "sst,sst25vf016b", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               m25p,fast-read;
> +               spi-cpol;
> +               spi-cpha;

Perhaps you want to add the partition layout, too?

> +       };
>  };

With the above fixed/clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
