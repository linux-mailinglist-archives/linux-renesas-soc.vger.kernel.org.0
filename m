Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7FDF4545
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 12:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730623AbfKHLCs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 06:02:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHLCr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 06:02:47 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88EB223F;
        Fri,  8 Nov 2019 12:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573210964;
        bh=kfFAClfdkiu6iSAk5dOKQrMTdhzDnrPMe0HeYQHf0Qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaoJ4HAvH0zoWbYFDkvFkSvEBjVhH4UBq7H2L9M+v4d888+f01hi/R8nN5IlIdrfq
         qBYZGDlYtuBFjCDjeEBswRCDzMO7USVJ0ZbRrGPv0aRtUOBhBbeMGR8rRZZrgHUHZP
         IsRx980dDHShwi9Yoy8gMZOR6hcSHcmGywo79a/o=
Date:   Fri, 8 Nov 2019 13:02:35 +0200
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
        Peter Rosin <peda@axentia.se>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 2/7] drm/bridge: Repurpose lvds-encoder.c
Message-ID: <20191108110235.GC4866@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107203454.GN24983@pendragon.ideasonboard.com>
 <TYXPR01MB177573D7BD9DAA139F7FAB8FC07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYXPR01MB177573D7BD9DAA139F7FAB8FC07B0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Nov 08, 2019 at 09:22:56AM +0000, Fabrizio Castro wrote:
> On 07 November 2019 20:35 Laurent Pinchart wrote:
> > On Thu, Nov 07, 2019 at 08:10:58PM +0000, Fabrizio Castro wrote:
> > > lvds-encoder.c implementation is also suitable for LVDS decoders,
> > > not just LVDS encoders.
> > > Instead of creating a new driver for addressing support for
> > > transparent LVDS decoders, repurpose lvds-encoder.c for the greater
> > > good.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > v2->v3:
> > > * No change
> > > v1->v2:
> > > * No change
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig        |   8 +-
> > >  drivers/gpu/drm/bridge/Makefile       |   2 +-
> > >  drivers/gpu/drm/bridge/lvds-codec.c   | 131 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/bridge/lvds-encoder.c | 155 ----------------------------------
> > >  4 files changed, 136 insertions(+), 160 deletions(-)
> > 
> > It would help if you added the -M1 option to git-format-patch to detect
> > the rename, the result would be easier to review.
> 
> Will do, thank you for the hint
> 
> > >  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
> > >  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index 3436297..9e75ca4e 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
> > >  	  Support for non-programmable RGB to VGA DAC bridges, such as ADI
> > >  	  ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
> > >
> > > -config DRM_LVDS_ENCODER
> > > -	tristate "Transparent parallel to LVDS encoder support"
> > > +config DRM_LVDS_CODEC
> > > +	tristate "Transparent LVDS encoders and decoders support"
> > >  	depends on OF
> > >  	select DRM_KMS_HELPER
> > >  	select DRM_PANEL_BRIDGE
> > >  	help
> > > -	  Support for transparent parallel to LVDS encoders that don't require
> > > -	  any configuration.
> > > +	  Support for transparent LVDS encoders and LVDS decoders that don't
> > > +	  require any configuration.
> > >
> > >  config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
> > >  	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
> > > diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> > > index 4934fcf..8a9178a 100644
> > > --- a/drivers/gpu/drm/bridge/Makefile
> > > +++ b/drivers/gpu/drm/bridge/Makefile
> > > @@ -2,7 +2,7 @@
> > >  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
> > >  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> > >  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> > > -obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
> > > +obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> > >  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> > >  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
> > >  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
> > > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > > new file mode 100644
> > > index 0000000..d57a8eb
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > > @@ -0,0 +1,131 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (C) 2019 Renesas Electronics Corporation
> > > + * Copyright (C) 2016 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > + */
> > > +
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_graph.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include <drm/drm_bridge.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +struct lvds_codec {
> > > +	struct drm_bridge bridge;
> > > +	struct drm_bridge *panel_bridge;
> > > +	struct gpio_desc *powerdown_gpio;
> > > +};
> > > +
> > > +static int lvds_codec_attach(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +						     struct lvds_codec, bridge);
> > > +
> > > +	return drm_bridge_attach(bridge->encoder, lvds_codec->panel_bridge,
> > > +				 bridge);
> > > +}
> > > +
> > > +static void lvds_codec_enable(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +						     struct lvds_codec, bridge);
> > > +
> > > +	if (lvds_codec->powerdown_gpio)
> > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 0);
> > > +}
> > > +
> > > +static void lvds_codec_disable(struct drm_bridge *bridge)
> > > +{
> > > +	struct lvds_codec *lvds_codec = container_of(bridge,
> > > +						     struct lvds_codec, bridge);
> > > +
> > > +	if (lvds_codec->powerdown_gpio)
> > > +		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
> > > +}
> > > +
> > > +static struct drm_bridge_funcs funcs = {
> > > +	.attach = lvds_codec_attach,
> > > +	.enable = lvds_codec_enable,
> > > +	.disable = lvds_codec_disable,
> > > +};
> > > +
> > > +static int lvds_codec_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *panel_node;
> > > +	struct drm_panel *panel;
> > > +	struct lvds_codec *lvds_codec;
> > > +
> > > +	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> > > +	if (!lvds_codec)
> > > +		return -ENOMEM;
> > > +
> > > +	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > +							     GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(lvds_codec->powerdown_gpio))
> > > +		return PTR_ERR(lvds_codec->powerdown_gpio);
> > 
> > The driver had an error message here, any reason it got removed ?
> 
> I am quoting from https://www.spinics.net/lists/devicetree/msg318602.html :
> "I know it was there already, but this seems a bit unusual for the
> minimal gain of having a printout in the very unlikely case the
> gpiod_get() operations fails. I would just return PTR_ERR()."
> 
> I am OK with reinstating it, just let me know what you want me to do here.

