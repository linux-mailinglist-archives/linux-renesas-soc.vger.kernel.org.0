Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12006DC6BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 14:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjDJM0H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 08:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjDJM0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 08:26:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10785B99;
        Mon, 10 Apr 2023 05:25:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 857C925E9;
        Mon, 10 Apr 2023 14:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681129557;
        bh=67lduPacpLMhq2ux8wEvh/kW0ZiVWSVK8q5xSlMbhFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XnkLoWVVNjS1PQpP3QBcSk4z1swpJB8JK3C2aU6BSsmi7Qfo/7HZzobRc9HwMDJ7S
         DhYty61c5DwflKTO4eSM0mCRH4z2OuYfn9/lago/eXx/MxkBVm7vQ5//sGg9Fl3Pv/
         eRn2HhOx4rosR2/u1KG19b4ybsgZlz1eaeGwMt7A=
Date:   Mon, 10 Apr 2023 15:26:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm: shmobile: Switch to drm_crtc_init_with_planes()
Message-ID: <20230410122607.GA11253@pendragon.ideasonboard.com>
References: <cover.1680273039.git.geert+renesas@glider.be>
 <df4099d79c985c73bdc890eb0e026494b7fa5c96.1680273039.git.geert+renesas@glider.be>
 <20230405035952.GI9915@pendragon.ideasonboard.com>
 <CAMuHMdUMEVYRr9oYBB=50WJtM4St1UfVkGMw09dchjgoUC2Q6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUMEVYRr9oYBB=50WJtM4St1UfVkGMw09dchjgoUC2Q6A@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Apr 10, 2023 at 11:35:56AM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 5, 2023 at 5:59 AM Laurent Pinchart wrote:
> > On Fri, Mar 31, 2023 at 04:48:09PM +0200, Geert Uytterhoeven wrote:
> > > The SH-Mobile DRM driver uses the legacy drm_crtc_init(), which
> > > advertizes only the formats in safe_modeset_formats[] (XR24 and AR24) as
> > > being supported.
> > >
> > > Switch to drm_crtc_init_with_planes(), and advertize all supported
> > > (A)RGB modes, so we can use RGB565 as the default mode for the console.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <drm/drm_gem_dma_helper.h>
> > >  #include <drm/drm_modeset_helper.h>
> > >  #include <drm/drm_modeset_helper_vtables.h>
> > > +#include <drm/drm_plane_helper.h>
> > >  #include <drm/drm_probe_helper.h>
> > >  #include <drm/drm_simple_kms_helper.h>
> > >  #include <drm/drm_vblank.h>
> > > @@ -478,16 +479,41 @@ static const struct drm_crtc_funcs crtc_funcs = {
> > >       .disable_vblank = shmob_drm_disable_vblank,
> > >  };
> > >
> > > +static const uint32_t modeset_formats[] = {
> > > +     DRM_FORMAT_RGB565,
> > > +     DRM_FORMAT_RGB888,
> > > +     DRM_FORMAT_ARGB8888,
> > > +     DRM_FORMAT_XRGB8888,
> > > +};
> > > +
> > > +static const struct drm_plane_funcs primary_plane_funcs = {
> > > +     DRM_PLANE_NON_ATOMIC_FUNCS,
> > > +};
> > > +
> > >  int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
> > >  {
> > >       struct drm_crtc *crtc = &sdev->crtc.crtc;
> > > +     struct drm_plane *primary;
> > >       int ret;
> > >
> > >       sdev->crtc.dpms = DRM_MODE_DPMS_OFF;
> > >
> > > -     ret = drm_crtc_init(sdev->ddev, crtc, &crtc_funcs);
> > > -     if (ret < 0)
> > > +     primary = __drm_universal_plane_alloc(sdev->ddev, sizeof(*primary), 0,
> > > +                                           0, &primary_plane_funcs,
> > > +                                           modeset_formats,
> > > +                                           ARRAY_SIZE(modeset_formats),
> > > +                                           NULL, DRM_PLANE_TYPE_PRIMARY,
> > > +                                           NULL);
> > > +     if (IS_ERR(primary))
> > > +             return PTR_ERR(primary);
> >
> > This seems like a bit of a hack to me. Why don't you use the planes
> 
> I'm following what Thomas did in the nouveau driver....
> 
> > created by shmob_drm_plane_create() instead of allocating a new one ?
> 
> Is that possible? shmob_drm_plane_create() creates overlay planes,
> while this is for the primary plane.

You're right, for some reason I overlooked that. Sorry for the noise.

It would be good to move handling of the primary plane to
shmob_drm_plane.c, but that's for later, when moving the driver to the
atomic API. For now,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> > > +
> > > +     ret = drm_crtc_init_with_planes(sdev->ddev, crtc, primary, NULL,
> > > +                                     &crtc_funcs, NULL);
> > > +     if (ret < 0) {
> > > +             drm_plane_cleanup(primary);
> > > +             kfree(primary);
> > >               return ret;
> > > +     }
> > >
> > >       drm_crtc_helper_add(crtc, &crtc_helper_funcs);

-- 
Regards,

Laurent Pinchart
