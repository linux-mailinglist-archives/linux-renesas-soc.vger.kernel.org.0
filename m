Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328E9475669
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241659AbhLOKa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:30:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52328 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241681AbhLOKa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:30:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43CA5292;
        Wed, 15 Dec 2021 11:30:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639564255;
        bh=3Nht8NTd5Th3Q7jJ7bUMeanvN2XBZqlY4koj+/LDfKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OmFVTTR1OVRVQzauepXfR8DbFc1x2K/eNFSH9SEi4XY5Iluvzxs7Z0FrnR2uF2T+A
         ADn1YA4XgQ2exKXWzQ6WgurICQ1bCRKJRWg5In12zJ2F07vr16CVo2I3rETcXtzVew
         rWKeZFUh5LhF9UTroaUDPSD8Tv24qxa20hsVSPwo=
Date:   Wed, 15 Dec 2021 12:30:53 +0200
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
Message-ID: <YbnD3RwTC9su+8WQ@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <b1fa94f611a5c32c5d70516d1a39973f518fb06a.1639559338.git.geert+renesas@glider.be>
 <Ybm/nwT9hx/dapdg@pendragon.ideasonboard.com>
 <CAMuHMdVZ_qySBbku9P7qPz57gBy_CRMOc23L=M-V40VJeebdgQ@mail.gmail.com>
 <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbnCKpL7m+m2nmrI@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Dec 15, 2021 at 12:23:39PM +0200, Laurent Pinchart wrote:
> On Wed, Dec 15, 2021 at 11:17:37AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 15, 2021 at 11:12 AM Laurent Pinchart wrote:
> > > On Wed, Dec 15, 2021 at 10:27:46AM +0100, Geert Uytterhoeven wrote:
> > > > The Renesas R-Car LVDS encoder driver is a subdriver of the R-Car
> > > > Display Unit driver, and enabling DRM_RCAR_USE_LVDS while DRM_RCAR_DU is
> > > > disabled doesn't have any impact on the kernel built.  Hence add a
> > > > dependency on DRM_RCAR_DU, to prevent asking the user about this driver
> > > > when configuring a kernel without R-Car Display Unit support, like is
> > > > already done for DRM_RCAR_CMM.
> > > >
> > > > Fixes: 42d95d1b3a9c649b ("drm/rcar: stop using 'imply' for dependencies")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > The problem pre-existed before commit 42d95d1b3a9c649b, as the
> > > > dependency of DRM_RCAR_LVDS on DRM_RCAR_DU was accidentally removed
> > > > before.
> > > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > > index 65d72be50f46f19e..a7aa556e301d1087 100644
> > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > @@ -32,7 +32,7 @@ config DRM_RCAR_DW_HDMI
> > > >
> > > >  config DRM_RCAR_USE_LVDS
> > > >       bool "R-Car DU LVDS Encoder Support"
> > > > -     depends on DRM_BRIDGE && OF
> > > > +     depends on DRM_BRIDGE && OF && DRM_RCAR_DU
> > >
> > > Shouldn't the same be done for DRM_RCAR_DW_HDMI ? Even better, we could
> > 
> > DRM_RCAR_DW_HDMI can be enabled and built with CONFIG_COMPILE_TEST=y
> > and CONFIG_DRM_RCAR_DU=n (yes I've tried on RISC-V ;-)
> 
> It would seem so indeed, my question is whether that shouldn't be fixed
> as well.
> 
> > > wrap all the entries for the subdrivers in a 'if DRM_RCAR_DU'.
> > 
> > That might work.  It can be tricky with bool/tristate, as sometimes m
> > is not properly propagated.
> 
> Would you give it a try for a v2 ?

Another option is to introduce DRM_RCAR_USE_HDMI and DRM_RCAR_USE_DSI.
I'd like to keep Kconfig consistent, with the same method to handle all
subdrivers if no specific reason requires doing otherwise.

> > > >       default DRM_RCAR_DU
> > > >       help
> > > >         Enable support for the R-Car Display Unit embedded LVDS encoders.

-- 
Regards,

Laurent Pinchart
