Return-Path: <linux-renesas-soc+bounces-24331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56041C40313
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 14:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0493A188EF65
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 13:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DF030E82D;
	Fri,  7 Nov 2025 13:50:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A42BD015
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762523423; cv=none; b=WdupeTMQJWoRoyLIZi0VAQopi4DM1RLgDX6PgoRHDgNUSXHQF8FjaW9DcA30o+tukgERAcZhKuks7jhtdgyHUSFMrFIPaGvAh9YF+/r6z2Q46Mq0yTCtsCe+KiTB2RjH8E37Jx426DsJsW5uBVzqbaQCqyJaQ3m5HeKM160XFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762523423; c=relaxed/simple;
	bh=GCmHjkPpWVUUJ6t8eHvHgMRrMZjTA4w1tKHC0DVEVx8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=acas8aMlbP0dL7OgmhttdobgPDh3RlRJ2oET7wNYMgnvJe18pVvsSBTGhMyTb0DvEHeI3tlVqEePrK8MKsqRlCagq6x+l9OCBrUWxFHHk7+cJwfhwdTBOq9Y2MZX8CNKnmvilyGOOb63zs/4EcfgVi5LksknMxg31gHA5GQ5NIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMr6-0007nE-IO; Fri, 07 Nov 2025 14:50:20 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMr6-007XQU-03;
	Fri, 07 Nov 2025 14:50:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHMr5-000000007q6-3x7j;
	Fri, 07 Nov 2025 14:50:19 +0100
Message-ID: <575b271790b267ac4cbbb190b26341656e2c7e0c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>
Date: Fri, 07 Nov 2025 14:50:19 +0100
In-Reply-To: <20251106143327.3049052-3-claudiu.beznea.uj@bp.renesas.com>
References: <20251106143327.3049052-1-claudiu.beznea.uj@bp.renesas.com>
	 <20251106143327.3049052-3-claudiu.beznea.uj@bp.renesas.com>
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

On Do, 2025-11-06 at 16:33 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The RZ/G2L USBPHY control driver is also used on the RZ/G3S SoC.
> The RZ/G3S SoC supports a power-saving mode in which power to most USB
> components (including the USBPHY control block) is turned off. Because of
> this, the USBPHY control block needs to be reconfigured when returning
> from power-saving mode.
>=20
> Add suspend/resume support to handle runtime suspend/resume of the device=
,
> assert/deassert the reset signal, and reinitialize the USBPHY control
> block.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 94 +++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 9ce0c1f5d465..8ba65839f6e4 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
[...]
> @@ -266,10 +273,67 @@ static void rzg2l_usbphy_ctrl_remove(struct platfor=
m_device *pdev)
>  	reset_control_assert(priv->rstc);
>  }
> =20
> +static int rzg2l_usbphy_ctrl_suspend(struct device *dev)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	pm_runtime_put(dev);

Should this be pm_runtime_put_sync(dev)?

> +
> +	ret =3D reset_control_assert(priv->rstc);
> +	if (ret)
> +		goto rpm_resume;
> +
> +	ret =3D rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, false);

This sets PWRRDY=3D1, and needs to be set after MSTOP=3D1,CLK_ON=3D0,
according to 58128aa88867 ("reset: rzg2l-usbphy-ctrl: Add support for
USB PWRRDY"). I assume MSTOP/CLK_ON refer to the PHY clock in that
description, so the pm_runtime_put() above is required to have taken
effect here.



regards
Philipp

