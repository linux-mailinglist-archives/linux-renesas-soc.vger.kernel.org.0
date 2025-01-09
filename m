Return-Path: <linux-renesas-soc+bounces-12020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA5A07CD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 17:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5843916131C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479221E092;
	Thu,  9 Jan 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQDMDbfd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94F21D5B1;
	Thu,  9 Jan 2025 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438774; cv=none; b=iNVqD5zKVtuKs5d0WBIl+Fl9qPInKzLBcCxmkb/e4qS/rLo24SrHBRcbjL7KDCEg28rX1A4fwBDbzQ/9a08OLlQA4L7EM7i79tWHmuPmdCklqXdIUghjh3K3dyhfQ1bKUaSrCflkymZpYDuSiegVslH0Wts0l7QGl+p/hl9J7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438774; c=relaxed/simple;
	bh=p4XkuorIpNoSEU2HBpQ1O27DvwV5LvulfkLyMZfyAfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdNM3oqfxih/7AU1+UEAkFco/4Y7NWjWofMAfskErSZbpQLALvhWFsSwxgtCNBRYxqL/z5N6TNO8DkFoNrRLdRi1jCgrr9se0dY+JQ8YLBQe+cDNag1FBkZu57UIHdMwQfDMLMNDx5rghAnBB+ObkXBM02yWX5YQq7pvVIH0Z9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQDMDbfd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736438773; x=1767974773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p4XkuorIpNoSEU2HBpQ1O27DvwV5LvulfkLyMZfyAfg=;
  b=XQDMDbfds7k1YRVTA3/aB7Jc8fXwYRo4zeurPEzKkG90x+NePd+lfe3N
   M/ZR37wCOQv4247fM/XybJYETV7+mpA5du06RDyGc6g9ao+S313Nd7zVq
   0gMNuPMPvy9PQuVmfS06FDbFK3L+S15rwNrUpDTd8M5uEm7IXAICyDqBP
   Dhj4RqePL8uVwoI6ebj28a9Gb4Bsmi1Eg7fWGig0kYFuovR8iDjh9bgjB
   FKYrhn1cBuRUp13iNE2l30nOzM4wfbYb0fdLKGx2Ug0qJNZmojG3dkal7
   yF9PAOpBkVscXQRDvAjug5mxrx3+hqQQrJqCRMG6IPE/a8apk7huG+GsW
   A==;
X-CSE-ConnectionGUID: YXTjDnMbTw+YBtQZZUU9DA==
X-CSE-MsgGUID: hTWdc08NSOeYUmeXggYW2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62086130"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="62086130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:05:55 -0800
X-CSE-ConnectionGUID: gYM7jUeoQau2+oJbNyjiWQ==
X-CSE-MsgGUID: 8PkbOk3sQpqIzHIL0w463A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103967271"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.241]) ([10.245.245.241])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:05:50 -0800
Message-ID: <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
Date: Thu, 9 Jan 2025 16:05:47 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250109150310.219442-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/01/2025 14:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..d75e3c39ab14 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_bo *bo;
>   	uint32_t handle;
> -	int cpp = DIV_ROUND_UP(args->bpp, 8);
>   	int err;
>   	u32 page_size = max_t(u32, PAGE_SIZE,
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>   
> -	args->pitch = ALIGN(args->width * cpp, 64);
> -	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> -			   page_size);
> +	err = drm_mode_size_dumb(dev, args, SZ_64, page_size);

AFAICT this looks to change the behaviour, where u64 size was 
technically possible and was allowed given that args->size is u64, but 
this helper is limiting the size to u32. Is that intentional? If so, we 
should probably make that clear in the commit message.

> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,


