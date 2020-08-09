Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87773240018
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 23:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHIVKd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 17:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIVKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 17:10:33 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CEAC061756;
        Sun,  9 Aug 2020 14:10:33 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id q16so4125262ybk.6;
        Sun, 09 Aug 2020 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FS8VaTKhvmE9nkcm+P7/rVO4xd8egtxbMts7IrjMZwI=;
        b=ZQRUBrsPLmUUs7t88nCb6LotejwEP/cgcI98kyJDCKbSVi2Kololr0uWmXdZ01Bg66
         wFLgXUSdinK/mEHiVQaUOwXdNcfU/8T7bzJvmhasepu3KGqp6GvvGGzjHj7a7jRZ4s3E
         RpkAkbyttWxwchd2mE7vxkKqF4KynL+rlghuwUqTDg0KsrXR6ZedXD54/l9dNhdapTBo
         fl+qvqSQT5wYii5j9Z/RpMZ4GbMG4uha9zP6a6FnfzjNH4+AEsM3tYj1zWEoRu1b+s9r
         vJrq9+l2M4NA/P8uXUpqolBNY3Ey2QbpIfjI/TFKvhI/1suRYlRAdP1LiiVf580gGp18
         YZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FS8VaTKhvmE9nkcm+P7/rVO4xd8egtxbMts7IrjMZwI=;
        b=NkhdaHH0KxhhK4NtJbyDS2tPFzBQ0Ffz4/nR4C+ClWbxZSNsxs4rW0hl2o1PsIT4ny
         cFTAWbgxLsrMb1PWQlFkz3AYRsvXXoE4r/G4/UH3gasAxDzGQLrBTED96QV+iagBkYiL
         a7M+Rirn6yvAr2E4hCNcxNAKCpZNZ409i88p0DoUEM2k5PPcWsS+ptpupxchws/J3dWM
         pyk98+r3ClAE+0C/vEWvaUJFO8I67g4i6AJ74g/vFWkVXW8T7Z5L84FAINYyMcwIwzgr
         ZQ9nvJMUf+1Pz/bDCIrU1dVwaWkg7Y3uQHqGSjUquAf8yKfI4iVsHPg8mfXUOPmZJGup
         6FAA==
X-Gm-Message-State: AOAM53256xoQHNQU+HKyOefMEliSvsNNqwg2h3PvS1W2J/NQQl71Z8ys
        2heSByIHRkkBmr26ca3OZVSKcQKS+1NZeRzdtLk=
X-Google-Smtp-Source: ABdhPJzkl+3oTLnEZzeGv+iWA/CW3+k2mTV9RRXQRR9+q7yU8D9yy1zyS867h86taMVevrq1/x0F54w50zETzAA9MFQ=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr32122222ybp.25.1597007432213;
 Sun, 09 Aug 2020 14:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200808210321.GO6186@pendragon.ideasonboard.com> <20200808210507.GP6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808210507.GP6186@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 9 Aug 2020 22:10:06 +0100
Message-ID: <CA+V-a8vGYtVUjXXGAMeZjMYq4BCt2ZVkkWeuqn8EffcRx46P0g@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas,lvds: Document r8a7742 bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the review.

On Sat, Aug 8, 2020 at 10:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Sun, Aug 09, 2020 at 12:03:27AM +0300, Laurent Pinchart wrote:
> > Hi Prabhakar,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 07, 2020 at 06:49:50PM +0100, Lad Prabhakar wrote:
> > > Document the RZ/G1H (R8A7742) LVDS bindings.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I actually spoke too soon, this binding has been concerted to YAML in
> drm-next. I can fix this when applying, no need to resubmit just for
> this.
>
Thank you for taking care of it.

Cheers,
Prabhakar

> > > ---
> > >  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > index c62ce2494ed9..40aa809f41cd 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > @@ -7,6 +7,7 @@ Gen2, R-Car Gen3 and RZ/G SoCs.
> > >  Required properties:
> > >
> > >  - compatible : Shall contain one of
> > > +  - "renesas,r8a7742-lvds" for R8A7742 (RZ/G1H) compatible LVDS encoders
> > >    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
> > >    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
> > >    - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders
>
> --
> Regards,
>
> Laurent Pinchart
