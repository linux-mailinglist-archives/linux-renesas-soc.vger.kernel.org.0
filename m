Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BAE91715C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 12:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbgB0LMt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 06:12:49 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40289 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbgB0LMs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 06:12:48 -0500
Received: by mail-oi1-f194.google.com with SMTP id a142so2885183oii.7;
        Thu, 27 Feb 2020 03:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRZl22qTx+n0iXrkM4uPLZmiGijPZu3bo/mxnerKIoY=;
        b=foY6N/WtfbG3ju7wmgF6gkWQnGfByIF8s3affJFIAwB5LfaFZN9TgsqKbQ+fz8YmUG
         qOAJh2MOYBuCCmssD+q2+psaQ30Qoj1sTwHRZEsQGQjbvpTMnRICSE2HM2oe+OTtp9y4
         kEeHSNdwvSVpXuI6c5umuAQidwjpCbmTHogmonfygLmPT7YtaFBrlx0wG6WwU5sVmgsn
         HYsG3HOXxiOMlbj9nf5DgX+fmI4AlSOUFervTJQjahg9pwwZl0oC8Spto/aT+fK0yz58
         cHQ3l/YYWLn/aPkGnwNlzasYlQiDTLYNYt1QgE+8ZVAAO+WjCf7VqQEiONKR/mN6jvlj
         CfGQ==
X-Gm-Message-State: APjAAAWl2JeTSa0u+0aYzXWjpE1TcCnyntT4BGFrKRwGXbSyuqRRrwkU
        8aZ3OPgr9nyKeguAL8VEB3kEOiMDvjFhZqNOnRc=
X-Google-Smtp-Source: APXvYqx8JkPWGFyKwQUC6fADauIojDD6kegNTwPJ5zzR2R+qSvbkUfWUOMyceK8YtlC6zWYKWbJr1kxzVs8QLn2+vbQ=
X-Received: by 2002:aca:b4c3:: with SMTP id d186mr2732342oif.131.1582801967331;
 Thu, 27 Feb 2020 03:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20200224152640.1318-1-geert+renesas@glider.be> <158265013473.177367.4512247165308399202@swboyd.mtv.corp.google.com>
In-Reply-To: <158265013473.177367.4512247165308399202@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Feb 2020 12:12:36 +0100
Message-ID: <CAMuHMdUDjWKYaQ_MN+AvYg8vimZKMcck3SdHUSg8tPCCAEieJQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

Thanks for your comments!

On Tue, Feb 25, 2020 at 6:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2020-02-24 07:26:40)
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > new file mode 100644
> > index 0000000000000000..dfbd1933f1bc56de
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -0,0 +1,204 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Renesas Clock Pulse Generator / Module Standby and Software Reset
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description: |
> > +  On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
> > +  and MSSR (Module Standby and Software Reset) blocks are intimately connected,
> > +  and share the same register block.
> > +
> > +  They provide the following functionalities:
> > +    - The CPG block generates various core clocks,
> > +    - The MSSR block provides two functions:
> > +        1. Module Standby, providing a Clock Domain to control the clock supply
> > +           to individual SoC devices,
> > +        2. Reset Control, to perform a software reset of individual SoC devices.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r7s9210-cpg-mssr  # RZ/A2
> > +      - renesas,r8a7743-cpg-mssr  # RZ/G1M
> > +      - renesas,r8a7744-cpg-mssr  # RZ/G1N
> > +      - renesas,r8a7745-cpg-mssr  # RZ/G1E
> > +      - renesas,r8a77470-cpg-mssr # RZ/G1C
> > +      - renesas,r8a774a1-cpg-mssr # RZ/G2M
> > +      - renesas,r8a774b1-cpg-mssr # RZ/G2N
> > +      - renesas,r8a774c0-cpg-mssr # RZ/G2E
> > +      - renesas,r8a7790-cpg-mssr  # R-Car H2
> > +      - renesas,r8a7791-cpg-mssr  # R-Car M2-W
> > +      - renesas,r8a7792-cpg-mssr  # R-Car V2H
> > +      - renesas,r8a7793-cpg-mssr  # R-Car M2-N
> > +      - renesas,r8a7794-cpg-mssr  # R-Car E2
> > +      - renesas,r8a7795-cpg-mssr  # R-Car H3
> > +      - renesas,r8a7796-cpg-mssr  # R-Car M3-W
> > +      - renesas,r8a77961-cpg-mssr # R-Car M3-W+
> > +      - renesas,r8a77965-cpg-mssr # R-Car M3-N
> > +      - renesas,r8a77970-cpg-mssr # R-Car V3M
> > +      - renesas,r8a77980-cpg-mssr # R-Car V3H
> > +      - renesas,r8a77990-cpg-mssr # R-Car E3
> > +      - renesas,r8a77995-cpg-mssr # R-Car D3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
>
> Do we need this here and also below? Why can't it just be below with the
> more specific constraints?

