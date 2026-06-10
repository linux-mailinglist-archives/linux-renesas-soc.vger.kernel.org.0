Return-Path: <linux-renesas-soc+bounces-33855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AktlBIj4KWpwgQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:51:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBAA66D709
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 01:51:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=DniidBE9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3701130117DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 23:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752E53BED2B;
	Wed, 10 Jun 2026 23:51:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC973750D5;
	Wed, 10 Jun 2026 23:51:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135483; cv=none; b=MK/NwSCixpvYfPW22nx6jWxrEocy6uUcKIPWOdh0gRJPcCEcMjTxmeC3as/0lu8qZbZtNZ7uBIQTRymhErb60FH6rV9a0JoUEjHhZNCINLx8XkHZFMzaykUnwEB6KdH2psIcwHvn91PffjlM+0CzrKoTwcGvajsnUQvTOCR94ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135483; c=relaxed/simple;
	bh=8aF0vJYkTLqyc2hfjIBLggx/b98ZBrmOXXZp0EwuxKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWXrX8hiW2IoDomxZ6KIEUkQfTSlvU1BQYhZ9qwPNXob81fyqwNDywrYbyoQUhoGHy4IgCkfgyWtBRme1lpx+BYltk86zwQZUn99QRr2MggVE77Q6fau9ZMUjsCuJ6u9MTExQlWJDrdB6rJarbSUkK4TVHZUDWlBDejWHg80RV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DniidBE9; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B39D228;
	Thu, 11 Jun 2026 01:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781135448;
	bh=8aF0vJYkTLqyc2hfjIBLggx/b98ZBrmOXXZp0EwuxKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DniidBE9r4tGw3ZP5rxqEZXzDw6WJ8GEHp0mIQ6V8rihjEcYgw8FJMmdNQU8fFupW
	 W4Gdmcs5+ZcT/u+i86Jxey/R0mKf1ahKLUoFAp31UXP8T9BE6mTVcUFKGMuGnA3na1
	 PZND/SOAj1IERCtyc805Mjd4FQ+ovozOqa1MHenc=
Date: Thu, 11 Jun 2026 02:51:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/7] drm/rcar-du: dsc: Add rudimentary Renesas R-Car
 V4H DSC driver
Message-ID: <20260610235116.GG1632628@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-3-164157820498@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33855-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:marek.vasut+renesas@mailbox.org,m:kieran.bingham+renesas@ideasonboard.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:tomi.valkeinen@ideasonboard.com,m:geert@glider.be,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:marek.vasut@mailbox.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,intel.com,linaro.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,mailbox.org,ideasonboard.com,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CBAA66D709

Hi Tomi, Marek,

Thank you for the patch.

On Fri, May 15, 2026 at 12:09:28PM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a

s/s \./s./

> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig    |  12 +++
>  drivers/gpu/drm/renesas/rcar-du/Makefile   |   1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c | 160 +++++++++++++++++++++++++++++
>  3 files changed, 173 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 840305fdeb49..c58dba949d85 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -33,6 +33,18 @@ config DRM_RCAR_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
>  
> +config DRM_RCAR_USE_DSC
> +	bool "R-Car DU DSC Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
> +	default DRM_RCAR_DU
> +	help
> +	  Enable support for the R-Car Display Unit embedded DSC encoder.
> +
> +config DRM_RCAR_DSC
> +	def_tristate DRM_RCAR_DU
> +	depends on DRM_RCAR_USE_DSC
> +

Nitpicking, I'd move this above CMM, for preserve alphabetical ordering
of the blocks.

>  config DRM_RCAR_USE_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
>  	depends on DRM_BRIDGE && OF
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/renesas/rcar-du/Makefile
> index 6f132325c8b7..cc27b2265d94 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
> @@ -12,5 +12,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
>  obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
> +obj-$(CONFIG_DRM_RCAR_DSC)		+= rcar_dsc.o

Here too.

>  obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> new file mode 100644
> index 000000000000..5d3d083e3ce6
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R-Car DSC Encoder
> + *
> + * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +

#include <linux/container_of.h>

> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>

I think you can drop drm_of.h.

> +
> +struct rcar_dsc {
> +	struct drm_bridge bridge;
> +
> +	struct device *dev;
> +	void __iomem *mmio;
> +};
> +
> +static inline struct rcar_dsc *bridge_to_rcar_dsc(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct rcar_dsc, bridge);
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
> +static int rcar_dsc_attach(struct drm_bridge *bridge,
> +			   struct drm_encoder *encoder,
> +			   enum drm_bridge_attach_flags flags)
> +{
> +	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;
> +
> +	return drm_bridge_attach(encoder, dsc->bridge.next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +				   struct drm_atomic_state *state)

Small conflict when rebasing on top of drm-misc.

> +{
> +	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +	WARN_ON(pm_runtime_resume_and_get(dsc->dev));
> +}
> +
> +static void rcar_dsc_atomic_disable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +	pm_runtime_put(dsc->dev);
> +}
> +
> +static enum drm_mode_status
> +rcar_dsc_bridge_mode_valid(struct drm_bridge *bridge,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
> +{
> +	if (mode->hdisplay < 320 || mode->hdisplay > 8190)
> +		return MODE_BAD_HVALUE;
> +
> +	if (mode->vdisplay < 160 || mode->vdisplay > 8190)
> +		return MODE_BAD_VVALUE;
> +
> +	if (mode->clock > 400000) /* Really 400 Mpixel/s */
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs rcar_dsc_bridge_ops = {
> +	.attach = rcar_dsc_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_enable = rcar_dsc_atomic_enable,
> +	.atomic_disable = rcar_dsc_atomic_disable,
> +	.mode_valid = rcar_dsc_bridge_mode_valid,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Probe & Remove
> + */
> +
> +static int rcar_dsc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *remote;
> +	struct rcar_dsc *dsc;
> +	int ret;
> +
> +	dsc = devm_drm_bridge_alloc(dev, struct rcar_dsc, bridge,
> +				    &rcar_dsc_bridge_ops);
> +	if (IS_ERR(dsc))
> +		return PTR_ERR(dsc);
> +
> +	platform_set_drvdata(pdev, dsc);
> +
> +	dsc->dev = &pdev->dev;
> +
> +	dsc->mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(dsc->mmio))
> +		return PTR_ERR(dsc->mmio);

The driver doesn't access registers, so this can be dropped (along with
the mmio field in the rcar_dsc structure).

> +
> +	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!remote)
> +		return -EINVAL;
> +
> +	dsc->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
> +	of_node_put(remote);

You can replace this with

	dsc->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node,
								1, 0);

and drop inclusion of of_graph.h.

> +	if (!dsc->bridge.next_bridge)
> +		return -EPROBE_DEFER;
> +
> +	dsc->bridge.of_node = dev->of_node;
> +
> +	ret = devm_drm_bridge_add(dev, &dsc->bridge);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static void rcar_dsc_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static const struct of_device_id rcar_dsc_of_table[] = {
> +	{ .compatible = "renesas,r8a779g0-dsc" },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_dsc_of_table);
> +
> +static struct platform_driver rcar_dsc_platform_driver = {
> +	.probe          = rcar_dsc_probe,
> +	.remove		= rcar_dsc_remove,
> +	.driver         = {
> +		.name   = "rcar-dsc",
> +		.of_match_table = rcar_dsc_of_table,
> +	},
> +};
> +
> +module_platform_driver(rcar_dsc_platform_driver);
> +
> +MODULE_DESCRIPTION("Renesas R-Car DSC Encoder Driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

