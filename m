Return-Path: <linux-renesas-soc+bounces-15061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B40DCA759BB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 13:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B36D168B41
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 11:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998E71C4A13;
	Sun, 30 Mar 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J8+0dhi9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA337175D50
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Mar 2025 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743333184; cv=none; b=Fze+lJgiYvyeZpfySmko8bX25opNh75vd12/2s7sLoLH4Oqcb0AueiaF02TW/jgXSyeCyy4cuuz0bFfFTG75b0mJB8WMPCFuWueKNcvk9ifWkp6d7fjITMjpCJbQK44li+nn/Ykd+Um9qgotDNGuKGCBVF8yowEqfmkOBfD2M2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743333184; c=relaxed/simple;
	bh=3hE6jH0/uHaWAN9ulu4gI3FtnCxcQcxt3f7Fh3GP81o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlU6DTebkv20O+lF364PvxVLq1vtUqUwfD1inrpgC+PB+mEK5IQUJvhQNv8h2UnuKt0R7vpTwIVbDUT84aGnH6Hro0f3xFPfkZcC9va4HOtqTsfIuInCmRJTCK/zX3EECUKb8/vgDkc5ZYFWQDWpxkpnS9ur2w1Q4kF9FticdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J8+0dhi9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EF5A11AA;
	Sun, 30 Mar 2025 13:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743333063;
	bh=3hE6jH0/uHaWAN9ulu4gI3FtnCxcQcxt3f7Fh3GP81o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8+0dhi96ZFdmZNR+MTl09+o4ryC+lWgb9FOAXzzqTCDB/2qCvKinilzA1GUp9RKG
	 iG+qcqg/sZ/wlOpJuJWNlHGYcoswbZ36+oOdfvZa8NX9WGHXlTF16eoNS2mL+myPi1
	 DF6fEZI9c9lNySjb6KtVvR5PSX/jKHqEXKkJ8FbE=
Date: Sun, 30 Mar 2025 14:12:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop bpp variable from
 struct rzg2l_du_format_info
Message-ID: <20250330111229.GA8840@pendragon.ideasonboard.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
 <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330102357.56010-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Sun, Mar 30, 2025 at 11:23:52AM +0100, Biju Das wrote:
> Drop the unused variable bpp from struct rzg2l_du_format_info.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
>  * New patch.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index 90c6269ccd29..1a428ab3c424 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -38,19 +38,16 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  	{
>  		.fourcc = DRM_FORMAT_XRGB8888,
>  		.v4l2 = V4L2_PIX_FMT_XBGR32,
> -		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ARGB8888,
>  		.v4l2 = V4L2_PIX_FMT_ABGR32,
> -		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGB888,
>  		.v4l2 = V4L2_PIX_FMT_BGR24,
> -		.bpp = 24,
>  		.planes = 1,
>  		.hsub = 1,
>  	}
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> index 876e97cfbf45..e2c599f115c6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> @@ -23,7 +23,6 @@ struct sg_table;
>  struct rzg2l_du_format_info {
>  	u32 fourcc;
>  	u32 v4l2;
> -	unsigned int bpp;
>  	unsigned int planes;
>  	unsigned int hsub;
>  };

-- 
Regards,

Laurent Pinchart

