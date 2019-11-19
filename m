Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BE0100FCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 01:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSATe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 19:19:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32800 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSATe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 19:19:34 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF3F0563;
        Tue, 19 Nov 2019 01:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574122771;
        bh=vlkuKu9sK/q05JyLvuh2kZKytL/A+MShiE20ocAAk4w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i35tMmEh6BW60LUKlcTqtPW3FRbRE1M4KDX4lJqey0kJh4PoV26D8z61OZouuqlF2
         bHGTxuHcCeBcFWDc+EAUpRdkMf5QyYhewkInc0df+ob22XIjk9y2khyBamV6YXrNsU
         ZuDZQAj9qtNjEjLAxvjqfTpKr4Qjus5KBsx/oAF8=
Date:   Tue, 19 Nov 2019 02:19:08 +0200
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
Subject: Re: [PATCH v4 13/13] [HACK] dt-bindings: display: bridge:
 lvds-codec: Absorb thine,thc63lvdm83d.txt
Message-ID: <20191119001908.GM5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:32PM +0000, Fabrizio Castro wrote:
> At this point in time, compatible string "thine,thc63lvdm83d" is
> backed by the lvds-codec driver, and the documentation contained
> in thine,thc63lvdm83d.txt is basically the same as the one
> contained in lvds-codec.yaml (generic fallback compatible string
> aside), therefore absorb thine,thc63lvdm83d.txt.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> Hi Laurent,
> 
> what do you think about this patch?

I think it's good :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

It however doesn't address my concern that resulted in patch 12/13. A
DTB could still contain only lvds-encoder or lvds-decoder, even if the
DT bindings forbid it. Adding a check in the driver would enforce the
use of a device-specific compatible string. It adds quite a bit of
complexity though :-S

> v3->v4:
> * New patch
> ---
>  .../bindings/display/bridge/lvds-codec.yaml        |  5 +--
>  .../bindings/display/bridge/thine,thc63lvdm83d.txt | 50 ----------------------
>  2 files changed, 2 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 21f8c6e..420bfce 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -30,9 +30,6 @@ description: |
>  
>  properties:
>    compatible:
> -    description: |
> -      Must list the device specific compatible string first, followed by the
> -      generic compatible string.
>      oneOf:
>        - items:
>          - enum:
> @@ -44,6 +41,8 @@ properties:
>          - enum:
>            - ti,ds90cf384a     # For the DS90CF384A FPD-Link LVDS Receiver
>          - const: lvds-decoder # Generic LVDS decoders compatible fallback
> +      - enum:
> +        - thine,thc63lvdm83d  # For the THC63LVDM83D LVDS serializer
>  
>    ports:
>      type: object
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> deleted file mode 100644
> index fee3c88..0000000
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -THine Electronics THC63LVDM83D LVDS serializer
> -----------------------------------------------
> -
> -The THC63LVDM83D is an LVDS serializer designed to support pixel data
> -transmission between a host and a flat panel.
> -
> -Required properties:
> -
> -- compatible: Should be "thine,thc63lvdm83d"
> -
> -Optional properties:
> -
> -- powerdown-gpios: Power down control GPIO (the /PWDN pin, active low).
> -
> -Required nodes:
> -
> -The THC63LVDM83D has two video ports. Their connections are modeled using the
> -OFgraph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
> -- Video port 0 for CMOS/TTL input
> -- Video port 1 for LVDS output
> -
> -
> -Example
> --------
> -
> -	lvds_enc: encoder@0 {
> -		compatible = "thine,thc63lvdm83d";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -
> -				lvds_enc_in: endpoint@0 {
> -					remote-endpoint = <&rgb_out>;
> -				};
> -			};
> -
> -			port@1 {
> -				reg = <1>;
> -
> -				lvds_enc_out: endpoint@0 {
> -					remote-endpoint = <&panel_in>;
> -				};
> -			};
> -		};
> -	};

-- 
Regards,

Laurent Pinchart
