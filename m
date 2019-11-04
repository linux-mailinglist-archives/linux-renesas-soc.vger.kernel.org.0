Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CE4EE431
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2019 16:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfKDPtf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Nov 2019 10:49:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38505 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbfKDPtf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Nov 2019 10:49:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id z19so12430797wmk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Nov 2019 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1QiMFK07xGtp6owlvKScFueSXMGUHCw0UFSd+uKSjuQ=;
        b=ZIlO3KJ8iU6Q7T/R/Mnvsrhjm+7cIgnAjwtF0+hbW9fBOtThI+/Cj00LZcnU5xb8v7
         HLIlWebRnibHmwWbodKZWCexdc6pNT9cZDbXyfF74/h8sKePOrATN8gNMcKf0JBPIcaq
         PsvjUA/MAYoMxFFHJIF9eykiei/4denoI3LihIakss1aImpsEGzDN8e7zF/hoyb70n77
         v8ocZ/wAQ2rgT9nMECpSfW3Qdy783t0z2X429iy0pYMirETsJ4uBdweG5PubM2+MqKph
         Jf19rqjrS8BCq66ESJcW1HWcP4MYp+QbKMYV2AYfLwu9Da9RzDdDDRPX3Gl1DwytpcHq
         aXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1QiMFK07xGtp6owlvKScFueSXMGUHCw0UFSd+uKSjuQ=;
        b=erH5PlKNZHQ4fMlDkB+oIBq1YWPgkIM2uJMO+bapHuLWa/sKlos43PJQEX5SZsz/xm
         oBzSlItw8h0oCP/9nlP9NpLB4x7H8c8XXwg4Wn9e9owPhzIFiG5UDAhN3Lvlk/Em84uR
         sIvNAtdErjTjAKBpZClcUZNQF8lv8cGgu1LFVJUcBeoRG3CP+5jXUsWfJJuARdTtF6IE
         i9RbFxozRh7hFf4vOJ4R3i74z2fGMuubm3EWiwApbc5/zBFNUD8T4uIMEcTnmLQWteDB
         Mz1XkltD3x+ntG0uX6u4KNeSz0/2Ms5XtmqHP7rNoYm1RpTPW8jBgTUdQedERe1OzvT8
         eDfg==
X-Gm-Message-State: APjAAAXVzDYj+BHNML7nOjPmtcSvGCUwr9HZ+LXxSCZnEut6U1E8Fh5y
        FyL75XfQiDByo4l/1c9/kVNWlw==
X-Google-Smtp-Source: APXvYqxstXe+PgbB1uSaGEbQ30o0jqz7NoB4o5Za+Bb2nyGUiK0ZLSZEYpPCioqiazQ57r2WP60P5A==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr24092715wmb.53.1572882570481;
        Mon, 04 Nov 2019 07:49:30 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v9sm16066375wrs.95.2019.11.04.07.49.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 07:49:29 -0800 (PST)
Subject: Re: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <870bea7e-5e5d-c0ba-2f5d-ebd0fd493c7e@baylibre.com>
 <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <a1e75e51-2565-1122-5a6e-bcb7b7d27712@baylibre.com>
Date:   Mon, 4 Nov 2019 16:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 04/11/2019 11:42, Fabrizio Castro wrote:
> Hi Neil,
> 
> Thank you for your feedback!
> 
>> From: Neil Armstrong <narmstrong@baylibre.com>
>> Sent: 04 November 2019 09:18
>> Subject: Re: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
>>
>> Hi,
>>
>> On 30/10/2019 14:43, Fabrizio Castro wrote:
>>> lvds-encoder.c implementation is also suitable for LVDS decoders,
>>> not just LVDS encoders.
>>> Instead of creating a new driver for addressing support for
>>> transparent LVDS decoders, repurpose lvds-encoder.c for the greater
>>> good.
>>>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> ---
>>>  drivers/gpu/drm/bridge/Kconfig        |   8 +-
>>>  drivers/gpu/drm/bridge/Makefile       |   2 +-
>>>  drivers/gpu/drm/bridge/lvds-codec.c   | 169 ++++++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/bridge/lvds-encoder.c | 155 -------------------------------
>>>  4 files changed, 174 insertions(+), 160 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
>>>  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
>>>
>>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>>> index 3436297..9e75ca4e 100644
>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>> @@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
>>>  	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
>>>  	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
>>>
>>> -config DRM_LVDS_ENCODER
>>> -	tristate "Transparent parallel to LVDS encoder support"
>>> +config DRM_LVDS_CODEC
>>
>>
>> I'm not CCed on other patches, but I'm pretty sure you should fix other
>> Kconfig and defconfigs selecting this config in this patch to avoid breaking bisect.
> 
> My understanding is that no defconfig and no other option refer directly to DRM_LVDS_ENCODER, do you mind being a little bit more specific here?
> 

