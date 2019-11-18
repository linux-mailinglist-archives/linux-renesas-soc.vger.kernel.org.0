Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF00100F87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 00:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKRXvw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 18:51:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60384 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKRXvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 18:51:52 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EA71563;
        Tue, 19 Nov 2019 00:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121108;
        bh=cq0iFcYYLL7F6N22Jb2KwkopjMTXx0m1CZA3BmgC/o4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PBtMEgkkXUJz6kMJbnMdvTUvaZPp/FH0TAv9kM+IH9TpoLtpTjnkvngM2VmgAzh9e
         3XB1PUi45IiX9azWW1pntADsy9HihaZNuR9ZiVOSjmPJOEjU0QJMBNCADREADS6BSk
         MWpSLzI4K3E6Qw3QAQ5ByjWTk3kd8TUJL+E7yOTI=
Date:   Tue, 19 Nov 2019 01:51:30 +0200
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
Subject: Re: [PATCH v4 01/13] dt-bindings: display: bridge: Convert
 lvds-transmitter binding to json-schema
Message-ID: <20191118235130.GA5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:20PM +0000, Fabrizio Castro wrote:
> Convert the lvds-transmitter binding to DT schema format using
> json-schema.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * Fixed the description of property "compatible" according to Laurent's
>   comments
> v2->v3:
> * Extracted conversion to dt-schema as per Rob's comment
> v1->v2:
> * Converted to dt-schema as per Neil's comment
> ---
>  .../bindings/display/bridge/lvds-transmitter.txt   | 66 ----------------
>  .../bindings/display/bridge/lvds-transmitter.yaml  | 91 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> deleted file mode 100644
> index 60091db..0000000
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Parallel to LVDS Encoder
> -------------------------
> -
> -This binding supports the parallel to LVDS encoders that don't require any
> -configuration.
> -
> -LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> -incompatible data link layers have been used over time to transmit image data
> -to LVDS panels. This binding targets devices compatible with the following
> -specifications only.
> -
> -[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> -1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> -[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> -Semiconductor
> -[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> -Electronics Standards Association (VESA)
> -
> -Those devices have been marketed under the FPD-Link and FlatLink brand names
> -among others.
> -
> -
> -Required properties:
> -
> -- compatible: Must be "lvds-encoder"
> -
> -  Any encoder compatible with this generic binding, but with additional
> -  properties not listed here, must list a device specific compatible first
> -  followed by this generic compatible.
> -
> -Required nodes:
> -
> -This device has two video ports. Their connections are modeled using the OF
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
> -	compatible = "lvds-encoder";
> -
> -	ports {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		port@0 {
> -			reg = <0>;
> -
> -			lvds_enc_in: endpoint {
> -				remote-endpoint = <&display_out_rgb>;
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
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> new file mode 100644
> index 0000000..b5dd0da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lvds-transmitter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Parallel to LVDS Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This binding supports the parallel to LVDS encoders that don't require any
> +  configuration.
> +
> +  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
> +  incompatible data link layers have been used over time to transmit image data
> +  to LVDS panels. This binding targets devices compatible with the following
> +  specifications only.
> +
> +  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
> +  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
> +  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
> +  Semiconductor
> +  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
> +  Electronics Standards Association (VESA)
> +
> +  Those devices have been marketed under the FPD-Link and FlatLink brand names
> +  among others.
> +
> +properties:
> +  compatible:
> +    description: |
> +      Any encoder compatible with this generic binding, but with additional
> +      properties not listed here, must define its own binding and list a device
> +      specific compatible first followed by the generic compatible.
> +    enum:
> +      - lvds-encoder
> +
> +  ports:
> +    type: object
> +    description: |
> +      This device has two video ports. Their connections are modeled using the
> +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Port 0 is for parallel input
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Port 1 is for LVDS output
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - ports
> +
> +examples:
> +  - |
> +    lvds-encoder {
> +      compatible = "lvds-encoder";
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +
> +          lvds_enc_in: endpoint {
> +            remote-endpoint = <&display_out_rgb>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +
> +          lvds_enc_out: endpoint {
> +            remote-endpoint = <&lvds_panel_in>;
> +          };
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart
