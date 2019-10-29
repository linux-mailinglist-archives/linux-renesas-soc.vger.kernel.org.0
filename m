Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C442AE8F82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 19:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731891AbfJ2Ss0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 14:48:26 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40184 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730531AbfJ2SsZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 14:48:25 -0400
Received: by mail-oi1-f195.google.com with SMTP id r27so3671832oij.7;
        Tue, 29 Oct 2019 11:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BV/pFZRnPwMUCShd+/7Pcts3x+guhMQU4TsUurYgJxs=;
        b=AhP30zJWYFP1VFyXHB+L/6bCKNMFV0RLoumpXuR9VKjOX1g9RB0Wm3DOAgFRsLV+AV
         bQEXuGjhKBwpDN0uCsgy11xCexaaXqvkbtoE+NU+gHakiohCEna+vGK21pedOQpUSFGe
         iq3WxAClq9ZCRFxN6NyoNBniAsBug7Tg4xSh5OD01jUTVRNWY9dHf5sPETrR8j7qsgnk
         K/9SPA8lbzHedkSa/DFCdyQoX/qVbHLSrJ8UPFFkK5JV5DoZ6K2BHarrBwvXXDFFuOQ2
         8O/nbAUp2Q5SgvkrSVXzLzsCDfuuS1QfxfERJ+HrImad4JxUkJ3U+1V9qxWvTDt0Pbsv
         fWrg==
X-Gm-Message-State: APjAAAXUwYfBZ+P2NQm+wYXMHAbSVHN9gYL39kWsDm0OGD5zbaxvC2JT
        ioUkdhO2kUcTDYXk1UZMjddZVOg=
X-Google-Smtp-Source: APXvYqyitgfXcvp9tXCmpkPBOz2AlXbBG5o5LAYBP/ppcqksleK0IBIa57lkHl+m906GlURTY/1vvA==
X-Received: by 2002:aca:b4d4:: with SMTP id d203mr5412702oif.168.1572374904349;
        Tue, 29 Oct 2019 11:48:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i11sm528077otj.17.2019.10.29.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 11:48:23 -0700 (PDT)
Date:   Tue, 29 Oct 2019 13:48:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, mark.rutland@arm.com,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: renesas_usbhs: convert bindings to
 json-schema
Message-ID: <20191029184822.GA5031@bogus>
References: <1571818808-12495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571818808-12495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 23, 2019 at 05:20:08PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas USBHS (HS-USB) controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/usb/renesas,usbhs.txt      |  58 ----------
>  .../devicetree/bindings/usb/renesas,usbhs.yaml     | 121 +++++++++++++++++++++
>  2 files changed, 121 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.txt b/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
> deleted file mode 100644
> index 06abe99..00000000
> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -Renesas Electronics USBHS driver
> -
> -Required properties:
> -  - compatible: Must contain one or more of the following:
> -
> -	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
> -	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
> -	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
> -	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
> -	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
> -	- "renesas,usbhs-r8a774b1" for r8a774b1 (RZ/G2N) compatible device
> -	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
> -	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
> -	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
> -	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
> -	- "renesas,usbhs-r8a7793" for r8a7793 (R-Car M2-N) compatible device
> -	- "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
> -	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
> -	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
> -	- "renesas,usbhs-r8a77965" for r8a77965 (R-Car M3-N) compatible device
> -	- "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
> -	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
> -	- "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
> -	- "renesas,usbhs-r7s9210" for r7s9210 (RZ/A2) compatible device
> -	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
> -	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 or RZ/G2 compatible devices
> -	- "renesas,rza1-usbhs" for RZ/A1 compatible device
> -	- "renesas,rza2-usbhs" for RZ/A2 compatible device
> -
> -	When compatible with the generic version, nodes must list the
> -	SoC-specific version corresponding to the platform first followed
> -	by the generic version.
> -
> -  - reg: Base address and length of the register for the USBHS
> -  - interrupts: Interrupt specifier for the USBHS
> -  - clocks: A list of phandle + clock specifier pairs.
> -	    - In case of "renesas,rcar-gen3-usbhs", two clocks are required.
> -	      First clock should be peripheral and second one should be host.
> -	    - In case of except above, one clock is required. First clock
> -	      should be peripheral.
> -
> -Optional properties:
> -  - renesas,buswait: Integer to use BUSWAIT register
> -  - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
> -			 function should be enabled
> -  - phys: phandle + phy specifier pair
> -  - phy-names: must be "usb"
> -  - dmas: Must contain a list of references to DMA specifiers.
> -  - dma-names : named "ch%d", where %d is the channel number ranging from zero
> -                to the number of channels (DnFIFOs) minus one.
> -
> -Example:
> -	usbhs: usb@e6590000 {
> -		compatible = "renesas,usbhs-r8a7790", "renesas,rcar-gen2-usbhs";
> -		reg = <0 0xe6590000 0 0x100>;
> -		interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp7_clks R8A7790_CLK_HSUSB>;
> -	};
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> new file mode 100644
> index 00000000..cb80a06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas USBHS (HS-USB) controller
> +
> +maintainers:
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,usbhs-r7s72100 # RZ/A1

