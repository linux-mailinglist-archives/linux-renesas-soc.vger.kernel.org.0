Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8BA73BE1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 19:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjFWRxy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 13:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjFWRxv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 13:53:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E3F26AF;
        Fri, 23 Jun 2023 10:53:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B478838;
        Fri, 23 Jun 2023 19:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687542791;
        bh=RvSeLhGa/5gGKnl6MJifYRRStnLqOA15rBU2GyZaIAA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gpnPOGGnWbbNI6mgE/vyt+WOZ1wWZzWwHWSoazzgcDny10E8pmnqPdNpGZbl43Okx
         dXpw1JyL4BKYs4zYs2rLqk0GM7lN4RiA1F2VVWslyPLMJqenM0x9fndnOTJyCUDCKB
         BvbX9hAxZ1iKm6DxHoEvS7JKjxMjGLu58PSVk8kk=
Date:   Fri, 23 Jun 2023 20:53:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 23/39] drm: renesas: shmobile: Move interface handling to
 connector setup
Message-ID: <20230623175346.GQ2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <0032f38b474a8ff63a7cdfdbc8b73766c3561729.1687423204.git.geert+renesas@glider.be>
 <20230623163950.GA2112@pendragon.ideasonboard.com>
 <CAMuHMdU_gvs1+KtN14DxAMY+Qa2YTo8KL3L4VnL3yG2zYiH6JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU_gvs1+KtN14DxAMY+Qa2YTo8KL3L4VnL3yG2zYiH6JQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 23, 2023 at 07:51:07PM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Fri, Jun 23, 2023 at 6:39 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Thu, Jun 22, 2023 at 11:21:35AM +0200, Geert Uytterhoeven wrote:
> > > Move legacy interface handling to the connector setup code.
> > > Set up bus_flags and bus_formats in display_info according to the
> > > bus format and panel information from platform data, to make it more
> > > similar with DT-based connector/bridge/panel setup.
> > > This will allows us to use the same LCD interface setup code for both
> >
> > s/allows/allow/
> >
> > > legacy and DT-based systems.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -8,6 +8,7 @@
> > >   */
> > >
> > >  #include <linux/clk.h>
> > > +#include <linux/media-bus-format.h>
> > >  #include <linux/pm_runtime.h>
> > >
> > >  #include <drm/drm_crtc.h>
> > > @@ -66,15 +67,65 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
> > >  {
> > >       struct drm_crtc *crtc = &scrtc->crtc;
> > >       struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
> > > -     enum display_flags dpy_flags = sdev->connector.mode->flags;
> > > +     const struct drm_display_info *info = &sdev->connector->display_info;
> > >       const struct drm_display_mode *mode = &crtc->mode;
> > >       u32 value;
> > >
> > > -     value = sdev->ldmt1r
> > > -           | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : LDMT1R_VPOL)
> > > -           | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : LDMT1R_HPOL)
> > > -           | ((dpy_flags & DISPLAY_FLAGS_PIXDATA_POSEDGE) ? LDMT1R_DWPOL : 0)
> > > -           | ((dpy_flags & DISPLAY_FLAGS_DE_LOW) ? LDMT1R_DIPOL : 0);
> > > +     if (!info->num_bus_formats || !info->bus_formats) {
> > > +             dev_warn(sdev->dev, "No bus format reported, using RGB888\n");
> > > +             value = LDMT1R_MIFTYP_RGB24;
> > > +     } else {
> > > +             switch (info->bus_formats[0]) {
> > > +             case MEDIA_BUS_FMT_RGB888_3X8:
> > > +                     value = LDMT1R_MIFTYP_RGB8;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB666_2X9_BE:
> > > +                     value = LDMT1R_MIFTYP_RGB9;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB888_2X12_BE:
> > > +                     value = LDMT1R_MIFTYP_RGB12A;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB444_1X12:
> > > +                     value = LDMT1R_MIFTYP_RGB12B;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB565_1X16:
> > > +                     value = LDMT1R_MIFTYP_RGB16;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB666_1X18:
> > > +                     value = LDMT1R_MIFTYP_RGB18;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_RGB888_1X24:
> > > +                     value = LDMT1R_MIFTYP_RGB24;
> > > +                     break;
> > > +
> > > +             case MEDIA_BUS_FMT_UYVY8_1X16:
> > > +                     value = LDMT1R_MIFTYP_YCBCR;
> > > +                     break;
> > > +
> > > +             default:
> > > +                     dev_warn(sdev->dev,
> > > +                              "unsupported bus format 0x%x, using RGB888\n",
> > > +                              info->bus_formats[0]);
> > > +                     value = LDMT1R_MIFTYP_RGB24;
> > > +                     break;
> > > +             }
> >
> > It's a bit annoying to lose the ability to validate the bus format at
> > probe time. Can it be kept. I'm also OK with restoring it later in the
> > series if it gets in the way of the conversion, in which case a mention
> > in the commit message would be nice.
> 
> I guess I can keep it, somewhere.
> Probably it should be validated for the DT case later, too.
> BTW, drivers/gpu/drm/renesas/rcar-du/rcar_lvds.s doesn't check this
> either, so I copied the bad example from the expert ;-)

There's an endless amount of issues to fix. Patches are of course
welcome :-)

-- 
Regards,

Laurent Pinchart
