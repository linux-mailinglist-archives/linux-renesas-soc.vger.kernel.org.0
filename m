Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68FCC37A553
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 May 2021 12:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhEKK6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 May 2021 06:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhEKK6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 May 2021 06:58:39 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05CAC061761
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 03:57:33 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id x188so4376188vsx.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 May 2021 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ey6AztPlStF+EHQEBxICZNmYDnr7gnn/OgJP3awQWRU=;
        b=oBVycJADQl/R5cnvsrr+Iz1eB2LUXKXbtFN1CtmKUyBBleJ3AaSHFTqOMlRm61ep+d
         t+fgqWs8hxLoMkEncV29fIoYT0KLNxabEEK6s8lR3JXoVjjdObh0M9dZYrMMrnuxIAP/
         FoNtO6b4CONjz5w8Bt0ICUDEqATkvImXskCsDCC38MoyeljVXvKiP5GdDqebduvs1T39
         e8DKD/GPyw+P+WlmPn+pHt2DqX9bdH0vL18slkSIwuChEaTsfEImeonmeJU3yDC6Jma2
         B61O/leBSgC3tdeb4t1Pdm+LyLdo7Ca+UUzNfXVY0osjoB7dG8gqI4IN9/6f1Ng4t4xt
         IwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ey6AztPlStF+EHQEBxICZNmYDnr7gnn/OgJP3awQWRU=;
        b=A0AC9d5T2NJdQsskCn3mukEyJMWd/W/U3V1Zjtw3CVh46TmuDkFR7v/JRDMu3kfvI8
         dah0kVDDxFNp9aOYxtVFHY4AJiKSu2NVTECV1AauYZfo5US7Pdx2mrWioyUMG9QO6oZm
         skUed5IXqfgFRTy6YImT5ydKO7ZmIatHgeudYWHdth7UD2DHTPyEWkjMfhTgMZeSzfJl
         1wh18+jlFSdvw+3LcmUDEMmpPwX8cOmDgACsUQ7P3TMuaEs9+Elc9zv5X5gU5aeoDAqO
         87zv3lJHpBG2azSy85krIHCye8CkJZyHH4/sZnILNraic4QDP7kg2G4VIP5eKyH9HLz3
         N9bA==
X-Gm-Message-State: AOAM5313D3/tNcA+uMamhTC6VARaHylSDTcckQUz5MSKR2mLA8COJUht
        1qn8yPPhCvwzIyOBfzSApoHFaqOaqbH0mn05tUn0IQ==
X-Google-Smtp-Source: ABdhPJw3qzDFl/gzmZd3gitN57mXa5ygDpx3w85ykxyCQl8YfsZ3EEzsfVHZ1UeVnTiS8kESOiSjCdHDQF6QIXii014=
X-Received: by 2002:a05:6102:505:: with SMTP id l5mr20495237vsa.55.1620730652897;
 Tue, 11 May 2021 03:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <04b97315fed0f4f512356b68f9f5bb6ed7adc41f.1620648698.git.geert+renesas@glider.be>
In-Reply-To: <04b97315fed0f4f512356b68f9f5bb6ed7adc41f.1620648698.git.geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 11 May 2021 12:56:55 +0200
Message-ID: <CAPDyKFqO6fkiwAmrGibpeZAyyeGbDHD03GVc34CPJhEWS2O9XQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: renesas,mmcif: Convert to json-schema
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 10 May 2021 at 14:13, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Convert the Renesas Multi Media Card Interface (MMCIF) Device Tree
> binding documentation to json-schema.
>
> Document missing properties.
> Update the example to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Drop unneeded oneOf,
>   - Add Reviewed-by.
> ---
>  .../devicetree/bindings/mmc/renesas,mmcif.txt |  53 -------
>  .../bindings/mmc/renesas,mmcif.yaml           | 135 ++++++++++++++++++
>  2 files changed, 135 insertions(+), 53 deletions(-)
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
> -       - "renesas,mmcif-r7s72100" for the MMCIF found in r7s72100 SoCs
> -       - "renesas,mmcif-r8a73a4" for the MMCIF found in r8a73a4 SoCs
> -       - "renesas,mmcif-r8a7740" for the MMCIF found in r8a7740 SoCs
> -       - "renesas,mmcif-r8a7742" for the MMCIF found in r8a7742 SoCs
> -       - "renesas,mmcif-r8a7743" for the MMCIF found in r8a7743 SoCs
> -       - "renesas,mmcif-r8a7744" for the MMCIF found in r8a7744 SoCs
> -       - "renesas,mmcif-r8a7745" for the MMCIF found in r8a7745 SoCs
> -       - "renesas,mmcif-r8a7778" for the MMCIF found in r8a7778 SoCs
> -       - "renesas,mmcif-r8a7790" for the MMCIF found in r8a7790 SoCs
> -       - "renesas,mmcif-r8a7791" for the MMCIF found in r8a7791 SoCs
> -       - "renesas,mmcif-r8a7793" for the MMCIF found in r8a7793 SoCs
> -       - "renesas,mmcif-r8a7794" for the MMCIF found in r8a7794 SoCs
> -       - "renesas,mmcif-sh73a0" for the MMCIF found in sh73a0 SoCs
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
> -       mmcif0: mmc@ee200000 {
> -               compatible = "renesas,mmcif-r8a7790", "renesas,sh-mmcif";
> -               reg = <0 0xee200000 0 0x80>;
> -               interrupts = <0 169 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&mstp3_clks R8A7790_CLK_MMCIF0>;
> -               dmas = <&dmac0 0xd1>, <&dmac0 0xd2>;
> -               dma-names = "tx", "rx";
> -               max-frequency = <97500000>;
> -       };
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
> new file mode 100644
> index 0000000000000000..c36ba561c3875ad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/renesas,mmcif.yaml
> @@ -0,0 +1,135 @@
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
> +    items:
> +      - enum:
> +          - renesas,mmcif-r7s72100 # RZ/A1H
> +          - renesas,mmcif-r8a73a4  # R-Mobile APE6
> +          - renesas,mmcif-r8a7740  # R-Mobile A1
> +          - renesas,mmcif-r8a7742  # RZ/G1H
> +          - renesas,mmcif-r8a7743  # RZ/G1M
> +          - renesas,mmcif-r8a7744  # RZ/G1N
> +          - renesas,mmcif-r8a7745  # RZ/G1E
> +          - renesas,mmcif-r8a7778  # R-Car M1A
> +          - renesas,mmcif-r8a7790  # R-Car H2
> +          - renesas,mmcif-r8a7791  # R-Car M2-W
> +          - renesas,mmcif-r8a7793  # R-Car M2-N
> +          - renesas,mmcif-r8a7794  # R-Car E2
> +          - renesas,mmcif-sh73a0   # SH-Mobile AG5
> +      - const: renesas,sh-mmcif
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
