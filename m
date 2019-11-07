Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 412FCF23B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 01:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732849AbfKGA5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 19:57:06 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36102 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKGA5E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 19:57:04 -0500
Received: by mail-oi1-f193.google.com with SMTP id j7so471770oib.3;
        Wed, 06 Nov 2019 16:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wVopP65af2cBXxzoana9KSKEMsEoxhrG9UviCULOUg4=;
        b=WfXqhr91JSsFNCTC2KnZrddnLYR4lhhNF04xhaxZ5FILgYpr1mq83Rd9NqXo4r0GhF
         3tjZ5A8Z1k85fAjOvYOIjJtUHgeCxtzT4Vo97GahaV4DTzqevLqJEeNBywMv6ikX8dEG
         Xk8Vyu4tXsyCaCMPnviESSQJEOYG2J22Vkg9jMtn+jh9Yy+XsWzHix2muhBohGshabQ3
         kPExhC/6IdEB0ikTUEVTV0LZ5DOuCqN3QflUgUtRAIBR9cIFTHqBeIP3FmvnXTz6GQ76
         FtieUWtly9B4vbhrtWlwBesste1ygJtyYA7bw+Cjsznbayo2Yl8+2G5hipZZqQsWUnuC
         6sjw==
X-Gm-Message-State: APjAAAVQLpB7IrvxU9EEVNIXeVrSebMBJtj7gOEjAGzQX3672VdIBNoF
        EV8QDW3TeXJ9bSsoVhOO7w==
X-Google-Smtp-Source: APXvYqzgyGiNH/+b07+ECaPHE7xfGIlXeKVgv1JewsJCDXnRFj3BROp9D0klxCcE7xKAxgV91Gsdqg==
X-Received: by 2002:aca:ad03:: with SMTP id w3mr816187oie.96.1573088221287;
        Wed, 06 Nov 2019 16:57:01 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f9sm218449otq.52.2019.11.06.16.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 16:57:00 -0800 (PST)
Date:   Wed, 6 Nov 2019 18:57:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_usbhs: convert bindings to
 json-schema
Message-ID: <20191107005700.GA26323@bogus>
References: <1573036483-16477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573036483-16477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 06, 2019 at 07:34:43PM +0900, Yoshihiro Shimoda wrote:
> Convert Renesas USBHS (HS-USB) controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Remove enum from RZ/A[12] compatibles.
>  - Remove comments from reg and clocks.
>  - Change maxItems from 2 to 3 on clocks for USB 2.0 clock selector.
>  - Add items on clocks.
>  - Remove $ref from a gpio property.
>  - Add maxItems on phys, phy-names and resets.
>  - Remove generic.txt file reference.
>  - Remove the last blank line.
>  https://patchwork.kernel.org/patch/11205919/
> 
>  .../devicetree/bindings/usb/renesas,usbhs.txt      |  58 ----------
>  .../devicetree/bindings/usb/renesas,usbhs.yaml     | 128 +++++++++++++++++++++
>  2 files changed, 128 insertions(+), 58 deletions(-)
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
> index 00000000..1d776d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> @@ -0,0 +1,128 @@
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
> +          - const: renesas,usbhs-r7s72100 # RZ/A1
> +          - const: renesas,rza1-usbhs
> +
> +      - items:
> +          - const: renesas,usbhs-r7s9210 # RZ/A2
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
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      - description: USB 2.0 host
> +      - description: USB 2.0 peripheral
> +      - description: USB 2.0 clock selector
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
> +    description: |
> +      gpio specifier to check GPIO determining if USB function should be
> +      enabled.
> +
> +  phys:
> +    maxItems: 1
> +    items:
> +      - description: phandle + phy specifier pair.
> +
> +  phy-names:
> +    maxItems: 1
> +    items:
> +      - const: usb
> +
> +  dmas:
> +    minItems: 2
> +    maxItems: 4
> +
> +  dma-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      - enum: [ch0, ch1, ch2, ch3]

This is saying the 1st item is one of the 4 values and the others are 
undefined. I think you want:

items:
  - const: ch0
  - const: ch1
  - const: ch2
  - const: ch3

> +
> +  dr_mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      tells Dual-Role USB controllers that we want to work on a particular
> +      mode. Valid arguments are "host", "peripheral" and "otg". In case this
> +      attribute isn't passed via DT, USB DRD controllers should default to OTG.

Assume we have a common binding for this and all you need is:

dr_mode: true

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: USB 2.0 host
> +      - description: USB 2.0 peripheral
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
> -- 
> 2.7.4
> 
