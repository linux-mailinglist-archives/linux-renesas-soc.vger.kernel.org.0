Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C9BB7DB0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 17:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391000AbfISPK0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 11:10:26 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37260 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404000AbfISPKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 11:10:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 47C1425AD81;
        Fri, 20 Sep 2019 01:10:17 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4BC9494444E; Thu, 19 Sep 2019 17:10:15 +0200 (CEST)
Date:   Thu, 19 Sep 2019 17:10:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: bus: simple-pm-bus: convert bindings to
 json-schema
Message-ID: <20190919151014.4azdfh2feg5ot6no@verge.net.au>
References: <20190916153357.3880-1-horms+renesas@verge.net.au>
 <20190916153357.3880-2-horms+renesas@verge.net.au>
 <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAL_JsqJHiAmH0eeUMLH1q9X6e+88EVZrmMtM33rVWCyBAszY8A@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 07:12:16AM -0500, Rob Herring wrote:
> On Mon, Sep 16, 2019 at 10:35 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> >
> > Convert Simple Power-Managed Bus bindings documentation to json-schema.
> >
> > As a side effect of this change only simple-pm-bus is used in example. A
> > follow-up patch will provide an example for the separately documented
> > Renesas Bus State Controller (BSC) that uses "renesas,bsc-sh73a0" and
> > "renesas,bsc" compat strings.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > * Tested using:
> >   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> >   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > ---
> >  .../devicetree/bindings/bus/simple-pm-bus.txt      | 44 --------------
> >  .../devicetree/bindings/bus/simple-pm-bus.yaml     | 68 ++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 44 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.txt
> >  create mode 100644 Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> 
> > diff --git a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > new file mode 100644
> > index 000000000000..72a3644974e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> > @@ -0,0 +1,68 @@
> 
> SPDX tag?
> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Simple Power-Managed Bus
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description: |
> > +  A Simple Power-Managed Bus is a transparent bus that doesn't need a real
> > +  driver, as it's typically initialized by the boot loader.
> > +
> > +  However, its bus controller is part of a PM domain, or under the control
> > +  of a functional clock.  Hence, the bus controller's PM domain and/or
> > +  clock must be enabled for child devices connected to the bus (either
> > +  on-SoC or externally) to function.
> > +
> > +  While "simple-pm-bus" follows the "simple-bus" set of properties, as
> > +  specified in the Devicetree Specification, it is not an extension of
> > +  "simple-bus".
> > +
> > +
> > +properties:
> 
> Add $nodename in here.


For now I have gone with:

  $nodename:
    pattern: "^bus@[0-9a-f]+$"

But this implies updating both msm8996.dtsi and the proposed
example (see below) to use bus@ rather than agnoc@.

If this is the right way to to then perhaps it is best to use the
following until msm8996.dtsi is updated.

  $nodename:
    pattern: "^(bus|agnoc)@[0-9a-f]+$"

> 
> > +  compatible:
> > +    items:
> > +       - const: simple-pm-bus
> 
> extra leading space.
> 
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> 
> 1 or 2 should be valid...
> 
> > +
> > +  ranges:
> > +    # Mapping between parent address and child address spaces.
> > +    maxItems: 1
> 
> empty or multiple ranges should be possible.
> 
> > +
> > +  clocks:
> > +    # Functional clocks
> > +    # Required if power-domains is absent, optional otherwise
> > +    minItems: 1
> 
> This will imply maxItems is 1 which I don't think you want.
> 
> Though more than 1 starts to mean you need to know specifically what the h/w is.

I have changed this to:

  clocks: true
    # Functional clocks
    # Required if power-domains is absent, optional otherwise

> > +
> > +  power-domains:
> > +    # Required if clocks is absent, optional otherwise
> > +    minItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - ranges
> 
> This will capture what you commented above:
> 
> oneOf:
>   - required:
>       - clocks
>   - required:
>       - power-domains

Thanks. Unfortunately dtbs_check does not seem happy
if both clocks and power-domains are present.

