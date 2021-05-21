Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4363E38C9DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 17:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbhEUPRh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 11:17:37 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:37532 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhEUPRg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:17:36 -0400
Received: by mail-vs1-f49.google.com with SMTP id s15so10543895vsi.4;
        Fri, 21 May 2021 08:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjH8fPaY2o8f5Ib7RZj1gMaw/NXIuKmhbkZfvqyPn5I=;
        b=dRW1OjE8TagNGSJDR2DxP6jYLjWeKzOyuq3D6bbbGn+k4KN5Y7z9klnx7t5PIxxpry
         DvcSE8/K+dDQvux8XxitZWGtBp6cMMBXf3gdBSwElSvuQnc/kc9Yp1dcpshJ6dy0xUZX
         uryDBXiDjlOjZbEbo7x9F/tiBvlxIPhfdIeu756Ue11tDXv/Pxj0mXSk8oZMWyxhUFrl
         Mc1J+0OEWACgFd+6bXBLOkhrGPevvS1PL2GgLI/zGCpSdbEC8NisCjQz4AQ4qV2ikuZT
         x2qoG46QNM6EWS/22oxKXDQD59IMj4ox//W8Wa5iz8QRmpxrM2KpoulyQ77rY9xihwrV
         qzVA==
X-Gm-Message-State: AOAM532mfk0T2fCR10PN+iadsQoehj4TdunBU6AhGlKdby2vKPBMpZUH
        BBwvfFteuJucDx2+BfR7AoSQjDK34JDj//5KvBM=
X-Google-Smtp-Source: ABdhPJx8Ajdh/v2OoW95fXlR3EdAJCqsWTRUG9iGhYqfk38ZBsPFymjTEjfn+Kf+9AyJ7sOkWVT6IygojHInYWXe4/Q=
X-Received: by 2002:a67:fb52:: with SMTP id e18mr11430842vsr.18.1621610171231;
 Fri, 21 May 2021 08:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210514192218.13022-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXh7GBjPOXDNb8iB1Pr9g7o_Z35wCbfeFgqFY4=jC1a_A@mail.gmail.com>
In-Reply-To: <CAMuHMdXh7GBjPOXDNb8iB1Pr9g7o_Z35wCbfeFgqFY4=jC1a_A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 17:15:59 +0200
Message-ID: <CAMuHMdXG_OfUSJpE1FBEF4uXurMmt7dw2sEc4UFyOD8=XGk0Cw@mail.gmail.com>
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

On Fri, May 21, 2021 at 3:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, May 14, 2021 at 9:23 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Document R9A07G044 SoC variants, common compatiable string
> > "renesas,scif-r9a07g044" is added for RZ/G2L and RZ/G2LC SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > @@ -64,6 +64,10 @@ properties:
> >            - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
> >            - const: renesas,scif           # generic SCIF compatible UART
> >
> > +      - items:
> > +          - enum:
> > +              - renesas,scif-r9a07g044      # RZ/G2{L,LC}
> > +
> >    reg:
> >      maxItems: 1
>
> Looks good to me.
>
> Do interrupts and interrupt-names need to be updated?
> The SCIF node added in "[PATCH 15/16] arm64: dts: renesas: Add initial
> DTSI for RZ/G2{L,LC} SoC's" has 5 interrupts, while the bindings
> support only 1, 4, or 6 interrupts.

According to the SoC interrupt mapping, "tei" and "dri" share an
interrupt, so 6 interrupts is correct, and this part of the binding
does not need an update.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
