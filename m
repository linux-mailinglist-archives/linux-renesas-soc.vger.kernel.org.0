Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B342238C7D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbhEUNZa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:25:30 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:46024 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbhEUNYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:24:54 -0400
Received: by mail-vs1-f50.google.com with SMTP id f15so9033319vsq.12;
        Fri, 21 May 2021 06:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=grIWK1QsxhsT24m56y7dhwhwHdiiBHd2e5BfJpcsSPI=;
        b=k45erVBBT7qTZs/LcbqG01Lvxi02BfDHzFONquS6MDhwGdkkdOqkUf/phfb/fS1uEv
         g76/swaATDdmhKWJ/tALs6Can72HmIjIj22Dr4ZATEq0Qr1pPdQYj4vKqAgZYUdW6ySf
         02eWaPLuYj0BWTMwjKeNz3vbt6TsZMx7ErIkNDtvEkJfR9oFN0S/W0rmAlg+RRP1i7m9
         eXHIAdS1LSIT2RPbHui82RD0pRAQxweWcAsyO/4THwKWr+OOifev7ZS2NjqxSqtNou8q
         gkW+FMbUNwej/KOBPL8G6cESUqGwIB08beU6kdLKDe/rAdu+nhIRKBikmQlvbdlr8D9o
         4DeA==
X-Gm-Message-State: AOAM532tHa9111Wm9hPcTYtXJbcVGt/tBvcHOcsdOZzEOQcv5wFxj5sy
        bcLhGXHBfVVVYNwcR8ecCTb1sL37DHG3d7K3dQY=
X-Google-Smtp-Source: ABdhPJxBz9P3itL9q4Dm0t/3ZTUmjAZ2WzGgZ7+CLj/+M1Zl6paCj+9B3gNd/O1PwMglY3/y9Eh/jrBhhgY/hOQMJ1I=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr10421630vsq.40.1621603409698;
 Fri, 21 May 2021 06:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:23:17 +0200
Message-ID: <CAMuHMdXdATYWRGL9PMkR_Fj-m-E5GUuPbHq0hZ_Mh=ceedF=RA@mail.gmail.com>
Subject: Re: [PATCH 02/16] dt-bindings: arm: renesas: Document Renesas
 RZ/G2{L,LC} SoC variants
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

Hii Prabhakar,

On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/G2{L,LC}
> SoC variants.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -308,6 +308,15 @@ properties:
>                - renesas,r9a07g043u11 # Single Cortex-A55 RZ/G2UL
>            - const: renesas,r9a07g043
>
> +      - description: RZ/G2{L,LC} (R9A07G044)
> +        items:
> +          - enum:
> +              - renesas,r9a07g044c1 # Single Cortex-A55 RZ/G2LC
> +              - renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
> +              - renesas,r9a07g044l1 # Single Cortex-A55 RZ/G2L
> +              - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L

Given the LSI DEVID is the same for all four, and presumably they're
thus the same die with different packaging, do we need these four
compatible values?

> +          - const: renesas,r9a07g044
> +
>  additionalProperties: true

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
