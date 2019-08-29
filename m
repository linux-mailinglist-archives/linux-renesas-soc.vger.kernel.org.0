Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E09FA1CD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 16:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfH2OdI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 10:33:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2OdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 10:33:08 -0400
Received: from pendragon.ideasonboard.com (85-76-67-152-nat.elisa-mobile.fi [85.76.67.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 723932E5;
        Thu, 29 Aug 2019 16:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567089185;
        bh=LLFnNWi8+xe8IFUm2uC6E4KdDBHIapI6l0mBjCKYGQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X1IZWYl214YobUT+kDlLhT8Z+WGbNEUZKAs2UeOAkMXKFpJIcJ0+jo2pycxMlv3FL
         dufELA9j3jTRLxSTRUbk5dOQ7jNMcUOyeR/vvKQKsddb+vBOE6FNIXQH8lplFwM/E8
         P9/ma5NLQgzSyNNdWgW/zEFAGTKunSrOcqNtDd3k=
Date:   Thu, 29 Aug 2019 17:32:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add idk-1110wr binding
Message-ID: <20190829143247.GA5875@pendragon.ideasonboard.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567078713-29361-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Aug 29, 2019 at 12:38:32PM +0100, Fabrizio Castro wrote:
> Add binding for the idk-1110wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-LCD-Kit-Modules/model-IDK-1110WR-55WSA1E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1->v2:
> * no change
> 
>  .../display/panel/advantech,idk-1110wr.yaml        | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> new file mode 100644
> index 0000000..e5fdaa0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/advantech,idk-1110wr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Advantech IDK-1110WR 10.1" WSVGA LVDS Display Panel
> +
> +maintainers:
> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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

-- 
Regards,

Laurent Pinchart
