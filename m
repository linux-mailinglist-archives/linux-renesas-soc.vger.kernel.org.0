Return-Path: <linux-renesas-soc+bounces-22213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50AB95C0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6B4A16A171
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B15322C65;
	Tue, 23 Sep 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fDa718dg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDDA3203AE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628531; cv=none; b=S1roLzyr26ktO+oEGkVHvUz89CX+Sa/Q1CB+BxIHxvpeQyZzVE8DJqfQoYS2D5dhNwQfN/Z2q3V6+6cxFa5ymwGuA3GB+ohv+aUZBDNPT1Zo2m4Mj8Ud8tMxqreLuWGrq7vtithH/x+7nPKct3vY819fQMMe4SGQrXT6FKwA4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628531; c=relaxed/simple;
	bh=Z9kWH3wS2DoMhemDdxgsqIpBUFbCyqpOqjEiPS15H8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSxQp2Ioex/3KmnsdT1mKZ/40zxIrl/RN9tx3JEXLpNMihR+lUYWxyr1wbQ3bqSBP6nPXA3+62qeJ7Vft43n8kfogkS6PFc7fM0dwl0LBYTOxytfCIuVzDxn8jd5dhRV4leiWxQo33F66Qes71KcsXeRK+XTVDZR7MiuLBpF2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fDa718dg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5A0FD6DC;
	Tue, 23 Sep 2025 13:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758628444;
	bh=Z9kWH3wS2DoMhemDdxgsqIpBUFbCyqpOqjEiPS15H8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDa718dgTNN5rFg71An2WVIcSgY/lUJQu6avj3aqO4ceQMDIFs9ELd0dQTlXFbk/y
	 mTpbtq9n/RhjcD6RWZtSfpr7XCPW2xPpv8Bv9sI9PS4fW14I9UvRkjJAe+rjQB11m8
	 e+DtklMlNpfvJw0MGQvvKjnGDdDzDXu7RC8oCvS4=
Date: Tue, 23 Sep 2025 14:54:55 +0300
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
Subject: Re: [PATCH 6/9] drm/rcar-du: dsi: Respect DSI mode flags
Message-ID: <20250923115455.GG20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-7-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-7-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thank you for the patch.

On Mon, Sep 22, 2025 at 08:55:02PM +0200, Marek Vasut wrote:
> Cache DSI mode flags in new mode_flags member of struct rcar_mipi_dsi .
> Configure TXVMSETR register based on the content of DSI mode flags in
> case the controller operates in video mode.
> 
> Rename TXVMSETR_H..BPEN_EN to TXVMSETR_H..BPEN and drop TXVMSETR_H..BPEN_DIS
> which resolves to 0. Update TXVMSETR_VSEN in the same manner. Replace
> TXVMSETR_SYNSEQ_PULSES with a code comment next to TXVMSETR_SYNSEQ_EVENTS
> because TXVMSETR_SYNSEQ_PULSES resolves to 0.
> 
> Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
> consisten with the current style. Conversion to BIT() and GENMASK()
> macros is done at the very end of this series in the last two patches.
> 
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
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    | 18 +++++++++++++++---
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 15 +++++----------
>  2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 1591837ff472c..36bd9de61ce05 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -71,6 +71,7 @@ struct rcar_mipi_dsi {
>  	} clocks;
>  
>  	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
>  	unsigned int num_data_lanes;
>  	unsigned int lanes;
>  };
> @@ -473,9 +474,19 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
>  	}
>  
>  	/* Configuration for Blanking sequence and Input Pixel */
> -	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
> -	     | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
> -	     | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
> +	setr = TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
> +
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
> +			setr |= TXVMSETR_SYNSEQ_EVENTS;
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> +			setr |= TXVMSETR_HFPBPEN;
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> +			setr |= TXVMSETR_HBPBPEN;
> +		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> +			setr |= TXVMSETR_HSABPEN;
> +	}
> +
>  	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
>  
>  	/* Configuration for Video Parameters */
> @@ -916,6 +927,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
> +	dsi->mode_flags = device->mode_flags;
>  
>  	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
>  						  1, 0);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 1a8d377ea85fc..99a88ea35aacd 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -140,18 +140,13 @@
>   * Video Mode Register
>   */
>  #define TXVMSETR			0x180
> -#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
> -#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
> +#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
>  #define TXVMSETR_VSTPM			(1 << 15)
>  #define TXVMSETR_PIXWDTH		(1 << 8)
> -#define TXVMSETR_VSEN_EN		(1 << 4)
> -#define TXVMSETR_VSEN_DIS		(0 << 4)
> -#define TXVMSETR_HFPBPEN_EN		(1 << 2)
> -#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
> -#define TXVMSETR_HBPBPEN_EN		(1 << 1)
> -#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
> -#define TXVMSETR_HSABPEN_EN		(1 << 0)
> -#define TXVMSETR_HSABPEN_DIS		(0 << 0)
> +#define TXVMSETR_VSEN			(1 << 4)
> +#define TXVMSETR_HFPBPEN		(1 << 2)
> +#define TXVMSETR_HBPBPEN		(1 << 1)
> +#define TXVMSETR_HSABPEN		(1 << 0)
>  
>  #define TXVMCR				0x190
>  #define TXVMCR_VFCLR			(1 << 12)

-- 
Regards,

Laurent Pinchart

