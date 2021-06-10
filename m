Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1DF43A2B5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFJMYR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:24:17 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:42761 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhFJMYR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:24:17 -0400
Received: by mail-ua1-f54.google.com with SMTP id w5so1194197uaq.9;
        Thu, 10 Jun 2021 05:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHImRfBQYLoz3d/i2ivFXTZfIrG8e8ycwCeg8K/SaiY=;
        b=t0g2XOIVo6nyrSlEBemjJI4Ix+9+B1pDNeQbBBRuEKOpES0yAawHiyE3KuTloHZ+R0
         tcgSiyraERWjHNrj5RiDwohXet9SUWDALt8ccqHnN/O1RlBk8F429yYupr0Yb/QsFOou
         +XiW/IwvICslSgD3fMznnD/I2tQM93miV44zWexmvCGWUzY02iDe7TNi5MsFhtlYPRXs
         od4oEoyRqPTo+1WUwo1z08mugIosvxEIDfAv4kdVFwEDtVZfgodSZg1Mm2s79yoWO2ra
         xUiUrp+JEi/NodfbTzKhjttlCjPME+bv/m2J1A9zPNN9tYa2CMi/6eWx48toXqddxo2s
         YKIQ==
X-Gm-Message-State: AOAM530Bgd0e7/PZxgU1+AqJEi3B/3127XjmgxrNFLrXImEiqRMDmtSE
        VSvCF4T9pSljgYR9FAjMkmw+Cx44muf3ma0gu4A=
X-Google-Smtp-Source: ABdhPJw8UipGhmaBBsSwyshnKJEMcNPGGI4TUltcMxoq/ilmmyOmBEd8pDYi8K6oMEVXDwhrjC22r0+D7Mf//KWyLuU=
X-Received: by 2002:ab0:2a4e:: with SMTP id p14mr3957154uar.2.1623327740301;
 Thu, 10 Jun 2021 05:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609163717.3083-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609163717.3083-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:22:09 +0200
Message-ID: <CAMuHMdVL-6dykmxb9PozWap3iTJEwuNQBgvvJwxHNGEu=r2WOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: renesas,rzg2l-sysc: Add DT
 binding documentation for SYSC controller
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 9, 2021 at 6:37 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add DT binding documentation for SYSC controller found on
> RZ/G2{L,LC,UL} SoC's.
>
> SYSC block contains the LSI_DEVID register which is used to retrieve
> SoC product information.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/renesas,rzg2l-sysc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Renesas RZ/G2L System Controller (SYSC)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The RZ/G2L System Controller (SYSC) performs system control of the LSI and
> +  supports following functions,
> +  - External terminal state capture function
> +  - 34-bit address space access function
> +  - Low power consumption control
> +  - WDT stop control
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: CA55/CM33 Sleep/Software Standby Mode request interrupt
> +      - description: CA55 Software Standby Mode release request interrupt
> +      - description: CM33 Software Standby Mode release request interrupt
> +      - description: CA55 ACE Asynchronous Bridge Master/Slave interface deny request interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: sys_lpm_int
> +      - const: sys_ca55stbydone_int
> +      - const: sys_cm33stbyr_int
> +      - const: sys_ca55_deny

The "sys_" prefixes feel superfluous to me.
If you don't mind, I can remove them while applying (also from example
and .dtsi).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
