Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 562FD100F93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 00:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKRX5P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 18:57:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60484 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKRX5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 18:57:15 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 471A2563;
        Tue, 19 Nov 2019 00:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121433;
        bh=aKyNEzCNW4oqanbsWqK2vMzhTfqMSaiIuQ3r2mGPDj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gx4DUTq4zphwLP3Z2qhO9xaWOGpl1lP/YpXrRTzV7qja/hb6HnRCOvBkEFSV7LqHq
         OLSaHZPElrzSDDNaxQgIP4wGGcd0D1wXyiXW7fLLZra6LdaMtmgbkZxV5D2UgCJz5R
         bgBEoGFdcBr9SplSX9zYillzM/XE1vvp+vrJKimE=
Date:   Tue, 19 Nov 2019 01:56:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 03/13] dt-bindings: display: bridge: lvds-transmitter:
 Absorb ti,ds90c185.txt
Message-ID: <20191118235659.GC5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:22PM +0000, Fabrizio Castro wrote:
> ti,ds90c185.txt documents LVDS encoders using the same driver
> as the one documented by lvds-transmitter.yaml.
> Since the properties listed in ti,ds90c185.txt are the same
> as the ones listed in lvds-transmitter.yaml, absorb the dt-binding
> into lvds-transmitter.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  .../bindings/display/bridge/lvds-transmitter.yaml  | 14 +++---
>  .../bindings/display/bridge/ti,ds90c185.txt        | 55 ----------------------
>  2 files changed, 8 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> index 2484737..a8326ce 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> @@ -31,11 +31,13 @@ description: |
>  properties:
>    compatible:
>      description: |
> -      Any encoder compatible with this generic binding, but with additional
> -      properties not listed here, must define its own binding and list a device
> -      specific compatible first followed by the generic compatible.
> -    enum:
> -      - lvds-encoder
> +      Must list the device specific compatible string first, followed by the
> +      generic compatible string.
> +    items:
> +      - enum:
> +        - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
> +        - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
> +      - const: lvds-encoder # Generic LVDS encoder compatible fallback
>  
>    ports:
>      type: object
> @@ -69,7 +71,7 @@ required:
>  examples:
>    - |
>      lvds-encoder {
> -      compatible = "lvds-encoder";
> +      compatible = "ti,ds90c185", "lvds-encoder";
>  
>        ports {
>          #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> deleted file mode 100644
> index e575f99..0000000
> --- a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -Texas Instruments FPD-Link (LVDS) Serializer
> ---------------------------------------------
> -
> -The DS90C185 and DS90C187 are low-power serializers for portable
> -battery-powered applications that reduces the size of the RGB
> -interface between the host GPU and the display.
> -
> -Required properties:
> -
> -- compatible: Should be
> -  "ti,ds90c185", "lvds-encoder"  for the TI DS90C185 FPD-Link Serializer
> -  "ti,ds90c187", "lvds-encoder"  for the TI DS90C187 FPD-Link Serializer
> -
> -Optional properties:
> -
> -- powerdown-gpios: Power down control GPIO (the PDB pin, active-low)
> -
> -Required nodes:
> -
> -The devices have two video ports. Their connections are modeled using the OF
> -graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
> -- Video port 0 for parallel input
> -- Video port 1 for LVDS output
> -
> -
> -Example
> --------
> -
> -lvds-encoder {
> -	compatible = "ti,ds90c185", "lvds-encoder";
> -
> -	powerdown-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			lvds_enc_in: endpoint {
> -				remote-endpoint = <&lcdc_out_rgb>;
> -			};
> -		};
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			lvds_enc_out: endpoint {
> -				remote-endpoint = <&lvds_panel_in>;
> -			};
> -		};
> -	};
> -};
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart
