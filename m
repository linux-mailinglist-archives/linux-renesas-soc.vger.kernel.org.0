Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD678426A25
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 13:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241150AbhJHLww (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 07:52:52 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:38743 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241072AbhJHLwv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 07:52:51 -0400
Received: by mail-vs1-f46.google.com with SMTP id x192so7970875vsx.5;
        Fri, 08 Oct 2021 04:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nQIe1mpPozhcy3n95drUQugG9ZDdKS0eZzq0/N/T6Dk=;
        b=EAUAiIcTpSyTy7HnEfBCkBQ4PK++62TfxsvpSs4PKmfNcwZnfLbxAhfbT34VVLKgRU
         qD8FSepmWBIt7e4Nmp4lVX6qewiszA9DozYmoHYKrIRuJETHkf6CUEboleEtbK01g8bm
         U58hbrPpwUo6MsQ7miDdKOHGPc7EzyNw4sBrpjToU9qvlj46WnqDt4cAJeQaZ2kBIejb
         hxz8RjUbP6qYkkpumycj10/bMsOHAaXjAOyTheiZnq1SaW6oZVdpaj+spnrzi/pBd1eu
         7iSvNQ1D3AD9K37nFMjd9KERVHWTCRqk5e5fwFBYdDk2xNltFhfwiYrd2tZpnzf7w4OJ
         dDGQ==
X-Gm-Message-State: AOAM532f+otCN6Wkzgemn93+U9+YaZ5FcSEocYCw3WjNaz8utCkNDw/M
        bfViTZXvfMRn0ivnSy7/8mMQc1vkCkb48vtRrxg=
X-Google-Smtp-Source: ABdhPJzb50Lwf3AqKsaa3r8TgaTkPnOEbJbnHBz5c2Ym+VLBkRV9KHXIWxLzY/RTjy5V7M675IJ+DDqGQjdBzd2hFPI=
X-Received: by 2002:a05:6102:d8c:: with SMTP id d12mr3061347vst.35.1633693856099;
 Fri, 08 Oct 2021 04:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com> <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 13:50:44 +0200
Message-ID: <CAMuHMdVAk0_Fp=EPYJLd41DARk7qji62T=qvrdNyfYukOvJE4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
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
> RZ/G2L SoM has both 64Gb eMMC and micro SD connected to SDHI0.
>
> Both these interfaces are mutually exclusive and the SD0 device
> selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
> switch position.
>
> This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
> setting logic for device selection between eMMC and microSD slot
> connected to SDHI0.
>
> Set SW1[2] to position 2/OFF for selecting eMMC
> Set SW1[2] to position 3/ON for selecting micro SD
>
> This patch enables eMMC on RZ/G2L SMARC platform by default.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!


> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -5,14 +5,55 @@
>   * Copyright (C) 2021 Renesas Electronics Corp.
>   */
>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>
> +/* SW1[2] should be at position 2/OFF to enable 64Gb eMMC */

64 GB (the MTFC64GASAQHD datasheet isn't clear about the exact size
and the meaning of GB)

> +#define EMMC   1
> +
> +/*
> + * To enable uSD card on CN3,
> + * SW1[2] should be at position 3/ON.
> + * Disable eMMC by setting "#define EMMC       0" above.
> + */
> +#define SDHI   (!EMMC)
> +
>  / {
>         memory@48000000 {
>                 device_type = "memory";
>                 /* first 128MB is reserved for secure area. */
>                 reg = <0x0 0x48000000 0x0 0x78000000>;
>         };
> +
> +       reg_1p8v: regulator0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v: regulator1 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       vccq_sdhi0: regulator-vccq-sdhi0 {
> +               compatible = "regulator-gpio";
> +
> +               regulator-name = "SDHI0 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               states = <3300000 1 1800000 0>;

"make dtbs_check" says:

    regulator-vccq-sdhi0: states:0: [3300000, 1, 1800000, 0] is too long

Please group the two states using angular brackets.

> +               regulator-boot-on;
> +               gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
> +               regulator-always-on;
> +       };
>  };
>
>  &adc {
> @@ -32,4 +73,108 @@
>         adc_pins: adc {
>                 pinmux = <RZG2L_PORT_PINMUX(9, 0, 2)>; /* ADC_TRG */
>         };
> +
> +       /*
> +        * SDO device selection is XOR between GPIO_SD0_DEV_SEL and SW1[2]
> +        * The below switch logic can be used to select the device between
> +        * eMMC and microSD, after setting GPIO_SD0_DEV_SEL to high in DT.
> +        * SW1[2] should be at position 2/OFF to enable 64Gb eMMC
> +        * SW1[2] should be at position 3/ON to enable uSD card CN3
> +        */
> +       gpio_sd0_dev_sel {

    gpio_sd0_dev_sel: $nodename:0: 'gpio_sd0_dev_sel' does not match
'^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
    (for all hogs)

Please use e.g. "sd0-dev-sel-hog".

> +               gpio-hog;
> +               gpios = <RZG2L_GPIO(41, 1) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "gpio_sd0_dev_sel";
> +       };
> +
> +       sd0_pwr_en {

gpio-sd0-pwr-en-hog (with "gpio-" prefix, to match schematics)

> +               gpio-hog;
> +               gpios = <RZG2L_GPIO(4, 1) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "sd0_pwr_en";

gpio_sd0_pwr_en

> +       };

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
