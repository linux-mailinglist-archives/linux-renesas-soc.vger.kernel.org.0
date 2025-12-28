Return-Path: <linux-renesas-soc+bounces-26146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C6CE54D2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 629FF300926B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2B518EFD1;
	Sun, 28 Dec 2025 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YF9Yzko4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C81DFF7;
	Sun, 28 Dec 2025 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766943327; cv=none; b=uMSRJ0T3OwHdY/70vtA8j3FmwWc/xD9uoel96nRLEnjymTYHEgrwWLVp3jsF1O9senr+SXbnRxNacf1bEvXih/YGoc85tmpOAwbEP1e1PVOu/Y/5dhkZigrD9wnjUNvrdgkApsjuspj8R6GUuU8+D8S/usW/BTHChEWI3MHf+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766943327; c=relaxed/simple;
	bh=1Nf85hLa6O7EJbvcClw6HPqXSvZF/VA6kVnNDzF4/Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/30R+TF28HU26m15vZ+yZ6HBcuCXv0Ovfqb38WOPs+K/Nc5iTndm0sHIjnfzsXqmUGTJ2X2BlkvJVnzUpSr4zl/rE4kwPtIO5wZrPtZ7Mm1wugRNwq1s6rNq5eNHvXItnnovxuflncgSnpZcIgzTSOBW4j6hPAAn1XQlKvXWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YF9Yzko4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B433C4BB;
	Sun, 28 Dec 2025 18:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766943307;
	bh=1Nf85hLa6O7EJbvcClw6HPqXSvZF/VA6kVnNDzF4/Zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YF9Yzko4BhCL15ufnSeecGIzQVYQ1rFNlHVKCPyQfIK/PaH8aNpj8eXgx8WJtPERw
	 Fd1UXlKpmfYALqmh8r5IJkL1vmz7sDBX1Nj+jQXZczV/mxM5lrovOJGXbbImCqY9vc
	 zOgc/po/LrEkk8hIVEWlOHpQf0vUNazwHBu6a/mg=
Date: Sun, 28 Dec 2025 19:35:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/8] drm/msm/dpu: don't mix devm and drmm functions
Message-ID: <20251228173503.GA16606@pendragon.ideasonboard.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
 <20251228-wb-drop-encoder-v4-1-58d28e668901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251228-wb-drop-encoder-v4-1-58d28e668901@oss.qualcomm.com>

On Sun, Dec 28, 2025 at 07:21:33PM +0200, Dmitry Baryshkov wrote:
> Mixing devm and drmm functions can result in a use-after-free errors.
> Change dpu_writeback_init() to use drmm_

The commit message should explain what the problem is. "can result" is
very vague.

> Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 7545c0293efb..6f2370c9dd98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>  
>  #include "dpu_writeback.h"
>  
> @@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
>  	struct dpu_wb_connector *dpu_wb_conn;
>  	int rc = 0;
>  
> -	dpu_wb_conn = devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
> +	dpu_wb_conn = drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNEL);
>  	if (!dpu_wb_conn)
>  		return -ENOMEM;
>  

-- 
Regards,

Laurent Pinchart

