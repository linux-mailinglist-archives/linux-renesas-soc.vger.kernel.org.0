Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091B62F2378
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 01:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391769AbhALAZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 19:25:51 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:41283 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390770AbhAKWuE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:50:04 -0500
Received: by mail-ot1-f46.google.com with SMTP id x13so468858oto.8;
        Mon, 11 Jan 2021 14:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wz2MH7ykMU5ONDsoSmTo3zznpsQj7T/MGyT3Jo+3L1Y=;
        b=MWHq+/9bNcMBcMpx5l0Qu7fzEKYIWW5YCz32y33ZGyI9rXghAH2vMh6+c/VRg4WpRd
         ZJv3d3o8js0kGvCy3RRZGrWkXutHcBlH0FQ05RMzeArcCim7NNDbc7iZu9pdG6AeIkB0
         VmYDR7xWZiqiWmIvDU6YUEEXNg62CN97lu99ZsNgslGLDyS2eiCqmlz03cHqGTTZei4o
         kUXJLrMGEtVzehcbCArj7ArPrqKPYT1NGVfLrP3QVM9QDtMLqO7/y03gB8uxaKRqS+QQ
         V+l/sBMs7RHObU5ezI1BABtvkFN6KhXsbCU9GAYK0PgMayCFFCPDGrgTB+CQKZg6hhwI
         ZXQg==
X-Gm-Message-State: AOAM532IGo4oM09y5Ljf46rd9YO9yy+iKIEqFx/cMgxalNzo87QR85vD
        5xdgGIWrZrQ4jHB7RlC0G9LPkRnfIA==
X-Google-Smtp-Source: ABdhPJyBD7ogYMfPGa69CMq4BaPiZMdTamezawFqriooXplzKySGfkAeETHZrifDjiKlF3HVyY9mfw==
X-Received: by 2002:a05:6830:1d58:: with SMTP id p24mr941223oth.286.1610405362536;
        Mon, 11 Jan 2021 14:49:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k3sm200383oor.19.2021.01.11.14.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:49:21 -0800 (PST)
Received: (nullmailer pid 3202128 invoked by uid 1000);
        Mon, 11 Jan 2021 22:49:20 -0000
Date:   Mon, 11 Jan 2021 16:49:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20210111224920.GA3197768@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 05, 2021 at 08:08:14AM +0200, Laurent Pinchart wrote:
> Convert the Renesas R-Car DWC HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Update MAINTAINERS
> 
> Changes since v1:
> 
> - Drop the part numbers in comments, only keep the SoC names
> - Use unevaluatedProperties instead of additionalProperties
> - Only specify maxItems for clocks and clock-names
> - Drop reg, interrupts, #address-cells and #size-cells as they're
>   checked in the base schema
> - Use one size and address cell in example
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> ---
>  .../display/bridge/renesas,dw-hdmi.txt        |  88 ------------
>  .../display/bridge/renesas,dw-hdmi.yaml       | 128 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 129 insertions(+), 89 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> deleted file mode 100644
> index 3f6072651182..000000000000
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -Renesas Gen3 DWC HDMI TX Encoder
> -================================
> -
> -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> -with a companion PHY IP.
> -
> -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> -following device-specific properties.
> -
> -
> -Required properties:
> -
> -- compatible : Shall contain one or more of
> -  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
> -  - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
> -  - "renesas,r8a774e1-hdmi" for R8A774E1 (RZ/G2H) compatible HDMI TX
> -  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
> -  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
> -  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
> -  - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
> -  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
> -			     HDMI TX
> -
> -    When compatible with generic versions, nodes must list the SoC-specific
> -    version corresponding to the platform first, followed by the
> -    family-specific version.
> -
> -- reg: See dw_hdmi.txt.
> -- interrupts: HDMI interrupt number
> -- clocks: See dw_hdmi.txt.
> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> -- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
> -  corresponding to the video input of the controller and one port numbered 1
> -  corresponding to its HDMI output, and one port numbered 2 corresponding to
> -  sound input of the controller. Each port shall have a single endpoint.
> -
> -Optional properties:
> -
> -- power-domains: Shall reference the power domain that contains the DWC HDMI,
> -  if any.
> -
> -
> -Example:
> -
> -	hdmi0: hdmi@fead0000 {
> -		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> -		reg = <0 0xfead0000 0 0x10000>;
> -		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> -		clock-names = "iahb", "isfr";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -			port@0 {
> -				reg = <0>;
> -				dw_hdmi0_in: endpoint {
> -					remote-endpoint = <&du_out_hdmi0>;
> -				};
> -			};
> -			port@1 {
> -				reg = <1>;
> -				rcar_dw_hdmi0_out: endpoint {
> -					remote-endpoint = <&hdmi0_con>;
> -				};
> -			};
> -			port@2 {
> -				reg = <2>;
> -				rcar_dw_hdmi0_sound_in: endpoint {
> -					remote-endpoint = <&hdmi_sound_out>;
> -				};
> -			};
> -		};
> -	};
> -
> -	hdmi0-out {
> -		compatible = "hdmi-connector";
> -		label = "HDMI0 OUT";
> -		type = "a";
> -
> -		port {
> -			hdmi0_con: endpoint {
> -				remote-endpoint = <&rcar_dw_hdmi0_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> new file mode 100644
> index 000000000000..23b940c3aff6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a774a1-hdmi # for RZ/G2M compatible HDMI TX
> +          - renesas,r8a774b1-hdmi # for RZ/G2N compatible HDMI TX
> +          - renesas,r8a774e1-hdmi # for RZ/G2H compatible HDMI TX
> +          - renesas,r8a7795-hdmi # for R-Car H3 compatible HDMI TX
> +          - renesas,r8a7796-hdmi # for R-Car M3-W compatible HDMI TX
> +          - renesas,r8a77961-hdmi # for R-Car M3-W+ compatible HDMI TX
> +          - renesas,r8a77965-hdmi # for R-Car M3-N compatible HDMI TX
> +      - const: renesas,rcar-gen3-hdmi
> +
> +  reg-io-width:
> +    const: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    maxItems: 2
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

This should be '#/properties/port' instead. '#/$defs/port-base' is if 
you have additional port or endpoint properties.

> +        unevaluatedProperties: false

And you can then drop this.

With those fixes,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        description: Parallel RGB input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: HDMI output port
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Sound input port
> +
> +    required:
> +      - port@0
> +      - port@1
> +      - port@2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    hdmi@fead0000 {
> +        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +        reg = <0xfead0000 0x10000>;
> +        interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> +        clock-names = "iahb", "isfr";
> +        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                dw_hdmi0_in: endpoint {
> +                    remote-endpoint = <&du_out_hdmi0>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                rcar_dw_hdmi0_out: endpoint {
> +                    remote-endpoint = <&hdmi0_con>;
> +                };
> +            };
> +            port@2 {
> +                reg = <2>;
> +                rcar_dw_hdmi0_sound_in: endpoint {
> +                    remote-endpoint = <&hdmi_sound_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +    hdmi0-out {
> +        compatible = "hdmi-connector";
> +        label = "HDMI0 OUT";
> +        type = "a";
> +
> +        port {
> +            hdmi0_con: endpoint {
> +                remote-endpoint = <&rcar_dw_hdmi0_out>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 22663c2cb3a8..e83a867d96d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5903,7 +5903,7 @@ L:	dri-devel@lists.freedesktop.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/pinchartl/media drm/du/next
> -F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
>  F:	Documentation/devicetree/bindings/display/renesas,du.yaml
>  F:	drivers/gpu/drm/rcar-du/
> -- 
> Regards,
> 
> Laurent Pinchart
> 
