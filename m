Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115DE38C7FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbhEUN2I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:28:08 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:47010 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbhEUN1l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:27:41 -0400
Received: by mail-vs1-f53.google.com with SMTP id q6so6141926vsp.13;
        Fri, 21 May 2021 06:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KTNce2cszMXlNJlPN56sLwNhveQoSMqLG5LwksSMoTU=;
        b=ENnUIbslz8qKVkYVuEROcAj2bxFR7thL4Y35g4IL3uLlclR8mhVUIkGp7DTvp9CjQA
         GyyoSC/83XQweG/VK9/6vnDRlzz2wLANnKxrr/wKNyYJ48lx3VB75iKhR1Fv2nG5EiFA
         rK1p0rI9n5YVd0kvbwfZEXMmYTwUt8mOO5YfeODVWtcVAgGG9K/lJkwmat4H9XE+QRK4
         X9qhfNKjg/qvh3bhFwewJfpG4UeYP/ohairb4CVriy2CeOx/8U7jcJy11jV4Hds/aSwe
         2g3gxfPs2Rybdhj77K6TTEgtdgRo9O/kROTZSSkNK8wtuTGVryhOFG7wUCVd0/F2kc0Y
         tWew==
X-Gm-Message-State: AOAM5307lhDQ8ooMqiGQlPuaD/w7VUGy8ObsEuhDuFZQKoHERMr5yhhy
        H1UzQ0nyuZWcSYtHHeSu1m72vsTXahm5GGMHkXM=
X-Google-Smtp-Source: ABdhPJyJehJzeUaz+NrL6SG9j+k4bwd6SEysdJmgVMw8ra1pk7SUSekFSoa2JH7G8P7nX0bzISgmx2uTUoueta7fh0g=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr10020833vsd.42.1621603577877;
 Fri, 21 May 2021 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:26:05 +0200
Message-ID: <CAMuHMdXh7GBjPOXDNb8iB1Pr9g7o_Z35wCbfeFgqFY4=jC1a_A@mail.gmail.com>
Subject: Re: [PATCH 09/16] dt-bindings: serial: renesas,scif: Document
 r9a07g044 bindings
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document R9A07G044 SoC variants, common compatiable string
> "renesas,scif-r9a07g044" is added for RZ/G2L and RZ/G2LC SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -64,6 +64,10 @@ properties:
>            - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
>            - const: renesas,scif           # generic SCIF compatible UART
>
> +      - items:
> +          - enum:
> +              - renesas,scif-r9a07g044      # RZ/G2{L,LC}
> +
>    reg:
>      maxItems: 1

Looks good to me.

Do interrupts and interrupt-names need to be updated?
The SCIF node added in "[PATCH 15/16] arm64: dts: renesas: Add initial
DTSI for RZ/G2{L,LC} SoC's" has 5 interrupts, while the bindings
support only 1, 4, or 6 interrupts.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
