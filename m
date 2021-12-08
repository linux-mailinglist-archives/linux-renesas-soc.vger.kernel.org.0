Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAFE46DBBA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 20:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239522AbhLHTDz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 14:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239511AbhLHTDy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 14:03:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D52FC061746
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Dec 2021 11:00:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94AEDB6C;
        Wed,  8 Dec 2021 20:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638990018;
        bh=xP/HJwclbv3GF7vnqrU0J6DNf0Kyn0iJpJC39G0OwJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jAthFaj4YCE6DY2zI8AjIk5F87w1MEIMbDfUfCK+AjiICac0d50Etg1dF+gaxItfX
         wrN9uAfcSglgNrVw3EAa1a8FFiEfaWpq32wfRTKWnogQFKGm7nttOJAxKIcSbo7Fo0
         YQPTbhtfwkZdYmtkHjyYkYD8jMUriu06brk7LRTo=
Date:   Wed, 8 Dec 2021 20:59:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
Message-ID: <YbEApc0JAKZ1vcrJ@pendragon.ideasonboard.com>
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
 <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
 <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUq0F-fiqwxOuyQHv7VNfXC0De2gxBCwCyC6iOjEBk7NQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Dec 08, 2021 at 07:23:25PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 8, 2021 at 7:00 PM Laurent Pinchart wrote:
> > On Wed, Dec 08, 2021 at 11:57:21AM +0000, Kieran Bingham wrote:
> > > Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > > > Use the dev_err_probe() helper, instead of open-coding the same
> > > > operation.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> > > >         /* DRM/KMS objects */
> > > >         ret = rcar_du_modeset_init(rcdu);
> > > >         if (ret < 0) {
> > > > -               if (ret != -EPROBE_DEFER)
> > > > -                       dev_err(&pdev->dev,
> > > > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > > > +               dev_err_probe(&pdev->dev, ret,
> > > > +                             "failed to initialize DRM/KMS\n");
> > >
> > > I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> > > Seems like a nice feature when exploring devices that are still waiting
> > > to probe. Is the message still appropriate enough in that case?
> >
> > It's a very generic message, so it's not ideal. One issue is that
> > dev_err_probe() replaces any currently stored probe deferral reason
> > message, which means that we'll override any message previously set. We
> > don't set any message now, but we should (in rcar_du_encoder_init(),
> > there are two main code paths where -EPROBE_DEFER is expected), so this
> > patch would then get in the way I'm afraid.
> 
> If rcar_du_encoder_init() will handle the printing of errors, there is indeed
> no more reason for rcar_du_probe() to do that, so the existing dev_err()
> with the fuzzy message can be removed?

We could drop the above message indeed, at least once all the error
paths deeper in the call stack will print a detailed message. The
message here is useful in case an error path forgets to print anything,
to avoid the worst case of probe() failing silently.

-- 
Regards,

Laurent Pinchart
