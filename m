Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366792419EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 12:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgHKKu1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 06:50:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgHKKu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 06:50:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D7389A8;
        Tue, 11 Aug 2020 12:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597143024;
        bh=8zMEVa3KodzwQFTKfb1dnAJNwfvwTHPgVIybOjOgCS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TjtkmP+nti7Hw2cPpH9FvVgO6Gzej4/0sg5RMz7P4y4admndsBBNa0Sk5HI3lKudA
         aF0MkIu0IvJLdswJcYkOOevGxyaFs5udfKiGXpvAwO0d/eUzpiwTc6DoCzXwSke+V+
         1XJFjGeF5UbA+71ialko7B4p6xBb1LzCIphtNjc0=
Date:   Tue, 11 Aug 2020 13:50:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3] ARM: dts: iwg20d-q7-common: Fix touch controller
 probe failure
Message-ID: <20200811105011.GC6054@pendragon.ideasonboard.com>
References: <20200810174944.2892-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200810174944.2892-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Aug 10, 2020 at 06:49:44PM +0100, Biju Das wrote:
> As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
> voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator
> for these device nodes and remove powerdown-gpios property from
> lvds-receiver node as it results in touch controller driver probe failure.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch depend on below patches
> 
> 1) https://patchwork.kernel.org/patch/11707595/
> 2) https://patchwork.kernel.org/patch/11707593/
> 
> v2->v3 : Added the missing part from the patch. removal of powerdown-gpios property.
> v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel device nodes
>            (Ref: https://patchwork.kernel.org/patch/11707559/)
> v1 : https://patchwork.kernel.org/patch/11705819/
> ---
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index ebbe1518ef8a..056f93119d8a 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -57,7 +57,7 @@
>  
>  	lvds-receiver {
>  		compatible = "ti,ds90cf384a", "lvds-decoder";
> -		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vcc_3v3_tft1>;
>  
>  		ports {
>  			#address-cells = <1>;
> @@ -81,6 +81,7 @@
>  	panel {
>  		compatible = "edt,etm0700g0dh6";
>  		backlight = <&lcd_backlight>;
> +		power-supply = <&vcc_3v3_tft1>;
>  
>  		port {
>  			panel_in: endpoint {
> @@ -113,6 +114,17 @@
>  		};
>  	};
>  
> +	vcc_3v3_tft1: regulator-panel {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "Panel Vcc";

Should this be named vcc-3v3-tft1, to match the hardware ? It's not just
the panel, it's also the power supply to the LVDS receiver and touch
screen.

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		startup-delay-us = <70000>;

Where does the 70ms value come from ? The time constant of the VCC_3V3
-> VCC_3V3_TFT[12] switches circuitry is 0.1ms (RC = 100kΩ * 1nF), so
0.5ms (5*RC) should be enough there. Are there other delays that need to
be taken into account ?

With those small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		gpio = <&gpio7 25 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	vcc_sdhi1: regulator-vcc-sdhi1 {
>  		compatible = "regulator-fixed";
>  
> @@ -207,6 +219,7 @@
>  		reg = <0x38>;
>  		interrupt-parent = <&gpio2>;
>  		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		vcc-supply = <&vcc_3v3_tft1>;
>  	};
>  };
>  

-- 
Regards,

Laurent Pinchart
