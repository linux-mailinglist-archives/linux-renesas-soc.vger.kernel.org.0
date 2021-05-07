Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79648376C04
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 May 2021 00:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhEGWGg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 May 2021 18:06:36 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:40489 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGWGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 May 2021 18:06:35 -0400
Received: by mail-ot1-f42.google.com with SMTP id c28-20020a9d615c0000b02902dde7c8833eso4230571otk.7;
        Fri, 07 May 2021 15:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XEQLV31v3vyi7ju/vzUI7BaZGEEK8wa7dNNPeGbjJFU=;
        b=bQIwszjKYsHAz0oqwgtDsq2EdEMnuEhkZFHzIZXd2ViBr0J8EEbWUYucm7veeh1+4i
         QgE3vtrIk8EoOeEkStnlD0t9QRqVd1CfC471r8gEG4TvDWkb+wR0jlUpG8UvV+XAn4Gp
         RlziK+7MGFUHgcCXlbcC9WibmwBsP7g1GE+vtVLyqvbu4pvkeE5+62tB0IeEkvjdukMF
         vNCbzG9l1tBJGYYNk62ni9tlqZBKXQMCUyLfQd1AcFxkvHsHkhb8pKhCx1fW0xUPWIeX
         gh4+MhwFlWoC9byY4qz5vhL0F4bCobYXZtX7iryOl1A4y7vd77HaQh/sbBz0aSUD2gkv
         lFaQ==
X-Gm-Message-State: AOAM532ubAB4bBPU8utPlTJjxFTkfmkai/DxAx5CTASaezHD0QppguOk
        QQTHDGFhCpAWorndR8Dc0A==
X-Google-Smtp-Source: ABdhPJxQsmKYiRhMFm4+R6Qv36mIfVEC9PrqSGL8UtbOZXqEO/WtJ3TZ9NDWUkNrP3mMSphWfqL9ew==
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr10026422otl.290.1620425135019;
        Fri, 07 May 2021 15:05:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u24sm1462310otg.73.2021.05.07.15.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:05:33 -0700 (PDT)
Received: (nullmailer pid 2977673 invoked by uid 1000);
        Fri, 07 May 2021 22:05:32 -0000