With the above removed:

    Documentation/devicetree/bindings/clock/renesas,cpg-mssr.example.dt.yaml:
clock-controller@e6150000: 'clock-names', 'clocks' do not match any of
the regexes: 'pinctrl-[0-9]+'

while the "if" below overriding minItems did trigger, as removing entries from
clocks/clock-names in the example causes more errors.

So it seems all properties must be listed in the main, unconditional,
properties section at the top.

> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          items:
> > +            enum:
> > +              - renesas,r7s9210-cpg-mssr
> > +              - renesas,r8a774c0-cpg-mssr
> > +              - renesas,r8a7792-cpg-mssr
> > +              - renesas,r8a77990-cpg-mssr
> > +              - renesas,r8a77995-cpg-mssr
> > +
> > +    then:
> > +      properties:
> > +        clock:
> > +          maxItems: 1
> > +        clock-names:
> > +          maxItems: 1
> > +          items:
> > +            - const: extal
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r8a7743-cpg-mssr
> > +              - renesas,r8a7744-cpg-mssr
> > +              - renesas,r8a7745-cpg-mssr
> > +              - renesas,r8a77470-cpg-mssr
> > +              - renesas,r8a7790-cpg-mssr
> > +              - renesas,r8a7791-cpg-mssr
> > +              - renesas,r8a7793-cpg-mssr
> > +              - renesas,r8a7794-cpg-mssr
> > +
> > +    then:
> > +      properties:
> > +        clock:
> > +          minItems: 2
> > +        clock-names:
> > +          minItems: 2
> > +          items:
> > +            - const: extal
> > +            - const: usb_extal
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          items:
> > +            enum:
> > +              - renesas,r8a774a1-cpg-mssr
> > +              - renesas,r8a774b1-cpg-mssr
> > +              - renesas,r8a7795-cpg-mssr
> > +              - renesas,r8a7796-cpg-mssr
> > +              - renesas,r8a77961-cpg-mssr
> > +              - renesas,r8a77965-cpg-mssr
> > +              - renesas,r8a77970-cpg-mssr
> > +              - renesas,r8a77980-cpg-mssr
> > +
> > +    then:
> > +      properties:
> > +        clock:
> > +          minItems: 2
> > +        clock-names:
> > +          minItems: 2
> > +          items:
> > +            - const: extal
> > +            - const: extalr
> > +
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            items:
> > +              enum:
> > +                - renesas,r7s9210-cpg-mssr
> > +    then:
> > +      required:
> > +        - '#reset-cells'
>
> It may make sense to split this binding up into multiple bindings so
> that we don't have deeply nested if/else/then.

Note that the above is not a nested if, but the yaml-equivalent of a switch()
statement.

If this is to be split, how to split it?
Each if contains SoCs from multiple families, and each family of SoCs is
split across multiple ifs.

> > +examples:
> > +  - |
> > +    // CPG device node:
> > +
> > +    cpg: clock-controller@e6150000 {
> > +            compatible = "renesas,r8a7795-cpg-mssr";
> > +            reg = <0xe6150000 0x1000>;
> > +            clocks = <&extal_clk>, <&extalr_clk>;
> > +            clock-names = "extal", "extalr";
> > +            #clock-cells = <2>;
> > +            #power-domain-cells = <0>;
> > +            #reset-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    // CPG/MSSR Clock Domain member device node:
> > +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    scif2: serial@e6e88000 {
> > +            compatible = "renesas,scif-r8a7795", "renesas,rcar-gen3-scif",
> > +                         "renesas,scif";
> > +            reg = <0xe6e88000 64>;
> > +            interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> > +            clocks = <&cpg CPG_MOD 310>, <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> > +                     <&scif_clk>;
> > +            clock-names = "fck";
> > +            dmas = <&dmac1 0x13>, <&dmac1 0x12>, <&dmac2 0x13>, <&dmac2 0x12>;
> > +            dma-names = "tx", "rx", "tx", "rx";
> > +            power-domains = <&cpg>;
> > +            resets = <&cpg 310>;
> > +    };
>
> I'm not sure we need this in the example.

OK, the second example can be removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
