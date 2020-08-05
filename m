Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817C423C601
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 08:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgHEGfo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 02:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgHEGfm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 02:35:42 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D4FC061757
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2020 23:35:42 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id o25so13555709uar.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2020 23:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vtaqrysP//SZM29T36wzhrYVhswR6gj7nAkwsYOrqUw=;
        b=k2asQqcX0Awj8WuiKZ0jBTWzkvmkvDdur0kq7mJiAaZihpCqdKRPO3c9+iF9BL4Buy
         IHcf9vnQPziwhjSbIe11uTfgtidmknjQcAQBQj71YAtQAb0SFSr4kKNCHgoNIM5xNOuj
         PFzmxfuQBmyTkqjcRToJbr2DxczGpPFTUY0wgWHQF9pyj+lzra6SHvbpuLDJIkkfaSPg
         itSZjQY95hft4A/7ne0ifdeL+F6pz4luMyyfO5tdkbbAF+nFgsU1pWIWKUJXeI78eiEb
         cGX8Sd3fWKbl+eXB9Wy7Oiv203yBGrjQ7S2lOr4MPifEiWevSUSh2Zz3Q/57YZ6WjhyC
         RbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vtaqrysP//SZM29T36wzhrYVhswR6gj7nAkwsYOrqUw=;
        b=Y8rXQEOqLOOHQVsefLy/gMaN7AIHsmy7+MrjDyJO299CWPpCycAcoZ7gzq/JnyijTh
         Rj7DcfhLYVjAlk0rRwF1xMAXTSxML+7Jkb7KQhGtZt665S+Vi90EfsQeA2b43lSnxQP8
         ydaJBF45SG8WIar3qNNXhHoVWxV1x8ahstkTPJ6hUO3anObqPGOqcVFbyTzRzwHJKnyO
         /TTJp+vYhKBFjeQncBzefPiMM/n+vy6EpsfFkWo0GoJYDwzdk8BSBHogQzSI/VC9yhOl
         62MziXYD7ANOYYMRaZjyw2IwN/4LZSO5Eu2e1Eu+aL54vrpnAGu8P8pqTWOeO+n0c4fZ
         MrCg==
X-Gm-Message-State: AOAM530eQNJMgI+A+jBZs5KbigSvs0ZW5nwAkuXHNX9f5UheGcqjJLqE
        /RSMtVUyoBf2JRG6tBVLoXGHfHkpcR/VJqgZYXR/pA==
X-Google-Smtp-Source: ABdhPJyPHXiYvmICQOrDoqgTPQ8Ztwt+WsydgwdKZfBNmzgRV4SEutSHmF1UQfZO7BaWNxaXpED+jU3ysJPGKmYw/eU=
X-Received: by 2002:ab0:2ea2:: with SMTP id y2mr998961uay.15.1596609341140;
 Tue, 04 Aug 2020 23:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <1594363883-22154-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594363883-22154-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 5 Aug 2020 08:35:04 +0200
Message-ID: <CAPDyKFpBpCtzkHJdfkNGMxWVw6jDdFKXSC5BJxLpqULyvj47tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: convert to YAML
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Jul 2020 at 08:51, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Convert Renesas SDHI SD/MMC controller document to YAML.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied for next (a while ago), thanks!
Kind regards
Uffe



