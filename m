Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23D23B0FDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 00:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFVWJp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 18:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhFVWJp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 18:09:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A23C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 15:07:28 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FFF7EE;
        Wed, 23 Jun 2021 00:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624399645;
        bh=VwgyXRJTAMgHLiUzfGfZYyjPpNTXNcg+lK1akEP16X4=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=Ax8eUj4VG3AtPxL9DDCzfSHdGrcIz5mIS1HxoDxrsbNpPWsaUisbJ/8xLlI+xwsh/
         EhVUYkYkUKPceFEGGIlVpJR2bbkHs7zqHyEEfBoXdoneNBw7jrVg5+KXYaSMX58x9a
         NyGlSht4SZeA4U7DYBk/KR55lfyTeAoKWuAQCAsE=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 1/4] drm: bridge: dw-hdmi: Attach to next bridge if
 available
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-2-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <04dd7768-e21b-6e68-cd76-fc667372c160@ideasonboard.com>
Date:   Tue, 22 Jun 2021 23:07:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520065046.28978-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 20/05/2021 07:50, Laurent Pinchart wrote:
> On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
> require a video output port connected to an HDMI sink (most likely an
> HDMI connector, in rare cases another bridges converting HDMI to another
> protocol). For those platforms, retrieve the next bridge and attach it
> from the dw-hdmi bridge attach handler.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Nothing jumping out at me here.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Make missing endpoint a fatal error
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 54 ++++++++++++++++++++++-
>  include/drm/bridge/dw_hdmi.h              |  2 +
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index e7c7c9b9c646..f9065ca4cd88 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
>  struct dw_hdmi {
>  	struct drm_connector connector;
>  	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
>  
>  	unsigned int version;
>  
> @@ -2775,7 +2776,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  	struct dw_hdmi *hdmi = bridge->driver_private;
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> -		return 0;
> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +					 bridge, flags);
>  
>  	return dw_hdmi_connector_create(hdmi);
>  }
> @@ -3160,6 +3162,52 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
>  /* -----------------------------------------------------------------------------
>   * Probe/remove API, used from platforms based on the DRM bridge API.
>   */
> +
> +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
> +{
> +	struct device_node *endpoint;
> +	struct device_node *remote;
> +
> +	if (!hdmi->plat_data->output_port)
> +		return 0;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
> +						 hdmi->plat_data->output_port,
> +						 -1);
> +	if (!endpoint) {
> +		/*
> +		 * On platforms whose bindings don't make the output port
> +		 * mandatory (such as Rockchip) the plat_data->output_port
> +		 * field isn't set, so it's safe to make this a fatal error.
> +		 */
> +		dev_err(hdmi->dev, "Missing endpoint in port@%u\n",
> +			hdmi->plat_data->output_port);
> +		return -ENODEV;
> +	}
> +
> +	remote = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
> +	if (!remote) {
> +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
> +			hdmi->plat_data->output_port);
> +		return -ENODEV;
> +	}
> +
> +	if (!of_device_is_available(remote)) {
> +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
> +			hdmi->plat_data->output_port);
> +		of_node_put(remote);
> +		return -ENODEV;
> +	}
> +
> +	hdmi->next_bridge = of_drm_find_bridge(remote);
> +	of_node_put(remote);
> +	if (!hdmi->next_bridge)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  			      const struct dw_hdmi_plat_data *plat_data)
>  {
> @@ -3196,6 +3244,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  	mutex_init(&hdmi->cec_notifier_mutex);
>  	spin_lock_init(&hdmi->audio_lock);
>  
> +	ret = dw_hdmi_parse_dt(hdmi);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
>  	if (ddc_node) {
>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a5716655619..2a1f85f9a8a3 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
>  struct dw_hdmi_plat_data {
>  	struct regmap *regm;
>  
> +	unsigned int output_port;
> +
>  	unsigned long input_bus_encoding;
>  	bool use_drm_infoframe;
>  	bool ycbcr_420_allowed;
> 
