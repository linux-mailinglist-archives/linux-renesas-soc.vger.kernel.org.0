Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75E8DF36B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 19:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbfKGSMN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 13:12:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKGSMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 13:12:13 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AA3C99A;
        Thu,  7 Nov 2019 19:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573150330;
        bh=qY+9wqw2HKjEleKyepixfIuCgZVEoPDFaahUGDwjj9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IalNoteqDBi42927UGCCa5rhXplV5XO4SMZO08+97RIpbJNDkQp1a58JXQWsNGqgD
         +vkONog7X97rmGJ3qI+EKSiMHpRp37v2qUoIL3ZELdg1ps5R7cSfpKdRe4v+W2l1oi
         GW2j+y11mkyXk7NPXpA2fC+WzoKQrma0CRlv1D3U=
Date:   Thu, 7 Nov 2019 20:12:00 +0200
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
Subject: Re: [PATCH v3 2/8] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191107181200.GB24231@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567017402-5895-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Aug 28, 2019 at 07:36:36PM +0100, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * new patch
> ---
>  .../display/panel/advantech,idk-2121wr.yaml        | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> new file mode 100644
> index 0000000..b2ccdc8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -0,0 +1,90 @@
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
> +
> +  The panels expects odd pixels from the first port, and even pixels from

s/panels/panel/
Maybe s/from the/on the/g ?

> +  the second port, therefore the ports must be marked accordingly.
> +
> +allOf:
> +  - $ref: lvds.yaml#
> +  - $ref: ../bus-timings/lvds.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: advantech,idk-2121wr
> +      - {} # panel-lvds, but not listed here to avoid false select
> +
> +  data-mapping:
> +    const: vesa-24
> +
> +  width-mm:
> +    const: 476
> +
> +  height-mm:
> +    const: 268
> +
> +  panel-timing: true
> +  ports: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible

Shouldn't data-mapping, width-mm, height-mm and ports be required too ?

As you mentioned in the cover letter, validating ports, port and the new
dual-lvds-*-pixels properties would be nice. I'm not YAML schema
specialist, so I'm fine with a best effort approach here, but as far as
I understand Rob proposed a way forward, could you try it ?

Apart from that, the bindings look sne to me, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

once the above issues get addressed.

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
