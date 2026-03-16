Return-Path: <linux-renesas-soc+bounces-29492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN6UFl4OuGkWYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:06:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92329AFF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B439E30300F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26006280A5B;
	Mon, 16 Mar 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fBATUmFe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDEB39B4A2;
	Mon, 16 Mar 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669758; cv=none; b=sqr6OVSewKZC3aO1Z5d7lCkWIi0KGS7uwCag+T+UGq/744GBe9C8gbubA61a+jJFX40MzaqtxfooTdtMOO8zc2NFAMJA/K8SPld1Wm6RzlS5Og5tXYAyVoUqIjIIteACtcF4mkWZbrugruXry5vLBZrftOh91pPe8r8KTcICzJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669758; c=relaxed/simple;
	bh=rnC9ZWruT8P234OiKFoEBR1WUr45WgRnghL0ZijnQnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUPvmfcUkfpN50iGNpcLn9QR3WMziLWSrnhfgsH8aZlfPozlifSzJhfSr8lAvFi6ebdBB0mSz8JHBG1bU06GPIMNmI8VRoMq+mOJXZpov4QM69WZ+5aU4uO/ujPVvjssOLyizVRQH5RyraB/CJlocJDKPBnvavFpppFR7LHvUxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fBATUmFe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8524622E;
	Mon, 16 Mar 2026 15:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773669682;
	bh=rnC9ZWruT8P234OiKFoEBR1WUr45WgRnghL0ZijnQnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBATUmFeL0g6mBXRZZPIWVMRnJ9VL6l3LMjYQJtRsya6FJCcz8woLDRxgIUSw1JbM
	 z6zfFHE5EYQMy2jNVjOOAnOZ3d0+YsyZAc/svT0zPMM/t2fIIMKcmfEE4aI3B0BEnF
	 P6vgKw5xSxiXO+k2YxDIw+U0B3TuOm/6YNExs8cQ=
Date: Mon, 16 Mar 2026 16:02:32 +0200
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Biju <biju.das.au@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jesse Van Gavere <jesseevg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Clear HPD IRQ before powering on
 device during resume()
Message-ID: <20260316140232.GB31616@killaraus.ideasonboard.com>
References: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219104659.114032-1-biju.das.jz@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29492-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,bp.renesas.com,kwiboo.se,oss.qualcomm.com,rock-chips.com,chromium.org,bootlin.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,renesas.com:email,killaraus.ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF92329AFF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

Thank you for the patch.

On Fri, Dec 19, 2025 at 10:46:53AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On RZ/G3E SMARC EVK using PSCI, s2ram powers down the SoC. Testing ADV7535
> IRQ configured as edge-triggered interrupt on RZ/G3E SMARC EVK shows that
> it is missing HPD IRQ during system resume, as the status change occurs
> before the IRQ/pincontrol resume. Once the status bit is set, there won't
> be any further IRQ unless the status bit is cleared.
> 
> Clear any pending HPD IRQs before powering on the ADV7535 device to
> deliver HPD interrupts after resume().

This issue doesn't seem to be specific to the ADV7511. Any device that
uses an edge-triggered interrupt could suffer from the same problem.
Implementing a work around in the driver doesn't seem to be a solution
that would scale.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 32 ++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 8be7266fd4f4..03aa23836ca4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -393,6 +393,7 @@ struct adv7511 {
>  	bool cec_enabled_adap;
>  	struct clk *cec_clk;
>  	u32 cec_clk_freq;
> +	bool suspended;
>  };
>  
>  static inline struct adv7511 *bridge_to_adv7511(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index b9be86541307..8d9467187d7c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -790,6 +790,25 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
>  	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  
> +	if (adv->i2c_main->irq && adv->suspended) {
> +		unsigned int irq;
> +
> +		/*
> +		 * If ADV7511 IRQ is configured as edge triggered interrupt, it
> +		 * will miss the IRQ during system resume as the status change
> +		 * occurs before IRQ/pincontrol resume. Once the status bit is

That seems very platform-specific.

> +		 * set there won't be any further IRQ unless the status bit is
> +		 * cleared. So, clear the IRQ status bit for further delivery
> +		 * of HPD IRQ.
> +		 */
> +		regmap_read(adv->regmap, ADV7511_REG_INT(0), &irq);
> +		if (irq & ADV7511_INT0_HPD)
> +			regmap_write(adv->regmap, ADV7511_REG_INT(0),
> +				     ADV7511_INT0_HPD);

Why do you need to read and test the IRQ here ? If ADV7511_INT0_HPD
isn't set, a write will be a no-op and will keep it cleared. If it is
set, it will clear it. It seems that an unconditional

		regmap_write(adv->regmap, ADV7511_REG_INT(0),
			     ADV7511_INT0_HPD);

should be enough.

> +
> +		adv->suspended = false;
> +	}
> +
>  	adv7511_power_on(adv);
>  
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> @@ -1407,6 +1426,16 @@ static void adv7511_remove(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  }
>  
> +static int adv7511_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
> +
> +	adv7511->suspended = true;
> +
> +	return 0;
> +}
> +
>  static const struct adv7511_chip_info adv7511_chip_info = {
>  	.type = ADV7511,
>  	.name = "ADV7511",
> @@ -1439,6 +1468,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
>  	.hpd_override_enable = true,
>  };
>  
> +static DEFINE_SIMPLE_DEV_PM_OPS(adv7511_pm_ops, adv7511_suspend, NULL);
> +
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
>  	{ "adv7511", (kernel_ulong_t)&adv7511_chip_info },
>  	{ "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
> @@ -1467,6 +1498,7 @@ static struct i2c_driver adv7511_driver = {
>  	.driver = {
>  		.name = "adv7511",
>  		.of_match_table = adv7511_of_ids,
> +		.pm = pm_sleep_ptr(&adv7511_pm_ops),
>  	},
>  	.id_table = adv7511_i2c_ids,
>  	.probe = adv7511_probe,

-- 
Regards,

Laurent Pinchart

