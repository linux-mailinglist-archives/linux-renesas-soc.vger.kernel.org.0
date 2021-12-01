Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B80B464604
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 05:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346549AbhLAEmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 23:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhLAEmd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 23:42:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9551C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Nov 2021 20:39:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10C6AA15;
        Wed,  1 Dec 2021 05:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638333551;
        bh=xTG3BUBRg2jVGvGV6uQaIeQX/Pvp6vwWJSpHCGen0dY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSMj/tNP81ZOaPAO+9b1/9RxavRFLdOR+mc5JLGFTtzkdAJKouFFFcLdIY93qq4x2
         uxse7kz5wKu6BvBrOyZ1L+dNii3pG9Sw81dfUmF8/EadPPRR1kDAhbMErAQ7no/AaD
         8oP3lwecRB/nBWSrpRpWSsnVRV8xeATJKPrz1DA8=
Date:   Wed, 1 Dec 2021 06:38:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm: rcar-du: mipi-dsi: Support bridge probe
 ordering
Message-ID: <Yab8VhX9qTvUKEcP@pendragon.ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
 <20211130162513.2898302-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211130162513.2898302-2-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tue, Nov 30, 2021 at 04:25:12PM +0000, Kieran Bingham wrote:
> The bridge probe ordering for DSI devices has been clarified and further
> documented in

I've read the document and


:-)

> To support connecting with the SN65DSI86 device after commit c3b75d4734cb
> ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
> update to the new probe ordering to remove a perpetual -EPROBE_DEFER
> loop between the two devices.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2
> - Remove now unused panel variable from rcar_mipi_dsi_probe()
> 
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 49 +++++++++++++------------
>  1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 50e922328fed..0a9f197ef62c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -637,6 +637,8 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  					struct mipi_dsi_device *device)
>  {
>  	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +	struct drm_panel *panel;
> +	int ret;
>  
>  	if (device->lanes > dsi->num_data_lanes)
>  		return -EINVAL;
> @@ -644,12 +646,36 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
>  
> +	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> +					  &dsi->next_bridge);
> +	if (ret) {
> +		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");

dev_err_probe() should only be used in probe(), and this function isn't
guaranteed to be called at probe time only.

This isn't a big deal as the next patch fixes this, and both will be
squashed. Furthermore, rcar_mipi_dsi_host_attach() should only be called
when the DSI device gets registered, which should happen after it
registers its bridge, so I don't think we can see a probe deferral here.

Other than that the patch looks fine, I'll squash it with the DSI
driver.

> +		return ret;
> +	}
> +
> +	if (!dsi->next_bridge) {
> +		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			dev_err(dsi->dev, "failed to create panel bridge\n");
> +			return PTR_ERR(dsi->next_bridge);
> +		}
> +	}
> +
> +	/* Initialize the DRM bridge. */
> +	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
> +	dsi->bridge.of_node = dsi->dev->of_node;
> +	drm_bridge_add(&dsi->bridge);
> +
>  	return 0;
>  }
>  
>  static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
>  					struct mipi_dsi_device *device)
>  {
> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +
> +	drm_bridge_remove(&dsi->bridge);
> +
>  	return 0;
>  }
>  
> @@ -731,7 +757,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
>  static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  {
>  	struct rcar_mipi_dsi *dsi;
> -	struct drm_panel *panel;
>  	struct resource *mem;
>  	int ret;
>  
> @@ -764,21 +789,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  		return PTR_ERR(dsi->rstc);
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> -					  &dsi->next_bridge);
> -	if (ret) {
> -		dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> -		return ret;
> -	}
> -
> -	if (!dsi->next_bridge) {
> -		dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			dev_err(dsi->dev, "failed to create panel bridge\n");
> -			return PTR_ERR(dsi->next_bridge);
> -		}
> -	}
> -
>  	/* Initialize the DSI host. */
>  	dsi->host.dev = dsi->dev;
>  	dsi->host.ops = &rcar_mipi_dsi_host_ops;
> @@ -786,11 +796,6 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	/* Initialize the DRM bridge. */
> -	dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;
> -	dsi->bridge.of_node = dsi->dev->of_node;
> -	drm_bridge_add(&dsi->bridge);
> -
>  	return 0;
>  }
>  
> @@ -798,8 +803,6 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
>  {
>  	struct rcar_mipi_dsi *dsi = platform_get_drvdata(pdev);
>  
> -	drm_bridge_remove(&dsi->bridge);
> -
>  	mipi_dsi_host_unregister(&dsi->host);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
