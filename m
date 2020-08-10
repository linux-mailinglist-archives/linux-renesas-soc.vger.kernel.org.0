Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E82240363
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 10:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgHJI1h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 04:27:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35489 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJI1g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 04:27:36 -0400
Received: by mail-ot1-f67.google.com with SMTP id 93so6670533otx.2;
        Mon, 10 Aug 2020 01:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//ZK6+SFvrkRSTwRR61xNq9XPyj33yV4vd1Xm7D7328=;
        b=KdYzGd8//xrDW54nDglMiU2RSU1/1oS/X8Mu9wxTdKCvzy5lWlw1HFWzposhWK3C/u
         XaA3wCkVaZIINUJLsx1LukGzDQQEajWaTHgb8ChmI6s3GL+JBSI3gLLEdVb7RIRASWF8
         WmVLq+VNkiTfpZa8aoX4L57LGNrHEHd0v7NBSP9lnoD3vgCSoUCgWOwkuPMajwxWc/R4
         /p7CFxhRIfIVwxnqRKmRrLfqSv0yYl/84t+b5Pae7zMkDjAip3YDyyZ/rjrh+oibdlG6
         GcuJ99k/10LY4c/mF/lMDBQ7ORFpUovjcx+Fg/GxtlwlLZmPgT16zPQUOWShGgg+NXru
         eSAw==
X-Gm-Message-State: AOAM5308vUMB/JFcZ2ymKWZQs0Bt0iWdEqSLA+ifS+jIlYUaexketyAs
        iE5LxWMih4B1wesri9EbEjZ+0GdrTsnzALRfGT5mdA==
X-Google-Smtp-Source: ABdhPJxwJlWiihOYnopaBk+U2KL7gmjD5NzWrgNpwHGalMg3unmme5HI285YIPGLyiOjEUmWDvwr253KoLAdDpnJgHA=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr11199918otl.145.1597048055761;
 Mon, 10 Aug 2020 01:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808211323.GR6186@pendragon.ideasonboard.com> <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
In-Reply-To: <CA+V-a8v0nXwe0iN2ymqE5YgcgOymWYv-Xf6N+rw_nJnUgx4yMQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 10:27:24 +0200
Message-ID: <CAMuHMdXH_ttYNrKpMxxkSTvhYcxkCD6v_ueXMGN6mXhkbpoyPA@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar, Laurent,

On Sun, Aug 9, 2020 at 11:30 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Sat, Aug 8, 2020 at 10:13 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> > > Add LVDS encoder node to r8a7742 SoC DT.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > ---
> > >  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> > > index a979a4b3de61..a7e66220d63a 100644
> > > --- a/arch/arm/boot/dts/r8a7742.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7742.dtsi
> > > @@ -1534,11 +1534,65 @@
> > >                               port@1 {
> > >                                       reg = <1>;
> > >                                       du_out_lvds0: endpoint {
> > > +                                             remote-endpoint = <&lvds0_in>;
> > >                                       };
> > >                               };
> > >                               port@2 {
> > >                                       reg = <2>;
> > >                                       du_out_lvds1: endpoint {
> > > +                                             remote-endpoint = <&lvds1_in>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             lvds0: lvds@feb90000 {
> > > +                     compatible = "renesas,r8a7742-lvds";
> > > +                     reg = <0 0xfeb90000 0 0x1c>;
> >
> > Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
> > below.

I can fix that while applying.

> Agreed, 0x1c comes from Gen-3 manuals.

All R-Car Gen3 and RZ/G2 .dtsi use 0x14 or 0x20.
All R-Car Gen2 and RZ/G1 .dtsi use 0x1c, but their manual suggests 0x14, too?

Doesn't matter much, as the hardware address decoder probably uses a
multiple of 2, and page mapping granularity is at least 4 KiB anyway.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
