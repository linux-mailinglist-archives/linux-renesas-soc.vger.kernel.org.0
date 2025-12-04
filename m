Return-Path: <linux-renesas-soc+bounces-25552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC721CA3AE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 13:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDFA530350D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 12:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B84F3128C8;
	Thu,  4 Dec 2025 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nDwr216k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F52D47EF;
	Thu,  4 Dec 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852914; cv=none; b=V5AUSh/5FYecV4vIV5fYbTNzJ2ozFicrbsGTFHV0XEzqTyms2AQaHd/0v6KRb7VHjz5ZuZCRjNAdRdXuh5AeqJNLzySaxLFSXT5/UggsKTBjWdD/6wvlThMG0pljO6hz0qvU/917EkZOBKDLgCgoYtID89a0632W4K8JNHFCQNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852914; c=relaxed/simple;
	bh=vOyqxAONuV3UvG9nQ0iP8PVekVL+G46eVPsya/9xNrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic0dYVNHrt0MKCPZILgbuhgf3m5vjJ6I+b9wWKT+l1o/ENQ1tSiHqr2j/+sVoRZYvztbfDrkLY7IOwPTSTa1Qh1MVmXGask+tMpdfM9LZ9/NR09ZQDxqOjcg92wJ8uUY4WiuaUNrvBOC1zcGwtin6us9GF+2jGUHcB4Zn9UfdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nDwr216k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5663A2D8;
	Thu,  4 Dec 2025 13:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764852766;
	bh=vOyqxAONuV3UvG9nQ0iP8PVekVL+G46eVPsya/9xNrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDwr216kOG2KYuQY4mNPr8g9vQwMctFJWZvj+HY1gZF7zoxf9quucf9Mbe0XB/c72
	 FkxXRkQwUFMDCB6gVcLZCRd4TbbpEhRDwFpswf2rf87/xPvTZsWm0VOZwIE8qPJ+gI
	 MqH+Ne6iT7oQ8Wef2I6fc0x9jO5kqtnykz3Qs/Z4=
Message-ID: <1f580f1d-8ed5-4167-8991-1909c350d00e@ideasonboard.com>
Date: Thu, 4 Dec 2025 14:54:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2025 20:11, Marek Vasut wrote:
> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
> for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
> previous behavior for maximum compatibility.
> 
> The change of behavior is visible below, consider Vertical mode->flags
> for simplicity sake, although the same applies to Horizontal ones:
> 
> Before 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
> 
> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> 
> After 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags") :
> 
> - DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
> - DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
> - Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
> 
> The "Neither" case behavior is different, because DRM_MODE_FLAG_N[HV]SYNC is
> really not equivalent !DRM_MODE_FLAG_P[HV]SYNC .
> 
> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, looks good to me. Pushing to drm-misc-next.

 Tomi

> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Update commit message
>     - Use only !P[HV]SYNC
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 9413b76d0bfce..4ef2e3c129ed7 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -492,9 +492,9 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  
>  	/* Configuration for Video Parameters, input is always RGB888 */
>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
>  
>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)


