Return-Path: <linux-renesas-soc+bounces-30673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFIoI6/WzGnnWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:26:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210C376C05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2E36305F09B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 08:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302CD3AB289;
	Wed,  1 Apr 2026 08:24:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E8139E17E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031857; cv=none; b=guNL9TbyG6C3xV2r66j4EhVuP9ERAE/sb6I7WNd/6YkZw01bgd52oMiE9iUZ/tDu7ON7WmRdYCqYbjg7xYG/Tpbkmu7qEO7iXp7yMsQidmRMEgaPi/AlrkvlUVZLKJg402/8U9uV61PubOmegBkhO4ZOVEbEQyx2G9QkWHPGmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031857; c=relaxed/simple;
	bh=ZzcQF/xLbG3d2Xhxu7WWzgc6rMJlFaUDEw2dS3CW/vM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VWttLHBt8vKZxGvLuL4VFygKA9hyDgkJ+1Ti0/miv8nCabq2S7rkiySCoIs58FcjHUg5IRyDYivBXIFuQzntNshIgZR2SqmbPttaONEGmSBzRPBeprz8zp+jiQ2P0zqEEJvHg6lrGe5C6VD1+1VeFz91II3SqnNUE1p9CdUPIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7qrh-0007cM-In; Wed, 01 Apr 2026 10:23:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7qrg-003B7l-1L;
	Wed, 01 Apr 2026 10:23:52 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7qrf-000000005us-3m3M;
	Wed, 01 Apr 2026 10:23:51 +0200
Message-ID: <0bad9579a953cc069e17a7075a45c9eb9c7a6d8d.camel@pengutronix.de>
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
 linux-renesas-soc@vger.kernel.org, 	biju.das.jz@bp.renesas.com, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven	 <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Josua Mayer <josua@solid-run.com>, Ulf
 Hansson	 <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 01 Apr 2026 10:23:51 +0200
In-Reply-To: <aczRo8HVUFqXKfG_@tom-desktop>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
	 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
	 <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
	 <aczRo8HVUFqXKfG_@tom-desktop>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-30673-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.847];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 3210C376C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mi, 2026-04-01 at 10:04 +0200, Tommaso Merciai wrote:
