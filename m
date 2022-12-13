Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770A364B8FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 16:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbiLMPyo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 10:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235622AbiLMPyo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 10:54:44 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88006456;
        Tue, 13 Dec 2022 07:54:42 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1441d7d40c6so13041394fac.8;
        Tue, 13 Dec 2022 07:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAOTQwL2Rgpq7vehslr+jEqVPFl/NMZ01ZLdvrOs6oI=;
        b=pYEs8+Uk/DeB8KU8mBkaTbeZSKCPrPm4eoOG5wAcxJbRxLzsYpTF+xOPYDdXScEPn6
         Eb6+Z+XATUCTYNs7FFjL8EYQY1E3/kVV7cVEfBR1PuwHiKBTSRPmwNh7w0N/9KR4eYq8
         m6Hgs8lkHjHFAWsGmNON3tnfDykLzlz6UU0F8LgWarLU+/Ljyi/a1i2A9/i3bqfGmQSl
         Rjrbzx0kjcPbLvi85qp90jCozfmRApTQZ2kJPiZ/o7FU8G+sTS8F1Vx7+/mWCeQ+4fNJ
         zywLgy6Ov9kyTgc3vdDqXBn3gT4vWdOI/qBWPTioEZOaAdUo6lKxYdQKbG1xNabaOpmj
         lNrg==
X-Gm-Message-State: ANoB5pnxN8DI2Db//H8dehvRRP5/r50tRX7ceWgh7SdypFtl+yJQfF0A
        qjSlZl+30C1epTIo4qXWJA==
X-Google-Smtp-Source: AA0mqf64BeJOLxanU6gvhjtshnjM+tgPLsBhJzLZO/NNpLHn/V4O+QIfS3xnENc7MjLoWMkoINuSbw==
X-Received: by 2002:a05:6871:4048:b0:144:d3f9:ff11 with SMTP id ky8-20020a056871404800b00144d3f9ff11mr10863569oab.28.1670946882100;
        Tue, 13 Dec 2022 07:54:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id os19-20020a0568707d1300b00130d060ce80sm1494951oab.31.2022.12.13.07.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 07:54:41 -0800 (PST)
Received: (nullmailer pid 1646255 invoked by uid 1000);
        Tue, 13 Dec 2022 15:54:41 -0000
Date:   Tue, 13 Dec 2022 09:54:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Message-ID: <20221213155441.GA1483198-robh@kernel.org>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
 <20221213142921.GA958810-robh@kernel.org>
 <OS0PR01MB59224764F969310126DB202186E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224764F969310126DB202186E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Dec 13, 2022 at 03:01:34PM +0000, Biju Das wrote:
> Hi Rob,
> 
> > Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
> > 
> > On Mon, Dec 12, 2022 at 05:27:50PM +0000, Biju Das wrote:
> > > Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
> > >  1 file changed, 123 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > new file mode 100644
> > > index 000000000000..0c473c3398b3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > @@ -0,0 +1,123 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +
> > > +title: Renesas RZ/V2M USB 3.1 DRD controller
> > > +
> > > +maintainers:
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  The RZ/V2{M, MA} USB3.1 DRD module supports the following functions
> > > +  * Role swapping function by the ID pin of the Micro-AB receptacle
> > > +  * Battery Charging Specification Revision 1.2
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - renesas,r9a09g011-usb3drd  # RZ/V2M
> > > +          - renesas,r9a09g055-usb3drd  # RZ/V2MA
> > > +      - const: renesas,rzv2m-usb3drd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Peripheral AXI clock
> > > +      - description: APB clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: peri_axi
> > > +      - const: apb
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    items:
> > > +      - description: DRD reset
> > > +      - description: Peripheral reset
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: drd_reset
> > > +      - const: aresetn_p
> > > +
> > > +  ranges: true
> > > +
> > > +  '#address-cells':
> > > +    enum: [ 1, 2 ]
> > > +
> > > +  '#size-cells':
> > > +    enum: [ 1, 2 ]
> > > +
> > > +  usb3peri:
> > > +    $ref: /schemas/usb/renesas,usb3-peri.yaml
> > > +
> > > +patternProperties:
> > > +  "^usb@[0-9a-f]+$":
> > > +    type: object
> > > +    $ref: renesas,usb-xhci.yaml#
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - resets
> > > +  - reset-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    usb3drd: usb@85070000 {
> > > +        compatible = "renesas,r9a09g011-usb3drd", "renesas,rzv2m-
> > usb3drd";
> > > +        reg = <0x85070000 0x1000>;
> > > +        clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > > +                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > +        clock-names = "peri_axi", "apb";
> > > +        power-domains = <&cpg>;
> > > +        resets = <&cpg R9A09G011_USB_DRD_RESET>,
> > > +                 <&cpg R9A09G011_USB_ARESETN_P>;
> > > +        reset-names = "drd_reset", "aresetn_p";
> > > +        ranges;
> > > +        #address-cells = <1>;
> > > +        #size-cells = <1>;
> > > +
> > > +        usb3host: usb@85060000 {
> > > +           compatible = "renesas,r9a09g011-xhci",
> > > +                        "renesas,rzv2m-xhci";
> > > +           reg = <0x85060000 0x2000>;
> > > +           interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
> > > +           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
> > > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > +           clock-names = "host_axi", "reg";
> > > +           power-domains = <&cpg>;
> > > +           resets = <&cpg R9A09G011_USB_ARESETN_H>;
> > > +        };
> > > +
> > > +        usb3peri: usb3peri {
> > > +           compatible = "renesas,r9a09g011-usb3-peri",
> > > +                        "renesas,rzv2m-usb3-peri";
> > > +           interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > > +                        <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> > > +           interrupt-names = "all_p", "drd", "bc", "gpi";
> > > +           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > +           clock-names = "aclk", "reg";
> > > +           power-domains = <&cpg>;
> > > +           resets = <&cpg R9A09G011_USB_ARESETN_P>;
> > > +        };
> > 
> > The USB device ctrlr doesn't have registers? It looks to me like you've
> > created 3 nodes for instantiating drivers rather that because you have 3
> > separate h/w blocks. Either you should split this to 2 independent nodes
> > or move usb3peri resources to the parent node. That would only be
> > interrupts because everything else is already there.
> 
> Address map of USB device controller is 0x85070000-0x85070400
> Address map of USB3 DRD is 0x85070400-0x850704FF

Then your DT should reflect that with 'reg' in usb3peri.

Why does the device ctrlr have a DRD interrupt?

> The advantage of the current split is that, 
> 
> 1) With this model, I can use USB3 storage device for booting and mounting rootFS 
> as XHCI driver is built-in and USB3 device ctrlr is usually module.

Sounds like a Linux problem. What does that have to do with the binding?

> 
> 2) To reuse the usb device controller code as much as possible.
> 
> If I create 2 independent nodes, then there will be more exported API's
> between USB3 peri and USB3 drd driver.

Why if that's a common split, then doesn't Linux have a defined 
interface?

There is no reason you can spawn 2 drivers from 1 DT node if that's what 
you need. Describe h/w blocks, not nodes for drivers. Sometimes the h/w 
isn't partitioned just like Linux would like. That's a Linux problem, 
not something to 'fix' in DT.

Rob
