Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A010727BD4B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Sep 2020 08:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbgI2GrZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Sep 2020 02:47:25 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38327 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbgI2GrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Sep 2020 02:47:25 -0400
Received: by mail-oi1-f195.google.com with SMTP id 26so4285253ois.5;
        Mon, 28 Sep 2020 23:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQxENvsyMWS22qKPMiworJ58ghi2NcksAJutpCi0NkU=;
        b=UGfgbv1mpey3fH02yNy5nxEq452WVa5C3hvejVbsEJJYY6OUGHvOOfaiokwhj5Lzsq
         KUYkODTBb7WlCC2Yp3mgx5quZYcLQ1VI/RVJcxjqBuWkWk+NGB6XKbP9BcBb/R5b4UAj
         4rlmQ64Sr6C6WyI/55nYqK030QIAUFQrtNG2AsNUXgyhJkoHl53v3Z7+tsDtjplGhBtq
         8MCZjexvh68RB1dELIePV04I7YZDavhi196MhyTB69N+WS7tdmruWv9NWaL2jUNU4EB0
         2LS3pzkJ6kuD78WsGzpYScQc9auwI813UjUc9LKgawJKtnd0blLMUSr37eGlfYqbVYnk
         /nlg==
X-Gm-Message-State: AOAM532zv6zqFrbhauef+vZA2fAzQ5jPBvbgkIJyuYdMRBIW6aUV0rx0
        mf881Lg4EmNASNoE/ZnzRQ06rmbdqZn2W4ByVZU=
X-Google-Smtp-Source: ABdhPJwCxCGIdhoc6Arzmd5fdzaebLgPJZk0Xi6OttQFUI4UCwkVKHL9xVA8kyId/LWk1n30Q5fKOSTVwC2ovpDk1dk=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr1622307oib.54.1601362044107;
 Mon, 28 Sep 2020 23:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824004816.GS6002@pendragon.ideasonboard.com> <CA+V-a8uq44hKOxbwBXZ_90q6e4JjCEPwOWp4BDY7BJJaP1Cg6g@mail.gmail.com>
 <20200927200418.GA3986@pendragon.ideasonboard.com> <CAMuHMdX0_VDVw41ZuGy0M+d6sgNMujSas4x+YqZMWwpF-TvOZg@mail.gmail.com>
 <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB5048ABBC3F74E1DF49374E7DAA350@OSBPR01MB5048.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Sep 2020 08:47:13 +0200
Message-ID: <CAMuHMdWgAD+ugVyPVGjOVx-0zranRqRTEinbPZ9_T24EOg0Vag@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Sep 28, 2020 at 9:52 AM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > On Sun, Sep 27, 2020 at 10:04 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > On Sun, Sep 27, 2020 at 02:01:50PM +0100, Lad, Prabhakar wrote:
> > > > On Mon, Aug 24, 2020 at 1:48 AM Laurent Pinchart wrote:
> > > > > On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> > > > > > The iwg21d comes with a 7" capacitive touch screen, therefore
> > > > > > add support for it.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > > > >
> > > > > Everything seems to match the schematics :-)
> > > > >
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >
> > > > > > ---
> > > > > > v1->v2
> > > > > > * This patch is part of series [1] (rest of the patches have be accepted
> > > > > >   by Geert [2]).
> > > > > > * Added regulator for lvds
> > > > > > * Added reset pin for touchpanel
> > > > > > * This patch is based on series [3]
> > > > > >
> > > > > > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > > >     ?series=330277
> > > > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> > > > > >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> > > > > > [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
> > > > > >     ?series=330957
> > > > > > ---
> > > > > >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
> > > > > >  1 file changed, 99 insertions(+)
> > > >
> > > > Would you be queueing this patch along with DRM driver patches for v5.10 ?
> > >
> > > No, I expect Geert to do so, DT patches go through his tree. I handle
> > > the drivers and DT bindings.
> >
> > Indeed.
> >
> > As the dependencies are now in linux-next, I'm queueing this in
> > renesas-devel for v5.11, after fixing all conflicts due to recent
> > additions, and sorting &lvds0 before &pfc.
> >
> This also needs changing vcc-supply to power-supply for lvds receiver due to recent binding changes, probably Ill do the above and post a v3.

Oh, I didn't know that.  So please send a v3, so I can replace the commit
in my renesas-arm-dt-for-v5.11 branch.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
