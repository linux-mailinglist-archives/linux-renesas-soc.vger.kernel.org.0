Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2416B11ED9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 23:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfLMWQX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 17:16:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbfLMWQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 17:16:22 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38ACE9D6;
        Fri, 13 Dec 2019 23:16:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576275379;
        bh=8v3Vl0tRhEDBVMWaZdlqz6AcZcOhfQ9YhCMTb9iBmwU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oQWxXcWE90vCVxgDF+U72Gqq2+42SshQcvP3fFEf5WDeZJJi8naumeXS49K0B6DW0
         1bvCFOLfCNk0lziXFIYvkIUkm2Df+Ogk51OWQVRS3jUJA01UKePXQ+i83OoKQctPF0
         lJ02QwifFj4P9lvpAA9zvdZuEBUt1HUeCiRLQNbA=
Date:   Sat, 14 Dec 2019 00:16:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v4 6/7] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191213221609.GQ4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-7-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1575649974-31472-7-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:53PM +0000, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * new patch
> ---
>  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> new file mode 100644
> index 0000000..24cd38b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/advantech,idk-2121wr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Advantech IDK-2121WR 21.5" Full-HD dual-LVDS panel
> +
> +maintainers:
> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  The IDK-2121WR from Advantech is a Full-HD dual-LVDS panel.
> +  A dual-LVDS interface is a dual-link connection with even pixels traveling
> +  on one link, and with odd pixels traveling on the other link.
> +
> +  The panel expects odd pixels on the first port, and even pixels on the
> +  second port, therefore the ports must be marked accordingly (with either
> +  dual-lvds-odd-pixels or dual-lvds-even-pixels).
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: advantech,idk-2121wr
> +      - {} # panel-lvds, but not listed here to avoid false select
> +
> +  width-mm:
> +    const: 476
> +
> +  height-mm:
> +    const: 268
> +
> +  data-mapping:
> +    const: vesa-24
> +
> +  ports:
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The sink for odd pixels.
> +        properties:
> +          reg:
> +            const: 0
> +
> +          dual-lvds-odd-pixels: true
> +
> +        required:
> +          - reg
> +          - dual-lvds-odd-pixels
> +
> +      port@1:
> +        type: object
> +        description: The sink for even pixels.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          dual-lvds-even-pixels: true
> +
> +        required:
> +          - reg
> +          - dual-lvds-even-pixels
> +
> +  panel-timing: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - width-mm
> +  - height-mm
> +  - data-mapping
> +  - panel-timing
> +  - ports
> +
> +examples:
> +  - |+
> +    panel-lvds {
> +      compatible = "advantech,idk-2121wr", "panel-lvds";
> +
> +      width-mm = <476>;
> +      height-mm = <268>;
> +
> +      data-mapping = "vesa-24";
> +
> +      panel-timing {
> +        clock-frequency = <148500000>;
> +        hactive = <1920>;
> +        vactive = <1080>;
> +        hsync-len = <44>;
> +        hfront-porch = <88>;
> +        hback-porch = <148>;
> +        vfront-porch = <4>;
> +        vback-porch = <36>;
> +        vsync-len = <5>;
> +      };
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          dual-lvds-odd-pixels;
> +          panel_in0: endpoint {
> +            remote-endpoint = <&lvds0_out>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          dual-lvds-even-pixels;
> +          panel_in1: endpoint {
> +            remote-endpoint = <&lvds1_out>;
> +          };
> +        };
> +      };
> +    };
> +
> +...

-- 
Regards,

Laurent Pinchart
