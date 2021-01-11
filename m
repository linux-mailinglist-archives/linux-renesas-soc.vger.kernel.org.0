Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2183E2F2374
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 01:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404121AbhALAZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jan 2021 19:25:51 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37582 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390888AbhAKXCU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 18:02:20 -0500
Received: by mail-ot1-f50.google.com with SMTP id o11so519162ote.4;
        Mon, 11 Jan 2021 15:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LgIrmd8Xh84n4mKyCBOge7ZOuspRIUfwhImhyiTAfBY=;
        b=IkQP5RZN+C05CWjKCZnJxslEWEd2G51Zs006X0KycK7djzBIUaVpRrrmTN7QGnn247
         PDKQhmjN8Q61IxIcDe/OE+oxzGjelXhnRJP2aic29c5zX0p/RPjOouqcqHTCtRnyTk4p
         XH2x27w8EIOltxfmgyVLjPbOyjaGUovCGuxyapDn0QzglR7ZnxxLt0D3RjZdfyX2EP9D
         N1Tzwfbu/4+H69GaCxIk+p3mfewLoGIONWcWSiwuYTwxNckGzrqQFKo1RXvRgoJ4F19X
         HCARpfqqC9Da33kYxINLvIEAN9aiwxe+KlMrYCq4PvodzPr8h41yYDYPTnJS6/GtldN1
         Z6Kg==
X-Gm-Message-State: AOAM531OLhLl6Aw6+e+AAMFc5phhpaRkRCsHHc60jhPR6j3rKgLft482
        XSR0ps8MSm1CB4zotN67hA==
X-Google-Smtp-Source: ABdhPJz9lBQjW6qjlQgKkEYCyfbF28AaHh5s1vTm/6txoFZiOke17geeJLFiPn/7iKDxflExMuKbeA==
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr922607otb.59.1610406098550;
        Mon, 11 Jan 2021 15:01:38 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u3sm256563otk.31.2021.01.11.15.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 15:01:37 -0800 (PST)
Received: (nullmailer pid 3218638 invoked by uid 1000);
        Mon, 11 Jan 2021 23:01:36 -0000
Date:   Mon, 11 Jan 2021 17:01:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Mark Yao <markyao0591@gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: display: rockchip: dw-hdmi: Convert
 binding to YAML
Message-ID: <20210111230136.GA3214205@robh.at.kernel.org>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210105060818.24158-5-laurent.pinchart+renesas@ideasonboard.com>
 <X/XUow/ku/bsDXvr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/XUow/ku/bsDXvr@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 06, 2021 at 05:17:55PM +0200, Laurent Pinchart wrote:
> Hi Rob,
> 
> Given that the maintainers property is mandatory in the schema, what's
> the procedure when no maintainer steps up for a converter YAML binding ?

Delete it if no one cares...

Typically we just put a subsystem or platform maintainer.

