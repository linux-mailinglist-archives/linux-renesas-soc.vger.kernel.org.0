Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5722562DEF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Nov 2022 16:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbiKQPFL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 10:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiKQPFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 10:05:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB38B140A6;
        Thu, 17 Nov 2022 07:05:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F4CC929;
        Thu, 17 Nov 2022 16:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668697508;
        bh=oKMtWtuyioi0YgvWzxpzxj77lBGNz8PB7EABwVQiruI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hII8nMnlvxrt27OOZJIRHSJgEVOWFZ/sTkFWgCzDMQ8xU4PMscDLQXwuLbTO4e7pt
         2jWZLq/iU1Z1mSnDhxxwYP7IR+Qir0swLQNOh5PpW+aBf7MlcskH8721MGG0+TaoPw
         k/8+hxAScVX3pi74VLL19/N7wUyeKxpFylcWacU0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221117122547.809644-6-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com> <20221117122547.809644-6-tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 5/8] arm64: dts: renesas: white-hawk-cpu: Add DP output support
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Thu, 17 Nov 2022 15:05:04 +0000
Message-ID: <166869750492.50677.10848791222370585422@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Tomi Valkeinen (2022-11-17 12:25:44)
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> Add DT nodes needed for the mini DP connector. The DP is driven by
> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/a=
rch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> index c10740aee9f6..8aab859aac7a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -97,6 +97,15 @@ memory@600000000 {
>                 reg =3D <0x6 0x00000000 0x1 0x00000000>;
>         };
> =20
> +       reg_1p2v: regulator-1p2v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "fixed-1.2V";
> +               regulator-min-microvolt =3D <1200000>;
> +               regulator-max-microvolt =3D <1200000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
>         reg_1p8v: regulator-1p8v {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "fixed-1.8V";
> @@ -114,6 +123,24 @@ reg_3p3v: regulator-3p3v {
>                 regulator-boot-on;
>                 regulator-always-on;
>         };
> +
> +       mini-dp-con {
> +               compatible =3D "dp-connector";
> +               label =3D "CN5";
> +               type =3D "mini";
> +
> +               port {
> +                       mini_dp_con_in: endpoint {
> +                               remote-endpoint =3D <&sn65dsi86_out>;
> +                       };
> +               };
> +       };
> +
> +       sn65dsi86_refclk: clk-x6 {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <38400000>;
> +       };
>  };
> =20
>  &avb0 {
> @@ -134,6 +161,23 @@ phy0: ethernet-phy@0 {
>         };
>  };
> =20
> +&dsi0 {
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {
> +                       dsi0_out: endpoint {
> +                               remote-endpoint =3D <&sn65dsi86_in>;
> +                               data-lanes =3D <1 2 3 4>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du {
> +       status =3D "okay";
> +};
> +
>  &extal_clk {
>         clock-frequency =3D <16666666>;
>  };
> @@ -172,6 +216,51 @@ eeprom@50 {
>         };
>  };
> =20
> +&i2c1 {
> +       pinctrl-0 =3D <&i2c1_pins>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       bridge@2c {
> +               compatible =3D "ti,sn65dsi86";
> +               reg =3D <0x2c>;
> +
> +               clocks =3D <&sn65dsi86_refclk>;
> +               clock-names =3D "refclk";
> +
> +               interrupt-parent =3D <&intc_ex>;
> +               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +               enable-gpios =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +
> +               vccio-supply =3D <&reg_1p8v>;
> +               vpll-supply =3D <&reg_1p8v>;
> +               vcca-supply =3D <&reg_1p2v>;
> +               vcc-supply =3D <&reg_1p2v>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               sn65dsi86_in: endpoint {
> +                                       remote-endpoint =3D <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg =3D <1>;
> +                               sn65dsi86_out: endpoint {
> +                                       remote-endpoint =3D <&mini_dp_con=
_in>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &mmc0 {
>         pinctrl-0 =3D <&mmc_pins>;
>         pinctrl-1 =3D <&mmc_pins>;
> @@ -221,6 +310,11 @@ i2c0_pins: i2c0 {
>                 function =3D "i2c0";
>         };
> =20
> +       i2c1_pins: i2c1 {
> +               groups =3D "i2c1";
> +               function =3D "i2c1";
> +       };
> +
>         keys_pins: keys {
>                 pins =3D "GP_5_0", "GP_5_1", "GP_5_2";
>                 bias-pull-up;
> --=20
> 2.34.1
>
