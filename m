Return-Path: <linux-renesas-soc+bounces-11133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7DD9EA264
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 00:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBDAD162A45
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 23:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE10219F133;
	Mon,  9 Dec 2024 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K/z8bvjw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1A19E99E;
	Mon,  9 Dec 2024 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785478; cv=none; b=TLxGS2tWm4E/IayVlCuoT+e8SjZe2e5a3donBKtwbKWJ0VqS6OWYmBXiig5HRvkPuk0JQDZa6v6eadGOD8xKs35XTHtFF1eVEwn/l/7sbTf+NHnksXB0ZIKW45z2rup+1DHPuMDKhMmi7wKPsR3gy0nK5tKv5AYIYdH39e11gmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785478; c=relaxed/simple;
	bh=Qcxa64sqKdeh/6r/m4016i3rOJhE43hZnPajfIkR4ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkdbOhSektU6/Uk2pEtkSnuwDzLGyBS8+cJKRlvGwL1V2gIAPd3aPX1yJGpps1tuicahYhu0Klf6Z+TkXYC/Fi2Ul9wnuoYjBMneRuojUKxkOPgAef1ErjAYzwVbgJlzGBsNY32vwSB/NZo/7temN1baYDZcOPqLbTLSZn8LeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K/z8bvjw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CC556EC;
	Tue, 10 Dec 2024 00:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733785441;
	bh=Qcxa64sqKdeh/6r/m4016i3rOJhE43hZnPajfIkR4ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/z8bvjw0WtKMU/6c110zoSWLuKHA3PhH5s6qjsCLUoYZdfKcTUJsPHKtAr0v6nPK
	 m0+EK8lGSCPgh1m2q+BINxwB+g0ZLUjG7ykzLBwcwr5OZW9GvqwWZUFcrv6b5GT5Py
	 zLOI2oWhMAv/ZKI5FaiDvPUgmEMWFZdPKcy7o/gM=
Date: Tue, 10 Dec 2024 01:04:18 +0200
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
Subject: Re: [PATCH v3 02/10] drm/rcar-du: Write DPTSR only if the second
 source exists
Message-ID: <20241209230418.GC26531@pendragon.ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-2-d74c2166fa15@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241206-rcar-gh-dsi-v3-2-d74c2166fa15@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, Dec 06, 2024 at 11:32:35AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Currently the driver always writes DPTSR when setting up the hardware.
> However, writing the register is only meaningful when the second source
> for a plane is used, and the register is not even documented for SoCs
> that do not have the second source.

I've confirmed that for all the models currently supported by the DU
driver.

> So move the write behind a condition.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I will test the series on an M3N board.

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> index 2ccd2581f544..1ec806c8e013 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -185,11 +185,21 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
>  	rcar_du_group_write(rgrp, DORCR, dorcr);
>  
> -	/* Apply planes to CRTCs association. */
> -	mutex_lock(&rgrp->lock);
> -	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> -			    rgrp->dptsr_planes);
> -	mutex_unlock(&rgrp->lock);
> +	/*
> +	 * DPTSR is used to select the source for the planes of a group. The
> +	 * first source is chosen by writing 0 to the respective bits, and this
> +	 * is always the default value of the register. In other words, writing
> +	 * DPTSR is only needed if the SoC supports choosing the second source.
> +	 *
> +	 * The SoCs documentations seems to confirm this, as the DPTSR register
> +	 * is not documented if only the first source exists on that SoC.
> +	 */
> +	if (rgrp->channels_mask & BIT(1)) {
> +		mutex_lock(&rgrp->lock);
> +		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
> +				    rgrp->dptsr_planes);
> +		mutex_unlock(&rgrp->lock);
> +	}
>  }
>  
>  /*
> 

-- 
Regards,

Laurent Pinchart

