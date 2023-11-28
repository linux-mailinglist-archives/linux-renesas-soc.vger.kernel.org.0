Return-Path: <linux-renesas-soc+bounces-339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1567FB8CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 12:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BBB5B20C02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFEC46421;
	Tue, 28 Nov 2023 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v8+IzSk3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8AE18F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:02:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D62BB289;
	Tue, 28 Nov 2023 12:01:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701169295;
	bh=aOAHm+7QlLBOLkQLIk6VxL4p/A6pjROBAZGcdianszY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v8+IzSk347HNHTPwNz7exqJZKmnjvWzzfpUbvmt6+wJs24E02b+XylMVxxev6yACS
	 15V6JrhH76sVK6ycJAsuGY2ghEhtg1XN8CBo6z3kshcrcsMHgycpi7ONSwOWQ1xqUE
	 t8kTepEHPUYGy/lHMwwpZEuB0YuJ8qi0Knl7Mbqc=
Date: Tue, 28 Nov 2023 13:02:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
	airlied@gmail.com, suijingfeng@loongson.cn, javierm@redhat.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] drm/xlnx: Do not include <drm/drm_plane_helper.h>
Message-ID: <20231128110216.GE25590@pendragon.ideasonboard.com>
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-9-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128104723.20622-9-tzimmermann@suse.de>

Hi Thomas,

Thank you for the patch.

On Tue, Nov 28, 2023 at 11:45:24AM +0100, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Assuming you've compile-tested the driver,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please get this merged through drm-misc as part of the series if
possible.

> ---
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index a7f8611be6f42..db3bb4afbfc46 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -27,7 +27,6 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_mode_config.h>
>  #include <drm/drm_plane.h>
> -#include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>

-- 
Regards,

Laurent Pinchart

