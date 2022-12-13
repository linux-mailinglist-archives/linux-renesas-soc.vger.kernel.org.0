Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B3064B75B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 15:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235621AbiLMO30 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 09:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbiLMO3Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 09:29:24 -0500
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1215D20BC3;
        Tue, 13 Dec 2022 06:29:24 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1441d7d40c6so12715246fac.8;
        Tue, 13 Dec 2022 06:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQKy20lRkZdHqk3gT0sVQxdWUBVKKO65u2g9flbQKyU=;
        b=XgC873sTMUct4De05UOWlKOZwltC5AZt627nV0bBAblGVQ/vl3wDhKs5Rbt1B1fskM
         ldmkZ1+1mRa8YNl+P+VHExlSaukkGsLAXj5sZwjBjZvavvtbIbFbimjWE8Fx6HBwpf5A
         +3AtpieepokXtZqN/4mnNoHWxSx0Y35WGYb4fz+4ns+Y7++wVnI2hnfwG/nBqBoUVhzS
         yqmLPAaK9ZOifBv3xRcz3PS7kkA2XQNXhDqeb9IXB6OJWVKFePYUaWrs4UhlkQHQi0Ms
         IBkbYkym41v+g0Qek7NQYEdA+oR8m+WtFDOSh7glxpuMtQSnzHbP+xhYtDG9kWF3OKIr
         YMhg==
X-Gm-Message-State: ANoB5plwRIf9LkH1sz5RruIUfqinWYqXqeDQCtsd2I4N5Yb1HI54tB2H
        ogKbrfKGg/foy3iEDPdAeA==
X-Google-Smtp-Source: AA0mqf7mesH76t/qTFVXBoPHFI+Q9oByg0u/+nUar5MhCtL9Fbvn0AAqhQrGcu2ftQYW+YFbJljXdA==
X-Received: by 2002:a05:6870:8914:b0:13d:99fc:8d23 with SMTP id i20-20020a056870891400b0013d99fc8d23mr8742920oao.42.1670941763148;
        Tue, 13 Dec 2022 06:29:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u39-20020a056870702700b001435fe636f2sm1440832oae.53.2022.12.13.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 06:29:22 -0800 (PST)
Received: (nullmailer pid 967453 invoked by uid 1000);
        Tue, 13 Dec 2022 14:29:21 -0000
Date:   Tue, 13 Dec 2022 08:29:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Message-ID: <20221213142921.GA958810-robh@kernel.org>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 12, 2022 at 05:27:50PM +0000, Biju Das wrote:
> Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> new file mode 100644
> index 000000000000..0c473c3398b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,rzv2m-usb3drd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2M USB 3.1 DRD controller
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  The RZ/V2{M, MA} USB3.1 DRD module supports the following functions
> +  * Role swapping function by the ID pin of the Micro-AB receptacle
> +  * Battery Charging Specification Revision 1.2
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a09g011-usb3drd  # RZ/V2M
> +          - renesas,r9a09g055-usb3drd  # RZ/V2MA
> +      - const: renesas,rzv2m-usb3drd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Peripheral AXI clock
> +      - description: APB clock
> +
> +  clock-names:
> +    items:
> +      - const: peri_axi
> +      - const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: DRD reset
> +      - description: Peripheral reset
> +
> +  reset-names:
> +    items:
> +      - const: drd_reset
> +      - const: aresetn_p
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    enum: [ 1, 2 ]
> +
> +  '#size-cells':
> +    enum: [ 1, 2 ]
> +
> +  usb3peri:
> +    $ref: /schemas/usb/renesas,usb3-peri.yaml
> +
> +patternProperties:
> +  "^usb@[0-9a-f]+$":
> +    type: object
> +    $ref: renesas,usb-xhci.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb3drd: usb@85070000 {
> +        compatible = "renesas,r9a09g011-usb3drd", "renesas,rzv2m-usb3drd";
> +        reg = <0x85070000 0x1000>;
> +        clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> +                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> +        clock-names = "peri_axi", "apb";
> +        power-domains = <&cpg>;
> +        resets = <&cpg R9A09G011_USB_DRD_RESET>,
> +                 <&cpg R9A09G011_USB_ARESETN_P>;
> +        reset-names = "drd_reset", "aresetn_p";
> +        ranges;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        usb3host: usb@85060000 {
> +           compatible = "renesas,r9a09g011-xhci",
> +                        "renesas,rzv2m-xhci";
> +           reg = <0x85060000 0x2000>;
> +           interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
> +           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
> +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> +           clock-names = "host_axi", "reg";
> +           power-domains = <&cpg>;
> +           resets = <&cpg R9A09G011_USB_ARESETN_H>;
> +        };
> +
> +        usb3peri: usb3peri {
> +           compatible = "renesas,r9a09g011-usb3-peri",
> +                        "renesas,rzv2m-usb3-peri";
> +           interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> +                        <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> +           interrupt-names = "all_p", "drd", "bc", "gpi";
> +           clocks = <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> +           clock-names = "aclk", "reg";
> +           power-domains = <&cpg>;
> +           resets = <&cpg R9A09G011_USB_ARESETN_P>;
> +        };

The USB device ctrlr doesn't have registers? It looks to me like you've 
created 3 nodes for instantiating drivers rather that because you have 3 
separate h/w blocks. Either you should split this to 2 independent nodes 
or move usb3peri resources to the parent node. That would only be 
interrupts because everything else is already there.

Rob
