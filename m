Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8EE7EFBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 11:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbfHBJBp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 05:01:45 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36621 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728559AbfHBJBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 05:01:45 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so61488057wme.1;
        Fri, 02 Aug 2019 02:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvvlW+uIUrUdNjqlOT5P3qO2zeClOhr+R8v8gEKY+6Y=;
        b=kkA0gcpG4rSlUkbE8JufAX7iiXuOmG6jE0U2BFuP4lAb34/eZ1cVaNNaLnNuXF0DsC
         UVA1qqrpFrJquOGbiFfxL/Z9UKB6IwL/Iz1hFg9Nn5ygDKAGR6+LRlJyjJ3FVuAm3JwQ
         VWh/ejODNC8Q94oNKmcbaaxW8bBKbJ7F/o1Vo4LedeQX+QUiES8VpxdCUKYrmGb8pdS+
         cqiO1N8oyu/rbc+8AP3fC/E1sqmVMqtjfhJXRHP0N/vQs3h857cjBsGH0rAk2PKSBBmA
         Ln3px4Rs8PHnLoAkzhhUBv9Far/eJLN5sAFqzr64E8khnECIKhAGcdbj8Hl20uF3qrhn
         6/ig==
X-Gm-Message-State: APjAAAUfocUqzyfjcmTPTUVuRgbjLktQqWwc4lZMjiRBfRoaz7x/nHVk
        LHqDtn/cJHCd6LqfvnFryu2zLbOm36DMUbwuhVs=
X-Google-Smtp-Source: APXvYqzlYNYU0pjvulT5Kn0ylbMvd7827Mu+1m9924pu/nWD4wXojl+caY4NoCY9bFexyT8l7fkwqjioGghgcgQKFeU=
X-Received: by 2002:a1c:1f4e:: with SMTP id f75mr3363459wmf.137.1564736503038;
 Fri, 02 Aug 2019 02:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-6-git-send-email-fabrizio.castro@bp.renesas.com> <20190802080613.GF5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802080613.GF5008@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Aug 2019 11:01:30 +0200
Message-ID: <CAMuHMdWw5SyP=jfwTpA=+qheTh1ckhiP_etn1J4PrRVdL4R1Pg@mail.gmail.com>
Subject: Re: [PATCH/RFC 05/12] drm: rcar-du: lvds: Add data swap support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Aug 2, 2019 at 10:06 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Aug 02, 2019 at 08:34:02AM +0100, Fabrizio Castro wrote:
> > When in vertical stripe mode of operation, there is the option
> > of swapping even data and odd data on the two LVDS interfaces
> > used to drive the video output.
> > Add data swap support by exposing a new DT property named
> > "renesas,swap-data".
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c

> > @@ -439,12 +440,16 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
> >       rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
> >
> >       if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> > -             /*
> > -              * Configure vertical stripe based on the mode of operation of
> > -              * the connected device.
> > -              */
> > -             rcar_lvds_write(lvds, LVDSTRIPE,
> > -                             lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
> > +             u32 lvdstripe = 0;
> > +
> > +             if (lvds->dual_link)
> > +                     /*
> > +                      * Configure vertical stripe based on the mode of
> > +                      * operation of the connected device.
> > +                      */
> > +                     lvdstripe = LVDSTRIPE_ST_ON | (lvds->stripe_swap_data ?
> > +                                                    LVDSTRIPE_ST_SWAP : 0);
>
> Would the following be simpler ?
>
>                 lvdstripe = (lvds->dual_link ? LVDSTRIPE_ST_ON : 0)
>                           | (lvds->stripe_swap_data ? LVDSTRIPE_ST_SWAP : 0);

From the point of view of "wc -l": yes.
From the point of view of readability, I'd go for:

    if (lvds->dual_link)
            lvdstripe |= LVDSTRIPE_ST_ON;
    if (lvds->stripe_swap_data)
            lvdstripe |= LVDSTRIPE_ST_SWAP;

> > +             rcar_lvds_write(lvds, LVDSTRIPE, lvdstripe);
> >       }
> >
> >       /*
> > @@ -770,8 +775,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
