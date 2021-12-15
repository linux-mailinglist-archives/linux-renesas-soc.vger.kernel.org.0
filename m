Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FE0475662
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Dec 2021 11:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241677AbhLOK3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Dec 2021 05:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241678AbhLOK3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 05:29:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E13C06173E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Dec 2021 02:29:21 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D713292;
        Wed, 15 Dec 2021 11:29:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639564160;
        bh=1YuIKnRkraFikhx1uWbpznSlX/vxik+lsq31+MYszsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZH+yzciTZSzZemOl8Kj8BIQhP4iKgvEa+Ik6kCMtOuz9SD/cJkdRfX2d6MNTV6ytu
         egWkU42ZvoUdzHMdkNWB96/ny/egCTO/dgZZrrQZbwuXg2kC5sEQK568ebN5awyjt3
         S606znN6z3lx4R8LHVPvJlqYjCwxfRi5ZkHDzB38=
Date:   Wed, 15 Dec 2021 12:29:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: rcar-du: DRM_RCAR_MIPI_DSI should depend on
 ARCH_RENESAS
Message-ID: <YbnDfvfoP00XzZT1@pendragon.ideasonboard.com>
References: <cover.1639559338.git.geert+renesas@glider.be>
 <c8599f5ba4f281a71240b3d6a8f27f450dfb5d17.1639559338.git.geert+renesas@glider.be>
 <YbnCldnKD7OK/jHi@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbnCldnKD7OK/jHi@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 15, 2021 at 12:25:26PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Wed, Dec 15, 2021 at 10:27:47AM +0100, Geert Uytterhoeven wrote:
> > The Renesas R-Car Display Unit embedded MIPI DSI encoder is only present
> > on Renesas R-Car V3U SoCs.  Hence add a dependency on ARCH_RENESAS, to
> > prevent asking the user about this driver when configuring a kernel
> > without Renesas SoC support.
> > 
> > Fixes: 155358310f013c23 ("drm: rcar-du: Add R-Car DSI driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index a7aa556e301d1087..2f4f6ac5fd4e66b1 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -48,6 +48,7 @@ config DRM_RCAR_LVDS
> >  config DRM_RCAR_MIPI_DSI
> >  	tristate "R-Car DU MIPI DSI Encoder Support"
> >  	depends on DRM && DRM_BRIDGE && OF
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> 
> Same as for 1/3, let's move this entry first. I can handle this when
> applying the patches, I'll take 1/3 and 3/3 in my tree already.

Actually, if we wrap all subdrivers in 'if DRM_RCAR_DU', we won't need
1/3 and 3/3. Let's reach a conclusion on that topic first.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  	select DRM_MIPI_DSI
> >  	help
> >  	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.

-- 
Regards,

Laurent Pinchart
