Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E071858FB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2020 03:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbgCOC06 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Mar 2020 22:26:58 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:46590 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgCOC05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Mar 2020 22:26:57 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8E42D804EB;
        Sat, 14 Mar 2020 08:38:14 +0100 (CET)
Date:   Sat, 14 Mar 2020 08:38:12 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Add idk-1110wr binding
Message-ID: <20200314073812.GC5783@ravnborg.org>
References: <1583957020-16359-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583957020-16359-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583957020-16359-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8
        a=NcFk6D9gAAAA:8 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=gEfo2CItAAAA:8
        a=pGLkceISAAAA:8 a=rdn2N8ET07tcJGP0fp8A:9 a=CjuIK1q_8ugA:10
        a=woH39XMaDYAA:10 a=-FEs8UIgK8oA:10 a=CojVow1nldcA:10 a=NWVoK91CQyQA:10
        a=QsnFDINu91a9xkgZirup:22 a=dT0RXAwTRpxWjiziVLXF:22
        a=AjGcO6oz07-iQ99wixmX:22 a=D0XLA9XvdZm18NrgonBM:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar

On Wed, Mar 11, 2020 at 08:03:39PM +0000, Lad Prabhakar wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Add binding for the idk-1110wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied, and pushed to drm-misc-next.

	Sam

> ---
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> new file mode 100644
> index 0000000..93878c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/advantech,idk-1110wr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Advantech IDK-1110WR 10.1" WSVGA LVDS Display Panel
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: lvds.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: advantech,idk-1110wr
> +      - {} # panel-lvds, but not listed here to avoid false select
> +
> +  data-mapping:
> +    const: jeida-24
> +
> +  width-mm:
> +    const: 223
> +
> +  height-mm:
> +    const: 125
> +
> +  panel-timing: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |+
> +    panel {
> +      compatible = "advantech,idk-1110wr", "panel-lvds";
> +
> +      width-mm = <223>;
> +      height-mm = <125>;
> +
> +      data-mapping = "jeida-24";
> +
> +      panel-timing {
> +        /* 1024x600 @60Hz */
> +        clock-frequency = <51200000>;
> +        hactive = <1024>;
> +        vactive = <600>;
> +        hsync-len = <240>;
> +        hfront-porch = <40>;
> +        hback-porch = <40>;
> +        vsync-len = <10>;
> +        vfront-porch = <15>;
> +        vback-porch = <10>;
> +      };
> +
> +      port {
> +        panel_in: endpoint {
> +          remote-endpoint = <&lvds_encoder>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> 2.7.4
