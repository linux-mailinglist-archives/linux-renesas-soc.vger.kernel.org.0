Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4E6125312
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 21:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLRUUW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 15:20:22 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35623 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfLRUUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 15:20:22 -0500
Received: by mail-ot1-f65.google.com with SMTP id f71so4005489otf.2;
        Wed, 18 Dec 2019 12:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5ftNpWYyKl69z1Op+T0ZEjpd3DQ5nYjH7jvgxCSreFA=;
        b=NCvJ1TtoAVBZ4ej6sO6Ko2DYisotNmqXdR+CT3zEpA3/7ZQZmZgN1ukD/P1m0kDcHZ
         SMvo6a7053+B4wdGA3nCefJKbBiHVdJirYbQq0brjsMSPaOZLaoY2eoIC7zzjwCQA3ai
         LWfEVBzVfz29WneweUwQJqLqSopB3kePIY94liOpRzuVntuTNO6sVtBEdQNm5gQ282tQ
         lBZa9e3pD+sQDld8TKNIIF/6uHL3krPINT4p/R2PsFKsw2Qeh9qFs+4CatUhR0d3yEx/
         nF9wgZQQpsLju3Du7oXFtqRuuyjw0MOoyms8Ex0tNpZUxwYErTU3Z+6LQBznJMuYwYG4
         dXJQ==
X-Gm-Message-State: APjAAAVyZcuKaSdIi0iE1+R8CcUJbX29mNS40DQ/TLd8b/sQnYGxUp2+
        CwcYsnYwZg4YVweB3A/9eg==
X-Google-Smtp-Source: APXvYqxEKkkc4eUcU32G8cCC0HDWRY1ZBkEZlpsBb0kXZRCZgzaryBbWtD6Knj0ZDfA2aholr6kBuQ==
X-Received: by 2002:a9d:7501:: with SMTP id r1mr1785228otk.196.1576700421108;
        Wed, 18 Dec 2019 12:20:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm1196527otk.2.2019.12.18.12.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:20:19 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:20:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Subject: Re: [PATCH v6 5/6] dt-bindings: display: Add idk-2121wr binding
Message-ID: <20191218202018.GA7282@bogus>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576590361-28244-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 17, 2019 at 01:46:00PM +0000, Fabrizio Castro wrote:
> Add binding for the idk-2121wr LVDS panel from Advantech.
> 
> Some panel-specific documentation can be found here:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v5->v6:
> * No change
> 
> v4->v5:
> * No change
> 
> v3->v4:
> * Absorbed patch "dt-bindings: display: Add bindings for LVDS
>   bus-timings"
> * Big restructuring after Rob's and Laurent's comments
> 
> v2->v3:
> * New patch
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

Needs to reference lvds.yaml here.

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

No need for these 2. Can assume they are defined in common binding.

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


port@0 and port@1 both required?

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

No need to repeat what's required by lvds.yaml.

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
> -- 
> 2.7.4
> 
