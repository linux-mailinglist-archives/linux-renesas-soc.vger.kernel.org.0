Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7D65AFB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Jun 2019 13:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3LWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 30 Jun 2019 07:22:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34646 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfF3LWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jun 2019 07:22:25 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4FFE255;
        Sun, 30 Jun 2019 13:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561893743;
        bh=/reUXQpUQ8z5ZpK2auXdX7aDQBtnZKobeH3QenRGS9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JvdIJcPnbFMOgXXIgd05vXrbUqcEGh9gM90zVmJrk3hK7cgqK2KxU0zf31XWPpoHt
         WOadNCSCx0aboOydapyFRbFzrIw1LpCLxtNgZcYl60z4fYR53LpQT0dGCixRzVbMye
         FpRbmm1NpqqNFNth4UVO4ouIDQMiBvZeb8YU1cN4=
Date:   Sun, 30 Jun 2019 14:22:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1] drm/shmobile: drop use of drmP.h
Message-ID: <20190630112203.GA7043@pendragon.ideasonboard.com>
References: <20190630052126.6050-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190630052126.6050-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

Thank you for the patch.

On Sun, Jun 30, 2019 at 07:21:26AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> Fix fallout.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> The patch is build tested using several configs and
> several architectures (including arm, arm64, x86).
> 
> The patch is based on drm-misc.
> 
> If patch is OK, please apply to your tree
> as this driver is maintained outside drm-misc.
> 
> I am happy to rebase on another tree, just let me know.

The shmobile driver hasn't seen changes for a long time and I don't have
patches queued in my tree for it. If you don't mind taking this patch
through drm-misc with the rest of the drmP.h removal series it would be
easier for me. Otherwise please let me know and I'll handle it.

>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 3 ++-
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h  | 1 -
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c   | 4 +++-
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c   | 1 -
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c | 2 +-
>  5 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index b6988a6d698e..75a752d59ef1 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -10,13 +10,14 @@
>  #include <linux/backlight.h>
>  #include <linux/clk.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "shmob_drm_backlight.h"
>  #include "shmob_drm_crtc.h"
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> index 9ca6920641d8..bd35fe8f9028 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> @@ -10,7 +10,6 @@
>  #ifndef __SHMOB_DRM_CRTC_H__
>  #define __SHMOB_DRM_CRTC_H__
>  
> -#include <drm/drmP.h>

I think you should include drm/drm_connector.h here. It gets pulled
indirectly, but it's one of the top-level headers and I think it should
be explicitly included to avoid future breakages.

While at it a forward declaration of struct drm_pending_vblank_event and
struct shmob_drm_format_info could also be useful to make the header
self-contained.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 6c106b7a3bfe..b8c0930959c7 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -15,10 +15,12 @@
>  #include <linux/pm.h>
>  #include <linux/slab.h>
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_irq.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>  
>  #include "shmob_drm_drv.h"
>  #include "shmob_drm_kms.h"
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 2e08bc203bf9..c51197b6fd85 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -7,7 +7,6 @@
>   * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> index 1d1ee5e51351..cbc464f006b4 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
> @@ -7,10 +7,10 @@
>   * Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> -#include <drm/drmP.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  
>  #include "shmob_drm_drv.h"

-- 
Regards,

Laurent Pinchart