Indeed, you are right.

Neil

> Thanks,
> Fab
> 
>>
>> Neil
>>
>>> +	tristate "Transparent LVDS encoders and decoders support"
>>>  	depends on OF
>>>  	select DRM_KMS_HELPER
>>>  	select DRM_PANEL_BRIDGE
>>>  	help
>>> -	  Support for transparent parallel to LVDS encoders that don't require
>>> -	  any configuration.
>>> +	  Support for transparent LVDS encoders and LVDS decoders that don't
>>> +	  require any configuration.
>>>
>>>  config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
>>>  	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
>>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
>>> index 4934fcf..8a9178a 100644
>>> --- a/drivers/gpu/drm/bridge/Makefile
>>> +++ b/drivers/gpu/drm/bridge/Makefile
>>> @@ -2,7 +2,7 @@
>>>  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>>>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>>>  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
>>> -obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>>> +obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>>>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>>>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>>>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>>> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
>>> new file mode 100644
>>> index 0000000..8a1979c
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
>>> @@ -0,0 +1,169 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> + */
>>> +
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_graph.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include <drm/drm_bridge.h>
>>> +#include <drm/drm_panel.h>
>>> +
>>> +struct lvds_codec {
>>> +	struct drm_bridge bridge;
>>> +	struct drm_bridge *panel_bridge;
>>> +	struct gpio_desc *powerdown_gpio;
>>> +	u32 connector_type;
>>> +};
>>> +
>>> +static int lvds_codec_attach(struct drm_bridge *bridge)
>>> +{
>>> +	struct lvds_codec *lvds_codec = container_of(bridge,
>>> +							 struct lvds_codec,
>>> +							 bridge);
>>> +
>>> +	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
>>> +				 bridge);
>>> +}
>>> +
>>> +static void lvds_codec_enable(struct drm_bridge *bridge)
>>> +{
>>> +	struct lvds_codec *lvds_codec = container_of(bridge,
>>> +							 struct lvds_codec,
>>> +							 bridge);
>>> +
>>> +	if (lvds_codec->powerdown_gpio)
>>> +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
>>> +}
>>> +
>>> +static void lvds_codec_disable(struct drm_bridge *bridge)
>>> +{
>>> +	struct lvds_codec *lvds_codec = container_of(bridge,
>>> +							 struct lvds_codec,
>>> +							 bridge);
>>> +
>>> +	if (lvds_codec->powerdown_gpio)
>>> +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
>>> +}
>>> +
>>> +static struct drm_bridge_funcs funcs = {
>>> +	.attach = lvds_codec_attach,
>>> +	.enable = lvds_codec_enable,
>>> +	.disable = lvds_codec_disable,
>>> +};
>>> +
>>> +static int lvds_codec_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct device_node *port;
>>> +	struct device_node *endpoint;
>>> +	struct device_node *panel_node;
>>> +	struct drm_panel *panel;
>>> +	struct lvds_codec *lvds_codec;
>>> +
>>> +	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>>> +	if (!lvds_codec)
>>> +		return -ENOMEM;
>>> +
>>> +	lvds_codec->connector_type = (u32)
>>> +		of_device_get_match_data(&pdev->dev);
>>> +	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>>> +							       GPIOD_OUT_HIGH);
>>> +	if (IS_ERR(lvds_codec->powerdown_gpio)) {
>>> +		int err = PTR_ERR(lvds_codec->powerdown_gpio);
>>> +
>>> +		if (err != -EPROBE_DEFER)
>>> +			dev_err(dev, "powerdown GPIO failure: %d\n", err);
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Locate the panel DT node. */
>>> +	port = of_graph_get_port_by_id(dev->of_node, 1);
>>> +	if (!port) {
>>> +		dev_dbg(dev, "port 1 not found\n");
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	endpoint = of_get_child_by_name(port, "endpoint");
>>> +	of_node_put(port);
>>> +	if (!endpoint) {
>>> +		dev_dbg(dev, "no endpoint for port 1\n");
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	panel_node = of_graph_get_remote_port_parent(endpoint);
>>> +	of_node_put(endpoint);
>>> +	if (!panel_node) {
>>> +		dev_dbg(dev, "no remote endpoint for port 1\n");
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	panel = of_drm_find_panel(panel_node);
>>> +	of_node_put(panel_node);
>>> +	if (IS_ERR(panel)) {
>>> +		dev_dbg(dev, "panel not found, deferring probe\n");
>>> +		return PTR_ERR(panel);
>>> +	}
>>> +
>>> +	lvds_codec->panel_bridge =
>>> +		devm_drm_panel_bridge_add_typed(dev, panel,
>>> +						lvds_codec->connector_type);
>>> +	if (IS_ERR(lvds_codec->panel_bridge))
>>> +		return PTR_ERR(lvds_codec->panel_bridge);
>>> +
>>> +	/* The panel_bridge bridge is attached to the panel's of_node,
>>> +	 * but we need a bridge attached to our of_node for our user
>>> +	 * to look up.
>>> +	 */
>>> +	lvds_codec->bridge.of_node = dev->of_node;
>>> +	lvds_codec->bridge.funcs = &funcs;
>>> +	drm_bridge_add(&lvds_codec->bridge);
>>> +
>>> +	platform_set_drvdata(pdev, lvds_codec);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int lvds_codec_remove(struct platform_device *pdev)
>>> +{
>>> +	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
>>> +
>>> +	drm_bridge_remove(&lvds_codec->bridge);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id lvds_codec_match[] = {
>>> +	{
>>> +		.compatible = "lvds-encoder",
>>> +		.data = (void *)DRM_MODE_CONNECTOR_LVDS
>>> +	},
>>> +	{
>>> +		.compatible = "thine,thc63lvdm83d",
>>> +		.data = (void *)DRM_MODE_CONNECTOR_LVDS,
>>> +	},
>>> +	{
>>> +		.compatible = "lvds-decoder",
>>> +		.data = (void *)DRM_MODE_CONNECTOR_Unknown,
>>> +	},
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, lvds_codec_match);
>>> +
>>> +static struct platform_driver lvds_codec_driver = {
>>> +	.probe	= lvds_codec_probe,
>>> +	.remove	= lvds_codec_remove,
>>> +	.driver		= {
>>> +		.name		= "lvds-codec",
>>> +		.of_match_table	= lvds_codec_match,
>>> +	},
>>> +};
>>> +module_platform_driver(lvds_codec_driver);
>>> +
>>> +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>>> +MODULE_DESCRIPTION("Driver for transparent LVDS encoders and LVDS decoders");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
>>> deleted file mode 100644
>>> index e2132a8..0000000
>>> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
>>> +++ /dev/null
>>> @@ -1,155 +0,0 @@
>>> -// SPDX-License-Identifier: GPL-2.0-or-later
>>> -/*
>>> - * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> - */
>>> -
>>> -#include <linux/gpio/consumer.h>
>>> -#include <linux/module.h>
>>> -#include <linux/of.h>
>>> -#include <linux/of_graph.h>
>>> -#include <linux/platform_device.h>
>>> -
>>> -#include <drm/drm_bridge.h>
>>> -#include <drm/drm_panel.h>
>>> -
>>> -struct lvds_encoder {
>>> -	struct drm_bridge bridge;
>>> -	struct drm_bridge *panel_bridge;
>>> -	struct gpio_desc *powerdown_gpio;
>>> -};
>>> -
>>> -static int lvds_encoder_attach(struct drm_bridge *bridge)
>>> -{
>>> -	struct lvds_encoder *lvds_encoder = container_of(bridge,
>>> -							 struct lvds_encoder,
>>> -							 bridge);
>>> -
>>> -	return drm_bridge_attach(bridge->encoder, lvds_encoder->panel_bridge,
>>> -				 bridge);
>>> -}
>>> -
>>> -static void lvds_encoder_enable(struct drm_bridge *bridge)
>>> -{
>>> -	struct lvds_encoder *lvds_encoder = container_of(bridge,
>>> -							 struct lvds_encoder,
>>> -							 bridge);
>>> -
>>> -	if (lvds_encoder->powerdown_gpio)
>>> -		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 0);
>>> -}
>>> -
>>> -static void lvds_encoder_disable(struct drm_bridge *bridge)
>>> -{
>>> -	struct lvds_encoder *lvds_encoder = container_of(bridge,
>>> -							 struct lvds_encoder,
>>> -							 bridge);
>>> -
>>> -	if (lvds_encoder->powerdown_gpio)
>>> -		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
>>> -}
>>> -
>>> -static struct drm_bridge_funcs funcs = {
>>> -	.attach = lvds_encoder_attach,
>>> -	.enable = lvds_encoder_enable,
>>> -	.disable = lvds_encoder_disable,
>>> -};
>>> -
>>> -static int lvds_encoder_probe(struct platform_device *pdev)
>>> -{
>>> -	struct device *dev = &pdev->dev;
>>> -	struct device_node *port;
>>> -	struct device_node *endpoint;
>>> -	struct device_node *panel_node;
>>> -	struct drm_panel *panel;
>>> -	struct lvds_encoder *lvds_encoder;
>>> -
>>> -	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
>>> -	if (!lvds_encoder)
>>> -		return -ENOMEM;
>>> -
>>> -	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>>> -							       GPIOD_OUT_HIGH);
>>> -	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
>>> -		int err = PTR_ERR(lvds_encoder->powerdown_gpio);
>>> -
>>> -		if (err != -EPROBE_DEFER)
>>> -			dev_err(dev, "powerdown GPIO failure: %d\n", err);
>>> -		return err;
>>> -	}
>>> -
>>> -	/* Locate the panel DT node. */
>>> -	port = of_graph_get_port_by_id(dev->of_node, 1);
>>> -	if (!port) {
>>> -		dev_dbg(dev, "port 1 not found\n");
>>> -		return -ENXIO;
>>> -	}
>>> -
>>> -	endpoint = of_get_child_by_name(port, "endpoint");
>>> -	of_node_put(port);
>>> -	if (!endpoint) {
>>> -		dev_dbg(dev, "no endpoint for port 1\n");
>>> -		return -ENXIO;
>>> -	}
>>> -
>>> -	panel_node = of_graph_get_remote_port_parent(endpoint);
>>> -	of_node_put(endpoint);
>>> -	if (!panel_node) {
>>> -		dev_dbg(dev, "no remote endpoint for port 1\n");
>>> -		return -ENXIO;
>>> -	}
>>> -
>>> -	panel = of_drm_find_panel(panel_node);
>>> -	of_node_put(panel_node);
>>> -	if (IS_ERR(panel)) {
>>> -		dev_dbg(dev, "panel not found, deferring probe\n");
>>> -		return PTR_ERR(panel);
>>> -	}
>>> -
>>> -	lvds_encoder->panel_bridge =
>>> -		devm_drm_panel_bridge_add_typed(dev, panel,
>>> -						DRM_MODE_CONNECTOR_LVDS);
>>> -	if (IS_ERR(lvds_encoder->panel_bridge))
>>> -		return PTR_ERR(lvds_encoder->panel_bridge);
>>> -
>>> -	/* The panel_bridge bridge is attached to the panel's of_node,
>>> -	 * but we need a bridge attached to our of_node for our user
>>> -	 * to look up.
>>> -	 */
>>> -	lvds_encoder->bridge.of_node = dev->of_node;
>>> -	lvds_encoder->bridge.funcs = &funcs;
>>> -	drm_bridge_add(&lvds_encoder->bridge);
>>> -
>>> -	platform_set_drvdata(pdev, lvds_encoder);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static int lvds_encoder_remove(struct platform_device *pdev)
>>> -{
>>> -	struct lvds_encoder *lvds_encoder = platform_get_drvdata(pdev);
>>> -
>>> -	drm_bridge_remove(&lvds_encoder->bridge);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static const struct of_device_id lvds_encoder_match[] = {
>>> -	{ .compatible = "lvds-encoder" },
>>> -	{ .compatible = "thine,thc63lvdm83d" },
>>> -	{},
>>> -};
>>> -MODULE_DEVICE_TABLE(of, lvds_encoder_match);
>>> -
>>> -static struct platform_driver lvds_encoder_driver = {
>>> -	.probe	= lvds_encoder_probe,
>>> -	.remove	= lvds_encoder_remove,
>>> -	.driver		= {
>>> -		.name		= "lvds-encoder",
>>> -		.of_match_table	= lvds_encoder_match,
>>> -	},
>>> -};
>>> -module_platform_driver(lvds_encoder_driver);
>>> -
>>> -MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>>> -MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
>>> -MODULE_LICENSE("GPL");
>>>
> 

