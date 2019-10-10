Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A87D33C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2019 00:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfJJWHM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Oct 2019 18:07:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33767 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfJJWHM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 18:07:12 -0400
Received: by mail-ot1-f68.google.com with SMTP id 60so6292022otu.0;
        Thu, 10 Oct 2019 15:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9c7KcoQ4FFzx8zGV1J16SVuEnUpzAJpoJWvdzrpXbwo=;
        b=lvQLK1nLnCThrjlZ/aYh585ELfXY8azMU5R5tZqqIu4BPxD02pUQ0n5SsKVKdeKA7x
         yuCsHaGwEPrgza5FuXX0gHcbrnqsBF2T9Khd3cmJbJbkJzAWj0nARhypHyey+4mkND/s
         h0zc4qpWUNUORh69kahUnXydPoXqliWFy93d51cVNkxMp5l0oPmsYY2cy7I6aUHqVPk1
         oxi94ZYIe7Tqkdv+YjCphWKixm0oMZVZ3lmfXWYIP6Ixo5m48K1qMtYw8GOl5I8xHsLc
         hPneCd4w8hscFjHzoxkuGNykaQnLv+5DgAxQEXoa72InkoyNVmfF2y9b4zgtKisovWk0
         LTww==
X-Gm-Message-State: APjAAAX9iBILCDfC9g8Rpdt/RJAXNQm7tAp4ZW2DWLfRJRBd+8GuEIYh
        96MlBtZs9oqvnR3wcYEkRA==
X-Google-Smtp-Source: APXvYqzav8nq1GSmd+E2q96LHc0iyMyNorMHRnqfQQ2/eJZUQqFPtRnU3rA6Y9a3AQ+J/Ukw73cpkQ==
X-Received: by 2002:a05:6830:1619:: with SMTP id g25mr9942770otr.195.1570745230722;
        Thu, 10 Oct 2019 15:07:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y18sm1985725oto.2.2019.10.10.15.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 15:07:10 -0700 (PDT)
Date:   Thu, 10 Oct 2019 17:07:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: irqchip: renesas: intc-irqpin: convert
 bindings to json-schema
Message-ID: <20191010220709.GA1314@bogus>
References: <1569527977-21213-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569527977-21213-1-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 27, 2019 at 04:59:37AM +0900, Yoshihiro Kaneko wrote:
> Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> v2
> - correct Geert-san's E-mail address.
> - delete Guennadi-san from the maintainer of this binding.
> - give 'sense-bitfield-width' the uint32 type.
> - describe 'control-parent' property as a boolean.
> 
>  .../interrupt-controller/renesas,intc-irqpin.txt   |  62 -------------
>  .../interrupt-controller/renesas,intc-irqpin.yaml  | 102 +++++++++++++++++++++
>  2 files changed, 102 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml


> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> new file mode 100644
> index 0000000..5925890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DT bindings for the R-/SH-Mobile irqpin controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
> +          - renesas,intc-irqpin-r8a7778  # R-Car M1A
> +          - renesas,intc-irqpin-r8a7779  # R-Car H1
> +          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
> +      - const: renesas,intc-irqpin
> +
> +  reg:
> +    # Base address and length of each register bank used by the external
> +    # IRQ pins driven by the interrupt controller hardware module. The base
> +    # addresses, length and number of required register banks varies with
> +    # soctype.
> +    minItems: 1
> +    maxItems: 6

Every entry is the same thing?

> +
> +  interrupt-controller: true
> +    # Identifies the node as an interrupt controller.

No need to define standard properties.
> +
> +  '#interrupt-cells':
> +    # an interrupt index and flags, as defined in interrupts.txt in this
> +    # directory.

Same here.

> +    const: 2
> +
> +  interrupts:
> +    # Must contain a list of interrupt specifiers. For each interrupt
> +    # provided by this irqpin controller instance, there must be one entry,
> +    # referring to the corresponding parent interrupt.

And here.

> +    maxItems: 1
> +
> +  sense-bitfield-width:
> +    # width of a single sense bitfield in the SENSE register, if different
> +    # from the default 4 bits

Use 'description'

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maxItems: 1

Update dtschema and run 'make dt_binding_check' and I think you'll find 
this fails now. The problem is $ref needs to be under an 'allOf' if 
there's additional schema.

maxItems is also wrong here. 'uint32' type implies that. What you should 
have is a definition of possible values using enum or minimum/maximum.

> +
> +  control-parent:
> +    # disable and enable interrupts on the parent interrupt controller,
> +    # needed for some broken implementations

Use 'description'

> +    type: boolean
> +
> +  clocks:
> +    # Must contain a reference to the functional clock.  This property is
> +    # mandatory if the hardware implements a controllable functional clock for
> +    # the irqpin controller instance.

Drop this. A single entry doesn't need more description.

> +    maxItems: 1
> +
> +  power-domains:
> +    # Must contain a reference to the power domain. This property is
> +    # mandatory if the irqpin controller instance is part of a controllable
> +    # power domain.

Same here.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7740-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    irqpin1: interrupt-controller@e6900004 {
> +        compatible = "renesas,intc-irqpin-r8a7740",
> +                     "renesas,intc-irqpin";
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        reg = <0xe6900004 4>,
> +              <0xe6900014 4>,
> +              <0xe6900024 1>,
> +              <0xe6900044 1>,
> +              <0xe6900064 1>;

Really only 1 byte?

> +        interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
> +                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;

<> each interrupt specifier.

Above you said there is only 1 interrupt...

> +        clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
> +        power-domains = <&pd_a4s>;
> +    };
> -- 
> 1.9.1
> 
