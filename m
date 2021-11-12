Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC2844E571
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 12:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbhKLLRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 06:17:17 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:45855 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhKLLRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 06:17:16 -0500
Received: by mail-ua1-f45.google.com with SMTP id ay21so17977910uab.12;
        Fri, 12 Nov 2021 03:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcPHPCWihqx4U5kW/XcCfGRSox61flLxbhTI2bkYqCU=;
        b=kJjnfTryjzAFZUnICn3MC0/eClBL/8wzYOMq/9fKepMX6yBqa/mj4qxrW4M7j76hp8
         a7W4CsQKG/A/m3WUW/S6vC2oW9ISkwc/9u4OI1SdKb7YshNr5vaM2kDAS8xRMrw+c/W+
         28AwH95BoCm1XTZqM7LelO+5aauP+b17reAcCVWSPegCcRL+YJNC7HrZlUb7QPXnDIG4
         R6bSOgO0+rmytlAjgWyfZooUjMSQZRzPPwc56B0Q3TufL67/9/MHjPEaxEd1wrOgHJbO
         TB3SVYdMTzeagk6FZ+yNePFdvJLVUvtqvCWj7VZjLXKWPLD+lT7d0Eopo2mDqH0YU/Ep
         j8tw==
X-Gm-Message-State: AOAM5319BbWJmFEUA+N0Ek6fXkdSAilBXIWgdwmnUFVg2T/aIV1+mByj
        4aKr9mFLEhR26K67cGFk7l3GZpFejnjlBg==
X-Google-Smtp-Source: ABdhPJwleBQuy5OITcURtJ0IGyfkpxPBvLKadORYlr+0SwbFSiwFrrAC05I00vWsil1N5dt5npflVA==
X-Received: by 2002:a05:6102:dcb:: with SMTP id e11mr9120480vst.8.1636715664737;
        Fri, 12 Nov 2021 03:14:24 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id l28sm3772471vkn.45.2021.11.12.03.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 03:14:24 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id t13so17991062uad.9;
        Fri, 12 Nov 2021 03:14:23 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr9010955vsl.35.1636715663609;
 Fri, 12 Nov 2021 03:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com> <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 12:14:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
Message-ID: <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Aug 17, 2021 at 11:03 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2L SDHI controller bindings.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch, which is now commit bfadee4554c3782b
("dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings")
in v5.15.

> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -44,19 +44,20 @@ properties:
>            - const: renesas,sdhi-mmc-r8a77470 # RZ/G1C (SDHI/MMC IP)
>        - items:
>            - enum:
> -              - renesas,sdhi-r8a774a1 # RZ/G2M
> -              - renesas,sdhi-r8a774b1 # RZ/G2N
> -              - renesas,sdhi-r8a774c0 # RZ/G2E
> -              - renesas,sdhi-r8a774e1 # RZ/G2H
> -              - renesas,sdhi-r8a7795  # R-Car H3
> -              - renesas,sdhi-r8a7796  # R-Car M3-W
> -              - renesas,sdhi-r8a77961 # R-Car M3-W+
> -              - renesas,sdhi-r8a77965 # R-Car M3-N
> -              - renesas,sdhi-r8a77970 # R-Car V3M
> -              - renesas,sdhi-r8a77980 # R-Car V3H
> -              - renesas,sdhi-r8a77990 # R-Car E3
> -              - renesas,sdhi-r8a77995 # R-Car D3
> -              - renesas,sdhi-r8a779a0 # R-Car V3U
> +              - renesas,sdhi-r8a774a1  # RZ/G2M
> +              - renesas,sdhi-r8a774b1  # RZ/G2N
> +              - renesas,sdhi-r8a774c0  # RZ/G2E
> +              - renesas,sdhi-r8a774e1  # RZ/G2H
> +              - renesas,sdhi-r8a7795   # R-Car H3
> +              - renesas,sdhi-r8a7796   # R-Car M3-W
> +              - renesas,sdhi-r8a77961  # R-Car M3-W+
> +              - renesas,sdhi-r8a77965  # R-Car M3-N
> +              - renesas,sdhi-r8a77970  # R-Car V3M
> +              - renesas,sdhi-r8a77980  # R-Car V3H
> +              - renesas,sdhi-r8a77990  # R-Car E3
> +              - renesas,sdhi-r8a77995  # R-Car D3
> +              - renesas,sdhi-r8a779a0  # R-Car V3U
> +              - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2

I don't think SDHI on RZ/G2L is fully compatible with SDHI on R-Car Gen3...

>
>    reg:
> @@ -66,15 +67,9 @@ properties:
>      minItems: 1
>      maxItems: 3
>
> -  clocks:
> -    minItems: 1
> -    maxItems: 2
> +  clocks: true
>
> -  clock-names:
> -    minItems: 1
> -    items:
> -      - const: core
> -      - const: cd
> +  clock-names: true
>
>    dmas:
>      minItems: 4
> @@ -108,6 +103,42 @@ properties:
>  allOf:
>    - $ref: "mmc-controller.yaml"
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a07g044
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: IMCLK, SDHI channel main clock1.
> +            - description: IMCLK2, SDHI channel main clock2. When this clock is
> +                           turned off, external SD card detection cannot be
> +                           detected.
> +            - description: CLK_HS, SDHI channel High speed clock which operates
> +                           4 times that of SDHI channel main clock1.
> +            - description: ACLK, SDHI channel bus clock.
> +        clock-names:
> +          items:
> +            - const: imclk
> +            - const: imclk2
> +            - const: clk_hs
> +            - const: aclk
> +      required:
> +        - clock-names
> +        - resets
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +        clock-names:
> +          minItems: 1
> +          items:
> +            - const: core
> +            - const: cd
> +
>    - if:
>        properties:
>          compatible:

... as the clock handling is completely different.

Does this actually work with the current Linux SDHI driver? How are
the extra clocks handled?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