If you don't expect new SoCs, this could be a 'const' instead.

> +          - const: renesas,rza1-usbhs
> +
> +      - items:
> +          - enum:
> +              - renesas,usbhs-r7s9210 # RZ/A2
> +          - const: renesas,rza2-usbhs
> +
> +      - items:
> +          - enum:
> +              - renesas,usbhs-r8a7743  # RZ/G1M
> +              - renesas,usbhs-r8a7744  # RZ/G1N
> +              - renesas,usbhs-r8a7745  # RZ/G1E
> +              - renesas,usbhs-r8a77470 # RZ/G1C
> +              - renesas,usbhs-r8a7790  # R-Car H2
> +              - renesas,usbhs-r8a7791  # R-Car M2-W
> +              - renesas,usbhs-r8a7792  # R-Car V2H
> +              - renesas,usbhs-r8a7793  # R-Car M2-N
> +              - renesas,usbhs-r8a7794  # R-Car E2
> +          - const: renesas,rcar-gen2-usbhs
> +
> +      - items:
> +          - enum:
> +              - renesas,usbhs-r8a774a1 # RZ/G2M
> +              - renesas,usbhs-r8a774b1 # RZ/G2N
> +              - renesas,usbhs-r8a774c0 # RZ/G2E
> +              - renesas,usbhs-r8a7795  # R-Car H3
> +              - renesas,usbhs-r8a7796  # R-Car M3-W
> +              - renesas,usbhs-r8a77965 # R-Car M3-N
> +              - renesas,usbhs-r8a77990 # R-Car E3
> +              - renesas,usbhs-r8a77995 # R-Car D3
> +          - const: renesas,rcar-gen3-usbhs
> +
> +  reg:
> +    # base address and length of the registers block for the controller.

That's every 'reg', so just drop the comment.

> +    maxItems: 1
> +
> +  clocks:
> +    # clock phandle and specifier pair(s).

Same here.

> +    minItems: 1
> +    maxItems: 2

If more than 1, you need to describe what each clock is with 'items' 
list.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  renesas,buswait:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Integer to use BUSWAIT register.
> +
> +  renesas,enable-gpio:
> +    $ref: /schemas/types.yaml#/definitions/phandle

*-gpio already has a type.

> +    description: |
> +      gpio specifier to check GPIO determining if USB function should be
> +      enabled.
> +
> +  phys:
> +    description: phandle + phy specifier pair.

How many?

> +
> +  phy-names:
> +    const: usb
> +
> +  dmas:
> +    minItems: 2
> +    maxItems: 4
> +
> +  dma-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      enum: [ch0, ch1, ch2, ch3]
> +
> +  dr_mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      See generic.txt.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2

Need to describe each reset.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    usbhs: usb@e6590000 {
> +        compatible = "renesas,usbhs-r8a7790", "renesas,rcar-gen2-usbhs";
> +        reg = <0 0xe6590000 0 0x100>;
> +        interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 704>;
> +    };
> +
> -- 
> 2.7.4
> 