# cr make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
...
/home/horms/projects/linux/renesas/arch/arm/boot/dts/r8a73a4-ape6evm.dt.yaml: bus@fec10000: {'compatible': ['renesas,bsc-r8a73a4', 'renesas,bsc', 'simple-pm-bus'], '#address-cells': [[1]], '#size-cells': [[1]], 'ranges': [[0, 0, 0, 536870912]], 'reg': [[0, 4274061312, 0, 1024]], 'clocks': [[27]], 'power-domains': [[15]], 'flash@0': {'compatible': ['cfi-flash', 'mtd-rom'], 'reg': [[0, 134217728]], 'bank-width': [[2]], 'partitions': {'compatible': ['fixed-partitions'], '#address-cells': [[1]], '#size-cells': [[1]], 'partition@0': {'label': ['uboot'], 'reg': [[0, 262144]], 'read-only': True}, 'partition@40000': {'label': ['uboot-env'], 'reg': [[262144, 262144]], 'read-only': True}, 'partition@80000': {'label': ['flash'], 'reg': [[524288, 133693440]]}}}, 'ethernet@8000000': {'compatible': ['smsc,lan9220', 'smsc,lan9115'], 'reg': [[134217728, 4096]], 'interrupt-parent': [[18]], 'interrupts': [[8, 4]], 'phy-mode': ['mii'], 'reg-io-width': [[4]], 'smsc,irq-active-high': True, 'smsc,irq-push-pull': True, 'vdd33a-supply': [[23]], 'vddvario-supply': [[28]]}, '$nodename': ['bus@fec10000']} is valid under each of {'required': ['power-domains']}, {'required': ['clocks']}
{'$filename': '/home/horms/projects/linux/renesas/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml',
 '$id': 'http://devicetree.org/schemas/bus/simple-pm-bus.yaml#',
 '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
 '$select_validator': <jsonschema.validators.create.<locals>.Validator object at 0x7fa9f2596048>,
 'oneOf': [{'required': ['clocks']}, {'required': ['power-domains']}],
 'patternProperties': {'pinctrl-[0-9]+': True},
 'properties': {'#address-cells': {'items': {'items': {'const': 1},
                                             'type': 'array'},
                                   'type': 'array'},
                '#size-cells': {'items': {'items': {'enum': [1, 2]},
                                          'type': 'array'},
                                'type': 'array'},
                '$nodename': {'additionalItems': False,
                              'items': [{'pattern': '^(bus|agnoc)(@.*|-[0-9a-f])*$'}],
                              'maxItems': 1,
                              'minItems': 1,
                              'type': 'array'},
                'clocks': True,
                'compatible': {'contains': {'const': 'simple-pm-bus'}},
                'phandle': True,
                'pinctrl-names': True,
                'power-domains': {'maxItems': 1, 'minItems': 1},
                'ranges': True,
                'status': True},
 'required': ['compatible', '#address-cells', '#size-cells', 'ranges'],
 'select': {'properties': {'compatible': {'contains': {'enum': ['simple-pm-bus']}}},
            'required': ['compatible']},
 'title': 'Simple Power-Managed Bus'}

> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    bsc: bus@fec10000 {
> > +        compatible = "simple-pm-bus";
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0 0x20000000>;
> > +        reg = <0xfec10000 0x400>;
> 
> If you have reg, then it shouldn't be "simple-pm-bus" unless you can
> function without accessing the regs.
> 
> > +        interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
> 
> Not documented?
> 
> > +        clocks = <&zb_clk>;
> > +        power-domains = <&pd_a4s>;
> > +    };

As per discussion elsewhere in this thread, I have updated this to the
example in msm8996.dtsi.

    agnoc@0 {
        power-domains = <&gcc AGGRE0_NOC_GDSC>;
        compatible = "simple-pm-bus";
        #address-cells = <1>;
        #size-cells = <1>;
        ranges;
    };

> > --
> > 2.11.0
> >
> 
