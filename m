Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1F1F3903
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 20:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfKGTzQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 14:55:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33740 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfKGTzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 14:55:16 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 254DA71D;
        Thu,  7 Nov 2019 20:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573156513;
        bh=7vACrdEDaRWqs66/eccarEZeVyuK4enYsQ73KPlnHH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LZzkyFg9sSAWZmQCmaVePWPD+eoiy8Ka20lGo2vpRjumXO1M6vOzF8c/76vLtA1oR
         x/B/lCwQ/eGmgJlgmVdtUUVoq2Z8I3UBUXIN5ksYoZxAusc+m1RiaAtnBOMBszEX/X
         zIh4BAC3VhgNl+FBiCmb2rkmzVbktM41kfErD25w=
Date:   Thu, 7 Nov 2019 21:55:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: Add EK874 board with
 idk-2121wr display support
Message-ID: <20191107195502.GK24983@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567017402-5895-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Aug 28, 2019 at 07:36:40PM +0100, Fabrizio Castro wrote:
> The EK874 is advertised as compatible with panel IDK-2121WR from
> Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> to work with the EK874, is the most convenient way to support the
> EK874 when it's connected to the IDK-2121WR.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * Added comment for lvds-connector-en-gpio
> * Renamed &lvds0_panel_in to panel_in0
> * Renamed &lvds1_panel_in to panel_in1
> 
> v2->v3:
> * removed renesas,swap-data property
> * added dual-lvds-odd-pixels and dual-lvds-even-pixels properties
> 
> Geert,
> 
> no need to review this patch unless they like the idea behind this
> series.

I like the idea :-) We still have a few issues to solve, but it should
make it in.

The patch looks sane to me, but I haven't checked if it matches the
hardware, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(even if this really calls for DT overlays)

> ---
>  arch/arm64/boot/dts/renesas/Makefile               |   3 +-
>  .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++++++++++
>  2 files changed, 118 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 42b74c2..ce48478 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
>  dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
> -dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
> +dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
> +			       r8a774c0-ek874-idk-2121wr.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
> new file mode 100644
> index 0000000..a7b27d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the Silicon Linux RZ/G2E evaluation kit (EK874),
> + * connected to an Advantech IDK-2121WR 21.5" LVDS panel
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774c0-ek874.dts"
> +
> +/ {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm5 0 50000>;
> +
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +
> +		power-supply = <&reg_12p0v>;
> +		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	panel-lvds {
> +		compatible = "advantech,idk-2121wr", "panel-lvds";
> +
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		data-mapping = "vesa-24";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hsync-len = <44>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +				panel_in0: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +				panel_in1: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&gpio0 {
> +	/*
> +	 * When GP0_17 is low LVDS[01] are connected to the LVDS connector
> +	 * When GP0_17 is high LVDS[01] are connected to the LT8918L
> +	 */
> +	lvds-connector-en-gpio{
> +		gpio-hog;
> +		gpios = <17 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "lvds-connector-en-gpio";
> +	};
> +};
> +
> +&lvds0 {
> +	ports {
> +		port@1 {
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&panel_in0>;
> +			};
> +		};
> +	};
> +};
> +
> +&lvds1 {
> +	status = "okay";
> +
> +	clocks = <&cpg CPG_MOD 727>, <&x13_clk>, <&extal_clk>;
> +	clock-names = "fck", "dclkin.0", "extal";
> +
> +	ports {
> +		port@1 {
> +			lvds1_out: endpoint {
> +				remote-endpoint = <&panel_in1>;
> +			};
> +		};
> +	};
> +};
> +
> +&pfc {
> +	pwm5_pins: pwm5 {
> +		groups = "pwm5_a";
> +		function = "pwm5";
> +	};
> +};
> +
> +&pwm5 {
> +	pinctrl-0 = <&pwm5_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};

-- 
Regards,

Laurent Pinchart
