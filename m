Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4FC8EA8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731497AbfHOLpV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:45:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHOLpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:45:21 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E88D2B2;
        Thu, 15 Aug 2019 13:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565869518;
        bh=cXJOaGd6roVYEcQram2z0isBJsQRvKBwHbGE0Jggb90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b9kRCnh+o4UkN5EGQTETqEkcKCYiV3qp9/a7tjTApUZ8fW/1sZPaSjeGg5X7vXDSN
         IsCrViB01nplCxKmGuf4WJTJ8Z68cJL2hNj5E33LxUmq+QylEM8irSegVsHHr+szKE
         MPUQnXJPCCjYN4uS3OulrETd8DxqrUbuqyb1IJMs=
Date:   Thu, 15 Aug 2019 14:45:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
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
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Message-ID: <20190815114515.GH5011@pendragon.ideasonboard.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1565867073-24746-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1565867073-24746-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Thu, Aug 15, 2019 at 12:04:25PM +0100, Fabrizio Castro wrote:
> Dual-link LVDS displays have two ports, therefore document this
> with the bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v1->v2:
> * Reworked the description of the ports property
> * lvds0_panel_in in the example has been renamed to panel_in0
> * lvds1_panel_in in the example has been renamed to panel_in1
> 
> Laurent,
> 
> in linux-next they are now working with:
> Documentation/devicetree/bindings/display/panel/lvds.yaml

Documentation/devicetree/bindings/display/panel/lvds.yaml is in
drm-misc-next, so I would advise rebasing on top of that.

> What should I do here?
> 
>  .../bindings/display/panel/panel-lvds.txt          | 95 ++++++++++++++++------
>  1 file changed, 71 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> index 250850a..5231243 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> @@ -41,7 +41,12 @@ Required nodes:
>  
>  - panel-timing: See panel-common.txt.
>  - ports: See panel-common.txt. These bindings require a single port subnode
> -  corresponding to the panel LVDS input.
> +  (for a single link panel) corresponding to the panel LVDS input, or two port
> +  subnodes (for a dual link panel) corresponding to the panel LVDS inputs.
> +  Dual-link LVDS panels expect even pixels (0, 2, 4, etc.) and odd pixels (1, 3,
> +  5, etc.) on different input ports, it's up to the panel-specific bindings to
> +  specify what port is expecting even pixels, and what port is expecting odd
> +  pixels.
>  
>  
>  LVDS data mappings are defined as follows.
> @@ -92,30 +97,72 @@ CTL3: 0
>  Example
>  -------
>  
> -panel {
> -	compatible = "mitsubishi,aa121td01", "panel-lvds";
> -
> -	width-mm = <261>;
> -	height-mm = <163>;
> -
> -	data-mapping = "jeida-24";
> -
> -	panel-timing {
> -		/* 1280x800 @60Hz */
> -		clock-frequency = <71000000>;
> -		hactive = <1280>;
> -		vactive = <800>;
> -		hsync-len = <70>;
> -		hfront-porch = <20>;
> -		hback-porch = <70>;
> -		vsync-len = <5>;
> -		vfront-porch = <3>;
> -		vback-porch = <15>;
> +Single port:
> +	panel {
> +		compatible = "mitsubishi,aa121td01", "panel-lvds";
> +
> +		width-mm = <261>;
> +		height-mm = <163>;
> +
> +		data-mapping = "jeida-24";
> +
> +		panel-timing {
> +			/* 1280x800 @60Hz */
> +			clock-frequency = <71000000>;
> +			hactive = <1280>;
> +			vactive = <800>;
> +			hsync-len = <70>;
> +			hfront-porch = <20>;
> +			hback-porch = <70>;
> +			vsync-len = <5>;
> +			vfront-porch = <3>;
> +			vback-porch = <15>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds_encoder>;
> +			};
> +		};
>  	};
>  
> -	port {
> -		panel_in: endpoint {
> -			remote-endpoint = <&lvds_encoder>;
> +Two ports:
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
> +				panel_in0: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				panel_in1: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
>  		};
>  	};
> -};

-- 
Regards,

Laurent Pinchart
