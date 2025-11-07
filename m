Return-Path: <linux-renesas-soc+bounces-24357-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C2C41F17
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 00:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 364CC3B55D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 23:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2EA30FF2E;
	Fri,  7 Nov 2025 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p8UyO+at"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3117E30FC24;
	Fri,  7 Nov 2025 23:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762557818; cv=none; b=LCitBVSlXvtklNeJ7V3ut/c6YT5G1qAXi/pFnHHwwjrkGO+17Jg2C/V0BA9Zt1mp0XxEglbmz9XRxIcJadQPrXkrYvkjRaAdVF8/qzIs60a+HA/uLlcl8OWoMJNNkxiYv09Y7Rze8aNHx8ghS8WBVk22HbyBNQH87qxoeG6gmmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762557818; c=relaxed/simple;
	bh=ckYpq461PfsLtpuZRSdnO1Hpr8pG5yQGPSwPZgGzK/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSJFbY5/2JCMWN3RbOBldITVt3SOXYe43/9KC0lRrTBiFZ8lf/plWB9m5WuN1XkM+DXzTRmbIuhlxXgLCC036NVFjzfDn7bs0doOCY23uYQpbrKF1rr6EiUzXFA3VSVy0teslRssHs8V2ELd/S6JrTsq9KiQiCh5K1+l2npJ+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p8UyO+at; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 641187E4;
	Sat,  8 Nov 2025 00:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762557698;
	bh=ckYpq461PfsLtpuZRSdnO1Hpr8pG5yQGPSwPZgGzK/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8UyO+atuJKTkeCoAICUyTPcilTtuIckKBlivjMAwUSQ/Q0C8T0T1Z7aZ8zCk3CaU
	 0nt+f6cZ9nDryYzBbkXlr5hOLc+bVRQ9kJNfdhccwGYWgaIVLaHZ5DBJucROqkwjrA
	 6ckisRlHFq5A5SNvaHGl/LtUFZz1tfTez0ce2JnA=
Date: Sat, 8 Nov 2025 01:23:29 +0200
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
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
Message-ID: <20251107232329.GI5558@pendragon.ideasonboard.com>
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>

On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.

Could you please explain what broke ? What panel are you using ?

> The previous behavior
> was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
> previous behavior for maximum compatibility.
> 
> Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 9413b76d0bfce..98bd7f40adbea 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -492,9 +492,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  
>  	/* Configuration for Video Parameters, input is always RGB888 */
>  	vprmset0r = TXVMVPRMSET0R_BPP_24;
> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;

I don't think this restores the previous behaviour. You would need to
write

	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;

> -	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
> +	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
>  		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;

Same here.

>  
>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)

-- 
Regards,

Laurent Pinchart