Debugging probe failures is annoying without proper error messages. As
the GPIO is optional, though, it's probably safe to drop it, but if you
decide to do so, please split that to a separate patch. What bothers me
the most is that the change is hidden and not explained in the commit
message.

> > > +
> > > +	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> > > +	if (!panel_node) {
> > > +		dev_dbg(dev, "panel DT node not found\n");
> > > +		return -ENXIO;
> > > +	}
> > > +
> > > +	panel = of_drm_find_panel(panel_node);
> > > +	of_node_put(panel_node);
> > > +	if (IS_ERR(panel)) {
> > > +		dev_dbg(dev, "panel not found, deferring probe\n");
> > > +		return PTR_ERR(panel);
> > > +	}
> > > +
> > > +	lvds_codec->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > 
> > This was devm_drm_panel_bridge_add_typed(), do you think there's a risk
> > of breaking userspace ? Of course as noted in the documentation of
> > devm_drm_panel_bridge_add_typed() the right solution is to fix panel
> > drivers, but I'm still slightly worried.
> 
> Things break when the panel doesn't define connector_type, leading to the below
> check from devm_drm_panel_bridge_add:
> if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))        
>     return NULL;
> 
> Please advise on the best course of action here.

It's a matter of risk management. Is there a system that uses a buggy
panel driver with lvds-encoder out there ? If you think the risk is
close to 0, this change is fine. Otherwise we need to keep using
devm_drm_panel_bridge_add_typed() for the lvds-encoder case. In any
case, please split this to a separate patch.

> > Actually, could you split this patch in two, with a patch that only
> > renames the driver (and the symbols internally) without any functional
> > change, and another patch that performs the modifications ? That would
> > be much easier to review and discuss.
> 
> Will do
> 
> > > +	if (IS_ERR(lvds_codec->panel_bridge))
> > > +		return PTR_ERR(lvds_codec->panel_bridge);
> > > +
> > > +	/* The panel_bridge bridge is attached to the panel's of_node,
> > > +	 * but we need a bridge attached to our of_node for our user
> > > +	 * to look up.
> > > +	 */
> > > +	lvds_codec->bridge.of_node = dev->of_node;
> > > +	lvds_codec->bridge.funcs = &funcs;
> > > +	drm_bridge_add(&lvds_codec->bridge);
> > > +
> > > +	platform_set_drvdata(pdev, lvds_codec);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int lvds_codec_remove(struct platform_device *pdev)
> > > +{
> > > +	struct lvds_codec *lvds_codec = platform_get_drvdata(pdev);
> > > +
> > > +	drm_bridge_remove(&lvds_codec->bridge);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id lvds_codec_match[] = {
> > > +	{ .compatible = "lvds-encoder"  },
> > > +	{ .compatible = "thine,thc63lvdm83d" },
> > > +	{ .compatible = "lvds-decoder" },
> > > +	{},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, lvds_codec_match);
> > > +
> > > +static struct platform_driver lvds_codec_driver = {
> > > +	.probe	= lvds_codec_probe,
> > > +	.remove	= lvds_codec_remove,
> > > +	.driver		= {
> > > +		.name		= "lvds-codec",
> > > +		.of_match_table	= lvds_codec_match,
> > > +	},
> > > +};
> > > +module_platform_driver(lvds_codec_driver);
> > > +
> > > +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> > > +MODULE_DESCRIPTION("Driver for transparent LVDS encoders and LVDS decoders");
> > 
> > Maybe "LVDS encoders and decoders" ?
> > 
> > > +MODULE_LICENSE("GPL");
> > 
> > [snip]

-- 
Regards,

Laurent Pinchart
