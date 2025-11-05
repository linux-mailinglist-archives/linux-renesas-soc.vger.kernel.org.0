Return-Path: <linux-renesas-soc+bounces-24176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A20C36957
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 035194FCC36
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 16:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16F8335560;
	Wed,  5 Nov 2025 16:05:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF74335556
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358721; cv=none; b=kDy8eT8eHypackW6bfvpGqv8OSYscsWShbdQHCU3sNn3S40DgzJ4DbkqV4mDz7ovDLwb3oXKh4j/diRU+07Cc+lCcYxDFRHDltBCd1EDH5ISNDgspvNTycAjPbTm9JO6yVP+nmH3E3pW53JGFUIYi7NBQpPnVn0lkPPS+6QBGtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358721; c=relaxed/simple;
	bh=Uapyn0o1PFsF4p87jzmRukDDVz/hXCiKLFKttO5iEUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTpO4omVsISxcQxOTUQTvwfgo8UwdLe28ZOpptJZsYW182kUQP05iTJDuZVFMOUbfVPitF6ERtqXYNNgFbxq2vv0drRddGzD55rZUhI4s8/vEwafKT+p+VMUJQau5DtCFXPPrEVo/nb4VHDS9XBQYuuPAOnS4bF1tP9U25C+v2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGg0F-0001Ma-RR; Wed, 05 Nov 2025 17:04:55 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGg0E-007Dp6-3D;
	Wed, 05 Nov 2025 17:04:55 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGg0E-00000000Cj1-3ksp;
	Wed, 05 Nov 2025 17:04:54 +0100
Message-ID: <4857ace4d241d3a0de4fe7247312ff07c930b11e.camel@pengutronix.de>
Subject: Re: [PATCH v2 06/21] reset: rzv2h-usb2phy: Add support for VBUS mux
 controller registration
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Vinod
 Koul	 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Peter Rosin <peda@axentia.se>,
 Yoshihiro Shimoda	 <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman	 <gregkh@linuxfoundation.org>,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 05 Nov 2025 17:04:54 +0100
In-Reply-To: <39923e450f1ce220cbca28dcf6b215dd9fa79dde.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
	 <39923e450f1ce220cbca28dcf6b215dd9fa79dde.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Mi, 2025-11-05 at 16:39 +0100, Tommaso Merciai wrote:
> The RZ/V2H USB2 PHY requires control of the VBUS selection line
> (VBENCTL) through a mux controller described in the device tree as
> "mux-controller". This change adds support for registering
> vbus-sel-mux auxiliary driver during probe.
>=20
> This enables proper management of USB2.0 VBUS source selection on
> platforms using the RZ/V2H SoC.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - New patch
>=20
>  drivers/reset/Kconfig               |  1 +
>  drivers/reset/reset-rzv2h-usb2phy.c | 65 +++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index e1ae624661f3..f54e216ca7f6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -255,6 +255,7 @@ config RESET_RZG2L_USBPHY_CTRL
>  config RESET_RZV2H_USB2PHY
>  	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	select AUXILIARY_BUS
>  	help
>  	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
>  	  (and similar SoCs).
> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> index 5bdd39274612..6074aa8cc13a 100644
> --- a/drivers/reset/reset-rzv2h-usb2phy.c
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -5,8 +5,10 @@
>   * Copyright (C) 2025 Renesas Electronics Corporation
>   */
> =20
> +#include <linux/auxiliary_bus.h>
>  #include <linux/cleanup.h>
>  #include <linux/delay.h>
> +#include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -14,6 +16,9 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/reset-controller.h>
> +#include <linux/reset/reset_rzv2h_usb2phy.h>
> +
> +static DEFINE_IDA(auxiliary_ids);
> =20
>  struct rzv2h_usb2phy_regval {
>  	u16 reg;
> @@ -104,6 +109,62 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset=
_controller_dev *rcdev,
>  	return 0;
>  }
> =20
> +static void rzv2h_usb2phy_reset_adev_unregister(void *data)
> +{
> +	struct auxiliary_device *adev =3D data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static void rzv2h_usb2phy_reset_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +
> +	ida_free(&auxiliary_ids, adev->id);
> +}
> +
> +static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
> +					    void __iomem *base,
> +					    const char *mux_name)
> +{
> +	struct reset_rzv2h_usb2phy_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev =3D devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->base =3D base;
> +
> +	adev =3D &rdev->adev;
> +	adev->name =3D mux_name;
> +	adev->dev.parent =3D dev->parent;
> +	adev->dev.release =3D rzv2h_usb2phy_reset_adev_release;
> +	adev->dev.of_node =3D dev->of_node;
> +	ret =3D ida_alloc(&auxiliary_ids, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +	adev->id =3D ret;
> +
> +	ret =3D auxiliary_device_init(adev);
> +	if (ret)
> +		goto cleanup_ida;
> +
> +	ret =3D auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		goto cleanup_ida;
> +	}
> +
> +	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_adev_unregiste=
r, adev);

Can't you use __devm_auxiliary_device_create()?

regards
Philipp

