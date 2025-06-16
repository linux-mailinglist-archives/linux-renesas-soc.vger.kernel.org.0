Return-Path: <linux-renesas-soc+bounces-18375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A5ADB504
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 17:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A0543AAF17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6A921CC51;
	Mon, 16 Jun 2025 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QM67Xzx9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894511EA7E1;
	Mon, 16 Jun 2025 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086849; cv=none; b=Hc21zb7xYvTSGRweeyQzOL0pFDSmniciBZrHlXgL8D78HfcGxNB6GOE0+EnXGqm0mndcp8hP3IqW1sw2x7f8YJwS8aM0al5NYd60SqeiCS06KnjNvSmYgSqQ2l5Tmca3KR7lbjh9F9WTjbci2Ud35lsImoPG9bD1qNX22J65v+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086849; c=relaxed/simple;
	bh=aNDbKOOjHpsSVm/u+QK5zaGokrrj0d/sOrb/9/P49gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSRwcog2hxUkTSo9hk79Kgx7LWVgXEn+tRy9NxmfreksQ+Nf6jWR34U2uCdeDwxAyzhx2R8T4VGAppbWb8NnvlilNxDKJXgLPMH4X9Ht9gF/R2PToNNtw+wkKLxlqKSLjhmAfT5k5voos3wV2QL4ps/JPudbr2vs4Y+i3IIoyzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QM67Xzx9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55562346;
	Mon, 16 Jun 2025 17:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750086834;
	bh=aNDbKOOjHpsSVm/u+QK5zaGokrrj0d/sOrb/9/P49gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QM67Xzx99jtSxFtbVWkxi9ny3lkeshszCYykwUWs4y08YnSKdKJ/O207ngwOCheOQ
	 TcS9TWQkg/ZF3B5IT/PRnJdD6ZeF54pordOC63Upxph3fPlOeSwafp7l71BiZ0xPAD
	 TAv/k4j+OiUsCXXAJRp6zom83aLOsyaQGJY4FajI=
Date: Mon, 16 Jun 2025 18:13:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 17/25] drm/renesas/rcar-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Message-ID: <20250616151350.GG10542@pendragon.ideasonboard.com>
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-18-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613090431.127087-18-tzimmermann@suse.de>

Hi Thomas,

Thank you for the patch.

On Fri, Jun 13, 2025 at 11:00:36AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 4c8fe83dd610..dd353fb858ef 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -407,8 +408,8 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			struct drm_mode_create_dumb *args)
>  {
>  	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> -	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	unsigned int align;
> +	int ret;
>  
>  	/*
>  	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented,
> @@ -419,7 +420,9 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	else
>  		align = 16 * args->bpp / 8;
>  
> -	args->pitch = roundup(min_pitch, align);
> +	ret = drm_mode_size_dumb(dev, args, align, 0);
> +	if (ret)
> +		return ret;
>  
>  	return drm_gem_dma_dumb_create_internal(file, dev, args);
>  }

-- 
Regards,

Laurent Pinchart

