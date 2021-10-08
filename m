Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19FF426A7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 14:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240624AbhJHMNw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 08:13:52 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:46668 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240374AbhJHMNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 08:13:52 -0400
Received: by mail-vs1-f53.google.com with SMTP id o15so5448349vsr.13;
        Fri, 08 Oct 2021 05:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atHRHBtxdUHdJdMnPHQRK+9+2ECYQA+VjavYPT+Zr+4=;
        b=HDuIsvPODt4Z+GiQB2MBpj52L84FScQomAT1QNyy2yumFeBu7ZBan+gQZ2ZClLy4KM
         pW/+ORT9+ej1sWW34xQxuff0aJ08R2KAgJoZtjnKaHgCJoD8SsOjJYkoAOSub3zummZx
         ydIIqx2xQSXTyo41v1uBx6TORMo40Pbf39tOi9V8Rxt2x8pNKGD/7k+Z3R6LHJxRu/Ix
         pY1o3KLpgiUoIOIXNEqQrKiCIEk3k40AflTpwmEs5aKMoxDu7Sijz1UCpgtV/ihIhm6O
         5FoLFaNK7XlWOkjjy9XQviWny3seug2tcHoCHFJVqmxsHk0yoc9oH+V/7VQ/DTqFAj1Y
         EIXw==
X-Gm-Message-State: AOAM531vcYfpU0BvoajJsGrOLze7yBNIWnCt404y1EWNyg9xhEt5FLil
        8wEeCWcqNVeNKF7fbROTefAp3URzqk+0YSJemWdahHXv
X-Google-Smtp-Source: ABdhPJxe3Kx2RdMfHdQk1flzPIUjAGXduz1FjMl2mTX9wxaePCZbrJbYxjRl6nLFxvgRqMzXHcUuCrG9ZCAnO8Uvwqc=
X-Received: by 2002:a67:d111:: with SMTP id u17mr9095460vsi.37.1633695116649;
 Fri, 08 Oct 2021 05:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com> <20211007155451.10654-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007155451.10654-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 14:11:45 +0200
Message-ID: <CAMuHMdX_sHb9w1v9g7Lycp-RQnm9sHGv8MtJmfM3js5DrwO6+A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable microSD on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 7, 2021 at 5:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch enables microSD card slot connected to SDHI1 on RZ/G2L SMARC
> platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -70,6 +70,16 @@
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
>         };
> +
> +       vccq_sdhi1: regulator-vccq-sdhi1 {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SDHI1 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;

Is this correct? Schematics say GPIO high is 3.3V.

> +               gpios-states = <1>;
> +               states = <3300000 1 1800000 0>;
> +       };
>  };
>
>  &audio_clk1{
> @@ -199,6 +209,45 @@
>                          <RZG2L_PORT_PINMUX(38, 1, 1)>; /* RxD */
>         };
>
> +       sd1_pwr_en {

sd1-pwr-en-hog (like in the example in
Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml ;-)


> +               gpio-hog;
> +               gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "sd1_pwr_en";
> +       };

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
