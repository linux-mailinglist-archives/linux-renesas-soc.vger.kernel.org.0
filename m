Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D562EAFE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 17:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbhAEQVl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 11:21:41 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:37588 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbhAEQVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 11:21:41 -0500
Received: by mail-oi1-f179.google.com with SMTP id l207so107294oib.4;
        Tue, 05 Jan 2021 08:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qPiqP3Lv6c+AAT30BoSKGDWtBOYr0gNlxMkgG1vPS+g=;
        b=SWKo0Vn5MI7SKAbLx3Egxb82sH9oBjWxlNr0FLF4fYrbmSQ+yy5j3HK4yRWu2uGtbe
         t37k/sv0CN8OTpBKdrA8ycy+MO9jNwvsHN++qN7IpzWeLt0i+XEshLtibLPkwBr4v94y
         kHtW1Xr4D001ykEuEpbJHaGGgiBws8mwizRS5Q+djShmhJzKNq9QUGbuYo6mRmk1095x
         ESc6L5TqBrCIAJNNquRgTIErISiGEJ9vhzMwrTh5h1hhd4Sx4/oWJqeYxR9+wpsYSCQN
         /Mbbb+vJrlLWPOk4EU8PLy6E/PzoqzbIaTIRydzsA+rh9eePV0MUyzI4Ip4HP2h8tvhD
         UMvQ==
X-Gm-Message-State: AOAM532L9jBfym6wDjnj4IkbRe7SvnPRV23+CUlI+DzUYu76SfGYbL0l
        CAgCtuVnwUtGA/eaQ7TMw4DhhLIO83UomB/J14k=
X-Google-Smtp-Source: ABdhPJzKeiHygcjJT1k7Mhyr7MP4DEtsx88pBRnKEvamWmZWxnefwC1XNDpcOKWAcmdRFmo6BO3+CfONu3n+fqNcogU=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr178613oih.153.1609863660062;
 Tue, 05 Jan 2021 08:21:00 -0800 (PST)
MIME-Version: 1.0
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com> <20201227130407.10991-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227130407.10991-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 17:20:49 +0100
Message-ID: <CAMuHMdWSZ7Fw2fX6aYhqavDDV01qkYJmXrAUWv8Rud9hKVEBZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch!

On Sun, Dec 27, 2020 at 2:04 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Tho Vu <tho.vu.wh@renesas.com>
>
> Define the Falcon board dependent part of the Ethernet-AVB device nodes.
> Only AVB0 was tested because it was the only port with a PHY on current
> hardware.

I'm a bit confused: according to the schematics, AVB0 is wired by
default to a KSZ9031 PHY connected to an RJ45 connector on the
breakout-board, while AVB1-5 are wired to 88Q2110 PHYs connected to a
5port MATEnet connector on the Ethernet sub board.  So all PHYs are
present?

(The alternative wiring for AVB0 is to a 88Q2110 PHY connected to a
1000Base-T1/TE MATEnet connector on the Ethernet sub board)

>
> Signed-off-by: Tho Vu <tho.vu.wh@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>  #include "r8a779a0-falcon-cpu.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";

Missing ethernet0 alias, preventing U-Boot from finding the device-node
and adding an appropriate "local-mac-address" property.

> @@ -21,6 +22,97 @@ chosen {
>         };
>  };
>
> +&avb0 {
> +       pinctrl-0 = <&avb0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-txid";

As the default wiring of AVB0 is similar to Salvator-XS, I think the
default phy-mode of "rgmii" in the base .dtsi should be fine, but
"tx-internal-delay-ps" should be overridden to <2000>.

> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;
> +               interrupt-parent = <&gpio4>;
> +               interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
> +       };
> +};
> +
> +&avb1 {
> +       pinctrl-0 = <&avb1_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy1>;
> +       phy-mode = "rgmii-txid";
> +
> +       phy1: ethernet-phy@1 {

Why not @0?
As the PHYs are present, why not set "status" to "okay"?

> +               rxc-skew-ps = <1500>;

This property is only supported by the Micrel PHY driver, not by
the Marvell PHY driver.

> +               reg = <0>;
> +               interrupt-parent = <&gpio5>;
> +               interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio5 15 GPIO_ACTIVE_LOW>;
> +       };
> +};

Same questions and comments for all instances below.
Perhaps we should postpone adding avb1-5 until they can be tested?

> @@ -78,6 +170,109 @@ &i2c6 {
>  };
>
>  &pfc {
> +       avb0_pins: avb0 {
> +               mux {
> +                       groups = "avb0_link", "avb0_mdio", "avb0_rgmii", "avb0_txcrefclk";
> +                       function = "avb0";
> +               };
> +
> +               pins_mdio {
> +                       groups = "avb0_mdio";
> +                       drive-strength = <21>;
> +               };
> +
> +               pins_mii_tx {

Strange node name, as the "avb0_rgmii" group includes rx pins.

> +                       groups = "avb0_rgmii";
> +                       drive-strength = <21>;

I can't comment on the drive-strength values.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
