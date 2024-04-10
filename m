Return-Path: <linux-renesas-soc+bounces-4501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743058A0376
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Apr 2024 00:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECB81C2166B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 22:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670611FA5;
	Wed, 10 Apr 2024 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N0ap8LXN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263897F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 22:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712788593; cv=none; b=tj6vfmmAuSz5KSZ0r4VdWon1quINnW91f9ZTjmUqGTrhrFIksC4JqcbW8mLsfNxNixWlpreTMmZLLe4ka6Oms803bDKklA5STUtFUEfxJc+dQtyoRA9KqlvxrIGldSj33ODvj/DjkxtvBdqiFIXyn5BwHJDX0fg0bo3lfoHSOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712788593; c=relaxed/simple;
	bh=koaH8Xn+/YPuIpTP7xQmr6xBWwY0n0cmfs8t/FkmPWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPN+Um++lhPrwzw3s7ZHU27/MBnhmi3DGWcDJvgQ9X+tHjLo8nze8u2tAZSYGTtGvW1sKPdMV7c7JBvlnZhZ61o7kB/Sq2uuVqBcCBh5Fkm8FMjvQ2Uj3LsAAeG5GDQMa3wan1NjX1k/wkYGhE6x1N6LpK+L9iUAj7ir4qgfQ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N0ap8LXN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (dynamic-095-117-103-138.95.117.pool.telefonica.de [95.117.103.138])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FAE9673;
	Thu, 11 Apr 2024 00:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712788547;
	bh=koaH8Xn+/YPuIpTP7xQmr6xBWwY0n0cmfs8t/FkmPWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0ap8LXNzv3yShT5lXGhx1UIDnzdTyj+eS06abpdetHFpSd1hiMDvvuPxeq1G1tWe
	 MIMyBANrKbiKKAFw0/brjIllwnaK3+DwW4hq+1OgDQiHSHXa5JpQbcB+3gDQzjOQc1
	 z0L6L/6+PxID1E2zwcT5gQ11+0looPskhnuPW9iA=
Date: Thu, 11 Apr 2024 01:36:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 20/21] drm/rcar-du: Allow build with COMPILE_TEST=y
Message-ID: <20240410223620.GD23594@pendragon.ideasonboard.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-21-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-21-ville.syrjala@linux.intel.com>

Hi Ville,

Thank you for the patch.

On Mon, Apr 08, 2024 at 08:04:25PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow rcar-du to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 2dc739db2ba3..df8b08b1e537 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -2,7 +2,7 @@
>  config DRM_RCAR_DU
>  	tristate "DRM Support for R-Car Display Unit"
>  	depends on DRM && OF
> -	depends on ARM || ARM64
> +	depends on ARM || ARM64 || COMPILE_TEST

I'll trust 0-day to tell us if this causes any issue on exotic (from the
R-Car DU driver's point of view) platforms.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I expect you to push this patch, please let me know if you don't intend
to.

>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER

-- 
Regards,

Laurent Pinchart

