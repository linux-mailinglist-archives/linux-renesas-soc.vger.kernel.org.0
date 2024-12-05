Return-Path: <linux-renesas-soc+bounces-10975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5F9E5E9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 20:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F35281F5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 19:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F133224B04;
	Thu,  5 Dec 2024 19:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5d21sTy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC55E2EB1F;
	Thu,  5 Dec 2024 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733425744; cv=none; b=JXb2adB0B+NWjZlm2jnRI+zhkoPB8mOETS9W/U6M4ClywfSsaGKKZviGnQUiMqBpOCBbaYfasx/3vBC5PFXmlpI0wmVjPnhuDU4W+1yZ5Uby0X9cAHKRrpymGWtASQs5YbQcmZYBE8fSkImCFJV9YUna3yHxc7X85qziv+ua8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733425744; c=relaxed/simple;
	bh=gpyryQqORDmiyuSyg34TV+1Hz4lJ6aOHkXIhXH1UvaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6D8ul+olTt/hrvwY8CJQ/idEP94MRV7RDuS5noGvn9TQ5IAST7FoKgEWaeO05vhRzLSz4larNpSFYu8tqanQas20UATYkHPAyYb6IRZ5lQZHckCxfDaucOxSzQNkdCnXqkN+DEXwL3KA4jMb1eap2ekSUxqMniKZxSwsfo6E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5d21sTy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E4D22B3;
	Thu,  5 Dec 2024 20:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733425708;
	bh=gpyryQqORDmiyuSyg34TV+1Hz4lJ6aOHkXIhXH1UvaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5d21sTyqWYtne2btLeGlY1CvIrEv7DHDVcS364svFlwB9+7EiQNSI6iIBrZ21WyG
	 Ob1ml8pP59fUOML9CA0STJECUiKv9HFqhTg7C5UTdUk/BCLRWW9S+u9Ls4sGWMpu5d
	 LK4KFPdds/1YnQAkArRQpPPJt0nEjvDPkblkbkiE=
Date: Thu, 5 Dec 2024 21:08:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 07/10] drm/rcar-du: Add support for r8a779h0
Message-ID: <20241205190845.GE21014@pendragon.ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
 <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Thu, Dec 05, 2024 at 03:45:02PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add support for r8a779h0. It is very similar to r8a779g0, but has only
> one output.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 18 ++++++++++++++++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c |  4 +++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index fb719d9aff10..7858e10839f2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
>  	.dsi_clk_mask =  BIT(1) | BIT(0),
>  };
>  
> +static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
> +	.gen = 4,
> +	.features = RCAR_DU_FEATURE_CRTC_IRQ
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_NO_BLENDING,
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		/* R8A779H0 has one MIPI DSI output. */
> +		[RCAR_DU_OUTPUT_DSI0] = {
> +			.possible_crtcs = BIT(0),
> +			.port = 0,
> +		},
> +	},
> +	.num_rpf = 5,
> +	.dsi_clk_mask = BIT(0),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>  	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> @@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
>  	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
>  	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
>  	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
> +	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
>  	{ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 0fbf6abbde6e..b9ae6cc43702 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  		 */
>  		rcrtc = rcdu->crtcs;
>  		num_crtcs = rcdu->num_crtcs;
> -	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
> +	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
> +		   rcdu->info->gen == 4) {
>  		/*
>  		 * On Gen3 dot clocks are setup through per-group registers,
>  		 * only available when the group has two channels.
> +		 * On Gen4 the registers are there for single channel too.
>  		 */
>  		rcrtc = &rcdu->crtcs[rgrp->index * 2];
>  		num_crtcs = rgrp->num_crtcs;
> 

-- 
Regards,

Laurent Pinchart

