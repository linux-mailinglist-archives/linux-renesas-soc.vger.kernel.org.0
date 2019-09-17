Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6519DB4C88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 13:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfIQLId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 07:08:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38338 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIQLId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 07:08:33 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5268225AD71;
        Tue, 17 Sep 2019 21:08:30 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5E6139407F6; Tue, 17 Sep 2019 13:08:28 +0200 (CEST)
Date:   Tue, 17 Sep 2019 13:08:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: bus: renesas-bsc: convert bindings to
 json-schema
Message-ID: <20190917110824.aapnwkccqijxgn4h@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-3-horms+renesas@verge.net.au>
 <670148264.237333.1568717022750@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670148264.237333.1568717022750@webmail.strato.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 12:43:42PM +0200, Ulrich Hecht wrote:
> 
> > On September 16, 2019 at 5:33 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > 
> > 
> > Convert Renesas Bus State Controller (BSC) bindings documentation to
> > json-schema.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > * Tested using:
> >   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> >   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > ---
> >  .../devicetree/bindings/bus/renesas,bsc.txt        | 46 -----------------
> >  .../devicetree/bindings/bus/renesas,bsc.yaml       | 57 ++++++++++++++++++++++
> >  2 files changed, 57 insertions(+), 46 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.txt
> >  create mode 100644 Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.txt b/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> > deleted file mode 100644
> > index 90e947269437..000000000000
> > --- a/Documentation/devicetree/bindings/bus/renesas,bsc.txt
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -Renesas Bus State Controller (BSC)
> > -==================================
> > -
> > -The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> > -Bridge", or "External Bus Interface") can be found in several Renesas ARM SoCs.
> > -It provides an external bus for connecting multiple external devices to the
> > -SoC, driving several chip select lines, for e.g. NOR FLASH, Ethernet and USB.
> > -
> > -While the BSC is a fairly simple memory-mapped bus, it may be part of a PM
> > -domain, and may have a gateable functional clock.
> > -Before a device connected to the BSC can be accessed, the PM domain
> > -containing the BSC must be powered on, and the functional clock
> > -driving the BSC must be enabled.
> > -
> > -The bindings for the BSC extend the bindings for "simple-pm-bus".
> > -
> > -
> > -Required properties
> > -  - compatible: Must contain an SoC-specific value, and "renesas,bsc" and
> > -		"simple-pm-bus" as fallbacks.
> > -                SoC-specific values can be:
> > -		"renesas,bsc-r8a73a4" for R-Mobile APE6 (r8a73a4)
> > -		"renesas,bsc-sh73a0" for SH-Mobile AG5 (sh73a0)
> > -  - #address-cells, #size-cells, ranges: Must describe the mapping between
> > -		parent address and child address spaces.
> > -  - reg: Must contain the base address and length to access the bus controller.
> > -
> > -Optional properties:
> > -  - interrupts: Must contain a reference to the BSC interrupt, if available.
> > -  - clocks: Must contain a reference to the functional clock, if available.
> > -  - power-domains: Must contain a reference to the PM domain, if available.
> > -
> > -
> > -Example:
> > -
> > -	bsc: bus@fec10000 {
> > -		compatible = "renesas,bsc-sh73a0", "renesas,bsc",
> > -			     "simple-pm-bus";
> > -		#address-cells = <1>;
> > -		#size-cells = <1>;
> > -		ranges = <0 0 0x20000000>;
> > -		reg = <0xfec10000 0x400>;
> > -		interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks = <&zb_clk>;
> > -		power-domains = <&pd_a4s>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > new file mode 100644
> > index 000000000000..0231a15cac47
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> > @@ -0,0 +1,57 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/renesas,bsc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas Bus State Controller (BSC)
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description: |
> > +  The Renesas Bus State Controller (BSC, sometimes called "LBSC within Bus
> > +  Bridge", or "External Bus Interface") can be found in several Renesas ARM
> > +  SoCs.  It provides an external bus for connecting multiple external
> > +  devices to the SoC, driving several chip select lines, for e.g. NOR
> > +  FLASH, Ethernet and USB.
> > +
> > +  While the BSC is a fairly simple memory-mapped bus, it may be part of a
> > +  PM domain, and may have a gateable functional clock.  Before a device
> > +  connected to the BSC can be accessed, the PM domain containing the BSC
> > +  must be powered on, and the functional clock driving the BSC must be
> > +  enabled.
> > +
> > +  The bindings for the BSC extend the bindings for "simple-pm-bus".
> > +
> > +allOf:
> > +  - $ref: simple-pm-bus.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,bsc-r8a73a4  # R-Mobile APE6 (r8a73a4)
> > +          - renesas,bsc-sh73a0   # SH-Mobile AG5 (sh73a0)
> > +      - const: renesas,bsc
> > +      - const: simple-pm-bus
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> 
> Shouldn't there be a "required:" section here?

Thanks, I will add:

required:
  - compatible
  - '#address-cells'
  - '#size-cells'
  - ranges
  - reg

> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bsc: bus@fec10000 {
> > +        compatible = "renesas,bsc-sh73a0", "renesas,bsc", "simple-pm-bus";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0 0x20000000>;
> > +        reg = <0xfec10000 0x400>;
> > +        interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&zb_clk>;
> > +        power-domains = <&pd_a4s>;
> > +    };
> > -- 
> > 2.11.0
> >
> 
> CU
> Uli
> 
