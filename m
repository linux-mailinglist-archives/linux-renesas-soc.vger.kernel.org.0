Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8054526AAD8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 19:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbgIORir (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 13:38:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38042 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbgIORht (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 13:37:49 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40798FD8;
        Tue, 15 Sep 2020 19:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600191427;
        bh=fMAdYnLFQPJOZ3K7k7cisLC+ohH34tEXY1rL2K9CT54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GyHFoUooDZx+gw+JgXwjp83Os+eqrJQGrsN/f7GC/vCdjo1kOGK/ETmjwQbYyl0ur
         6SXpGx+YEj72+Mj6yVoZt68W00ybceImXZXUUtJpXpaIeflywdXKYh03E3fTXplo4E
         1rFgfiHE4wD9wE9/V7wBo8UOql43Jw+IaBJXVDMc=
Date:   Tue, 15 Sep 2020 20:36:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] media: dt-bindings: media: renesas,drif: Convert to
 json-schema
Message-ID: <20200915173638.GD26029@pendragon.ideasonboard.com>
References: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com>
 <20200915131216.21137-3-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915131216.21137-3-fabrizio.castro.jz@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Sep 15, 2020 at 02:12:15PM +0100, Fabrizio Castro wrote:
> Convert the Renesas DRIF bindings to DT schema and update
> MAINTAINERS accordingly.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../bindings/media/renesas,drif.txt           | 177 ------------
>  .../bindings/media/renesas,drif.yaml          | 270 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 271 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,drif.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,drif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt b/Documentation/devicetree/bindings/media/renesas,drif.txt
> deleted file mode 100644
> index 0d8974aa8b38..000000000000
> --- a/Documentation/devicetree/bindings/media/renesas,drif.txt
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -Renesas R-Car Gen3 Digital Radio Interface controller (DRIF)
> -------------------------------------------------------------
> -
> -R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> -representation of DRIF interfacing with a master device is shown below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |-----SD0------->|D0                   |
> -|                     |-----SD1------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -As per datasheet, each DRIF channel (drifn) is made up of two internal
> -channels (drifn0 & drifn1). These two internal channels share the common
> -CLK & SYNC. Each internal channel has its own dedicated resources like
> -irq, dma channels, address space & clock. This internal split is not
> -visible to the external master device.
> -
> -The device tree model represents each internal channel as a separate node.
> -The internal channels sharing the CLK & SYNC are tied together by their
> -phandles using a property called "renesas,bonding". For the rest of
> -the documentation, unless explicitly stated, the word channel implies an
> -internal channel.
> -
> -When both internal channels are enabled they need to be managed together
> -as one (i.e.) they cannot operate alone as independent devices. Out of the
> -two, one of them needs to act as a primary device that accepts common
> -properties of both the internal channels. This channel is identified by a
> -property called "renesas,primary-bond".
> -
> -To summarize,
> -   - When both the internal channels that are bonded together are enabled,
> -     the zeroth channel is selected as primary-bond. This channels accepts
> -     properties common to all the members of the bond.
> -   - When only one of the bonded channels need to be enabled, the property
> -     "renesas,bonding" or "renesas,primary-bond" will have no effect. That
> -     enabled channel can act alone as any other independent device.
> -
> -Required properties of an internal channel:
> --------------------------------------------
> -- compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R8A7795 SoC.
> -		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796 SoC.
> -		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible device.
> -
> -		When compatible with the generic version, nodes must list the
> -		SoC-specific version corresponding to the platform first
> -		followed by the generic version.
> -
> -- reg: offset and length of that channel.
> -- interrupts: associated with that channel.
> -- clocks: phandle and clock specifier of that channel.
> -- clock-names: clock input name string: "fck".
> -- dmas: phandles to the DMA channels.
> -- dma-names: names of the DMA channel: "rx".
> -- renesas,bonding: phandle to the other channel.
> -
> -Optional properties of an internal channel:
> --------------------------------------------
> -- power-domains: phandle to the respective power domain.
> -
> -Required properties of an internal channel when:
> -	- It is the only enabled channel of the bond (or)
> -	- If it acts as primary among enabled bonds
> ---------------------------------------------------------
> -- pinctrl-0: pin control group to be used for this channel.
> -- pinctrl-names: must be "default".
> -- renesas,primary-bond: empty property indicating the channel acts as primary
> -			among the bonded channels.
> -- port: child port node corresponding to the data input, in accordance with
> -	the video interface bindings defined in
> -	Documentation/devicetree/bindings/media/video-interfaces.txt. The port
> -	node must contain at least one endpoint.
> -
> -Optional endpoint property:
> ----------------------------
> -- sync-active: Indicates sync signal polarity, 0/1 for low/high respectively.
> -	       This property maps to SYNCAC bit in the hardware manual. The
> -	       default is 1 (active high).
> -
> -Example:
> ---------
> -
> -(1) Both internal channels enabled:
> ------------------------------------
> -
> -When interfacing with a third party tuner device with two data pins as shown
> -below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |-----SD0------->|D0                   |
> -|                     |-----SD1------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -	drif00: rif@e6f40000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f40000 0 0x64>;
> -		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 515>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif01>;
> -		renesas,primary-bond;
> -		pinctrl-0 = <&drif0_pins>;
> -		pinctrl-names = "default";
> -		port {
> -			drif0_ep: endpoint {
> -			     remote-endpoint = <&tuner_ep>;
> -			};
> -		};
> -	};
> -
> -	drif01: rif@e6f50000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f50000 0 0x64>;
> -		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 514>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif00>;
> -	};
> -
> -
> -(2) Internal channel 1 alone is enabled:
> -----------------------------------------
> -
> -When interfacing with a third party tuner device with one data pin as shown
> -below.
> -
> -+---------------------+                +---------------------+
> -|                     |-----SCK------->|CLK                  |
> -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> -|                     |                |D0 (unused)          |
> -|                     |-----SD-------->|D1                   |
> -+---------------------+                +---------------------+
> -
> -	drif00: rif@e6f40000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f40000 0 0x64>;
> -		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 515>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif01>;
> -	};
> -
> -	drif01: rif@e6f50000 {
> -		compatible = "renesas,r8a7795-drif",
> -			     "renesas,rcar-gen3-drif";
> -		reg = <0 0xe6f50000 0 0x64>;
> -		interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cpg CPG_MOD 514>;
> -		clock-names = "fck";
> -		dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> -		dma-names = "rx", "rx";
> -		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> -		renesas,bonding = <&drif00>;
> -		pinctrl-0 = <&drif0_pins>;
> -		pinctrl-names = "default";
> -		port {
> -			drif0_ep: endpoint {
> -			     remote-endpoint = <&tuner_ep>;
> -			     sync-active = <0>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> new file mode 100644
> index 000000000000..f57fccc159d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -0,0 +1,270 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,drif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Gen3 Digital Radio Interface controller (DRIF)

s/controller/Controller/

> +
> +maintainers:
> +  - Ramesh Shanmugasundaram <rashanmu@gmail.com>
> +  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> +
> +description: |
> +  R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> +  representation of DRIF interfacing with a master device is shown below.
> +
> +  +---------------------+                +---------------------+
> +  |                     |-----SCK------->|CLK                  |
> +  |       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> +  |                     |-----SD0------->|D0                   |
> +  |                     |-----SD1------->|D1                   |
> +  +---------------------+                +---------------------+
> +
> +  As per datasheet, each DRIF channel (drifn) is made up of two internal
> +  channels (drifn0 & drifn1). These two internal channels share the common
> +  CLK & SYNC. Each internal channel has its own dedicated resources like
> +  irq, dma channels, address space & clock. This internal split is not
> +  visible to the external master device.
> +
> +  The device tree model represents each internal channel as a separate node.
> +  The internal channels sharing the CLK & SYNC are tied together by their
> +  phandles using a property called "renesas,bonding". For the rest of
> +  the documentation, unless explicitly stated, the word channel implies an
> +  internal channel.
> +
> +  When both internal channels are enabled they need to be managed together
> +  as one (i.e.) they cannot operate alone as independent devices. Out of the
> +  two, one of them needs to act as a primary device that accepts common
> +  properties of both the internal channels. This channel is identified by a
> +  property called "renesas,primary-bond".
> +
> +  To summarize,
> +     * When both the internal channels that are bonded together are enabled,
> +       the zeroth channel is selected as primary-bond. This channels accepts
> +       properties common to all the members of the bond.
> +     * When only one of the bonded channels need to be enabled, the property
> +       "renesas,bonding" or "renesas,primary-bond" will have no effect. That
> +       enabled channel can act alone as any other independent device.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a7795-drif        # R-Car H3
> +        - renesas,r8a7796-drif        # R-Car M3-W
> +      - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: fck
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: rx
> +      - const: rx
> +
> +  renesas,bonding:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the other internal channel of DRIF
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  pinctrl-0:
> +    maxItems: 1
> +
> +  pinctrl-names:
> +    maxItems: 1
> +    items:
> +      - const: default

You can drop those three properties, they're already handled by
dt-schema.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +  renesas,primary-bond:
> +    type: boolean
> +    description:
> +      Indicates that the channel acts as primary among the bonded channels.
> +
> +  port:
> +    type: object
> +    description:
> +      Child port node corresponding to the data input, in accordance with the
> +      video interface bindings defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +      The port node must contain at least one endpoint.
> +
> +    properties:
> +      endpoint:
> +        type: object
> +
> +        properties:
> +          remote-endpoint:
> +            description:
> +              A phandle to the remote tuner endpoint subnode in remote node
> +              port.
> +
> +          sync-active:
> +            enum: [0, 1]
> +            description:
> +              Indicates sync signal polarity, 0/1 for low/high respectively.
> +              This property maps to SYNCAC bit in the hardware manual. The
> +              default is 1 (active high).
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - renesas,bonding
> +
> +if:
> +  required:
> +    - renesas,primary-bond
> +then:
> +  required:
> +    - pinctrl-0
> +    - pinctrl-names
> +    - port
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example with both internal channels enabled.
> +  #
> +  # When interfacing with a third party tuner device with two data pins as shown
> +  # below.
> +  #
> +  # +---------------------+                +---------------------+
> +  # |                     |-----SCK------->|CLK                  |
> +  # |       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> +  # |                     |-----SD0------->|D0                   |
> +  # |                     |-----SD1------->|D1                   |
> +  # +---------------------+                +---------------------+
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    soc {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            drif00: rif@e6f40000 {
> +                    compatible = "renesas,r8a7795-drif",
> +                                 "renesas,rcar-gen3-drif";
> +                    reg = <0 0xe6f40000 0 0x64>;
> +                    interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +                    clocks = <&cpg CPG_MOD 515>;
> +                    clock-names = "fck";
> +                    dmas = <&dmac1 0x20>, <&dmac2 0x20>;
> +                    dma-names = "rx", "rx";
> +                    power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +                    renesas,bonding = <&drif01>;
> +                    resets = <&cpg 515>;
> +                    renesas,primary-bond;
> +                    pinctrl-0 = <&drif0_pins>;
> +                    pinctrl-names = "default";
> +                    port {
> +                            drif0_ep: endpoint {
> +                                 remote-endpoint = <&tuner_ep>;
> +                            };
> +                    };
> +            };
> +
> +            drif01: rif@e6f50000 {
> +                    compatible = "renesas,r8a7795-drif",
> +                                 "renesas,rcar-gen3-drif";
> +                    reg = <0 0xe6f50000 0 0x64>;
> +                    interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +                    clocks = <&cpg CPG_MOD 514>;
> +                    clock-names = "fck";
> +                    dmas = <&dmac1 0x22>, <&dmac2 0x22>;
> +                    dma-names = "rx", "rx";
> +                    power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +                    renesas,bonding = <&drif00>;
> +                    resets = <&cpg 514>;
> +            };
> +    };
> +
> +  # Example with internal channel 1 alone enabled.
> +  #
> +  # When interfacing with a third party tuner device with one data pin as shown
> +  # below.
> +  #
> +  # +---------------------+                +---------------------+
> +  # |                     |-----SCK------->|CLK                  |
> +  # |       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> +  # |                     |                |D0 (unused)          |
> +  # |                     |-----SD-------->|D1                   |
> +  # +---------------------+                +---------------------+
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    soc {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +
> +            drif10: rif@e6f60000 {
> +                    compatible = "renesas,r8a7795-drif",
> +                                 "renesas,rcar-gen3-drif";
> +                    reg = <0 0xe6f60000 0 0x64>;
> +                    interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +                    clocks = <&cpg CPG_MOD 513>;
> +                    clock-names = "fck";
> +                    dmas = <&dmac1 0x24>, <&dmac2 0x24>;
> +                    dma-names = "rx", "rx";
> +                    power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +                    resets = <&cpg 513>;
> +                    renesas,bonding = <&drif11>;
> +            };
> +
> +            drif11: rif@e6f70000 {
> +                    compatible = "renesas,r8a7795-drif",
> +                                 "renesas,rcar-gen3-drif";
> +                    reg = <0 0xe6f70000 0 0x64>;
> +                    interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +                    clocks = <&cpg CPG_MOD 512>;
> +                    clock-names = "fck";
> +                    dmas = <&dmac1 0x26>, <&dmac2 0x26>;
> +                    dma-names = "rx", "rx";
> +                    power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +                    resets = <&cpg 512>;
> +                    renesas,bonding = <&drif10>;
> +                    pinctrl-0 = <&drif1_pins>;
> +                    pinctrl-names = "default";
> +                    port {
> +                            drif1_ep: endpoint {
> +                                 remote-endpoint = <&tuner_ep1>;
> +                                 sync-active = <0>;
> +                            };
> +                    };
> +            };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f49e5ac90d8..3e2a1cad3749 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10903,7 +10903,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
> -F:	Documentation/devicetree/bindings/media/renesas,drif.txt
> +F:	Documentation/devicetree/bindings/media/renesas,drif.yaml
>  F:	drivers/media/platform/rcar_drif.c
>  
>  MEDIA DRIVERS FOR RENESAS - FCP

-- 
Regards,

Laurent Pinchart
