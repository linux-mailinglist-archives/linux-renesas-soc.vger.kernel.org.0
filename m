Return-Path: <linux-renesas-soc+bounces-21354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13089B44126
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A0F17BD69
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829272727FD;
	Thu,  4 Sep 2025 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qv3oeNWl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29083271454
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001300; cv=none; b=KGYjDlMidd9tvd3jMw0bdDr+HwOymtyh/05VcnjIasSqjey6XO2A47+hPL4h3ADP9+tfI/Me/SNWCWJmD9RU/YYPSKrhoW0dp/QJBbCHsCZSTzlkhGN0kAd75OwDSStsNqMO0EyDC9rgZ/VyamFQJo/6Okl1/INxVUE3Y31Qpl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001300; c=relaxed/simple;
	bh=EUitpBuEyGTZlB+HNH7hlagNzY8esbz9mumI5QTncHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VySKcF0FhFbVhRzX4oZLIgnMD7fJa5U79T9GI3vCjPCyStAeRBLMLSaaW8g0Htl6uxOmxIuPzXkeA1BjbGusEV/At1ss6p/m21M0Q/cjn6D/KF7p6guT4LxQ/5mc79ztyTetM8+rfvLotbPKMce8lGvfTaRPbKp7uItyX/Qm8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qv3oeNWl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CCDE678C;
	Thu,  4 Sep 2025 17:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757001225;
	bh=EUitpBuEyGTZlB+HNH7hlagNzY8esbz9mumI5QTncHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qv3oeNWlKElB18WaBD7JOC2ZSfn94qfJfTEAq7SJIpKqYRLqo3LRDd+O6kl26tRiI
	 sprhdw23w1cNCuHv+XzwGFSHLmxrT+4j1R10n2wvPaXi4jJ6QgjaqTb475tEFB/6jR
	 kztAyYJaHfTQpaY6pxRU2IVlisSOZ6IZabWMiWko=
Date: Thu, 4 Sep 2025 17:54:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
Message-ID: <20250904155434.GF6174@pendragon.ideasonboard.com>
References: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>

On Thu, Sep 04, 2025 at 05:31:00PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Display Unit LVDS driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
> kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
> on PM, the code may still serve as an example for new drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> index 4dcb36dc0bff6e53..6d44238c4078a425 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -1013,7 +1013,7 @@ static int rcar_lvds_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rcar_lvds_pm_ops = {
> -	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver rcar_lvds_platform_driver = {
> @@ -1021,7 +1021,7 @@ static struct platform_driver rcar_lvds_platform_driver = {
>  	.remove		= rcar_lvds_remove,
>  	.driver		= {
>  		.name	= "rcar-lvds",
> -		.pm	= &rcar_lvds_pm_ops,
> +		.pm	= pm_ptr(&rcar_lvds_pm_ops),
>  		.of_match_table = rcar_lvds_of_table,
>  	},
>  };

-- 
Regards,

Laurent Pinchart

