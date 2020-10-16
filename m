Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC86290D1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 23:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410926AbgJPVNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 17:13:46 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:36078 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410923AbgJPVNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 17:13:46 -0400
X-Greylist: delayed 563 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Oct 2020 17:13:45 EDT
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id BAF4320030;
        Fri, 16 Oct 2020 23:04:20 +0200 (CEST)
Date:   Fri, 16 Oct 2020 23:04:19 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Message-ID: <20201016210419.GD1496366@ravnborg.org>
References: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8 a=P1BnusSwAAAA:8 a=e5mUnYsNAAAA:8
        a=mSdEz-HRsigmF5DYOmMA:9 a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
        a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju, Laurent

On Tue, Sep 22, 2020 at 01:55:26PM +0300, Laurent Pinchart wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add the support for enabling optional regulator that may be used as VCC
> source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> [Replaced 'error' variable with 'ret']
> [Renamed regulator from 'vcc' to 'power']
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Applied to drm-misc-next.
Biju, could you make a follow-up patch that introduces dev_err_probe()
where appropriate? I did not fix up the code but this was a good
candidate.

	Sam

> ---
> Changes since v2:
> 
> - Use the correct regulator name
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index f19d9f7a5db2..f52ccffc1bd1 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -10,13 +10,16 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>  
>  struct lvds_codec {
> +	struct device *dev;
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	struct regulator *vcc;
>  	struct gpio_desc *powerdown_gpio;
>  	u32 connector_type;
>  };
> @@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge *bridge,
>  static void lvds_codec_enable(struct drm_bridge *bridge)
>  {
>  	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +	int ret;
> +
> +	ret = regulator_enable(lvds_codec->vcc);
> +	if (ret) {
> +		dev_err(lvds_codec->dev,
> +			"Failed to enable regulator \"vcc\": %d\n", ret);
> +		return;
> +	}
>  
>  	if (lvds_codec->powerdown_gpio)
>  		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
> @@ -46,9 +57,15 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
>  static void lvds_codec_disable(struct drm_bridge *bridge)
>  {
>  	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +	int ret;
>  
>  	if (lvds_codec->powerdown_gpio)
>  		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
> +
> +	ret = regulator_disable(lvds_codec->vcc);
> +	if (ret)
> +		dev_err(lvds_codec->dev,
> +			"Failed to disable regulator \"vcc\": %d\n", ret);
>  }
>  
>  static const struct drm_bridge_funcs funcs = {
> @@ -63,12 +80,24 @@ static int lvds_codec_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_codec *lvds_codec;
> +	int ret;
>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  	if (!lvds_codec)
>  		return -ENOMEM;
>  
> +	lvds_codec->dev = &pdev->dev;
>  	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> +
> +	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
> +	if (IS_ERR(lvds_codec->vcc)) {
> +		ret = PTR_ERR(lvds_codec->vcc);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(lvds_codec->dev,
> +				"Unable to get \"vcc\" supply: %d\n", ret);
> +		return ret;
> +	}
> +
>  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							     GPIOD_OUT_HIGH);
>  	if (IS_ERR(lvds_codec->powerdown_gpio))
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
