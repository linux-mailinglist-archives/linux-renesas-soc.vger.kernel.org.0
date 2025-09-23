Return-Path: <linux-renesas-soc+bounces-22212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B5B95BE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E3E16A0AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1810732274A;
	Tue, 23 Sep 2025 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WP1egfIl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB12E8881
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628369; cv=none; b=huPVwKmcLDfbTRrVb36YuWMI+bYP3+FfB5YiCtn9jr+GkbFzdjH68T8rSZjzWckVfeDNxpwj81vtqOj1C9Sty3ucAKSGy6fHMftMHr1/ZSfHIHXxVvvvLV33CNHQyBfQ9Jf7P2ocWDpRI6Uv3Atq4ZEdym6z7LwtPX2eCnmsMsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628369; c=relaxed/simple;
	bh=O8hBfkLdAyjg1EPS2VYk+Lhj9c9w4A3WYvzYMETnyio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlUpir507HbsjlRQrI6WqxQ3EV9JnEmVDp7JlUvh5vix7/T+gtoImDNMCTkVPMukcVKOIiWegOcVkVSusnjFCsskWDdaFR+/b3cEmPB85TopVtHpRnUpac2PNLR6lG7tSgHDh2uwfxN0FoYTesU8grQL1UpnrTCmpa+1fp2VMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WP1egfIl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65E60346;
	Tue, 23 Sep 2025 13:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758628281;
	bh=O8hBfkLdAyjg1EPS2VYk+Lhj9c9w4A3WYvzYMETnyio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WP1egfIl56qh9w7ZkHbkB/RVst2O2RBst9aX0vjgQJO+QDrwiTAmnHhYiafDCs4+s
	 TeXikE8COPoyVG8OEO3Zz/ic9n8WT3bOROd4xszfj7EOchvsUfUJHGq/TFLonv/iWO
	 oFeUjCqfGBYpNVbLsgJNCf0XOaM2niW9FTQcwQBY=
Date: Tue, 23 Sep 2025 14:52:12 +0300
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
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/9] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Message-ID: <20250923115212.GF20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-6-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-6-marek.vasut+renesas@mailbox.org>

On Mon, Sep 22, 2025 at 08:55:01PM +0200, Marek Vasut wrote:
> Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
> appropriate bitfield from mask and value without bitshift.
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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 17 ++++++++++-------
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h    | 11 ++++++-----
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 2374cbe3768f2..1591837ff472c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -458,13 +458,16 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  	u32 vprmset4r;
>  
>  	/* Configuration for Pixel Stream and Packet Header */
> -	if (dsibpp == 24)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> -	else if (dsibpp == 18)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> -	else if (dsibpp == 16)
> -		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
> -	else {
> +	if (dsibpp == 24) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB24));
> +	} else if (dsibpp == 18) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB18));
> +	} else if (dsibpp == 16) {
> +		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
> +				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB16));
> +	} else {
>  		dev_warn(dsi->dev, "unsupported format");
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 808861aaf3bfe..1a8d377ea85fc 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -167,11 +167,12 @@
>  #define TXVMSCR_STR			(1 << 16)
>  
>  #define TXVMPSPHSETR			0x1c0
> -#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
> -#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
> -#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
> -#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
> -#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
> +#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
> +#define TXVMPSPHSETR_DT_RGB16		0x0e
> +#define TXVMPSPHSETR_DT_RGB18		0x1e
> +#define TXVMPSPHSETR_DT_RGB18_LS	0x2e
> +#define TXVMPSPHSETR_DT_RGB24		0x3e
> +#define TXVMPSPHSETR_DT_YCBCR16		0x2c

As commented on 3/9, I'm really not thrilled, sorry. I think this
decreased readability in the .c file without any other advantage. If
it's the shift that bothers you you could use FIELD_PREP() in the macro
itself, but I wouldn't do that.

>  
>  #define TXVMVPRMSET0R			0x1d0
>  #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)

-- 
Regards,

Laurent Pinchart

