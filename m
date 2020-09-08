Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C842261DDB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 21:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbgIHTnN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 15:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730881AbgIHPwh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:52:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8592CC061261
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2020 08:43:13 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96BCA47;
        Tue,  8 Sep 2020 17:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599579781;
        bh=Q9Exi0QsBh2DAJVgX/S7VrkPK2whLlZIP60tBjMCF8Q=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HCxnng2TzFcm91m+d2Yx/wh5b4T6MLy55vKLFOX98htnwPA8uOrWa7LU5hVnOTkeZ
         OnUiOPBYEVkC9ajeBmIYJgEt3wTInpIJ/wobQiACHhcCEF24nPz94BskQCL7EVqyKx
         4oIhZ1PF5cfbexvQ8kvMQYheNvduhp6AxzPbC/qc=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
Date:   Tue, 8 Sep 2020 16:42:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 06/08/2020 03:26, Laurent Pinchart wrote:
> When creating a frame buffer, the driver verifies that the pitches for
> the chroma planes match the luma plane. This is done incorrectly for
> fully planar YUV formats, without taking horizontal subsampling into
> account. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 52 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  1 +
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 482329102f19..2fda3734a57e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -40,6 +40,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_RGB565,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -47,6 +48,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_ARGB555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -61,6 +63,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_XBGR32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
>  		.edf = PnDDCR4_EDF_RGB888,
>  	}, {
> @@ -68,6 +71,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_ABGR32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
>  		.edf = PnDDCR4_EDF_ARGB8888,
>  	}, {
> @@ -75,6 +79,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_UYVY,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 2,
>  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -82,6 +87,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_YUYV,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 2,
>  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -89,6 +95,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_NV12M,
>  		.bpp = 12,
>  		.planes = 2,
> +		.hsub = 2,
>  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -96,6 +103,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_NV21M,
>  		.bpp = 12,
>  		.planes = 2,
> +		.hsub = 2,
>  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
>  		.edf = PnDDCR4_EDF_NONE,
>  	}, {
> @@ -103,6 +111,7 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_NV16M,
>  		.bpp = 16,
>  		.planes = 2,
> +		.hsub = 2,
>  		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
>  		.edf = PnDDCR4_EDF_NONE,
>  	},
> @@ -115,156 +124,187 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>  		.v4l2 = V4L2_PIX_FMT_RGB332,
>  		.bpp = 8,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ARGB4444,
>  		.v4l2 = V4L2_PIX_FMT_ARGB444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_XRGB4444,
>  		.v4l2 = V4L2_PIX_FMT_XRGB444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBA4444,
>  		.v4l2 = V4L2_PIX_FMT_RGBA444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBX4444,
>  		.v4l2 = V4L2_PIX_FMT_RGBX444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ABGR4444,
>  		.v4l2 = V4L2_PIX_FMT_ABGR444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_XBGR4444,
>  		.v4l2 = V4L2_PIX_FMT_XBGR444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRA4444,
>  		.v4l2 = V4L2_PIX_FMT_BGRA444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRX4444,
>  		.v4l2 = V4L2_PIX_FMT_BGRX444,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBA5551,
>  		.v4l2 = V4L2_PIX_FMT_RGBA555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBX5551,
>  		.v4l2 = V4L2_PIX_FMT_RGBX555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ABGR1555,
>  		.v4l2 = V4L2_PIX_FMT_ABGR555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_XBGR1555,
>  		.v4l2 = V4L2_PIX_FMT_XBGR555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRA5551,
>  		.v4l2 = V4L2_PIX_FMT_BGRA555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRX5551,
>  		.v4l2 = V4L2_PIX_FMT_BGRX555,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGR888,
>  		.v4l2 = V4L2_PIX_FMT_RGB24,
>  		.bpp = 24,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGB888,
>  		.v4l2 = V4L2_PIX_FMT_BGR24,
>  		.bpp = 24,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBA8888,
>  		.v4l2 = V4L2_PIX_FMT_BGRA32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGBX8888,
>  		.v4l2 = V4L2_PIX_FMT_BGRX32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ABGR8888,
>  		.v4l2 = V4L2_PIX_FMT_RGBA32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_XBGR8888,
>  		.v4l2 = V4L2_PIX_FMT_RGBX32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRA8888,
>  		.v4l2 = V4L2_PIX_FMT_ARGB32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_BGRX8888,
>  		.v4l2 = V4L2_PIX_FMT_XRGB32,
>  		.bpp = 32,
>  		.planes = 1,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_YVYU,
>  		.v4l2 = V4L2_PIX_FMT_YVYU,
>  		.bpp = 16,
>  		.planes = 1,
> +		.hsub = 2,
>  	}, {
>  		.fourcc = DRM_FORMAT_NV61,
>  		.v4l2 = V4L2_PIX_FMT_NV61M,
>  		.bpp = 16,
>  		.planes = 2,
> +		.hsub = 2,
>  	}, {
>  		.fourcc = DRM_FORMAT_YUV420,
>  		.v4l2 = V4L2_PIX_FMT_YUV420M,
>  		.bpp = 12,
>  		.planes = 3,
> +		.hsub = 2,

I guess vertical subsampling is handled distinctly?
(perhaps the height of the plane or such?)

>  	}, {
>  		.fourcc = DRM_FORMAT_YVU420,
>  		.v4l2 = V4L2_PIX_FMT_YVU420M,
>  		.bpp = 12,
>  		.planes = 3,
> +		.hsub = 2,
>  	}, {
>  		.fourcc = DRM_FORMAT_YUV422,
>  		.v4l2 = V4L2_PIX_FMT_YUV422M,
>  		.bpp = 16,
>  		.planes = 3,
> +		.hsub = 2,
>  	}, {
>  		.fourcc = DRM_FORMAT_YVU422,
>  		.v4l2 = V4L2_PIX_FMT_YVU422M,
>  		.bpp = 16,
>  		.planes = 3,
> +		.hsub = 2,
>  	}, {
>  		.fourcc = DRM_FORMAT_YUV444,
>  		.v4l2 = V4L2_PIX_FMT_YUV444M,
>  		.bpp = 24,
>  		.planes = 3,
> +		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_YVU444,
>  		.v4l2 = V4L2_PIX_FMT_YVU444M,
>  		.bpp = 24,
>  		.planes = 3,
> +		.hsub = 1,
>  	},
>  };
>  

