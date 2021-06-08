Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6496E39FA07
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jun 2021 17:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhFHPKv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Jun 2021 11:10:51 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:37629 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233538AbhFHPKu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jun 2021 11:10:50 -0400
Received: by mail-vs1-f43.google.com with SMTP id f21so9319456vsl.4;
        Tue, 08 Jun 2021 08:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDiaD0QpBOMcE0PMxzMhL3MWciIvjsNbxKoMrmcmJ1E=;
        b=DVIaPQiMT2f6/br4gxxxljYR9VsAw4ZfIxPyT2aAhnwyi3mPEWB7PhWXxg4kAH1kGK
         oo86pgy8/CzYjycUqzFS10DmvMcWZTrX4h8RBLoz+4vu9MzOvWunrPT+oF26UvsL9Tz2
         ugxtYYzsrHSqWyHh40yrf2CgZa9Kdz779HvYKVlylIRKM/eqxWgdrRX8PYRdhPQBjfMT
         FwzKgZswvbvYWp07vf4eecz2/8vI7VwAPl2awEAZqmO9V2nwYy0P8u+Cm236mH/gg9tb
         EyDC3zEMzLZMBjTAwVP9KA/DyOHi/JtXjQbahdtoWdDAdlaT5Jv4StvlUSKZ4J1BaeNo
         zguA==
X-Gm-Message-State: AOAM532ryh2M3DYsGVgV3a/f7Rf8iA/RnXdchhfaD2PZAt+z2aDstZ6l
        9F/w2gXxVjBDtVKnh5FXYlUWsSdj/z2gtZSAX1o=
X-Google-Smtp-Source: ABdhPJxAAAqyrSL7AqH/7wFzHGB8g+Yzzx+HqBzJkZEZm1+whye88TFNXKhkrTDet/pSlZsQRcuT0CIkeZGOE4ejWC4=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr658970vss.18.1623164936724;
 Tue, 08 Jun 2021 08:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210603221758.10305-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jun 2021 17:08:45 +0200
Message-ID: <CAMuHMdX9En43TvWt_e5JyUOd7rV2AhMJsFqGi9OUnPs00jc=AQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] dt-bindings: clock: renesas: Document RZ/G2L SoC
 CPG driver
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Jun 4, 2021 at 12:18 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document the device tree bindings of the Renesas RZ/G2L SoC clock
> driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Rob Herring <robh@kernel.org>

IIRC, Rob gave his R-b, not his A-b.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas RZ/G2L Clock Pulse Generator / Module Standby Mode
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  On Renesas RZ/G2L SoC, the CPG (Clock Pulse Generator) and Module
> +  Standby Mode share the same register block.
> +
> +  They provide the following functionalities:
> +    - The CPG block generates various core clocks,
> +    - The Module Standby Mode block provides two functions:
> +        1. Module Stop, providing a Clock Domain to control the clock supply
> +           to individual SoC devices,
> +        2. Reset Control, to perform a software reset of individual SoC devices.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a07g044-cpg  # RZ/G2{L,LC,UL}

Shouldn't RZ/G2UL use renesas,r9a07g043-cpg?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: extal
> +
> +  '#clock-cells':
> +    description: |
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
> +        and a core clock reference, as defined in
> +        <dt-bindings/clock/r9a07g044l-cpg.h>

r9a07g044-cpg.h

> +      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
> +        a module number, as defined in the <dt-bindings/clock/r9a07g044l-cpg.h>.

r9a07g044-cpg.h

> +    const: 2
> +
> +  '#power-domain-cells':
> +    description:
> +      SoC devices that are part of the CPG/Module Standby Mode Clock Domain and
> +      can be power-managed through Module Stop should refer to the CPG device

Module Standby

> +      node in their "power-domains" property, as documented by the generic PM
> +      Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
> +    const: 0
> +
> +  '#reset-cells':
> +    description:
> +      The single reset specifier cell must be the module number, as defined in
> +      the <dt-bindings/clock/r9a07g044l-cpg.h>.

r9a07g044-cpg.h

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
