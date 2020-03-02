Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC1E1764DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2020 21:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCBU0M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Mar 2020 15:26:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38617 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCBU0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 15:26:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id i14so640950otp.5;
        Mon, 02 Mar 2020 12:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5XBtgrtLiy94riHECcrFgVdKA2SyAZZ5XYgSL/pdgvM=;
        b=sRj4ADFhuC1i07T60y6nPKHB9fz2lJI/Lmv2r14xM0/Q16lcAZkYgfdXW/O9G4HEHW
         DhzpZVGRTI6pw5Wd1h4N6iQS11Owkhl7+1FtWRVy7RgG2e0dcj5czv+DIO2aXV7ux7ze
         6vn8hrf4+jfbrg9MEJ0pvu5uZScgtr7I6e2cURkpLHAh8G93bW06yguDSxJZkqBArmqZ
         L+7w0uvXLZFt1mVHdHKXDs+YW8jr/GBLFPWcoqJra61BTw4d3NEIFp6HaN33ZRk3aeBm
         Xeu81y/JX1PEZDhhC/1+3CuXCwIdFyUCEVw5zGEdRqVlageXWfPOqLTHNRlXYXizpRlg
         +zbg==
X-Gm-Message-State: ANhLgQ3/UrnjBZgKCzgmUfAhPsaw39VXZjf930M9mxBUSPK9NxMX6Sok
        +itpXNlg2kqoZnteKzLOMw==
X-Google-Smtp-Source: ADFU+vsXDzZVDlw6FcVhTkZxRni0C3yrmMHNPiLxu+STNcPBcOGjF4Xm7pEmlBDqttBkz1l3czXchg==
X-Received: by 2002:a05:6830:108d:: with SMTP id y13mr723232oto.241.1583180770877;
        Mon, 02 Mar 2020 12:26:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l8sm6928111otn.31.2020.03.02.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 12:26:10 -0800 (PST)
Received: (nullmailer pid 4438 invoked by uid 1000);
        Mon, 02 Mar 2020 20:26:09 -0000
Date:   Mon, 2 Mar 2020 14:26:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: renesas: cpg-mssr: Convert to
 json-schema
Message-ID: <20200302202609.GA24264@bogus>
References: <20200224152640.1318-1-geert+renesas@glider.be>
 <158265013473.177367.4512247165308399202@swboyd.mtv.corp.google.com>
 <CAMuHMdUDjWKYaQ_MN+AvYg8vimZKMcck3SdHUSg8tPCCAEieJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDjWKYaQ_MN+AvYg8vimZKMcck3SdHUSg8tPCCAEieJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 27, 2020 at 12:12:36PM +0100, Geert Uytterhoeven wrote:
