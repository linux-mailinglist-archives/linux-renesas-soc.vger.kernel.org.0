Return-Path: <linux-renesas-soc+bounces-10307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5069BD1A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 17:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CDB41C23729
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 16:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E00A155C8D;
	Tue,  5 Nov 2024 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rhw5jwaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464313AD0F;
	Tue,  5 Nov 2024 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822521; cv=none; b=gtWxOF755PGxwrBf1100ndvJIHVSi6MNaks2FBZR+GKqUkZ38zWa3Qw5W5cUagoX2f0AwhP6KYHXMipWK+HuyGAm2xW8JoxFnv4j6Bupa87Spf6rVv42e/o8JOXYZpe28cGw662rBIXbGDsKHIQiAqBm7CNtO0ssifAYgVfW6ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822521; c=relaxed/simple;
	bh=jV0ZsDeRx2PgG5eWTadzFaxOSxD1QREaoh8NhIiUtnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pb0r8xiBOT7yz6VN7L382kD7f82L9Chnwfk/9TTzXPxk9/LB/BFl1oWEa3s6STJRN8bl3yLaFN8lOZq/0Z+FETXW9csHqgsnKIppRwdcu+V9AgkqtxW6JS0zSvxL79t2PrdMQtmqll8jsUAwLlpziLB83l3Sdxw0qmdpBxMXFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rhw5jwaW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAB31874;
	Tue,  5 Nov 2024 17:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730822501;
	bh=jV0ZsDeRx2PgG5eWTadzFaxOSxD1QREaoh8NhIiUtnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhw5jwaWZpBtZ801zchegwjm59zZWvCec4AuS28/Q5PCsO/aGbaNpEj5P1sSbm1UZ
	 7RvUZZhG4prUTPDnREh3jreMoJ6FBOlwR1b6pfKs5YbsILAqQywWAtwjvwCz38UHF5
	 2kyM7zLLNZFDACTMx6osQTOD3sviAx8FAU5RHzQw=
Date: Tue, 5 Nov 2024 18:01:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Archit Taneja <architt@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241105160138.GB6317@pendragon.ideasonboard.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105111228.112813-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Nov 05, 2024 at 11:12:18AM +0000, Biju Das wrote:
> The host_node pointer assigned and freed in adv7533_parse_dt()
> and later adv7533_attach_dsi() uses the same. Fix this issue
> by freeing the host_node in adv7533_attach_dsi() instead of
> adv7533_parse_dt().
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5e..3e57ba838e5e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -133,6 +133,7 @@ int adv7533_patch_cec_registers(struct adv7511 *adv)
>  
>  int adv7533_attach_dsi(struct adv7511 *adv)
>  {
> +	struct device_node *np __free(device_node) = adv->host_node;

This raises so many red flags. The function will free the node while the
adv->host_node variable still points to it, opening the door to
use-after-free. Furthermore, there's nothing in the function name that
hints it will do this, callers can get surprised by this behaviour.

I'm sure you can do better than this and fix the problem with readable
code, not cryptic and error-prone constructs :-)

>  	struct device *dev = &adv->i2c_main->dev;
>  	struct mipi_dsi_host *host;
>  	struct mipi_dsi_device *dsi;
> @@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  	if (!adv->host_node)
>  		return -ENODEV;
>  
> -	of_node_put(adv->host_node);
> -
>  	adv->use_timing_gen = !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>  

-- 
Regards,

Laurent Pinchart

