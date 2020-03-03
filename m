Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69261770CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 09:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgCCIIv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 03:08:51 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43999 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbgCCIIv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 03:08:51 -0500
Received: by mail-ot1-f66.google.com with SMTP id j5so2097654otn.10;
        Tue, 03 Mar 2020 00:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tnsLoZ2+ZJ9fFHKXi3EF1/dm4uTQYUq+JzUajRZ2h+c=;
        b=r+x1IY6wSBVuqF8oqOY1lk9P1pjwo0pEyuKIUW4O+kOU1HDMU2J8ZECMFWiIiSaI8c
         rHMzRM3KZ0QrpwSPLbzg/Y3/2auhjr86kmrSIm7fP38UJjSH2P4RLZ5EgtRoGmG/9aRt
         gM2/6IbNubBpf492QNtEhImM2dCj1WqhrTmho+URPOnc4YPAEJjv8enD8Hpp4NSrNjVV
         MlRYX2qwNpqz3ILQZ87IDDqOtc++Y6iH9vbss9CBUL6oDdLf/a8BpF/AuAFnJC0m9Qjp
         4jxtFKK7V/G/Z8oQVXVG0IPqDLmyGJ6vPz/A4zH2b+iQtSygbUXoKkIqolYyqA/Ge/Ab
         I10Q==
X-Gm-Message-State: ANhLgQ2SJwFD+Ib/I9v9uwee4Kgndzpi4hbbZh+jYFh5HSLkmFTyaxZi
        aLpN0CYudGD4rRW6GESr4G0OVr3d7SrT1hMYZrM=
X-Google-Smtp-Source: ADFU+vshWGB7tPqasQr01SWBNXK56E3VM6/cuuVC0u24ieCvps6JZtv6VLhiWLuVyOUAdH9lC6gJYjnAPytMnwsJu9M=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr2475400ots.250.1583222929855;
 Tue, 03 Mar 2020 00:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20200224152640.1318-1-geert+renesas@glider.be>
 <158265013473.177367.4512247165308399202@swboyd.mtv.corp.google.com>
 <CAMuHMdUDjWKYaQ_MN+AvYg8vimZKMcck3SdHUSg8tPCCAEieJQ@mail.gmail.com> <20200302202609.GA24264@bogus>
