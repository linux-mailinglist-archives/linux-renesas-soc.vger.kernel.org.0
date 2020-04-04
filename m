Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB3319E70A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Apr 2020 20:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgDDSZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Apr 2020 14:25:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgDDSZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Apr 2020 14:25:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59DB6312;
        Sat,  4 Apr 2020 20:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586024749;
        bh=PTvG/2khhxzZNEwEyrtZBzHyBxkv0ac/83/7I+tYhbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JR2f8h6iYWY6ClzcUb+sEA1UtC1yRBJOVANHPgrx0pb73Kn9CCUFBafCsUUIocB/p
         xeMUol5K41vluJiKD/kFX38+rRQIn3HJSAiY/z36cjwo0wUZsAm6cD1z9iTr7muSq3
         ght3/2QROPC0lx53IXQLIAbSJtIou58XVoz35s/g=
Date:   Sat, 4 Apr 2020 21:25:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary
 planes
Message-ID: <20200404182540.GC4875@pendragon.ideasonboard.com>
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Apr 02, 2020 at 01:12:51PM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 2, 2020 at 12:42 PM Laurent Pinchart wrote:
> > The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> > all the overlay planes, but leaves the primary plane without a zpos
> > property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> > of it the property is mandatory for all planes when exposed for some of
> > the planes. Nonetheless, weston v8.0 has been reported to have trouble
> > handling this situation.
> >
> > The DRM core offers support for immutable zpos properties. Creating an
> > immutable zpos property set to 0 for the primary planes seems to be a
> > good way forward, as it shouldn't introduce any regression, and can fix
> > the issue. Do so.
> >
> > Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > @@ -785,13 +785,15 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
> >
> >                 drm_plane_create_alpha_property(&plane->plane);
> >
> > -               if (type == DRM_PLANE_TYPE_PRIMARY)
> > -                       continue;
> > -
> > -               drm_object_attach_property(&plane->plane.base,
> > -                                          rcdu->props.colorkey,
> > -                                          RCAR_DU_COLORKEY_NONE);
> > -               drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> > +               if (type == DRM_PLANE_TYPE_PRIMARY) {
> > +                       drm_plane_create_zpos_immutable_property(&plane->plane,
> > +                                                                0);
> > +               } else {
> > +                       drm_object_attach_property(&plane->plane.base,
> > +                                                  rcdu->props.colorkey,
> > +                                                  RCAR_DU_COLORKEY_NONE);
> > +                       drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> > +               }
> >         }
> >
> >         return 0;
> 
> This is very similar to Esaki-san's patch[*] posted yesterday.

Thank you for pointing me to it, I had missed that patch.

> However, there's one big difference: your patch doesn't update
> rcar_du_vsp_init(). Isn't that needed?
> 
> [*] "[PATCH] drm: rcar-du: Set primary plane zpos immutably at initializing"
>     https://lore.kernel.org/linux-renesas-soc/20200401061100.7379-1-etom@igel.co.jp/

My bad. I've sent a v2 of Esaki-san's patch to CC the dri-devel mailing
list, and have applied it to my tree.

-- 
Regards,

Laurent Pinchart
