Return-Path: <linux-renesas-soc+bounces-18374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC58ADB4FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 17:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A503A3AA9B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E1B21CA08;
	Mon, 16 Jun 2025 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cd+rEl4L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097D21771A;
	Mon, 16 Jun 2025 15:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086809; cv=none; b=qQMH/MyTb7C94CJc5uDDcZ6R4t9OU1nbwto6rNcgtcNiPO0P8yYKvoI9DQfHNX4qEt1NxZmAVC7EPQO9qkB+/vtGAMOQpfBT4ce+1SAx2eGpdFn4GCO+JrAwPx86blAyO2Mg3IHXW9jq+rpzrbmEtsGM+ZiXsTZmBv5ycX9g1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086809; c=relaxed/simple;
	bh=0HNCExAqJ+LaxU1ueCxhXgS3CX0/GTT4qiqhOCeleZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urExBnYpaCnDvqiwbtk3w8nTzAFeFheKvaQP7cpj4JjGm3EYIfENAP+WyqwsTfKFgcKjZ7ZFg4xBjr7sVOZMJV4WNVTqkgwCKrvhGtQzMzOneYcicOw4zu8hJxaNu3P0ZqgvSbdaQZsYvICQMpaPSYpjilUtF8/JU+Kaa4QnuXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cd+rEl4L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 357B7346;
	Mon, 16 Jun 2025 17:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750086793;
	bh=0HNCExAqJ+LaxU1ueCxhXgS3CX0/GTT4qiqhOCeleZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cd+rEl4LeP/ZHIM4gWEMYhjqXD0/rin9VjD52OOHdZvIkqhRoZaWZn00QN6bJnKA6
	 pVExi1IbQLR4xfrlBC/dpwg8ODX0SRU7pxY8ZM2CFH8LzJOKfAccxMJQ+5H54VHgVS
	 rCMxoyNkNFjfyxiC7+vvZacma5jP5aesiq8AWwhs=
Date: Mon, 16 Jun 2025 18:13:09 +0300
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
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <20250616151309.GF10542@pendragon.ideasonboard.com>
References: <20250613090431.127087-1-tzimmermann@suse.de>
 <20250613090431.127087-26-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613090431.127087-26-tzimmermann@suse.de>

Hi Thomas,

Thank you for the patch.

On Fri, Jun 13, 2025 at 11:00:44AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index b47463473472..7ea0cd4f71d3 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_fourcc.h>
> @@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
>  				    struct drm_mode_create_dumb *args)
>  {
>  	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
> -	unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int ret;
>  
>  	/* Enforce the alignment constraints of the DMA engine. */
> -	args->pitch = ALIGN(pitch, dpsub->dma_align);
> +	ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
> +	if (ret)
> +		return ret;
>  
>  	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
>  }

-- 
Regards,

Laurent Pinchart

