Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDAD2F2376
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 01:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391770AbhALAZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 19:25:51 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39656 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390858AbhAKW6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 17:58:43 -0500
Received: by mail-oi1-f179.google.com with SMTP id w124so362938oia.6;
        Mon, 11 Jan 2021 14:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h99tgpjO+Fur4D6aDCs45LdGnZbg0FYuLTMw0nRoTag=;
        b=haRM50pX2OvTE+UvKXu0/Q/VQZdtRNmUidyxf5MoOfCPJNB4orNlSbOvTVK6BsYAIb
         4w5NsENCGyTrpzWIPtQOIaEk5d0WmJKvfq/BproVgZRhbt2DIgiGrU9/yCzzYRZhgsW7
         HDtuixgu4aNXUxE6IdFmDs28gUrh3N+EUwIRFXCBpHYg1rk6EUCqjYdC8F1OcVv3oBHV
         5beCJ44qBw/x/MrmRPzrS8xlJzE5xeNSXRHPPzm+CtUPBKY52yV5EGYpT9UlEfilgEcD
         v4Y80Nxs4DCkMY8QU8xA2qEbaNB4S08D1O13da7P+Sxd25C6Qf3EzYGnBGLjJgPIyCuK
         8GDw==
X-Gm-Message-State: AOAM531zCpujJJVm+Hbx2xwQSe6akwQ84fv4lwlsP8Hq1otAT1KlHcaD
        znoTsm92Wo6tFmsEVXUIig==
X-Google-Smtp-Source: ABdhPJzd5KCXjk/WFQSJuFjKzPEwE7xBtIUQ5JCqULsw5oRqhu1vmf0h7DWbazrQ1J+2CGa0QBlZLg==
X-Received: by 2002:aca:ec43:: with SMTP id k64mr649295oih.43.1610405881350;
        Mon, 11 Jan 2021 14:58:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w9sm259493otq.44.2021.01.11.14.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:58:00 -0800 (PST)
Received: (nullmailer pid 3213802 invoked by uid 1000);
        Mon, 11 Jan 2021 22:57:59 -0000
Date:   Mon, 11 Jan 2021 16:57:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: display: imx: hdmi: Convert binding
 to YAML
Message-ID: <20210111225759.GA3202374@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105060818.24158-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 05, 2021 at 08:08:15AM +0200, Laurent Pinchart wrote:
> Convert the i.MX6 HDMI TX text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Only specify maxItems for clocks
> - Drop reg and interrupts as they're checked in the base schema
> - Rebase on top of OF graph schema, dropped redundant properties
> - Fix identation for enum entries
> - Drop clock-names items, use maxItems only
> ---
>  .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
>  2 files changed, 130 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> new file mode 100644
> index 000000000000..f9b131bb3339
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX6 DWC HDMI TX Encoder
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> +  with a companion PHY IP.
> +
> +allOf:
> +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx6dl-hdmi
> +      - fsl,imx6q-hdmi
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
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The HDMI DDC bus can be connected to either a system I2C master or the
> +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> +      to a system I2C master this property contains a phandle to that I2C
> +      master controller.

This should be deprecated as it should be in the connector node. But 
that's a separate issue.

> +
> +  gpr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
> +      register.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      This device has four video ports, corresponding to the four inputs of the
> +      HDMI multiplexer. Each port shall have a single endpoint.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: First input of the HDMI multiplexer

muxing should have been endpoints rather than ports...

Anyways, same 'port' issues here. With those fixes:

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Second input of the HDMI multiplexer
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Third input of the HDMI multiplexer
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Fourth input of the HDMI multiplexer
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
> +      - required:
> +          - port@2
> +      - required:
> +          - port@3
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - gpr
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +
> +    hdmi: hdmi@120000 {
> +        reg = <0x00120000 0x9000>;
> +        interrupts = <0 115 0x04>;
> +        gpr = <&gpr>;
> +        clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
> +                 <&clks IMX6QDL_CLK_HDMI_ISFR>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                hdmi_mux_0: endpoint {
> +                    remote-endpoint = <&ipu1_di0_hdmi>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                hdmi_mux_1: endpoint {
> +                    remote-endpoint = <&ipu1_di1_hdmi>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
> deleted file mode 100644
> index 6d021e71c9cf..000000000000
> --- a/Documentation/devicetree/bindings/display/imx/hdmi.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale i.MX6 DWC HDMI TX Encoder
> -===================================
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
> -- compatible : Shall be one of "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
> -- reg: See dw_hdmi.txt.
> -- interrupts: HDMI interrupt number
> -- clocks: See dw_hdmi.txt.
> -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> -- ports: See dw_hdmi.txt. The DWC HDMI shall have between one and four ports,
> -  numbered 0 to 3, corresponding to the four inputs of the HDMI multiplexer.
> -  Each port shall have a single endpoint.
> -- gpr : Shall contain a phandle to the iomuxc-gpr region containing the HDMI
> -  multiplexer control register.
> -
> -Optional properties
> -
> -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> -  connected to a system I2C master this property contains a phandle to that
> -  I2C master controller.
> -
> -
> -Example:
> -
> -	gpr: iomuxc-gpr@20e0000 {
> -		/* ... */
> -	};
> -
> -        hdmi: hdmi@120000 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                compatible = "fsl,imx6q-hdmi";
> -                reg = <0x00120000 0x9000>;
> -                interrupts = <0 115 0x04>;
> -                gpr = <&gpr>;
> -                clocks = <&clks 123>, <&clks 124>;
> -                clock-names = "iahb", "isfr";
> -                ddc-i2c-bus = <&i2c2>;
> -
> -                port@0 {
> -                        reg = <0>;
> -
> -                        hdmi_mux_0: endpoint {
> -                                remote-endpoint = <&ipu1_di0_hdmi>;
> -                        };
> -                };
> -
> -                port@1 {
> -                        reg = <1>;
> -
> -                        hdmi_mux_1: endpoint {
> -                                remote-endpoint = <&ipu1_di1_hdmi>;
> -                        };
> -                };
> -        };
> -- 
> Regards,
> 
> Laurent Pinchart
> 
