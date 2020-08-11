Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD065241A0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 13:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgHKLAQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 07:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgHKLAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 07:00:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893F9C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2020 04:00:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B26E99A8;
        Tue, 11 Aug 2020 13:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597143608;
        bh=XY+WuRlsiCQJwziOQYlWOYnlEUvnKKZa8SJ/PfngfZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VXk0zYVQ6fFufVsmZOBnMftFizjahyf5J9cy+lR7onuBkv1wnPgksE82vMexY2Bqz
         1a9zlKinwbxXE2OGyYSwxXMMrqk88Eekf1/UBYmuh7yGJyoLqnR2IrfF7J1U8PtVGg
         zj++V08KIGDKsOcyRl+xCZOduhKDy/SzDIul2/Qo=
Date:   Tue, 11 Aug 2020 13:59:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/bridge: lvds-codec: Add support for regulator
Message-ID: <20200811105955.GE6054@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200810152219.6254-3-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Aug 10, 2020 at 04:22:18PM +0100, Biju Das wrote:
> Add the support for enabling optional regulator that may be used as VCC
> source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> New Patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> index 24fb1befdfa2..5858a29aafe6 100644
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
> +	int error;

The driver tends to use "ret" for error status variables. If you're fine
with this change there's no need to resubmit the patch, I can fix when
applying.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  	if (!lvds_codec)
>  		return -ENOMEM;
>  
> +	lvds_codec->dev = &pdev->dev;
>  	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
> +
> +	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "vcc");
> +	if (IS_ERR(lvds_codec->vcc)) {
> +		error = PTR_ERR(lvds_codec->vcc);
> +		if (error != -EPROBE_DEFER)
> +			dev_err(lvds_codec->dev,
> +				"Unable to get \"vcc\" supply: %d\n", error);
> +		return error;
> +	}
> +
>  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							     GPIOD_OUT_HIGH);
>  	if (IS_ERR(lvds_codec->powerdown_gpio)) {

-- 
Regards,

Laurent Pinchart
