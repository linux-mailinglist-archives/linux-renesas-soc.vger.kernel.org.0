Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFC424391E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Aug 2020 13:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHMLJ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Aug 2020 07:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMLJ1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 07:09:27 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA559C061757;
        Thu, 13 Aug 2020 04:09:26 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id m200so3077433ybf.10;
        Thu, 13 Aug 2020 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+FdrfrzUYGESkY5nR/Iw5dDnYK/s8TkEFw8YlZ8IoPA=;
        b=hhFDjW9tbqs1Ztzrt/0JJWGsCwXM8Khk4AIkUF+5JlNcxp4f0JlCocua2RnfhPbG8x
         hoCLrrI2CzIo9DVV/uk1BD+2BFMmyKjhT4j+udkBY+B3lpOHX38IEwXpa4PapwCGN+72
         SPpBRoX3A3V+ANN0jV1BzwxpMWCTnUpbusGIw0uAXBVVgahS5r8EG8rwLxVdIjcR9L0Y
         MR6UhaEwfR8ncUixSfXQpHx/7HrZccRMfNeDJYbCSHgRLdwOl6j9VRPTC/SuUQF8/wci
         TvjBP4NM55Ylx9aCH3BkmVtljB+/NbfyjXHkPHy318NyyQKn6XIMMirqtsaYE8yr40A5
         demA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+FdrfrzUYGESkY5nR/Iw5dDnYK/s8TkEFw8YlZ8IoPA=;
        b=GuUf8WGefUDWOwnuYVCUiLyCYzU2MEzA448kUalB7DCf0KDYk+TbFSjMOtOotjGPLC
         FhC8G9HzjiBeF+MBM3RyrwQ0mib5G5YmceP/icT9ETciGeKsB9wRX5DmR0dDEz0ETCbG
         tiEbD2J1Qdy2p6Gc1iqN55esnB+B/VQE9ZBmz0rfiFbTbvnsRovXFe2BmzZuWkuiCMnE
         R7WE9Zfu0f+yKIfJko0QGpIO09/bnTQ/YKOfrzpb3mKc/w6+hFUZV2gimsWNCGN7TPPo
         3r7aAEVwhTtIckBcaBOHOC4LBS53gWTP0kyA50T/7loudjzT3l5m02Z7e2IfBvy+dLVH
         cFTw==
X-Gm-Message-State: AOAM533HEWF8sVGX4/r6pys8hHmnzOIc3J9eV8mWmeNXlg4AGihXI8Oi
        mq24RGQnuG8loKI12SUD2ldQV1SAY+nSHqr1LcY=
X-Google-Smtp-Source: ABdhPJxKeZMHzQR81am/qi1CITAjrBfwbP5SaZgc5j843o+QifzGhzSPXvA2PGEL0nrcsoL7/vIHQXSUoMFWAiiCDBM=
X-Received: by 2002:a25:c743:: with SMTP id w64mr5573010ybe.127.1597316964657;
 Thu, 13 Aug 2020 04:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV4Tp=kz57pAJk0u5hVpbiEdVzTWDvK+F1AZ5TjGmLbMQ@mail.gmail.com>
 <CA+V-a8svAuDx51vuTCH4w5g0oF9qf8sWAEjMDMm+0+9u-UQhQw@mail.gmail.com> <20200813105910.GB6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813105910.GB6057@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 13 Aug 2020 12:08:58 +0100
Message-ID: <CA+V-a8sRQ_R4UGkSjrZ7Rq5nUqTwPtbvuuT0t69mM8M8ZeTkRQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1 bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Aug 13, 2020 at 11:59 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Thu, Aug 13, 2020 at 11:38:03AM +0100, Lad, Prabhakar wrote:
> > On Thu, Aug 13, 2020 at 10:05 AM Geert Uytterhoeven wrote:
> > > On Wed, Aug 12, 2020 at 4:02 PM Lad Prabhakar wrote:
> > > > From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > >
> > > > Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.
> > > >
> > > > Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > index 51cd4d162770..67cded5ad827 100644
> > > > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > > > @@ -10,6 +10,7 @@ Required Properties:
> > > >      - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
> > > >      - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
> > > >      - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
> > > > +    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
> > > >      - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
> > > >      - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
> > > >      - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
> > > > @@ -75,6 +76,7 @@ corresponding to each DU output.
> > > >   R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
> > > >   R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
> > > >   R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
> > > > + R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
> > >
> > > As LVDS 0 is the fourth channel (DU3), should it be listed under port 3
> > > instead of port 2?
> > >
> > > I know we did it the same for R-Car M3-N and RZ/G2N.
> > > But my main worry is adding support for R-Car H3-N later.
>
> Why should we do so ? The port number here isn't tied to the DU channel
> number. It only identifies the output port. Many DUs can route DU
> channel outputs to different output ports.
>
The binding document (renesas,du.txt) does state that "The following
table lists for each supported model the port number corresponding to
each DU output.", hence the confusion.

Cheers,
Prabhakar

> > I do agree too, with the below diff I tested the LVDS output on RZ/G2N
> > Rev2 board and things work fine. But only thing it doesn't explain is
> > why does LVDS work on DU2 for G2[H/N] boards :D
> >
> > Geert, Laurent, Kieran If you agree with the below changes I shall
> > post a proper patch fixing it for RZ/G2[HN]
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > index d661724fc28a..0b087d287202 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> > @@ -2540,8 +2540,8 @@
> >                                                 remote-endpoint =
> > <&dw_hdmi0_in>;
> >                                         };
> >                                 };
> > -                               port@2 {
> > -                                       reg = <2>;
> > +                               port@3 {
> > +                                       reg = <3>;
> >                                         du_out_lvds0: endpoint {
> >                                                 remote-endpoint = <&lvds0_in>;
> >                                         };
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e67cf70f040..419d81c7763e 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -153,7 +153,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774b1_info = {
> >                 },
> >                 [RCAR_DU_OUTPUT_LVDS0] = {
> >                         .possible_crtcs = BIT(0),
> > -                       .port = 2,
> > +                       .port = 3,
> >                 },
> >         },
> >         .num_lvds = 1,
> >
> > > >   R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
> > > >   R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
> > > >   R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
> > >
> > > Apart from that:
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> --
> Regards,
>
> Laurent Pinchart
