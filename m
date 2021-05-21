Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933AC38C7C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhEUNZB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:25:01 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:43940 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbhEUNYe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:24:34 -0400
Received: by mail-ua1-f53.google.com with SMTP id f1so6639566uaj.10;
        Fri, 21 May 2021 06:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADq2Zx/7nfEnjWKiWzAvzDTBOKD2nd8BVp+9Als5Ufs=;
        b=WBJHd8zxY7z3+0ArscwMVYbkK8dVEFWyLKuY6/DwacAhmSrtbEABDFBDnHkw52ZwHO
         74/ZhhJi6GWQI8kQa/2C4O+t/g9Hcg/3JL/AvK4XKC6nSM8LS1SWjCdNA5lSXIUIIw0x
         uMouAYrWp3BjYW0o67+3Wc7sTnrrapBq663+TM0vlPfgo/pUDH1Ao7YiMLZ45U2AYl+w
         56/4puOKe5mNyQZVOtjKMkt8u1bu4dGeW7PNWuCwAq2V7CbMtCSjgHKI8SN7KMXk+prM
         9SoBFp9Frj1aBoHjMFHSgunbJwXLaK/hTBdOWJC2ogkod4h0pZOzyDQvT/Ns1OXbGlbF
         Ro+Q==
X-Gm-Message-State: AOAM533dw1lwSya/M8eOzvlbwZ1bOFUaWEy7VVHtMv7Xjt5/7bhFlOpZ
        cwPAPiU0aS9urPByTIp9AUYR4ddaOrDXhdkj6I8=
X-Google-Smtp-Source: ABdhPJxS2muEq7IWZB2b6v5k3aSCWvcaT6ZzHMy3fI7WKXk7eOTxKsfaGq/y9VR8gzzkbPfYWbJUfXafu1vtP5J294w=
X-Received: by 2002:a9f:24b4:: with SMTP id 49mr878737uar.100.1621603390988;
 Fri, 21 May 2021 06:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:22:59 +0200
Message-ID: <CAMuHMdU40pLb3LvEghkT0pryLtHdXj+U1R7Y7L6-_6euVohyUw@mail.gmail.com>
Subject: Re: [PATCH 01/16] dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
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
> Add device tree bindings documentation for Renesas RZ/G2UL SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -302,6 +302,12 @@ properties:
>                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
>            - const: renesas,r9a06g032
>
> +      - description: RZ/G2UL (R9A07G043)
> +        items:
> +          - enum:
> +              - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL

Is there any specific reason you're including the final "1", unlike the
RZ/G2{L,LC} binding?
As RZ/G2UL is always single-core, perhaps this compatible value can be
dropped?

> +          - const: renesas,r9a07g043
> +
>  additionalProperties: true

For now, there are no users of this binding?
I assume you're posting it already, as RZ/G2UL is pin-compatible with RZ/G2LC,
and thus can be used interchangeably on the G2L SOM?
However, the DTS board part in this series is for RZ/G2L, not RZ/GLC?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14, after the above have been
resolved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
