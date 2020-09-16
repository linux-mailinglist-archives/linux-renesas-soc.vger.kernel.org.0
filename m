Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3DF26C1AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 12:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgIPK2W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 06:28:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgIPK1l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 06:27:41 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2107357F;
        Wed, 16 Sep 2020 12:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600252000;
        bh=yUpFXLpSMd8aDzEogJqMmCNE/VDz4HaTCogK73JfZBs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OnLvgDhuQ93uM4hWyCinvA5/Ed96Y8hguB9i7wfCgkSvmBO8Li8dmEWKD4K1NoQdf
         b8uQvWKXDUcykmjZd7grIvwcg6bSJ64hRPyV5cQdZomHAv/l85nwJeuAgviJi3fTKN
         iZPnFwwjOm19mIc670/m4TZxeSxfA2vHWoU01eHg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Put reference to VSP device
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Yu Kuai <yukuai3@huawei.com>,
        yi.zhang@huawei.com
References: <20200915233004.GD14954@pendragon.ideasonboard.com>
 <20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1deb9fc0-7f87-ed4a-d719-401e08ad83ca@ideasonboard.com>
Date:   Wed, 16 Sep 2020 11:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 16/09/2020 00:38, Laurent Pinchart wrote:
> The reference to the VSP device acquired with of_find_device_by_node()
> in rcar_du_vsp_init() is never released. Fix it with a drmm action,
> which gets run both in the probe error path and in the remove path.
> 
> Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
> Reported-by: Yu Kuai <yukuai3@huawei.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Looks nice and clean!

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index f1a81c9b184d..fa09b3ae8b9d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -341,6 +342,13 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
>  };
>  
> +static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
> +{
> +	struct rcar_du_vsp *vsp = res;
> +
> +	put_device(vsp->vsp);

Ugh the asymmetry of the put_device is a bit annoying, because it's not
initially clear that the of_find_device_by_node() call 'gets' a reference.

(Or at least not until you find:
  https://lore.kernel.org/patchwork/patch/731284/)

It is stated in the commit message though so that's fine, and although I
thought perhaps a comment here might be useful to declare that it
releases the reference taken by of_find_device_by_node(), I'm not sure
it even adds that much value ... so either way.


> +}
> +
>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		     unsigned int crtcs)
>  {
> @@ -357,6 +365,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  
>  	vsp->vsp = &pdev->dev;
>  
> +	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = vsp1_du_init(vsp->vsp);
>  	if (ret < 0)
>  		return ret;
> 

