Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25BBD16462C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 14:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgBSN5Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 08:57:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgBSN5Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 08:57:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E7142F9;
        Wed, 19 Feb 2020 14:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582120642;
        bh=hPoOjSQJ0zp4s9np2o9NzbNtvHJJaplKNMUpacOxZHM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIoen60AddqmzQREBzmgmJ6qmWpdpjphplRlEkJr2FORH8Dswb0axkN9jo7EhTvAd
         uunl2jGxMtKAyQgJTNIv7KaGbBdUtwUGT7eaxM1xJAxmKKupe9w9/sFZ/y19nE1MGf
         zAiuB4csVQxtF5tDbkBbTtt+ARXWwKlh9+X2AMwQ=
Date:   Wed, 19 Feb 2020 15:57:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 40/52] drm/shmob: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200219135704.GI5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-41-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-41-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:21:10AM +0100, Daniel Vetter wrote:
> It's right above the drm_dev_put().
> 
> Aside: Another driver with a bit much devm_kzalloc, which should
> probably use drmm_kzalloc instead ...

With the same comments as the one for the rcar-du patch taken into
account,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 2 --
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c | 6 +++++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index b8c0930959c7..ae9d6b8d3ca8 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -192,7 +192,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  
>  	drm_dev_unregister(ddev);
>  	drm_kms_helper_poll_fini(ddev);
> -	drm_mode_config_cleanup(ddev);
>  	drm_irq_uninstall(ddev);
>  	drm_dev_put(ddev);
>  
> @@ -288,7 +287,6 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	drm_irq_uninstall(ddev);
>  err_modeset_cleanup:
>  	drm_kms_helper_poll_fini(ddev);
> -	drm_mode_config_cleanup(ddev);
>  err_free_drm_dev:
>  	drm_dev_put(ddev);
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index c51197b6fd85..e6e34bb75ba0 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -126,7 +126,11 @@ static const struct drm_mode_config_funcs shmob_drm_mode_config_funcs = {
>  
>  int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
>  {
> -	drm_mode_config_init(sdev->ddev);
> +	int ret;
> +
> +	ret = drm_mode_config_init(sdev->ddev);
> +	if (ret)
> +		return ret;
>  
>  	shmob_drm_crtc_create(sdev);
>  	shmob_drm_encoder_create(sdev);

-- 
Regards,

Laurent Pinchart
