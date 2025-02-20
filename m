Return-Path: <linux-renesas-soc+bounces-13391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5DA3D620
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 11:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA2EE189922E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5121F151B;
	Thu, 20 Feb 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js2YtSm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7831F1508;
	Thu, 20 Feb 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046123; cv=none; b=tW+qNeaT5JdKrSAy1Soh3GkLYLAsuHGmvBvWPQkDNLYkrClFXrw9BokLAXCrFObP0fbhGopMHby/Kjfm1gks+jkL0rS7vMS2jz4IDap5BzhdbBt52d4cCQ/y1/LxI1mNre6OAsieFo5jFr1JB239NIPaPReOpA4mbpAqE1pqSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046123; c=relaxed/simple;
	bh=qEEkaGFEKdByIXhxlRz4s/blmxr0i3FKT7WWs7RYcVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rzt8O2zvgjaCutDXkPax04BGJfGafJtg+OUIAuYfLgw+M0ayaM9v+0Goaz7lorkBHZB6vcayEwsqVD6sZoDI/YR4XiboqHV6y7JMDFGULvD76oxBg2Fpy+azvchx5pSCE+BHj1tgCrhIx+JrNktE9RuVenzVvQFLoi5Zp0YZ+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js2YtSm2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740046121; x=1771582121;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qEEkaGFEKdByIXhxlRz4s/blmxr0i3FKT7WWs7RYcVE=;
  b=Js2YtSm23SX09ECAeyG+E0bWqFZk8fw8HtXh+EazJvcBVjkWoaUmFc9i
   YcXcso8mk/RXYY2t90n1aDS3b5Nne4uLFwkm8gX+zrDJFxwLYb7K7PcPi
   H+JxIjnqpu/KHTXIt9osI76mChz0+aM0ggGLJd78JWjiRWt1ZHRiDJ/h8
   fV+CetiDk3baXJKMnajlkikHuobf1y5fVY5C/zgkaygJ8MrS1f6QYfkXK
   SpMDy7wNnipsgrepEnA8KuDjFzKhAfbqxXOEna7kRJwyKZ+tk/2yETxnj
   X3HAoZCDZ/qT6uzNeMTVDah/Qx8MLyD3m3oENWtW6XNniKk+mg1UzkOFH
   Q==;
X-CSE-ConnectionGUID: itITFt9BRUKHcKMimWcyCw==
X-CSE-MsgGUID: tscZdd6nRie/VFF5DOAi4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44734925"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="44734925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:08:40 -0800
X-CSE-ConnectionGUID: UUemawqKTUWXKRiDeorKDQ==
X-CSE-MsgGUID: hc9L0Du1SByRgSK2VuJbDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120221268"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.161]) ([10.245.244.161])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:08:36 -0800
Message-ID: <92c1b182-5a0b-4d13-9b16-172ac970b62e@intel.com>
Date: Thu, 20 Feb 2025 10:08:33 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] drm/xe: Compute dumb-buffer sizes with
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
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-24-tzimmermann@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250218142542.438557-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/02/2025 14:23, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Align the pitch to a multiple of 8. Align the
> buffer size according to hardware requirements.
> 
> Xe's internal calculation allowed for 64-bit wide buffer sizes, but
> the ioctl's internal checks always verified against 32-bit wide limits.
> Hance, it is safe to limit the driver code to 32-bit calculations as
> well.
> 
> v3:
> - mention 32-bit calculation in commit description (Matthew)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 78d09c5ed26d..b34f446ad57d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -9,6 +9,7 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_device.h>
> @@ -2672,14 +2673,13 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
> +	if (err)
> +		return err;
>   
>   	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>   			       DRM_XE_GEM_CPU_CACHING_WC,


