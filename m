Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209FA47562A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhLOKXn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbhLOKXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:23:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954CCC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:23:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6238292;
        Wed, 15 Dec 2021 11:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639563820;
        bh=FU1G4YPVrZV7HUmGOXN/N4GHYBP87iaL0p4SZetVTeY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s02GZnuBgcxLI1SSoflyHNflGFUU5sP/sx6NvY1kocMDvDofWE4IQt301f7nL8XEG
         nrm9FQb7543zpGKwYB6bZUSEf/9g81eFg+AlCNkSin9+isD2qtp1xT4ko3Qkrw77RC
         Jq3Y4BI/L7NlvXZybn4sjpbIPb38saav0CwsZ1Zg=
Date:   Wed, 15 Dec 2021 12:23:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm: rcar-du: DRM_RCAR_USE_LVDS should depend on
 DRM_RCAR_DU
Message-ID: <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
 <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Dec 15, 2021 at 11:17:37AM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart wrote:
> > On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > > disabled doesn't have any impact on the kernel built.  Hence add a
> > > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > > when configuring a kernel without R-Car Display Unit support, like is
> > > already done for DRM_RCAR_CMM.
> > >
> > > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > > before.
> > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> > >
> > >  config DRM_RCAR_USE_LVDS
> > >       bool "R-Car DU LVDS Encoder Support"
> > > -     depends on DRM_BRIDGE && OF
> > > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
> >
> > Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could
> 
> DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
> and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)

It would seem so indeed, my question is whether that shouldn't be fixed
as well.

> > wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.
> 
> That might work.  It can be tricky with bool/tristate, as sometimes m
> is not properly propagated.

Would you give it a try for a v2 ?

> > >       default DRM_RCAR_DU
> > >       help
> > >         Enable support for the R-Car Display Unit embedded LVDS encoders.

-- 
Regards,

Laurent Pinchart
