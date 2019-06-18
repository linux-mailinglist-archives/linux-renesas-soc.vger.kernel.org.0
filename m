Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A1449AAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRHf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:35:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRHf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:35:27 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C6C6D5;
        Tue, 18 Jun 2019 09:35:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560843325;
        bh=Fzhc1I4GvnyBFZliP4EYcydVYhoOIH848SWA0jWyt+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ho9wb0GWHwy5g/DbXnaswR7Ckz3k1KfMySQt+RwkZktLuuI+F6t0lutd1XsSteZRx
         pf4agCo/mF0vFzSn0WS8E4xf2lIS2xkBLcziX2kEyQs2u5wjEJxPTnm+SW8a2/hYth
         zbh8iob0ga9i8RGmmA/3ogHpvV6tZszKqcbeVip8=
Date:   Tue, 18 Jun 2019 10:35:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 26/59] drm/rcar-du: Drop drm_gem_prime_export/import
Message-ID: <20190618073508.GD4800@pendragon.ideasonboard.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-27-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-27-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Fri, Jun 14, 2019 at 10:35:42PM +0200, Daniel Vetter wrote:
> They're the default.
> 
> Aside: Would be really nice to switch the others over to
> drm_gem_object_funcs.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to merged this as part of the series.

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 83685250319d..9c93eb4fad8b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -446,8 +446,6 @@ static struct drm_driver rcar_du_driver = {
>  	.gem_vm_ops		= &drm_gem_cma_vm_ops,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_import	= drm_gem_prime_import,
> -	.gem_prime_export	= drm_gem_prime_export,
>  	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
>  	.gem_prime_vmap		= drm_gem_cma_prime_vmap,

-- 
Regards,

Laurent Pinchart
