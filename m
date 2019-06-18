Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A5449AB0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 09:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRHfs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:35:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRHfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:35:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE1FCD5;
        Tue, 18 Jun 2019 09:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560843347;
        bh=9B6lsHamppvchomwWGBfoo1wRcyGvNZz1UhrpVEu6CQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nFmVTr6N1sb+HqTOChRrMimD7xIrvo0KDJ2Fh1k/NUTGlpO1Y/ubzo0DZpDE8pWrq
         VyJ5U5ffYnI5GFt+9et19JJ3htfRbfkrEXbtfizkle8Bva3j1aNW/R/WSNw+X8mIXg
         BBcTG7KqpS76WK5E5qCD68O9onoMfYYEa/RqXJ9Y=
Date:   Tue, 18 Jun 2019 10:35:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 28/59] drm/shmob: Drop drm_gem_prime_export/import
Message-ID: <20190618073530.GE4800@pendragon.ideasonboard.com>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-29-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Fri, Jun 14, 2019 at 10:35:44PM +0200, Daniel Vetter wrote:
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
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 9047a49ff35e..6c106b7a3bfe 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -133,8 +133,6 @@ static struct drm_driver shmob_drm_driver = {
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
