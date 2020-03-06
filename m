Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C0317C02E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 15:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCFO2Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 09:28:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44992 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCFO2Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 09:28:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0890724B;
        Fri,  6 Mar 2020 15:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583504902;
        bh=ImKyg2Rt+BNTa71Lnrc2XDPX0687KcLwXIdOHli2fTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sH6YQwSbCFFwSloh9k9vJldXYfFroGqtlXzpbrnhzIic7eVqO4vgiQNs25bSDXsKM
         bDk8TMDzOmsB6hfxkVRvndfsygHVoUmUqrUymfiH+2WuP0rNTbBrZ8iB3/N+YG6k8p
         jDudKFu7Y9L51JdTPBegKDQ5u/ChXcgVneDygxbg=
Date:   Fri, 6 Mar 2020 16:28:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        David Airlie <airlied@linux.ie>
Subject: Re: [RFC PATCH] drm: rcar-du: make all sub-symbols depend on
 DRM_RCAR_DU
Message-ID: <20200306142819.GG4878@pendragon.ideasonboard.com>
References: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b50cc9f-1434-b78a-d56a-fadfd030f002@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Randy,

On Thu, Mar 05, 2020 at 07:17:49PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> DRM_RCAR_CMM depends on DRM_RCAR_DU. Since the following Kconfig
> symbols do not depend on DRM_RCAR_DU, the menu presentation is
> broken for these and following non-R-Car Kconfig symbols.
> 
> Is it safe/appropriate to make all of these symbols depend on
> DRM_RCAR_DU?  It make the kconfig menu presentation much cleaner.

As those drivers are useless without DRM_RCAR_DU, I'm fine with this
change. It however prevents test-compiling those drivers when
DRM_RCAR_DU is disabled, but I see little reason to do so anyway, I
expect compile tests to aim for as large coverage as possible, and they
should thus enable DRM_RCAR_DU.

Would you like to submit a new version without this question, and
possibly addressing Geert's concern if you think it's appropriate, or
should I do so when applying ?

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Cc: Dave Airlie <airlied@linux.ie>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- linux-next-20200305.orig/drivers/gpu/drm/rcar-du/Kconfig
> +++ linux-next-20200305/drivers/gpu/drm/rcar-du/Kconfig
> @@ -24,6 +24,7 @@ config DRM_RCAR_CMM
>  config DRM_RCAR_DW_HDMI
>  	tristate "R-Car DU Gen3 HDMI Encoder Support"
>  	depends on DRM && OF
> +	depends on DRM_RCAR_DU
>  	select DRM_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 internal HDMI encoder.
> @@ -31,6 +32,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_LVDS
>  	tristate "R-Car DU LVDS Encoder Support"
>  	depends on DRM && DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU
>  	select DRM_PANEL
>  	select OF_FLATTREE
>  	select OF_OVERLAY
> @@ -47,4 +49,5 @@ config DRM_RCAR_VSP
>  
>  config DRM_RCAR_WRITEBACK
>  	bool
> +	depends on DRM_RCAR_DU
>  	default y if ARM64

Is this one needed ? The symbol should not be shown in the kconfig menu
as it has no text.

-- 
Regards,

Laurent Pinchart
