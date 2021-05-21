Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C857238C7ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 15:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbhEUN1c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 09:27:32 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:43584 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbhEUN1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 09:27:10 -0400
Received: by mail-vs1-f43.google.com with SMTP id n1so8885179vsr.10;
        Fri, 21 May 2021 06:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6PugjoAaJt+l80R28svGGy/E47HBQC4C74ypfx68hc=;
        b=Vc2UnRAIcP6SYvBeDiK3g4lY7FIZTNgxxtW3XQGSmGt4Kv4PruyirVoC5fxtv+C4cb
         fwcouNbSvmTjiNasd24LjiulBcavV8lzNVtKy9BSLKMXciF7xXSDlZsIu4cUKx/ii6Gw
         qtsLTPTBbKkzss/pPx9RAgw6RRChNNgZ8aAS0FmUO12wXG3o9Akx05rEXeY6/lznpZbR
         u9S0okOCVQWeU/NRlbd7wAVxtk5XQzK7j0/xpTfXV4xDvvHVL+uUcQ04fz3+hbBdgXVU
         XWCNevrM+2DEU21tceMrflAQDC3rmsHAP+TuM9hQUxgSgxz/Bh1uhPoA0zQGM67uD0R/
         ZMUw==
X-Gm-Message-State: AOAM532ksfyL8E/qqqQM6GnqPVX3sQJKchQSAgHmG45/GKIxCQ1L6llr
        a+AOgBKn1hEz/qEUBfBd+heNlkiy5DIDfJj6CaY=
X-Google-Smtp-Source: ABdhPJxEH3kZKLf8SMB6v9o7mwBYSIk9ws1qQLFEyBIXhU52GxAxOiTv0cchQy/EJ/jvaJlpuo0OcIdXm94XTK/+Kpg=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr10648951vsr.18.1621603546669;
 Fri, 21 May 2021 06:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 15:25:34 +0200
Message-ID: <CAMuHMdXhNz7jGdKYvCVWt-X0EWaFUk67f+4G9+aVGGL3W73-eA@mail.gmail.com>
Subject: Re: [PATCH 06/16] dt-bindings: arm: renesas,prr: Add new compatible
 string for RZ/G{L,LC,UL}
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
> RZ/G2{L,LC,UL} SoC's have LSI_DEVID register to retrieve SoC product and
> revision information.
>
> RZ/G{L,LC,UL} SoC's have 28-bit product-id compared to other R-Car and
> RZ/G2{E,H,M,N} SoC's hence a new compatible string "renesas,devid" is
> added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas,prr.yaml
> @@ -12,14 +12,16 @@ maintainers:
>
>  description: |
>    Most Renesas ARM SoCs have a Product Register or Boundary Scan ID
> -  Register that allows to retrieve SoC product and revision information.
> -  If present, a device node for this register should be added.
> +  Register or LSI Device ID Register that allows to retrieve SoC product
> +  and revision information. If present, a device node for this register
> +  should be added.

Note that this register does not seem to be documented, so I have to
trust you on this.

However, from looking at the LSI DEVID register address, this does not
seem to be a lone register (like the Product Register on other SoCs),
but to be part of the System Controller (SYSC).  Hence I think there
should be separate bindings for the whole SYSC block instead.
You can still read the LSI DEVID register from renesas_soc_init(),
using the SYSC node.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
