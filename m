Return-Path: <linux-renesas-soc+bounces-22215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B476B96025
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 15:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4077E3A4F0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94359326D5F;
	Tue, 23 Sep 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hDcYRamG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A238321425
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758634013; cv=none; b=dl4p/1VSGg+rI9sREpzcT91GQcBAnAGkwKRMySAyAffzRPWogfxHAuUS6T2CdAJLFZTHL/oX9cst/D/zHCPoKmHZJRSDjhki12rOWbJQLS0PVQ4hmXjReSEK/lt904pqhxrBKYUkbqL8Kc9Y+uSUnrrBg7ighOAv4it15NHRX90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758634013; c=relaxed/simple;
	bh=hgUEqnkw5EjDs7V414pyGoHX4/BPaE5zj68fHVMXxGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6z0U2Vr2K2lhYyBp9Rycau1nDyWPykxUX3WkC2oMStUy9QvyOrojEhbaeWVE61rtMfsmEIIZgzSniTSR6Vljacl6cCE9b3R5dV1n3jPfkmBuzdGaaYNsDrgXNakj6MrlR7+TyV3DzVrc7otT9T6XUIBcMYd0ckSlbXX1pQtRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hDcYRamG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 93226346;
	Tue, 23 Sep 2025 15:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758633925;
	bh=hgUEqnkw5EjDs7V414pyGoHX4/BPaE5zj68fHVMXxGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDcYRamGEiPlbcyAO9bsJk7t0z4s6x75k8tf8LaHIGNWFKMtCN65VKK55OxVvdN6q
	 QYN7E1zcUWVaud8Jkp7y8uHg71CVCCFmcLZv68L09NiT9eg7AZJxEzwd1wRe1slKpk
	 5BiLnVUkqieS4TiLfrxorY78NV/C1pHvaWVG338k=
Date: Tue, 23 Sep 2025 16:26:16 +0300
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
	linux-renesas-soc@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Message-ID: <20250923132616.GH20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>

Hi Marek,

On Mon, Sep 22, 2025 at 08:55:03PM +0200, Marek Vasut wrote:
> Introduce TXVMVPRMSET0R_BPP_MASK macro and use FIELD_PREP() to generate
> appropriate bitfield from mask and value without bitshift, assign this
> value into vprmset0r. Remove TXVMVPRMSET0R_CSPC_RGB which is never used,
> replace it with code comment next to TXVMVPRMSET0R_CSPC_YCbCr.
> 
> Replace (mode->flags & DRM_MODE_FLAG_P.SYNC) test with inverted conditional
> (mode->flags & DRM_MODE_FLAG_N.SYNC) and bitwise orr vprmset0r with either

I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
here. A quick grep showed one panel driver setting both the N and P
flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
that ?).

> or both TXVMVPRMSET0R_HSPOL_LOW and TXVMVPRMSET0R_VSPOL_LOW if conditional
> matches.
> 
> Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
> consisten with the current style. Conversion to BIT() and GENMASK()
> macros is done at the very end of this series in the last two patches.
> 
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
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: No functional change expected, this is a preparatory patch which
> partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
> The other patches in this series proceed with that job, piece by piece,
> to make it all reviewable.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  | 12 ++++++------
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 16 +++++++---------
>  2 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 36bd9de61ce05..f91cc35423758 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -489,12 +489,12 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  
>  	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
>  
> -	/* Configuration for Video Parameters */
> -	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
> -		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
> -		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
> -		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
> -		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
> +	/* Configuration for Video Parameters, input is always RGB888 */
> +	vprmset0r = FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, TXVMVPRMSET0R_BPP_24);
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;

Looks good.

>  
>  	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
>  		  | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 99a88ea35aacd..48c3b679b2663 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -170,15 +170,13 @@
>  #define TXVMPSPHSETR_DT_YCBCR16		0x2c
>  
>  #define TXVMVPRMSET0R			0x1d0
> -#define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
> -#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
> -#define TXVMVPRMSET0R_VSPOL_HIG		(0 << 16)
> -#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16)
> -#define TXVMVPRMSET0R_CSPC_RGB		(0 << 4)
> -#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4)
> -#define TXVMVPRMSET0R_BPP_16		(0 << 0)
> -#define TXVMVPRMSET0R_BPP_18		(1 << 0)
> -#define TXVMVPRMSET0R_BPP_24		(2 << 0)
> +#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17) /* 0:High 1:Low */
> +#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16) /* 0:High 1:Low */
> +#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4) /* 0:RGB 1:YCbCr */
> +#define TXVMVPRMSET0R_BPP_MASK		(7 << 0)
> +#define TXVMVPRMSET0R_BPP_16		0
> +#define TXVMVPRMSET0R_BPP_18		1
> +#define TXVMVPRMSET0R_BPP_24		2

Same comment as in previous patches regarding usage of FIELD_PREP().
The rest looks fine.

>  
>  #define TXVMVPRMSET1R			0x1d4
>  #define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)

-- 
Regards,

Laurent Pinchart

