Return-Path: <linux-renesas-soc+bounces-30661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHR8JPj6y2mcNAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:48:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA336D2C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFE8B31F026D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 16:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF666426D06;
	Tue, 31 Mar 2026 16:37:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5F7423A93
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975027; cv=none; b=mLOZ9qA/SDwFl2FiiTMfTzYvGEO/e1gBbKE4PdmKBCRDfxGEWFTezrFZL9iIVCRzURMVBQ+HpRocRzFlClE2mp3WSZtV70oLhHfAtdiZOwS9slA/jaWa4jpDDQbOy2PZqeBeZxu8KX23aoegRb+NUHqYd1J6SwxzMRhBVavsAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975027; c=relaxed/simple;
	bh=+UP5jDRgRrhTKDpe4/Eb6DFbB/J0Uu9rOaYB30d1NG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxZJzJkZ4/VQ0FDg66I5kCB7J9/7undZFwCU+xovOBu4BE2JSbqoVqealYfWbaLkIqpoaZvbWl4n/nUrx8CSHxJaJjpdN6oSE9JqiZ1D1n9rx9Tsl8Msige3G9A7DwV2E9CDiq1ENply6RmX/cG1ryBcLMlqA41PdYhlzwdnStw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7c59-0000dv-0A; Tue, 31 Mar 2026 18:36:47 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7c58-0034QK-0Z;
	Tue, 31 Mar 2026 18:36:46 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7c58-00000000Guu-0KUb;
	Tue, 31 Mar 2026 18:36:46 +0200
Message-ID: <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com, peda@axentia.se
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Josua Mayer <josua@solid-run.com>, Ulf
 Hansson	 <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 31 Mar 2026 18:36:45 +0200
In-Reply-To: <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
	 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30661-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,axentia.se];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.258];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:mid]
X-Rspamd-Queue-Id: DFBA336D2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fr, 2026-03-27 at 19:08 +0100, Tommaso Merciai wrote:
> Replace raw MMIO accesses (void __iomem *, readl/writel) with
> regmap_read/regmap_write via devm_regmap_init_mmio(). Regmap
> provides its own internal locking, so the manual spinlock and
> scoped_guard() wrappers are no longer needed.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v8->v9:
>  - New patch
>=20
>  drivers/reset/Kconfig               |  1 +
>  drivers/reset/reset-rzv2h-usb2phy.c | 42 ++++++++++++++++-------------
>  2 files changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5165006be693..c539ca88518f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
>  config RESET_RZV2H_USB2PHY
>  	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	select REGMAP_MMIO
>  	help
>  	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
>  	  (and similar SoCs).
> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> index 5bdd39274612..4014eff0f017 100644
> --- a/drivers/reset/reset-rzv2h-usb2phy.c
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -5,13 +5,13 @@
>   * Copyright (C) 2025 Renesas Electronics Corporation
>   */
> =20
> -#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> =20
> @@ -37,10 +37,9 @@ struct rzv2h_usb2phy_reset_of_data {
> =20
>  struct rzv2h_usb2phy_reset_priv {
>  	const struct rzv2h_usb2phy_reset_of_data *data;
> -	void __iomem *base;
> +	struct regmap *regmap;
>  	struct device *dev;
>  	struct reset_controller_dev rcdev;
> -	spinlock_t lock; /* protects register accesses */
>  };
> =20
>  static inline struct rzv2h_usb2phy_reset_priv
> @@ -55,10 +54,8 @@ static int rzv2h_usbphy_reset_assert(struct reset_cont=
roller_dev *rcdev,
>  	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
>  	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> =20
> -	scoped_guard(spinlock, &priv->lock) {
> -		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> -		writel(data->reset_assert_val, priv->base + data->reset_reg);
> -	}
> +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_acquire_val);
> +	regmap_write(priv->regmap, data->reset_reg, data->reset_assert_val);

What is the spinlock protecting? acquire/assert registers being set
together, without another acquire/assert or deassert/release register
access pair interleaving?
In that case you still need the lock. Or use regmap_multi_reg_write().
You could even directly store the sequences as struct reg_sequence in
rzv2h_usb2phy_reset_of_data.

>  	usleep_range(11, 20);
> =20
> @@ -71,11 +68,9 @@ static int rzv2h_usbphy_reset_deassert(struct reset_co=
ntroller_dev *rcdev,
>  	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
>  	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> =20
> -	scoped_guard(spinlock, &priv->lock) {
> -		writel(data->reset_deassert_val, priv->base + data->reset_reg);
> -		writel(data->reset2_release_val, priv->base + data->reset2_reg);
> -		writel(data->reset_release_val, priv->base + data->reset_reg);
> -	}
> +	regmap_write(priv->regmap, data->reset_reg, data->reset_deassert_val);
> +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_release_val);
> +	regmap_write(priv->regmap, data->reset_reg, data->reset_release_val);

Same as above.

[...]

> @@ -149,7 +153,7 @@ static int rzv2h_usb2phy_reset_probe(struct platform_=
device *pdev)
>  		return dev_err_probe(dev, error, "unable to register cleanup action\n"=
);
> =20
>  	for (unsigned int i =3D 0; i < data->init_val_count; i++)
> -		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +		regmap_write(priv->regmap, data->init_vals[i].reg, data->init_vals[i].=
val);

Not required for locking, but this could use regmap_multi_reg_write()
as well.

regards
Philipp