> 
> On Tue, Jan 05, 2021 at 08:08:16AM +0200, Laurent Pinchart wrote:
> > Convert the Rockchip HDMI TX text binding to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Use Mark's @gmail.com e-mail address as the @rock-chips.com address
> >   bounces
> > 
> > Changes since v1:
> > 
> > - Drop pinctrl-0 and pinctrl-1
> > - Use unevaluatedProperties instead of additionalProperties
> > - Drop reg and interrupts as they're checked in the base schema
> > - Rebase on top of OF graph schema, dropped redundant properties
> > - Fix identation for enum entries
> > - Tidy up clock names
> > ---
> >  .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
> >  .../display/rockchip/rockchip,dw-hdmi.yaml    | 158 ++++++++++++++++++
> >  2 files changed, 158 insertions(+), 74 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > deleted file mode 100644
> > index 3d32ce137e7f..000000000000
> > --- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
> > +++ /dev/null
> > @@ -1,74 +0,0 @@
> > -Rockchip DWC HDMI TX Encoder
> > -============================
> > -
> > -The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > -with a companion PHY IP.
> > -
> > -These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> > -Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> > -following device-specific properties.
> > -
> > -
> > -Required properties:
> > -
> > -- compatible: should be one of the following:
> > -		"rockchip,rk3228-dw-hdmi"
> > -		"rockchip,rk3288-dw-hdmi"
> > -		"rockchip,rk3328-dw-hdmi"
> > -		"rockchip,rk3399-dw-hdmi"
> > -- reg: See dw_hdmi.txt.
> > -- reg-io-width: See dw_hdmi.txt. Shall be 4.
> > -- interrupts: HDMI interrupt number
> > -- clocks: See dw_hdmi.txt.
> > -- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> > -- ports: See dw_hdmi.txt. The DWC HDMI shall have a single port numbered 0
> > -  corresponding to the video input of the controller. The port shall have two
> > -  endpoints, numbered 0 and 1, connected respectively to the vopb and vopl.
> > -- rockchip,grf: Shall reference the GRF to mux vopl/vopb.
> > -
> > -Optional properties
> > -
> > -- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
> > -  or the functionally-reduced I2C master contained in the DWC HDMI. When
> > -  connected to a system I2C master this property contains a phandle to that
> > -  I2C master controller.
> > -- clock-names: See dw_hdmi.txt. The "cec" clock is optional.
> > -- clock-names: May contain "cec" as defined in dw_hdmi.txt.
> > -- clock-names: May contain "grf", power for grf io.
> > -- clock-names: May contain "vpll", external clock for some hdmi phy.
> > -- phys: from general PHY binding: the phandle for the PHY device.
> > -- phy-names: Should be "hdmi" if phys references an external phy.
> > -
> > -Optional pinctrl entry:
> > -- If you have both a "unwedge" and "default" pinctrl entry, dw_hdmi
> > -  will switch to the unwedge pinctrl state for 10ms if it ever gets an
> > -  i2c timeout.  It's intended that this unwedge pinctrl entry will
> > -  cause the SDA line to be driven low to work around a hardware
> > -  errata.
> > -
> > -Example:
> > -
> > -hdmi: hdmi@ff980000 {
> > -	compatible = "rockchip,rk3288-dw-hdmi";
> > -	reg = <0xff980000 0x20000>;
> > -	reg-io-width = <4>;
> > -	ddc-i2c-bus = <&i2c5>;
> > -	rockchip,grf = <&grf>;
> > -	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > -	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> > -	clock-names = "iahb", "isfr";
> > -	ports {
> > -		hdmi_in: port {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -			hdmi_in_vopb: endpoint@0 {
> > -				reg = <0>;
> > -				remote-endpoint = <&vopb_out_hdmi>;
> > -			};
> > -			hdmi_in_vopl: endpoint@1 {
> > -				reg = <1>;
> > -				remote-endpoint = <&vopl_out_hdmi>;
> > -			};
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > new file mode 100644
> > index 000000000000..d3b2f87f152a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> > @@ -0,0 +1,158 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip DWC HDMI TX Encoder
> > +
> > +maintainers:
> > +  - Mark Yao <markyao0591@gmail.com>
> > +
> > +description: |
> > +  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
> > +  with a companion PHY IP.
> > +
> > +allOf:
> > +  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3228-dw-hdmi
> > +      - rockchip,rk3288-dw-hdmi
> > +      - rockchip,rk3328-dw-hdmi
> > +      - rockchip,rk3399-dw-hdmi
> > +
> > +  reg-io-width:
> > +    const: 4
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 5
> > +    items:
> > +      - {}
> > +      - {}
> > +      # The next three clocks are all optional, but shall be specified in this
> > +      # order when present.
> > +      - description: The HDMI CEC controller main clock
> > +      - description: Power for GRF IO
> > +      - description: External clock for some HDMI PHY
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 5
> > +    items:
> > +      - {}
> > +      - {}
> > +      - enum:
> > +          - cec
> > +          - grf
> > +          - vpll
> > +      - enum:
> > +          - grf
> > +          - vpll
> > +      - const: vpll
> > +
> > +  ddc-i2c-bus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The HDMI DDC bus can be connected to either a system I2C master or the
> > +      functionally-reduced I2C master contained in the DWC HDMI. When connected
> > +      to a system I2C master this property contains a phandle to that I2C
> > +      master controller.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description: The HDMI PHY
> > +
> > +  phy-names:
> > +    const: hdmi
> > +
> > +  pinctrl-names:
> > +    description:
> > +      The unwedge pinctrl entry shall drive the DDC SDA line low. This is
> > +      intended to work around a hardware errata that can cause the DDC I2C
> > +      bus to be wedged.
> > +    items:
> > +      - const: default
> > +      - const: unwedge
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Input of the DWC HDMI TX
> > +
> > +        properties:
> > +          endpoint@0:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +            description: Connection to the VOPB
> > +
> > +          endpoint@1:
> > +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +            unevaluatedProperties: false
> > +            description: Connection to the VOPL
> > +
> > +        required:
> > +          - endpoint@0
> > +          - endpoint@1
> > +
> > +    required:
> > +      - port
> > +
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the GRF to mux vopl/vopb.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-io-width
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - ports
> > +  - rockchip,grf
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3288-cru.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    hdmi: hdmi@ff980000 {
> > +        compatible = "rockchip,rk3288-dw-hdmi";
> > +        reg = <0xff980000 0x20000>;
> > +        reg-io-width = <4>;
> > +        ddc-i2c-bus = <&i2c5>;
> > +        rockchip,grf = <&grf>;
> > +        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
> > +        clock-names = "iahb", "isfr";
> > +
> > +        ports {
> > +            port {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                hdmi_in_vopb: endpoint@0 {
> > +                    reg = <0>;
> > +                    remote-endpoint = <&vopb_out_hdmi>;
> > +                };
> > +                hdmi_in_vopl: endpoint@1 {
> > +                    reg = <1>;
> > +                    remote-endpoint = <&vopl_out_hdmi>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> 
> -- 
> Regards,
> 
> Laurent Pinchart
