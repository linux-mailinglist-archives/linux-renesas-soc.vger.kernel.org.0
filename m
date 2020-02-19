Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C5316460B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 14:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgBSNx1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 08:53:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35458 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgBSNx1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 08:53:27 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA0872F9;
        Wed, 19 Feb 2020 14:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582120405;
        bh=uYsobsH12wc9qCc7Q6YekFm7z+egO3H0mY8Ziz2TgjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wIjNNE0AhUiDfayd4+4kR9AmrwcXGxHeUaZS3urB5etFD2xxeGS+rQLs30KKrt0D4
         NaQNmtBz9eqmXGFzS8gZOCWnO+7EztjyuNZNGNYvdg/hMs9IegOJzHD0/rrFgNkIbd
         emCn82gslraxp1j6Bvf/RZ4m014voJvSAcUr+drg=
Date:   Wed, 19 Feb 2020 15:53:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200219135307.GH5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:21:07AM +0100, Daniel Vetter wrote:
> It's right above the drm_dev_put().

Could you mention in the commit message that the call can be dropped
because drm_mode_config_init() uses the managed API to handle cleaning
automatically, removing the need to do so in drivers ? Otherwise when
someone will look at the commit later, without having the full context
in mind, the reason why the call is dropped won't be immediately clear.
With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This also applies to similar patches for other drivers.

> Aside: Another driver with a bit much devm_kzalloc, which should
> probably use drmm_kzalloc instead ...

I agree, but I'm not sure this should be part of the commit message :-)

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 654e2dd08146..3e67cf70f040 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
>  	drm_dev_unregister(ddev);
>  
>  	drm_kms_helper_poll_fini(ddev);
> -	drm_mode_config_cleanup(ddev);
>  
>  	drm_dev_put(ddev);
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index fcfd916227d1..dcdc1580b511 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	unsigned int i;
>  	int ret;
>  
> -	drm_mode_config_init(dev);
> +	ret = drm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
>  
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;

-- 
Regards,

Laurent Pinchart
