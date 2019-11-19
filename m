Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA3C100FA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 01:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfKSAEG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 19:04:06 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60672 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSAEG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 19:04:06 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1ED4563;
        Tue, 19 Nov 2019 01:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121844;
        bh=VtMemPJqqEbKjR+6JRu+opzP9DDp6kItFRs+SttWtZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=StpMtxbJT4xx1fQwoKTjSuSBDBVeWdnlzYC2Es/WTrgJclcpTWKVjcS3f0wqwQa70
         k4oWfHatOEj/NzGh0pi4jj2AERl5Cngf6JLNq828prYm0XfDAC4Rx2kCybOm+Bq3Ti
         PvRNCdPxbw0BAjzowly8G9ljOiMEgmEGdauqPrPM=
Date:   Tue, 19 Nov 2019 02:03:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 07/13] drm/bridge: lvds-codec: Simplify panel DT node
 localisation
Message-ID: <20191119000350.GG5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:26PM +0000, Fabrizio Castro wrote:
> The probe function needs to get ahold of the panel device tree
> node, and it achieves that by using a combination of
> of_graph_get_port_by_id, of_get_child_by_name, and
> of_graph_get_remote_port_parent. We can achieve the same goal
> by replacing those calls with a call to of_graph_get_remote_node
> these days.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index c32e125..784bbd3 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -57,8 +57,6 @@ static struct drm_bridge_funcs funcs = {
>  static int lvds_codec_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *port;
> -	struct device_node *endpoint;
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> @@ -79,23 +77,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Locate the panel DT node. */
> -	port = of_graph_get_port_by_id(dev->of_node, 1);
> -	if (!port) {
> -		dev_dbg(dev, "port 1 not found\n");
> -		return -ENXIO;
> -	}
> -
> -	endpoint = of_get_child_by_name(port, "endpoint");
> -	of_node_put(port);
> -	if (!endpoint) {
> -		dev_dbg(dev, "no endpoint for port 1\n");
> -		return -ENXIO;
> -	}
> -
> -	panel_node = of_graph_get_remote_port_parent(endpoint);
> -	of_node_put(endpoint);
> +	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	if (!panel_node) {
> -		dev_dbg(dev, "no remote endpoint for port 1\n");
> +		dev_dbg(dev, "panel DT node not found\n");
>  		return -ENXIO;
>  	}
>  

-- 
Regards,

Laurent Pinchart
