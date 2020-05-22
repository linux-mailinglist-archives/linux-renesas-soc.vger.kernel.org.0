Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A2C1DF09B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 22:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731181AbgEVUYK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 16:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731056AbgEVUYE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 16:24:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8ECC05BD43;
        Fri, 22 May 2020 13:24:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0390B55;
        Fri, 22 May 2020 22:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590179041;
        bh=eHYE+NQkQ5F13N+F0zH4qMpO6wi5gp39cWdyPaPGwMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lG6Lr1pXS+PdX3mO4+MCydqQxgESvaSwVRqZOYRatNHph9oPDsxoUxVNB9ZR0bIXM
         rKm1pxsciai7SfU65O5Wv6cgey0Xo7pjoLxbKAPrVGuSPWp1FdDeAmPoq2wg2XrvrM
         +SX/50OE2QwcASuwJjiEXod9Rd7Av1KnlpbZQauk=
Date:   Fri, 22 May 2020 23:23:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Gomez <dagmcr@gmail.com>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        kieran.bingham+renesas@ideasonboard.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Fix build error
Message-ID: <20200522202349.GF5824@pendragon.ideasonboard.com>
References: <20200518201646.48312-1-dagmcr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200518201646.48312-1-dagmcr@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, May 18, 2020 at 10:16:46PM +0200, Daniel Gomez wrote:
> Select DRM_KMS_HELPER dependency.
> 
> Build error when DRM_KMS_HELPER is not selected:
> 
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
> 
> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree for v5.9. If you think it should get in v5.8 as a
fix, I can do so as well, could you then provide a Fixes: tag ?

> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 0919f1f159a4..f65d1489dc50 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
>  config DRM_RCAR_LVDS
>  	tristate "R-Car DU LVDS Encoder Support"
>  	depends on DRM && DRM_BRIDGE && OF
> +	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select OF_FLATTREE
>  	select OF_OVERLAY

-- 
Regards,

Laurent Pinchart
