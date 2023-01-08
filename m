Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0B96613A1
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jan 2023 06:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjAHFJQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Jan 2023 00:09:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAHFJP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Jan 2023 00:09:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689953056D
        for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Jan 2023 21:09:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D21876CF;
        Sun,  8 Jan 2023 06:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673154552;
        bh=F3UWcLV9XVyAU9iQr8lwWZHRziu895o/rbzfmNpK31o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lAkiWEch7e0unbdnh2NZPlt/nmFwFKCS+EMBc8gVgBsh7wXsjGsLO/6ENVQVhCftF
         rMO5Mftvvf064P0Of2AFxSh/UZavE9RB+HFGJ2EY7SS5Of6FJqEoKZNyHPLHqJplKS
         73W4XB8jlsInNgNK3qDq68Jmf6T9d4LRhJpaDHcU=
Date:   Sun, 8 Jan 2023 07:09:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on
 that SoC
Message-ID: <Y7pP8w+9BmM/ZSP9@pendragon.ideasonboard.com>
References: <20230108043147.346349-1-pbrobinson@gmail.com>
 <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
 <CALeDE9NV8WctWcFMuW4nqwi-piane-YWxidCWjjaZ3XJEXSTXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALeDE9NV8WctWcFMuW4nqwi-piane-YWxidCWjjaZ3XJEXSTXw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Peter,

On Sun, Jan 08, 2023 at 04:50:48AM +0000, Peter Robinson wrote:
> > On Sun, Jan 08, 2023 at 04:31:47AM +0000, Peter Robinson wrote:
> > > There's a few components in the rcar-du drm directory that
> > > don't make sense to be slectedable if ARCH_RENESAS isn't because
> >
> > s/slectedable/selectable/
> >
> > > they are part of those SoCs so add a dependency and add compile
> > > check to ensure they're still tested.
> > >
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index b2bddbeca878..4d2bff78a559 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> > >  config DRM_RCAR_DW_HDMI
> > >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> > >       depends on DRM && OF
> > > +     depends on ARCH_RENESAS || COMPILE_TEST
> >
> > As this module isn't useful without the DU driver, wouldn't it be better
> > to add a dependency on DRM_RCAR_DU, which itself already depends on
> > ARCH_RENESAS || COMPILE_TEST ? Same for the other two below.
> 
> I had considered both options but as I suspected that it would have at
> least been compile tested by I wasn't 100% sure of the dependency
> within the actually SoC as I don't really know the HW but I am happy
> to go that route too.

No worries. I can confirm that the extra drivers can't be used without
the DU.

> Also the DRM_RCAR_USE_ options seem a little weird too the
> DRM_RCAR_USE_MIPI_DSI vs just using DRM_RCAR_MIPI_DSI, seems like
> extra logic just in the Kconfig that provides little, but ultimately
> that bit doesn't affect me overall.

Yes it's awkward. The reason for this is that the DU drivers call into
the RCAR_CMM, RCAR_LVDS and RCAR_MIPI_DSI drivers directly. They are
however optional, so the functions are stubbed with IS_ENABLED() using
the corresponding CONFIG_DRM_RCAR_* Kconfig symbol, but Kconfig doesn't
make it easy to express the dependencies correctly in that case. Other
options have been tried, causing build problems in one way or another
(you can check the git log if curious).

> Will do a v2

Thank you.

> > >       select DRM_DW_HDMI
> > >       help
> > >         Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> > > @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
> > >  config DRM_RCAR_USE_LVDS
> > >       bool "R-Car DU LVDS Encoder Support"
> > >       depends on DRM_BRIDGE && OF
> > > +     depends on ARCH_RENESAS || COMPILE_TEST
> > >       default DRM_RCAR_DU
> > >       help
> > >         Enable support for the R-Car Display Unit embedded LVDS encoders.
> > > @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
> > >  config DRM_RCAR_USE_MIPI_DSI
> > >       bool "R-Car DU MIPI DSI Encoder Support"
> > >       depends on DRM_BRIDGE && OF
> > > +     depends on ARCH_RENESAS || COMPILE_TEST
> > >       default DRM_RCAR_DU
> > >       help
> > >         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
