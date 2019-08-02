Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B19617EE40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732294AbfHBIDh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:03:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfHBIDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:03:36 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0013A33E;
        Fri,  2 Aug 2019 10:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564733014;
        bh=iESMaiwMfzcHwok5GLi0XmKd4pH/pITjQS3plSb9Z34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GlIO4h09Z40O9LbRY2FO6XIGflDy1hY2hNm+JpqlfFcT4o1UBbVay+On30qcePB3R
         XpK6hxFtraFU69VIrNjbWvA7k7S5K3ybAB23zpFl3Uy0bn/8xyo4nBeE98MbJOP/L0
         BExEJZlMr4sLNiLx+OBcBgfFnhF/L3lxiy98JP1A=
Date:   Fri, 2 Aug 2019 11:03:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for
 Advantech IDK-2121WR
Message-ID: <20190802080332.GE5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:01AM +0100, Fabrizio Castro wrote:
> This panel is handled through the generic lvds-panel bindings,
> so only needs its additional compatible specified.
> 
> Some panel specific documentation can be found here:

s/panel specific/panel-specific/

> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  .../display/panel/advantech,idk-2121wr.txt         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
> new file mode 100644
> index 0000000..70b15b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
> @@ -0,0 +1,62 @@
> +Advantech Co., Ltd. IDK-2121WR 21.5" LVDS panel
> +===============================================
> +
> +Required properties:
> +- compatible: should be "advantech,idk-2121wr" followed by "panel-lvds"
> +
> +This binding is compatible with the lvds-panel binding, which is specified
> +in panel-lvds.txt in this directory.

How about adding "The panel operates in dual-link mode and thus requires
two port nodes." ?

> +
> +Example
> +-------
> +
> +	panel {
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
> +				lvds0_panel_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				lvds1_panel_in: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
> +		};
> +	};
> +
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

I think you can drop the backlight here, it's a bit out of scope.

-- 
Regards,

Laurent Pinchart
