Return-Path: <linux-renesas-soc+bounces-10808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9189E162E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A098F163734
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F241DACA7;
	Tue,  3 Dec 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t9brO18N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851321BD50C;
	Tue,  3 Dec 2024 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215720; cv=none; b=CtHW+OKVm4g1kP09DNnsl1A+FhygfENif4KxbQrEP5Pt/gZA+PuM7pcI5lASCWmWagim8/J+WKfLQ0JeGQVeynVyQQGE3LQeDK+2bDhK4jtyRF0aql3yfgAxHzPEyACceihCGD9UQgukLprccbogtbvXF3Ii4uFzVYVcXibkns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215720; c=relaxed/simple;
	bh=0OpAzWPuoryPxuF28/pNqAjWqcvclJtIH5b6VDVvfN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=um5pyVf9PoAwRII8IK1pGV6aR79deiXO3G0LqjmkqOmJqTaCbyL3dRqmiS+u0MyjUnGlTWmtCeUFwItbbyEAGThQQy6IziUB38vexfi4eNkAQEaX4GEJiJT22u6WEr+0kxmnwfC229SwxHnuj8NuiXthsvLJgUcqMza+2v6imNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t9brO18N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 785328DB;
	Tue,  3 Dec 2024 09:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733215688;
	bh=0OpAzWPuoryPxuF28/pNqAjWqcvclJtIH5b6VDVvfN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9brO18N9dPcCEATfgU02ojolfRs6YqdOaDkiWn8yJNW2atTCM8O/g2Vpd3wQepmp
	 ump13EAQaDL8jKuuK21ZroYB2mMypvk/OS1PrO0EwnKrj05YkBaLle8XTBOoR9iEnd
	 NepGOJeAQW124EcLase6euLcGdjJmhfO/N3nS0BI=
Date: Tue, 3 Dec 2024 10:48:24 +0200
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
Subject: Re: [PATCH 4/9] drm/rcar-du: dsi: Fix PHY lock bit check
Message-ID: <20241203084824.GG10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-4-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-4-738ae1a95d2a@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:38AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The driver checks for bit 16 (using CLOCKSET1_LOCK define) in CLOCKSET1
> register when waiting for the PPI clock. However, the right bit to check
> is bit 17 (CLOCKSET1_LOCK_PHY define). Not only that, but there's
> nothing in the documents for bit 16 for V3U nor V4H.
> 
> So, fix the check to use bit 17, and drop the define for bit 16.
> 
> Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
> Fixes: 11696c5e8924 ("drm: Place Renesas drivers in a separate dir")

Should this have CC: stable ?

> Signed-off-by: Tomi Valkeiben <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index 2dba7c5ffd2c..92f4261305bd 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -587,7 +587,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	for (timeout = 10; timeout > 0; --timeout) {
>  		if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
>  		    (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
> -		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
> +		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK_PHY))
>  			break;
>  
>  		usleep_range(1000, 2000);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index f8114d11f2d1..a6b276f1d6ee 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -142,7 +142,6 @@
>  
>  #define CLOCKSET1			0x101c
>  #define CLOCKSET1_LOCK_PHY		(1 << 17)
> -#define CLOCKSET1_LOCK			(1 << 16)
>  #define CLOCKSET1_CLKSEL		(1 << 8)
>  #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>  #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)

-- 
Regards,

Laurent Pinchart