> ---
>  Almost all node names in Renesas dtsi files have "sd@" name, but these should
>  be "mmc@". So converting the node names by using the following commands
>  is easy to check this patch :)
>   sed -i "s/sd@/mmc@/" arch/arm/boot/dts/*
>   sed -i "s/sd@/mmc@/" arch/arm64/boot/dts/renesas/*
>
>  r8a77470-iwg23s-sbc.dts doesn't seem to follow the document though...
>
>  .../devicetree/bindings/mmc/renesas,sdhi.txt       | 114 ------------
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 191 +++++++++++++++++++++
>  2 files changed, 191 insertions(+), 114 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> deleted file mode 100644
> index 0ca9a62..0000000
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -* Renesas SDHI SD/MMC controller
> -
> -Required properties:
> -- compatible: should contain one or more of the following:
> -               "renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
> -               "renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
> -               "renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
> -               "renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
> -               "renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
> -               "renesas,sdhi-r8a7742" - SDHI IP on R8A7742 SoC
> -               "renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
> -               "renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
> -               "renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
> -               "renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> -               "renesas,sdhi-r8a774b1" - SDHI IP on R8A774B1 SoC
> -               "renesas,sdhi-r8a774c0" - SDHI IP on R8A774C0 SoC
> -               "renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC
> -               "renesas,sdhi-mmc-r8a77470" - SDHI/MMC IP on R8A77470 SoC
> -               "renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
> -               "renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
> -               "renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
> -               "renesas,sdhi-r8a7791" - SDHI IP on R8A7791 SoC
> -               "renesas,sdhi-r8a7792" - SDHI IP on R8A7792 SoC
> -               "renesas,sdhi-r8a7793" - SDHI IP on R8A7793 SoC
> -               "renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
> -               "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
> -               "renesas,sdhi-r8a7796" - SDHI IP on R8A77960 SoC
> -               "renesas,sdhi-r8a77961" - SDHI IP on R8A77961 SoC
> -               "renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
> -               "renesas,sdhi-r8a77970" - SDHI IP on R8A77970 SoC
> -               "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
> -               "renesas,sdhi-r8a77990" - SDHI IP on R8A77990 SoC
> -               "renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
> -               "renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
> -               "renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> -               "renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 and RZ/G1 SDHI
> -                                          (not SDHI/MMC) controller
> -               "renesas,rcar-gen3-sdhi" - a generic R-Car Gen3 or RZ/G2
> -                                          SDHI controller
> -
> -
> -               When compatible with the generic version, nodes must list
> -               the SoC-specific version corresponding to the platform
> -               first followed by the generic version.
> -
> -- clocks: Most controllers only have 1 clock source per channel. However, on
> -         some variations of this controller, the internal card detection
> -         logic that exists in this controller is sectioned off to be run by a
> -         separate second clock source to allow the main core clock to be turned
> -         off to save power.
> -         If 2 clocks are specified by the hardware, you must name them as
> -         "core" and "cd". If the controller only has 1 clock, naming is not
> -         required.
> -         Devices which have more than 1 clock are listed below:
> -         2: R7S72100, R7S9210
> -
> -Optional properties:
> -- pinctrl-names: should be "default", "state_uhs"
> -- pinctrl-0: should contain default/high speed pin ctrl
> -- pinctrl-1: should contain uhs mode pin ctrl
> -
> -Example: R8A7790 (R-Car H2) SDHI controller nodes
> -
> -       sdhi0: sd@ee100000 {
> -               compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> -               reg = <0 0xee100000 0 0x328>;
> -               interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&cpg CPG_MOD 314>;
> -               dmas = <&dmac0 0xcd>, <&dmac0 0xce>,
> -                      <&dmac1 0xcd>, <&dmac1 0xce>;
> -               dma-names = "tx", "rx", "tx", "rx";
> -               max-frequency = <195000000>;
> -               power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -               resets = <&cpg 314>;
> -       };
> -
> -       sdhi1: sd@ee120000 {
> -               compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> -               reg = <0 0xee120000 0 0x328>;
> -               interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&cpg CPG_MOD 313>;
> -               dmas = <&dmac0 0xc9>, <&dmac0 0xca>,
> -                      <&dmac1 0xc9>, <&dmac1 0xca>;
> -               dma-names = "tx", "rx", "tx", "rx";
> -               max-frequency = <195000000>;
> -               power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -               resets = <&cpg 313>;
> -       };
> -
> -       sdhi2: sd@ee140000 {
> -               compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> -               reg = <0 0xee140000 0 0x100>;
> -               interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&cpg CPG_MOD 312>;
> -               dmas = <&dmac0 0xc1>, <&dmac0 0xc2>,
> -                      <&dmac1 0xc1>, <&dmac1 0xc2>;
> -               dma-names = "tx", "rx", "tx", "rx";
> -               max-frequency = <97500000>;
> -               power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -               resets = <&cpg 312>;
> -       };
> -
> -       sdhi3: sd@ee160000 {
> -               compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> -               reg = <0 0xee160000 0 0x100>;
> -               interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&cpg CPG_MOD 311>;
> -               dmas = <&dmac0 0xd3>, <&dmac0 0xd4>,
> -                      <&dmac1 0xd3>, <&dmac1 0xd4>;
> -               dma-names = "tx", "rx", "tx", "rx";
> -               max-frequency = <97500000>;
> -               power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> -               resets = <&cpg 311>;
> -       };
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> new file mode 100644
> index 0000000..e5dbc20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas SDHI SD/MMC controller
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
> +          - const: renesas,sdhi-sh73a0  # R-Mobile APE6
> +      - items:
> +          - const: renesas,sdhi-r7s72100 # RZ/A1H
> +      - items:
> +          - const: renesas,sdhi-r7s9210 # SH-Mobile AG5
> +      - items:
> +          - const: renesas,sdhi-r8a73a4 # R-Mobile APE6
> +      - items:
> +          - const: renesas,sdhi-r8a7740 # R-Mobile A1
> +      - items:
> +          - enum:
> +              - renesas,sdhi-r8a7778 # R-Car M1
> +              - renesas,sdhi-r8a7779 # R-Car H1
> +          - const: renesas,rcar-gen1-sdhi # R-Car Gen1
> +      - items:
> +          - enum:
> +              - renesas,sdhi-r8a7742  # RZ/G1H
> +              - renesas,sdhi-r8a7743  # RZ/G1M
> +              - renesas,sdhi-r8a7744  # RZ/G1N
> +              - renesas,sdhi-r8a7745  # RZ/G1E
> +              - renesas,sdhi-r8a77470 # RZ/G1C
> +              - renesas,sdhi-r8a7790  # R-Car H2
> +              - renesas,sdhi-r8a7791  # R-Car M2-W
> +              - renesas,sdhi-r8a7792  # R-Car V2H
> +              - renesas,sdhi-r8a7793  # R-Car M2-N
> +              - renesas,sdhi-r8a7794  # R-Car E2
> +          - const: renesas,rcar-gen2-sdhi # R-Car Gen2 and RZ/G1
> +      - items:
> +          - const: renesas,sdhi-mmc-r8a77470 # RZ/G1C (SDHI/MMC IP)
> +      - items:
> +          - enum:
> +              - renesas,sdhi-r8a774a1 # RZ/G2M
> +              - renesas,sdhi-r8a774b1 # RZ/G2N
> +              - renesas,sdhi-r8a774c0 # RZ/G2E
> +              - renesas,sdhi-r8a7795  # R-Car H3
> +              - renesas,sdhi-r8a7796  # R-Car M3-W
> +              - renesas,sdhi-r8a77961 # R-Car M3-W+
> +              - renesas,sdhi-r8a77965 # R-Car M3-N
> +              - renesas,sdhi-r8a77970 # R-Car V3M
> +              - renesas,sdhi-r8a77980 # R-Car V3H
> +              - renesas,sdhi-r8a77990 # R-Car E3
> +              - renesas,sdhi-r8a77995 # R-Car D3
> +          - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: core
> +      - const: cd
> +
> +  dmas:
> +    minItems: 4
> +    maxItems: 4
> +
> +  dma-names:
> +    minItems: 4
> +    maxItems: 4
> +    items:
> +      enum:
> +        - tx
> +        - rx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  pinctrl-0:
> +    minItems: 1
> +    maxItems: 2
> +
> +  pinctrl-1:
> +    maxItems: 1
> +
> +  pinctrl-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: default
> +      - const: state_uhs
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
> +      items:
> +        enum:
> +          - renesas,sdhi-r7s72100
> +          - renesas,sdhi-r7s9210
> +then:
> +  required:
> +    - clock-names
> +  description:
> +     The internal card detection logic that exists in these controllers is
> +     sectioned off to be run by a separate second clock source to allow
> +     the main core clock to be turned off to save power.
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
> +
> +    sdhi0: mmc@ee100000 {
> +            compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> +            reg = <0xee100000 0x328>;
> +            interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&cpg CPG_MOD 314>;
> +            dmas = <&dmac0 0xcd>, <&dmac0 0xce>, <&dmac1 0xcd>, <&dmac1 0xce>;
> +            dma-names = "tx", "rx", "tx", "rx";
> +            max-frequency = <195000000>;
> +            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +            resets = <&cpg 314>;
> +    };
> +
> +    sdhi1: mmc@ee120000 {
> +             compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> +             reg = <0xee120000 0x328>;
> +             interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +             clocks = <&cpg CPG_MOD 313>;
> +             dmas = <&dmac0 0xc9>, <&dmac0 0xca>, <&dmac1 0xc9>, <&dmac1 0xca>;
> +             dma-names = "tx", "rx", "tx", "rx";
> +             max-frequency = <195000000>;
> +             power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +             resets = <&cpg 313>;
> +    };
> +
> +    sdhi2: mmc@ee140000 {
> +             compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> +             reg = <0xee140000 0x100>;
> +             interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +             clocks = <&cpg CPG_MOD 312>;
> +             dmas = <&dmac0 0xc1>, <&dmac0 0xc2>, <&dmac1 0xc1>, <&dmac1 0xc2>;
> +             dma-names = "tx", "rx", "tx", "rx";
> +             max-frequency = <97500000>;
> +             power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +             resets = <&cpg 312>;
> +     };
> +
> +     sdhi3: mmc@ee160000 {
> +              compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
> +              reg = <0xee160000 0x100>;
> +              interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +              clocks = <&cpg CPG_MOD 311>;
> +              dmas = <&dmac0 0xd3>, <&dmac0 0xd4>, <&dmac1 0xd3>, <&dmac1 0xd4>;
> +              dma-names = "tx", "rx", "tx", "rx";
> +              max-frequency = <97500000>;
> +              power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
> +              resets = <&cpg 311>;
> +    };
> --
> 2.7.4
>