I wonder when we can have a global/generic set of format tables so that
all of this isn't duplicated on a per-driver basis.


> @@ -311,6 +351,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  {
>  	struct rcar_du_device *rcdu = dev->dev_private;
>  	const struct rcar_du_format_info *format;
> +	unsigned int chroma_pitch;
>  	unsigned int max_pitch;
>  	unsigned int align;
>  	unsigned int i;
> @@ -353,8 +394,17 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	/*
> +	 * Calculate the chroma plane(s) pitch using the horizontal subsampling
> +	 * factor. For semi-planar formats, the U and V planes are combined, the
> +	 * pitch must thus be doubled.
> +	 */
> +	chroma_pitch = mode_cmd->pitches[0] / format->hsub;
> +	if (format->planes == 2)
> +		chroma_pitch *= 2;
> +
>  	for (i = 1; i < format->planes; ++i) {
> -		if (mode_cmd->pitches[i] != mode_cmd->pitches[0]) {
> +		if (mode_cmd->pitches[i] != chroma_pitch) {
>  			dev_dbg(dev->dev,
>  				"luma and chroma pitches do not match\n");

Is this statement still sufficient?
I'd perhaps say 'are not compatible' or 'are not correct'. - but its
only a debug print, so it really doesn't matter.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>



>  			return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> index 0346504d8c59..8f5fff176754 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> @@ -22,6 +22,7 @@ struct rcar_du_format_info {
>  	u32 v4l2;
>  	unsigned int bpp;
>  	unsigned int planes;
> +	unsigned int hsub;
>  	unsigned int pnmr;
>  	unsigned int edf;
>  };
> 

-- 
Regards
--
Kieran
