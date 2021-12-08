Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2446DA9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 19:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238413AbhLHSDq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 13:03:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbhLHSDp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 13:03:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25F3C061746
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Dec 2021 10:00:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A634B6C;
        Wed,  8 Dec 2021 19:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638986410;
        bh=1p0Zr4OspTZwwt9ZcopVSnlKwBFgIDhLPkDhgz0zUfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=no5CLVQsCdXlUfljvbCqGFHnmpf4mcfPFXH7UuE01tNKde1rf4+lh77vt36c8Nil5
         9kmU3aSKkshCGDgqxv15UHyU1Ojb1ICncn2//1DOXTfWnbXuCgeoJGFCUgPs4+ENMG
         Ug+34Srs91r6DK9zlV4b5j1V6j3CIaUVaTC5ly/g=
Date:   Wed, 8 Dec 2021 19:59:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Use dev_err_probe() helper
Message-ID: <YbDyjFEJuAgROwqU@pendragon.ideasonboard.com>
References: <62adddea1fc5e9133766af2d953be7334f4622aa.1638959417.git.geert+renesas@glider.be>
 <163896464129.995700.3492964836875185548@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <163896464129.995700.3492964836875185548@Monstersaurus>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Wed, Dec 08, 2021 at 11:57:21AM +0000, Kieran Bingham wrote:
> Quoting Geert Uytterhoeven (2021-12-08 10:30:53)
> > Use the dev_err_probe() helper, instead of open-coding the same
> > operation.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 5612a9e7a9056cf7..86eeda769e2ebd10 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -661,9 +661,8 @@ static int rcar_du_probe(struct platform_device *pdev)
> >         /* DRM/KMS objects */
> >         ret = rcar_du_modeset_init(rcdu);
> >         if (ret < 0) {
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(&pdev->dev,
> > -                               "failed to initialize DRM/KMS (%d)\n", ret);
> > +               dev_err_probe(&pdev->dev, ret,
> > +                             "failed to initialize DRM/KMS\n");
> 
> I've just learned that dev_err_probe() sets a 'reason' for the deferral.
> Seems like a nice feature when exploring devices that are still waiting
> to probe. Is the message still appropriate enough in that case?

It's a very generic message, so it's not ideal. One issue is that
dev_err_probe() replaces any currently stored probe deferral reason
message, which means that we'll override any message previously set. We
don't set any message now, but we should (in rcar_du_encoder_init(),
there are two main code paths where -EPROBE_DEFER is expected), so this
patch would then get in the way I'm afraid.

> I think it's probably fine, so
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >                 goto error;
> >         }
> >  

-- 
Regards,

Laurent Pinchart