> Hi Stephen,
> 
> Thanks for your comments!
> 
> On Tue, Feb 25, 2020 at 6:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2020-02-24 07:26:40)
> > > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > > new file mode 100644
> > > index 0000000000000000..dfbd1933f1bc56de
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > > @@ -0,0 +1,204 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Renesas Clock Pulse Generator / Module Standby and Software Reset
> > > +
> > > +maintainers:
> > > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > > +
> > > +description: |
> > > +  On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Generator)
> > > +  and MSSR (Module Standby and Software Reset) blocks are intimately connected,
> > > +  and share the same register block.
> > > +
> > > +  They provide the following functionalities:
> > > +    - The CPG block generates various core clocks,
> > > +    - The MSSR block provides two functions:
> > > +        1. Module Standby, providing a Clock Domain to control the clock supply
> > > +           to individual SoC devices,
> > > +        2. Reset Control, to perform a software reset of individual SoC devices.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,r7s9210-cpg-mssr  # RZ/A2
> > > +      - renesas,r8a7743-cpg-mssr  # RZ/G1M
> > > +      - renesas,r8a7744-cpg-mssr  # RZ/G1N
> > > +      - renesas,r8a7745-cpg-mssr  # RZ/G1E
> > > +      - renesas,r8a77470-cpg-mssr # RZ/G1C
> > > +      - renesas,r8a774a1-cpg-mssr # RZ/G2M
> > > +      - renesas,r8a774b1-cpg-mssr # RZ/G2N
> > > +      - renesas,r8a774c0-cpg-mssr # RZ/G2E
> > > +      - renesas,r8a7790-cpg-mssr  # R-Car H2
> > > +      - renesas,r8a7791-cpg-mssr  # R-Car M2-W
> > > +      - renesas,r8a7792-cpg-mssr  # R-Car V2H
> > > +      - renesas,r8a7793-cpg-mssr  # R-Car M2-N
> > > +      - renesas,r8a7794-cpg-mssr  # R-Car E2
> > > +      - renesas,r8a7795-cpg-mssr  # R-Car H3
> > > +      - renesas,r8a7796-cpg-mssr  # R-Car M3-W
> > > +      - renesas,r8a77961-cpg-mssr # R-Car M3-W+
> > > +      - renesas,r8a77965-cpg-mssr # R-Car M3-N
> > > +      - renesas,r8a77970-cpg-mssr # R-Car V3M
> > > +      - renesas,r8a77980-cpg-mssr # R-Car V3H
> > > +      - renesas,r8a77990-cpg-mssr # R-Car E3
> > > +      - renesas,r8a77995-cpg-mssr # R-Car D3
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    maxItems: 2
> >
> > Do we need this here and also below? Why can't it just be below with the
> > more specific constraints?
> 
> With the above removed:
> 
>     Documentation/devicetree/bindings/clock/renesas,cpg-mssr.example.dt.yaml:
> clock-controller@e6150000: 'clock-names', 'clocks' do not match any of
> the regexes: 'pinctrl-[0-9]+'
> 
> while the "if" below overriding minItems did trigger, as removing entries from
> clocks/clock-names in the example causes more errors.
> 
> So it seems all properties must be listed in the main, unconditional,
> properties section at the top.
> 
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          items:
> > > +            enum:
> > > +              - renesas,r7s9210-cpg-mssr
> > > +              - renesas,r8a774c0-cpg-mssr
> > > +              - renesas,r8a7792-cpg-mssr
> > > +              - renesas,r8a77990-cpg-mssr
> > > +              - renesas,r8a77995-cpg-mssr
> > > +
> > > +    then:
> > > +      properties:
> > > +        clock:
> > > +          maxItems: 1
> > > +        clock-names:
> > > +          maxItems: 1
> > > +          items:
> > > +            - const: extal
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,r8a7743-cpg-mssr
> > > +              - renesas,r8a7744-cpg-mssr
> > > +              - renesas,r8a7745-cpg-mssr
> > > +              - renesas,r8a77470-cpg-mssr
> > > +              - renesas,r8a7790-cpg-mssr
> > > +              - renesas,r8a7791-cpg-mssr
> > > +              - renesas,r8a7793-cpg-mssr
> > > +              - renesas,r8a7794-cpg-mssr
> > > +
> > > +    then:
> > > +      properties:
> > > +        clock:
> > > +          minItems: 2
> > > +        clock-names:
> > > +          minItems: 2
> > > +          items:
> > > +            - const: extal
> > > +            - const: usb_extal
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          items:
> > > +            enum:
> > > +              - renesas,r8a774a1-cpg-mssr
> > > +              - renesas,r8a774b1-cpg-mssr
> > > +              - renesas,r8a7795-cpg-mssr
> > > +              - renesas,r8a7796-cpg-mssr
> > > +              - renesas,r8a77961-cpg-mssr
> > > +              - renesas,r8a77965-cpg-mssr
> > > +              - renesas,r8a77970-cpg-mssr
> > > +              - renesas,r8a77980-cpg-mssr
> > > +
> > > +    then:
> > > +      properties:
> > > +        clock:
> > > +          minItems: 2
> > > +        clock-names:
> > > +          minItems: 2
> > > +          items:
> > > +            - const: extal
> > > +            - const: extalr
> > > +
> > > +  - if:
> > > +      not:
> > > +        properties:
> > > +          compatible:
> > > +            items:
> > > +              enum:
> > > +                - renesas,r7s9210-cpg-mssr
> > > +    then:
> > > +      required:
> > > +        - '#reset-cells'
> >
> > It may make sense to split this binding up into multiple bindings so
> > that we don't have deeply nested if/else/then.
> 
> Note that the above is not a nested if, but the yaml-equivalent of a switch()
> statement.
> 
> If this is to be split, how to split it?
> Each if contains SoCs from multiple families, and each family of SoCs is
> split across multiple ifs.

Looks like 3 files based on the first 3 if's above.

Personally, I'd be fine with just a single schema without all the if's. 
It wouldn't be as strict as to what's allowed for each compatible, but 
good enough IMO.

Rob
