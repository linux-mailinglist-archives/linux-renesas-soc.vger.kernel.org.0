Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F069639926
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 00:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfFGWvh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 18:51:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58860 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfFGWvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 18:51:37 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 789DD334;
        Sat,  8 Jun 2019 00:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559947894;
        bh=Hj0x4ttsssiFksmql6Qx5/FnTRecACA00Z6/MQgyQyI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rzrkEenviHJOkXonv6AH8CGpyL1YmcNxxcLUBjS2eP1UXRIFZJR9HnQjysU2w4Na0
         vV5w8pb9QLBNzm3Na7HMdjanm6OSdr0zl6wO1pBtMtixXNG4WMNb14Vw9THjJ6GVZE
         Jvb7Fb/cYcIiiC1TIg3Ak86WKeWGS7ueaCk/jdXg=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 03/10] drm: bridge: thc63: Report input bus mode
 through bridge timings
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <5f40d16f-c949-e13b-307f-946ee6000a56@ideasonboard.com>
Date:   Fri, 7 Jun 2019 23:51:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528141234.15425-4-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 28/05/2019 15:12, Laurent Pinchart wrote:
> Set a drm_bridge_timings in the drm_bridge, and use it to report the
> input bus mode (single-link or dual-link). The other fields of the
> timings structure are kept to 0 as they do not apply to LVDS buses.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Ignore disabled remote device
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 54 +++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index b083a740565c..709dd28b43d6 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -31,6 +31,8 @@ struct thc63_dev {
>  
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next;
> +
> +	struct drm_bridge_timings timings;

These are just input timings right?

>  };
>  
>  static inline struct thc63_dev *to_thc63(struct drm_bridge *bridge)
> @@ -48,15 +50,28 @@ static int thc63_attach(struct drm_bridge *bridge)
>  static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
>  					const struct drm_display_mode *mode)
>  {
> +	struct thc63_dev *thc63 = to_thc63(bridge);
> +	unsigned int min_freq;
> +	unsigned int max_freq;
> +
>  	/*
> -	 * The THC63LVD1024 clock frequency range is 8 to 135 MHz in single-in
> -	 * mode. Note that the limits are different in dual-in, single-out mode,
> -	 * and will need to be adjusted accordingly.
> +	 * The THC63LVD1024 pixel rate range is 8 to 135 MHz in all modes but
> +	 * dual-in, single-out where it is 40 to 150 MHz. As dual-in, dual-out

That comma is unfortunate, and makes me read the sentence as "in all
modes but dual-in, ... ... single out where it is 40 to 150 mhz (as if
we should single out the device for it's behaviour between 40 to 150mhz).

Perhaps we could enclose the mode in single quotes to denote that it is
a single description:

   ... in all modes but 'dual-in, single-out' where it ...

> +	 * isn't supported by the driver yet, simply derive the limits from the
> +	 * input mode.
>  	 */
> -	if (mode->clock < 8000)
> +	if (thc63->timings.dual_link) {
> +		min_freq = 40000;
> +		max_freq = 150000;
> +	} else {
> +		min_freq = 8000;
> +		max_freq = 135000;
> +	}
> +
> +	if (mode->clock < min_freq)
>  		return MODE_CLOCK_LOW;
>  
> -	if (mode->clock > 135000)
> +	if (mode->clock > max_freq)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;
> @@ -101,19 +116,19 @@ static const struct drm_bridge_funcs thc63_bridge_func = {
>  
>  static int thc63_parse_dt(struct thc63_dev *thc63)
>  {
> -	struct device_node *thc63_out;
> +	struct device_node *endpoint;
>  	struct device_node *remote;
>  
> -	thc63_out = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> -						  THC63_RGB_OUT0, -1);
> -	if (!thc63_out) {
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_RGB_OUT0, -1);
> +	if (!endpoint) {
>  		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
>  			THC63_RGB_OUT0);
>  		return -ENODEV;
>  	}
>  
> -	remote = of_graph_get_remote_port_parent(thc63_out);
> -	of_node_put(thc63_out);
> +	remote = of_graph_get_remote_port_parent(endpoint);
> +	of_node_put(endpoint);
>  	if (!remote) {
>  		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
>  			THC63_RGB_OUT0);
> @@ -132,6 +147,22 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
>  	if (!thc63->next)
>  		return -EPROBE_DEFER;
>  
> +	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> +						 THC63_LVDS_IN1, -1);
> +	if (endpoint) {
> +		remote = of_graph_get_remote_port_parent(endpoint);
> +		of_node_put(endpoint);
> +
> +		if (remote) {
> +			if (of_device_is_available(remote))
> +				thc63->timings.dual_link = true;
> +			of_node_put(remote);
> +		}
> +	}
> +
> +	dev_dbg(thc63->dev, "operating in %s-link mode\n",
> +		thc63->timings.dual_link ? "dual" : "single");
> +
>  	return 0;
>  }
>  
> @@ -188,6 +219,7 @@ static int thc63_probe(struct platform_device *pdev)
>  	thc63->bridge.driver_private = thc63;
>  	thc63->bridge.of_node = pdev->dev.of_node;
>  	thc63->bridge.funcs = &thc63_bridge_func;
> +	thc63->bridge.timings = &thc63->timings;
>  
>  	drm_bridge_add(&thc63->bridge);
>  
> 

-- 
Regards
--
Kieran
