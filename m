Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F721A51F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 10:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730205AbfIBIjP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 04:39:15 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39753 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbfIBIjP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 04:39:15 -0400
Received: by mail-oi1-f194.google.com with SMTP id w144so2900505oia.6;
        Mon, 02 Sep 2019 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ZpqrbK70Ld5mnKoMYiYvVEM2pi/doZB4O7a3wLCqTI=;
        b=QctrxUtq1+doQV/xAxEv4gggNNifMs4r25MsynktzW5aP5WnEzSREJ4FqRiudPq2TX
         B+DnQtQG5AlnUvRd3Gla1Kxb9K69WNIGbpXAUp9PFKek95Gj+x8Q87IYKfgBWc7d1mTV
         NBV6RJPPh9ggNxSmeTWFu37Ua4306n+8Yuvf9LLtmhVqGNtWQDkrHxkK/m7UYCd4tqCK
         e9exvOe22ALOCJcK3N1+4Vd1AvIXOeaI9cu2lpgDeWsmyesmAKg4tAPDIDT1rbMM6W8z
         +zz/5QJtOAP2SGTjQDpzVi3Hmn/AjjqoDfnOOOfyswvmjD9YYQGXhJaZIW32SNm4gIX+
         lQSg==
X-Gm-Message-State: APjAAAWSv2TBn8Koi9bwX5PXLNJxYP/28uPr9wDy+jzSKuLICM+skxBz
        Fh4U6j0aGZk88/prup63wONvBk5+enDd6DYcQGw=
X-Google-Smtp-Source: APXvYqw++tYM+EEWK5AjkQiIj1oaLed6Hs8B/zga9tEOOV5NUPQZIfJRhnU/MTMKvV5E2rk1cdLAKGCNmS1sgYwW9UQ=
X-Received: by 2002:aca:fc53:: with SMTP id a80mr1306498oii.131.1567413554435;
 Mon, 02 Sep 2019 01:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB1770BF952221F50BBCDF3765C0BD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190902083224.mn5agbxf5akhhoqg@verge.net.au>
In-Reply-To: <20190902083224.mn5agbxf5akhhoqg@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Sep 2019 10:39:03 +0200
Message-ID: <CAMuHMdVuj1w_bQVPySpspk4OJPN1cNSF-JW6XKExTEdZbtALgw@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
To:     Simon Horman <horms@verge.net.au>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 2, 2019 at 10:32 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Aug 30, 2019 at 10:37:54AM +0000, Fabrizio Castro wrote:
> > This patch has been reviewed by Geert, Simon, and Rob, so I think it's ok to apply.
> > Is anybody willing to take this patch?
>
> <2c> I think Geert can take this </2c>

If the timer people won't take it for v5.4, I can queue it in renesas-devel
for v5.5, in my branch for DT binding updates for subsystems that are
less DT-centric.

> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Sent: 11 June 2019 14:07
> > > Subject: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
> > >
> > > Document RZ/G2M (R8A774A1) SoC in the Renesas TMU bindings.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > index 13ad074..9dff7e5 100644
> > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > @@ -10,6 +10,7 @@ Required Properties:
> > >
> > >    - compatible: must contain one or more of the following:
> > >      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> > > +    - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
> > >      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
> > >      - "renesas,tmu-r8a7778" for the r8a7778 TMU
> > >      - "renesas,tmu-r8a7779" for the r8a7779 TMU

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
