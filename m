Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356E63A64E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 13:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233264AbhFNLa0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 07:30:26 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:46956 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbhFNL2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 07:28:04 -0400
Received: by mail-vs1-f46.google.com with SMTP id z15so7572398vsn.13;
        Mon, 14 Jun 2021 04:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTSBYN8rB77+u8stbTCtFfsGhQZ+9hrV0blh5vsPcM8=;
        b=ezfqobBGAdJB13yM1iqFmzhfLj1eiHKSsXk0wJZW/qdKnIMRYpSlt4EeoD4p1Te+/0
         RwZ/5WsLSl+QyVz05GUgTThT1ig20uIEv5zY69qZuxIkT+ye5MOaf7yVIN3j8kkZu36D
         jnn7sekopbE3YfaxWuDEOusSIR8MI8Ivj1WKtG/qsKcyevszwE0YCKohwuhbR1ereG/5
         57R0W/iAKQ8mwN7k397DwmYYEy3BTwTxYlbu4azpS9cIVob00rF6fQwrLaSD438cWoGt
         hfgEoYiELc3B9P42HAJsKbqUVHsjFn2UtbUYQJYjJtPwnHqaRAogkko1KZEWA/9jNO7L
         zJpA==
X-Gm-Message-State: AOAM533V9HCMOE/ND1mDclQ+ewLP6073GnfmlSabN4xcgUlSYe+Tz1wn
        xbNqPZb3HjVLdCkQFKlCxMtOII1OMk8ner9A800=
X-Google-Smtp-Source: ABdhPJwSoUdv+XJJLXAM5AiN9UYILuhDhY0u4gOSBJcrU4V9hU8do+W5mFGvy3VYfZ0rv4e8VJ/o9fS1xYBPYDhZo38=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr16631993vsr.40.1623669960839;
 Mon, 14 Jun 2021 04:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623315732.git.geert+renesas@glider.be> <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
 <YMVbupt4pqdl2FOc@pendragon.ideasonboard.com>
In-Reply-To: <YMVbupt4pqdl2FOc@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 13:25:49 +0200
Message-ID: <CAMuHMdXvB7dfcoCXOuE_oTCxaBqQyA8RVGm7SVy8iTmccvG95A@mail.gmail.com>
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sun, Jun 13, 2021 at 3:13 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 10, 2021 at 11:37:14AM +0200, Geert Uytterhoeven wrote:
> > Document the compatible values for the R-Car H3e-2G (R8A779M1) and
> > M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
> > ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.
> >
> > All R-Car Gen3e on-SoC devices are identical to the devices on the
> > corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> > for the latter.  The root compatible properties do gain an additional
> > value, to sort out integration issues if they ever arise.
> >
> > Document the use of these SoCs on the Salvator-XS and ULCB (with and
> > without Kingfisher) development boards.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> I however wonder if we haven't messed up the board compatible strings
> somehow (unrelated to this patch). Aren't compatible strings supposed to
> be ordered from most specific to most generic, with a more specific
> compatible string being a strict subset of a more generic string ?
> Looking at, for example,
>
>         compatible = "renesas,salvator-xs", "renesas,r8a779m1", "renesas,r8a7795";
>
> the rule is upheld by renesas,r8a779m1 being a subset of the more
> generic renesas,r8a7795, but that's not the case for
> renesas,salvator-xs.

That's a very interesting comment.  Originally, we had lists like:

    compatible = "renesas,koelsch", "renesas,r8a7791";

with the Koelsch board indeed being a specialization of an R-Car
M2-W-based system. Later, we reused that system for the Salvator-X
board with an R-Car H3 SiP:

    compatible = "renesas,salvator-x", "renesas,r8a7795";

That scheme became "broken" with the introduction of the R-Car M3-W
SiP, which was also mounted on a Salvator-X board, leading to:

    compatible = "renesas,salvator-x", "renesas,r8a7796";

Note that we did have a similar case for R-Car M2-W and R-Car M2-N on
the Koelsch resp. Gose boards: from the schematics (I haven't seen
a Gose), it looks identical to Koelsch, with parts not supported by
R-Car M2-N (like the second SDRAM bank) marked "Do not stuff".
But in this case the boards were assigned different names, thus
leading to different compatible values.

With Salvator-X(S), it was easier to support multiple SoCs, as they
are mounted on SiPs, with differences like the different number of
memory channels hidden in the SiP, and handled at a different level
(these days memory layout information flows from ATF to U-Boot to
the DTB passed to the kernel).

Would you feel more comfortable if we had introduced more
board-specific compatible values, like "renesas,r8a7796-salvator-x",
and had used

    compatible = "renesas,r8a7795-salvator-x", "renesas,salvator-x",
"renesas,r8a7795";

or

    compatible = "renesas,r8a7795-salvator-x", "renesas,r8a7795";

?

If the need ever arises, Linux can still identify the exact combination
by checking for both the board- and the SoC-specific values.
So far we didn't have that need for Salvator-X(S) yet (we do have
board-specific checks in
arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c).

> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -238,17 +238,29 @@ properties:
> >            - const: renesas,r8a77961
> >
> >        - description: Kingfisher (SBEV-RCAR-KF-M03)
> > -        items:
> > -          - const: shimafuji,kingfisher
> > -          - enum:
> > -              - renesas,h3ulcb
> > -              - renesas,m3ulcb
> > -              - renesas,m3nulcb
> > -          - enum:
> > -              - renesas,r8a7795
> > -              - renesas,r8a7796
> > -              - renesas,r8a77961
> > -              - renesas,r8a77965
> > +        oneOf:
> > +          - items:
> > +              - const: shimafuji,kingfisher
> > +              - enum:
> > +                  - renesas,h3ulcb
> > +                  - renesas,m3ulcb
> > +                  - renesas,m3nulcb
> > +              - enum:
> > +                  - renesas,r8a7795
> > +                  - renesas,r8a7796
> > +                  - renesas,r8a77961
> > +                  - renesas,r8a77965
> > +          - items:
> > +              - const: shimafuji,kingfisher
> > +              - enum:
> > +                  - renesas,h3ulcb
> > +                  - renesas,m3ulcb
> > +              - enum:
> > +                  - renesas,r8a779m1
> > +                  - renesas,r8a779m3
> > +              - enum:
> > +                  - renesas,r8a7795
> > +                  - renesas,r8a77961
> >
> >        - description: R-Car M3-N (R8A77965)
> >          items:
> > @@ -296,6 +308,22 @@ properties:
> >            - const: renesas,falcon-cpu
> >            - const: renesas,r8a779a0
> >
> > +      - description: R-Car H3e-2G (R8A779M1)
> > +        items:
> > +          - enum:
> > +              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
> > +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> > +          - const: renesas,r8a779m1
> > +          - const: renesas,r8a7795
> > +
> > +      - description: R-Car M3e-2G (R8A779M3)
> > +        items:
> > +          - enum:
> > +              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
> > +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> > +          - const: renesas,r8a779m3
> > +          - const: renesas,r8a77961
> > +
> >        - description: RZ/N1D (R9A06G032)
> >          items:
> >            - enum:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