> Hi Philipp,
> Thanks for your review.
>=20
> On Tue, Mar 31, 2026 at 06:36:45PM +0200, Philipp Zabel wrote:
> > On Fr, 2026-03-27 at 19:08 +0100, Tommaso Merciai wrote:
> > > Replace raw MMIO accesses (void __iomem *, readl/writel) with
> > > regmap_read/regmap_write via devm_regmap_init_mmio(). Regmap
> > > provides its own internal locking, so the manual spinlock and
> > > scoped_guard() wrappers are no longer needed.
> > >=20
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v8->v9:
> > >  - New patch
> > >=20
> > >  drivers/reset/Kconfig               |  1 +
> > >  drivers/reset/reset-rzv2h-usb2phy.c | 42 ++++++++++++++++-----------=
--
> > >  2 files changed, 24 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > > index 5165006be693..c539ca88518f 100644
> > > --- a/drivers/reset/Kconfig
> > > +++ b/drivers/reset/Kconfig
> > > @@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
> > >  config RESET_RZV2H_USB2PHY
> > >  	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver=
"
> > >  	depends on ARCH_RENESAS || COMPILE_TEST
> > > +	select REGMAP_MMIO
> > >  	help
> > >  	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> > >  	  (and similar SoCs).
> > > diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/rese=
t-rzv2h-usb2phy.c
> > > index 5bdd39274612..4014eff0f017 100644
> > > --- a/drivers/reset/reset-rzv2h-usb2phy.c
> > > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> > > @@ -5,13 +5,13 @@
> > >   * Copyright (C) 2025 Renesas Electronics Corporation
> > >   */
> > > =20
> > > -#include <linux/cleanup.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/io.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regmap.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/reset-controller.h>
> > > =20
> > > @@ -37,10 +37,9 @@ struct rzv2h_usb2phy_reset_of_data {
> > > =20
> > >  struct rzv2h_usb2phy_reset_priv {
> > >  	const struct rzv2h_usb2phy_reset_of_data *data;
> > > -	void __iomem *base;
> > > +	struct regmap *regmap;
> > >  	struct device *dev;
> > >  	struct reset_controller_dev rcdev;
> > > -	spinlock_t lock; /* protects register accesses */
> > >  };
> > > =20
> > >  static inline struct rzv2h_usb2phy_reset_priv
> > > @@ -55,10 +54,8 @@ static int rzv2h_usbphy_reset_assert(struct reset_=
controller_dev *rcdev,
> > >  	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_pri=
v(rcdev);
> > >  	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> > > =20
> > > -	scoped_guard(spinlock, &priv->lock) {
> > > -		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> > > -		writel(data->reset_assert_val, priv->base + data->reset_reg);
> > > -	}
> > > +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_acquire_v=
al);
> > > +	regmap_write(priv->regmap, data->reset_reg, data->reset_assert_val)=
;
> >=20
> > What is the spinlock protecting? acquire/assert registers being set
> > together, without another acquire/assert or deassert/release register
> > access pair interleaving?
> > In that case you still need the lock. Or use regmap_multi_reg_write().
> > You could even directly store the sequences as struct reg_sequence in
> > rzv2h_usb2phy_reset_of_data.
>=20
> You are correct. Thank you.
> As per your suggestion I'm planning to use regmap_multi_reg_write().
>=20
> Plan is to have the:
>=20
> static const struct reg_sequence rzv2h_init_seqs[] =3D {

Even though the struct is called req_sequence, the whole array is the
sequence. Let's call these _seq, singular.

> 	{ .reg =3D 0xc10, .def =3D 0x67c },
> 	{ .reg =3D 0xc14, .def =3D 0x1f },

0x01f for consistency?

> 	{ .reg =3D 0x600, .def =3D 0x909 },
> };
>=20
> static const struct reg_sequence rzv2h_assert_seqs[] =3D {
> 	{ .reg =3D 0xb04, .def =3D 0x303 },
> 	{ .reg =3D 0x000, .def =3D 0x206 },

Consider setting .delay_us =3D 11, see below.

> };
>=20
> static const struct reg_sequence rzv2h_deassert_seqs[] =3D {
> 	{ .reg =3D 0x000, .def =3D 0x200 },
> 	{ .reg =3D 0xb04, .def =3D 0x003 },
> 	{ .reg =3D 0x000, .def =3D 0x000 },
> };
>=20
> static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data =3D {
> 	.init_seqs =3D rzv2h_init_seqs,
> 	.init_nseqs =3D ARRAY_SIZE(rzv2h_init_seqs),
> 	.assert_seqs =3D rzv2h_assert_seqs,
> 	.assert_nseqs =3D ARRAY_SIZE(rzv2h_assert_seqs),
> 	.deassert_seqs =3D rzv2h_deassert_seqs,
> 	.deassert_nseqs =3D ARRAY_SIZE(rzv2h_deassert_seqs),
> 	.reset_reg =3D 0,
> 	.reset_status_bits =3D BIT(2),
> };
>=20
> With that I can use:
>=20
> static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> 				     unsigned long id)
> {
> 	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rcd=
ev);
> 	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> 	int ret;
>=20
> 	ret =3D regmap_multi_reg_write(priv->regmap, data->assert_seqs,
> 				     data->assert_nseqs);
> 	if (ret)
> 		return ret;
>=20
> 	usleep_range(11, 20);

Specifying a delay in rzv2h_assert_seqs[] and setting
rzv2h_usb2phy_reset_regconf.can_sleep =3D true would have the same
effect.

regards
Philipp