Date:   Fri, 7 May 2021 17:05:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,mmcif: Convert to json-schema
Message-ID: <20210507220532.GA2974418@robh.at.kernel.org>
References: <1207254b45a0efa65d9d9e3d951fdabfe5b48101.1620206845.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1207254b45a0efa65d9d9e3d951fdabfe5b48101.1620206845.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 05, 2021 at 11:28:22AM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Multi Media Card Interface (MMCIF) Device Tree
> binding documentation to json-schema.
> 
> Document missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/mmc/renesas,mmcif.txt |  53 -------
>  .../bindings/mmc/renesas,mmcif.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt b/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> deleted file mode 100644
> index 291532ac0446fc71..0000000000000000
> --- a/Documentation/devicetree/bindings/mmc/renesas,mmcif.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Renesas Multi Media Card Interface (MMCIF) Controller
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the MMCIF device.
> -
> -
> -Required properties:
> -
> -- compatible: should be "renesas,mmcif-<soctype>", "renesas,sh-mmcif" as a
> -  fallback. Examples with <soctype> are:
> -	- "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
> -	- "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
> -	- "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> -	- "renesas,mmcif-r8a7742" for the MMCIF found in r8a7742 SoCs
> -	- "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
> -	- "renesas,mmcif-r8a7744" for the MMCIF found in r8a7744 SoCs
> -	- "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
> -	- "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
> -	- "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
> -	- "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
> -	- "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
> -	- "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
> -	- "renesas,mmcif-sh73a0" for the MMCIF found in sh73a0 SoCs
> -
> -- interrupts: Some SoCs have only 1 shared interrupt, while others have either
> -  2 or 3 individual interrupts (error, int, card detect). Below is the number
> -  of interrupts for each SoC:
> -    1: r8a73a4, r8a7742, r8a7743, r8a7744, r8a7745, r8a7778, r8a7790, r8a7791,
> -       r8a7793, r8a7794
> -    2: r8a7740, sh73a0
> -    3: r7s72100
> -
> -- clocks: reference to the functional clock
> -
> -- dmas: reference to the DMA channels, one per channel name listed in the
> -  dma-names property.
> -- dma-names: must contain "tx" for the transmit DMA channel and "rx" for the
> -  receive DMA channel.
> -- max-frequency: Maximum operating clock frequency, driver uses default clock
> -  frequency if it is not set.
> -
> -
> -Example: R8A7790 (R-Car H2) MMCIF0
> -
> -	mmcif0: mmc@ee200000 {
> -		compatible = "renesas,mmcif-r8a7790", "renesas,sh-mmcif";
> -		reg = <0 0xee200000 0 0x80>;
> -		interrupts = <0 169 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&mstp3_clks R8A7790_CLK_MMCIF0>;
> -		dmas = <&dmac0 0xd1>, <&dmac0 0xd2>;
> -		dma-names = "tx", "rx";
> -		max-frequency = <97500000>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
> new file mode 100644
> index 0000000000000000..a0eb819ccdf5d684
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/renesas,mmcif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Multi Media Card Interface (MMCIF) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Don't need oneOf with a single entry. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          - enum:
> +              - renesas,mmcif-r7s72100 # RZ/A1H
> +              - renesas,mmcif-r8a73a4  # R-Mobile APE6
> +              - renesas,mmcif-r8a7740  # R-Mobile A1
> +              - renesas,mmcif-r8a7742  # RZ/G1H
> +              - renesas,mmcif-r8a7743  # RZ/G1M
> +              - renesas,mmcif-r8a7744  # RZ/G1N
> +              - renesas,mmcif-r8a7745  # RZ/G1E
> +              - renesas,mmcif-r8a7778  # R-Car M1A
> +              - renesas,mmcif-r8a7790  # R-Car H2
> +              - renesas,mmcif-r8a7791  # R-Car M2-W
> +              - renesas,mmcif-r8a7793  # R-Car M2-N
> +              - renesas,mmcif-r8a7794  # R-Car E2
> +              - renesas,mmcif-sh73a0   # SH-Mobile AG5
> +          - const: renesas,sh-mmcif
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  dmas:
> +    minItems: 2
> +    maxItems: 4
> +    description:
> +      Must contain a list of pairs of references to DMA specifiers, one for
> +      transmission, and one for reception.
> +
> +  dma-names:
> +    minItems: 2
> +    maxItems: 4
> +    items:
> +      enum:
> +        - tx
> +        - rx
> +
> +  max-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - power-domains
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: renesas,mmcif-r7s72100
> +then:
> +  properties:
> +    interrupts:
> +      items:
> +        - description: Error interrupt
> +        - description: Normal operation interrupt
> +        - description: Card detection interrupt
> +else:
> +  if:
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - renesas,mmcif-r8a7740
> +            - renesas,mmcif-sh73a0
> +  then:
> +    properties:
> +      interrupts:
> +        items:
> +          - description: Error interrupt
> +          - description: Normal operation interrupt
> +  else:
> +    if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,mmcif-r8a73a4
> +              - renesas,mmcif-r8a7778
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +    else:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +      required:
> +        - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    mmcif0: mmc@ee200000 {
> +            compatible = "renesas,mmcif-r8a7790", "renesas,sh-mmcif";
> +            reg = <0xee200000 0x80>;
> +            interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 315>;
> +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets = <&cpg 315>;
> +            dmas = <&dmac0 0xd1>, <&dmac0 0xd2>, <&dmac1 0xd1>, <&dmac1 0xd2>;
> +            dma-names = "tx", "rx", "tx", "rx";
> +            max-frequency = <97500000>;
> +    };
> -- 
> 2.25.1
> 