In-Reply-To: <20200302202609.GA24264@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Mar 2020 09:08:38 +0100
Message-ID: <CAMuHMdWZ=_p2qfv+Q1XCXts88SUgR3ote=7PQ5sHRR7pM4U0Yw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, Mar 2, 2020 at 9:26 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Feb 27, 2020 at 12:12:36PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 25, 2020 at 6:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Geert Uytterhoeven (2020-02-24 07:26:40)
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > > > new file mode 100644
> > > > index 0000000000000000..dfbd1933f1bc56de
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > > > @@ -0,0 +1,204 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Renesas Clock Pulse Generator / Module Standby and Software Reset
> > > > +
> > > > +maintainers:
> > > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > > +
> > > > +description: |
> > > > +  On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
> > > > +  and MSSR (Module Standby and Software Reset) blocks are intimately connected,
> > > > +  and share the same register block.
> > > > +
> > > > +  They provide the following functionalities:
> > > > +    - The CPG block generates various core clocks,
> > > > +    - The MSSR block provides two functions:
> > > > +        1. Module Standby, providing a Clock Domain to control the clock supply
> > > > +           to individual SoC devices,
> > > > +        2. Reset Control, to perform a software reset of individual SoC devices.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - renesas,r7s9210-cpg-mssr  # RZ/A2
> > > > +      - renesas,r8a7743-cpg-mssr  # RZ/G1M
> > > > +      - renesas,r8a7744-cpg-mssr  # RZ/G1N
> > > > +      - renesas,r8a7745-cpg-mssr  # RZ/G1E
> > > > +      - renesas,r8a77470-cpg-mssr # RZ/G1C
> > > > +      - renesas,r8a774a1-cpg-mssr # RZ/G2M
> > > > +      - renesas,r8a774b1-cpg-mssr # RZ/G2N
> > > > +      - renesas,r8a774c0-cpg-mssr # RZ/G2E
> > > > +      - renesas,r8a7790-cpg-mssr  # R-Car H2
> > > > +      - renesas,r8a7791-cpg-mssr  # R-Car M2-W
> > > > +      - renesas,r8a7792-cpg-mssr  # R-Car V2H
> > > > +      - renesas,r8a7793-cpg-mssr  # R-Car M2-N
> > > > +      - renesas,r8a7794-cpg-mssr  # R-Car E2
> > > > +      - renesas,r8a7795-cpg-mssr  # R-Car H3
> > > > +      - renesas,r8a7796-cpg-mssr  # R-Car M3-W
> > > > +      - renesas,r8a77961-cpg-mssr # R-Car M3-W+
> > > > +      - renesas,r8a77965-cpg-mssr # R-Car M3-N
> > > > +      - renesas,r8a77970-cpg-mssr # R-Car V3M
> > > > +      - renesas,r8a77980-cpg-mssr # R-Car V3H
> > > > +      - renesas,r8a77990-cpg-mssr # R-Car E3
> > > > +      - renesas,r8a77995-cpg-mssr # R-Car D3
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > >
> > > Do we need this here and also below? Why can't it just be below with the
> > > more specific constraints?
> >
> > With the above removed:
> >
> >     Documentation/devicetree/bindings/clock/renesas,cpg-mssr.example.dt.yaml:
> > clock-controller@e6150000: 'clock-names', 'clocks' do not match any of
> > the regexes: 'pinctrl-[0-9]+'
> >
> > while the "if" below overriding minItems did trigger, as removing entries from
> > clocks/clock-names in the example causes more errors.
> >
> > So it seems all properties must be listed in the main, unconditional,
> > properties section at the top.
> >
> > > > +allOf:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          items:
> > > > +            enum:
> > > > +              - renesas,r7s9210-cpg-mssr
> > > > +              - renesas,r8a774c0-cpg-mssr
> > > > +              - renesas,r8a7792-cpg-mssr
> > > > +              - renesas,r8a77990-cpg-mssr
> > > > +              - renesas,r8a77995-cpg-mssr
> > > > +
> > > > +    then:
> > > > +      properties:
> > > > +        clock:
> > > > +          maxItems: 1
> > > > +        clock-names:
> > > > +          maxItems: 1
> > > > +          items:
> > > > +            - const: extal
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - renesas,r8a7743-cpg-mssr
> > > > +              - renesas,r8a7744-cpg-mssr
> > > > +              - renesas,r8a7745-cpg-mssr
> > > > +              - renesas,r8a77470-cpg-mssr
> > > > +              - renesas,r8a7790-cpg-mssr
> > > > +              - renesas,r8a7791-cpg-mssr
> > > > +              - renesas,r8a7793-cpg-mssr
> > > > +              - renesas,r8a7794-cpg-mssr
> > > > +
> > > > +    then:
> > > > +      properties:
> > > > +        clock:
> > > > +          minItems: 2
> > > > +        clock-names:
> > > > +          minItems: 2
> > > > +          items:
> > > > +            - const: extal
> > > > +            - const: usb_extal
> > > > +
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          items:
> > > > +            enum:
> > > > +              - renesas,r8a774a1-cpg-mssr
> > > > +              - renesas,r8a774b1-cpg-mssr
> > > > +              - renesas,r8a7795-cpg-mssr
> > > > +              - renesas,r8a7796-cpg-mssr
> > > > +              - renesas,r8a77961-cpg-mssr
> > > > +              - renesas,r8a77965-cpg-mssr
> > > > +              - renesas,r8a77970-cpg-mssr
> > > > +              - renesas,r8a77980-cpg-mssr
> > > > +
> > > > +    then:
> > > > +      properties:
> > > > +        clock:
> > > > +          minItems: 2
> > > > +        clock-names:
> > > > +          minItems: 2
> > > > +          items:
> > > > +            - const: extal
> > > > +            - const: extalr
> > > > +
> > > > +  - if:
> > > > +      not:
> > > > +        properties:
> > > > +          compatible:
> > > > +            items:
> > > > +              enum:
> > > > +                - renesas,r7s9210-cpg-mssr
> > > > +    then:
> > > > +      required:
> > > > +        - '#reset-cells'
> > >
> > > It may make sense to split this binding up into multiple bindings so
> > > that we don't have deeply nested if/else/then.
> >
> > Note that the above is not a nested if, but the yaml-equivalent of a switch()
> > statement.
> >
> > If this is to be split, how to split it?
> > Each if contains SoCs from multiple families, and each family of SoCs is
> > split across multiple ifs.
>
> Looks like 3 files based on the first 3 if's above.

Yeah, but how to name them: renesas,cpg-mssr-[123].yaml?

> Personally, I'd be fine with just a single schema without all the if's.
> It wouldn't be as strict as to what's allowed for each compatible, but
> good enough IMO.

OK, that seems sensible to me, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
