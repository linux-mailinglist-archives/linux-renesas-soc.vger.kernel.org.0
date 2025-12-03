Return-Path: <linux-renesas-soc+bounces-25514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96DC9D92C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 03:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A5B54E029E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 02:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB52238C0D;
	Wed,  3 Dec 2025 02:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zm9LEz3s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B96221271;
	Wed,  3 Dec 2025 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728695; cv=none; b=SjWo+kVPN2OVsA0LE0dXwLDL/OesFq01kKuxoFYZD1sr33suWTr9EXWEsKEeJLjWA6qmL7wKZuMMBo2hAUqlvvNA8Vdtl4TcFTN6NXsniL/V0JPzOOQUSjkDmafUaJ/JfMXUGK9ysxwDSoI1Sh+LQEDwEWWkk3r8/DDkPI2cJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728695; c=relaxed/simple;
	bh=wT2DANF+meWmSjCurwWa1uu27bdlxRsyR8fhhcZwSjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKIATw7Tlyl9o3m8jdVvO6iOQn9X8McoZFJUiDFMP55Iv1wXu9nbsJbAUWnKiU0TUtLJdSCU8lcZtZU7V4mGcobKoYEu0JXStcIB+JN5RQ37hOSQo9lJ0AoU+EypUA01OQL+rLBlK+YCdCRf5yr496PG+6wZVcsrzpzqcDkQmhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zm9LEz3s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net [221.113.100.198])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BB07BB5;
	Wed,  3 Dec 2025 03:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764728556;
	bh=wT2DANF+meWmSjCurwWa1uu27bdlxRsyR8fhhcZwSjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm9LEz3sW38O4ZicxkXZc0V/Iro4w3X7zJjw8KNFg+2ze6yk/mBYJpq2i9srsjXHe
	 S69TuDVchr9BOtbQbMRWe5LGjY5mMH5toCiM33oU4/VIyO84bhyH5lttU7EHlNuiLq
	 1ap/LVMcMVzAig95ZgWZDrtJgj5flUTki7OgIUSo=
Date: Wed, 3 Dec 2025 11:24:30 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC
 and !DRM_MODE_FLAG_P.SYNC
Message-ID: <20251203022430.GK8219@pendragon.ideasonboard.com>
References: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202181146.138365-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thank you for the patch.

On Tue, Dec 02, 2025 at 07:11:06PM +0100, Marek Vasut wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart

