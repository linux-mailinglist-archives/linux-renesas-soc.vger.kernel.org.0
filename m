Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC09C3FC3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbfJASZ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:25:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728456AbfJASZ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:25:26 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE2A23F;
        Tue,  1 Oct 2019 20:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569954323;
        bh=cmL18QMee8v+4UyAhs4JOoF9M4X5HAKn20PG0g2L+To=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DPnZX9pc4Co/PmVC8ixkFP+si7fDztCJKOND9F/WcYgQOt0DbdGZDyJcfwmNsjFwh
         yr2SJu1r2rSmBzKrUV0P4BeG+ukJusfTBYeytxq3X/VLiiz1AKQiKQunlG3UZCrsri
         X+GRN8JVipmZa6wmM7vDZGWYVT4lMafzJKd5o/IY=
Date:   Tue, 1 Oct 2019 21:25:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS panel
 support
Message-ID: <20191001182510.GJ4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-9-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-9-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:24PM +0100, Biju Das wrote:
> This patch adds support for Advantech idk-1110wr LVDS panel.
> The HiHope RZ/G2[MN] is advertised as compatible with panel idk-1110wr
> from Advantech, however the panel isn't sold alongside the board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi  | 30 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi | 37 ++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index 70f9a2a..ae1ef2d 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2019 Renesas Electronics Corp.
>   */
>  
> +#include "rzg2-panel-lvds.dtsi"
> +
>  / {
>  	aliases {
>  		ethernet0 = &avb;
> @@ -51,6 +53,34 @@
>  	status = "okay";
>  };
>  
> +&gpio1 {
> +	/*
> +	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> +	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> +	 */
> +	lvds-connector-en-gpio {
> +		gpio-hog;
> +		gpios = <20 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "lvds-connector-en-gpio";
> +	};
> +};
> +
> +&lvds0 {
> +	/* Uncomment  below line to enable lvds panel connected to RZ/G2N board
> +	 */
> +
> +	/* status = "okay"; */
> +
> +	ports {
> +		port@1 {
> +			lvds_connector: endpoint {
> +				remote-endpoint = <&panel_in_advantech_idk_1110wr>;
> +			};
> +		};
> +	};
> +};
> +
>  &pciec0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi b/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi
> new file mode 100644
> index 0000000..768a8ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi

Should this be named according to the panel name istead of just
"panel-lvds" ? It could be used by any board, and this board could also
use a different LVDS panel.

> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the LVDS panels connected to RZ/G2 boards
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +/ {
> +
> +	panel-lvds {
> +		compatible = "advantech,idk-1110wr", "panel-lvds";
> +
> +		width-mm = <223>;
> +		height-mm = <125>;
> +
> +		data-mapping = "jeida-24";
> +
> +		panel-timing {
> +			/* 1024x600 @60Hz */
> +			clock-frequency = <51200000>;
> +			hactive = <1024>;
> +			vactive = <600>;
> +			hsync-len = <240>;
> +			hfront-porch = <40>;
> +			hback-porch = <40>;
> +			vfront-porch = <15>;
> +			vback-porch = <10>;
> +			vsync-len = <10>;
> +		};
> +
> +		port {
> +			panel_in_advantech_idk_1110wr: endpoint {

Could we abbreviate the label name to panel_in ? That way the board .dts
wouldn't need to update the remote-endpoint phandle to use a different
panel, only the #include would need to be changed.

> +				remote-endpoint = <&lvds_connector>;
> +			};
> +		};
> +	};
> +};

For the same reason I would set the remote-endpoint for &lvds_connector
here. See arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi for an example.


-- 
Regards,

Laurent Pinchart
