Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B556474BFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Dec 2021 20:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbhLNTeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Dec 2021 14:34:07 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44643 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbhLNTeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 14:34:06 -0500
Received: by mail-ot1-f51.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso22038439otj.11;
        Tue, 14 Dec 2021 11:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vCREBi8MWAP3rMq+yvusV0B0Cmd5+72EQ4wkbwL8Qt8=;
        b=4Ep4LfBR2keZ5XxtY87+Abjgzklws9semIG/xkXpBJqklSgCQqiL/Pt7yxQSlcz6cr
         ncg+6ndTWYV0TnnLQh7xc0oKt45DdYfyM2cOlHGlP+Sw8TpmhLbnWZnHQZVDMqlYwKns
         30y2HW7PNARBaZDqm26zAIrICNcRc2ymQfLY5gysHEd+koScSwFpyJ1+oFKA8x6OR5xk
         OSxStHAsTGGLYJDNzfoVUXuOYGgf6FQMqriyXkHsvsMPePShlGAbAdaQOY+0YYHquFUI
         XHLIScT8l3ccG/UpCPZnyby7jMq7J0H3rohll1wR5VHJVFJSrn4Dvb6C1F6cmM2osKsw
         1Bjg==
X-Gm-Message-State: AOAM530WF1gV97XY2FIOIt5vprLL0whMMCEoV1JDuBQP0+zwu0ryBEfi
        ztLn5GeO40IicW12TcRm5g==
X-Google-Smtp-Source: ABdhPJzS445ppJ7YtxrZCmXQ4Ysb550vEy7U7/Nb5U0PvJN3zmwdkPgOLiU9JbdTLOoAxoh2Zn1rnQ==
X-Received: by 2002:a9d:12f2:: with SMTP id g105mr5873165otg.301.1639510446260;
        Tue, 14 Dec 2021 11:34:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r23sm154596ooj.37.2021.12.14.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 11:34:05 -0800 (PST)
Received: (nullmailer pid 3776590 invoked by uid 1000);
        Tue, 14 Dec 2021 19:34:04 -0000
Date:   Tue, 14 Dec 2021 13:34:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
Message-ID: <YbjxrFyfIz8Qydpb@robh.at.kernel.org>
References: <20211209143228.525234-1-miquel.raynal@bootlin.com>
 <20211209143228.525234-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209143228.525234-2-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 09, 2021 at 03:32:25PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
> 
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> new file mode 100644
> index 000000000000..cc6a358e33d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,rzn1-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-nand-controller
> +      - const: renesas,rzn1-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB host controller clock
> +      - description: External NAND bus clock
> +
> +  clock-names:
> +    items:
> +      - const: nand_hclk
> +      - const: nand_eclk

'nand_' is redundant.

> +
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: true

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
> +
> +    nand-controller@40102000 {
> +        compatible = "renesas,r9a06g032-nand-controller",
> +                     "renesas,rzn1-nand-controller";
> +        reg = <0x40102000 0x2000>;
> +        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
> +        clock-names = "nand_hclk", "nand_eclk";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +    };
> -- 
> 2.27.0
> 
> 
