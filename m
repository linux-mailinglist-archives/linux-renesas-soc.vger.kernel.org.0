Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61C14A2E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfFRN4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:56:22 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:38922 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFRN4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org; s=ds201810;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Q/RwDQFrb3dcl/FL0bW4yFjiR6exH+nuBXsFFNpJbgc=;
        b=eTy4pCdX4fFcXYVs9Om6zknzXKMYpj1h6JVf2+wHydBpCBGOgbaH/88yzjlyendqpbVdm7/DMIytKk+TBd3+tk3+gtIES1/ICKjBtnP5s4xizGoxvXoiCpHGyAs7XA6dhbHZkjZpCegVg/GAfgC9EgW/HlgHnlefJM+sUaKuCgWnySFjt+9Qw7urWJ2xIw0uD0fkX+zvdHxNsa50llYoDqAqDkQbCvLQGf9tx7o3DPpdDE5geFYuA0IGvjjAQYby54NXujpIDr1Ouaw4nk5bn3iQVbgcmiA3IEsr/x4svh8uQgGHf/k9qvie0EHSvMcYoPiiw6Wf79Ewdo1F7bMW+w==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51204 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <noralf@tronnes.org>)
        id 1hdEay-0001Vf-I8; Tue, 18 Jun 2019 15:56:20 +0200
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
Date:   Tue, 18 Jun 2019 15:56:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



Den 18.06.2019 15.13, skrev Laurent Pinchart:
> The recommended way to specify GEM object functions is to provide a
> drm_gem_object_funcs structure instance and set the GEM object to point
> to it. The drm_cma_gem_create_object_default_funcs() function provided
> by the GEM CMA helper does so when creating the GEM object, simplifying
> the driver implementation. Switch to it, and remove the then unneeded
> GEM-related opertions from rcar_du_driver.

s/opertions/operations/

> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> Daniel, is this what you had in mind ?
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e5e835ea2b6..4cbb82009931 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  static struct drm_driver rcar_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
>  				| DRIVER_ATOMIC,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> +	.gem_create_object      = drm_cma_gem_create_object_default_funcs,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_import	= drm_gem_prime_import,
> -	.gem_prime_export	= drm_gem_prime_export,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
>  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,

If you want to pick up yet another recommendation, you can use
drm_gem_prime_mmap here.

Either way:

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

>  	.dumb_create		= rcar_du_dumb_create,
>  	.fops			= &rcar_du_fops,
> 
