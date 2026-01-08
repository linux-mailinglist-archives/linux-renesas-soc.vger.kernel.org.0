Return-Path: <linux-renesas-soc+bounces-26410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A0D02831
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 12:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4179830F3999
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 11:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502C44B8DF7;
	Thu,  8 Jan 2026 11:19:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433F54A22DD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871164; cv=none; b=D4Y2LIM/h9M+4eIRd8YT2KPUS6WbJdE4z2t0G0bkED8BoDGfRsj8osUnF5DqmL6GW60IFYyDsa+SO51kHNmvylI7L7ms3m+1SS69ay/QCH8n7nx6o33CHd0oUWIemavDz+Gk2gf6CjO27mUkkYYXewpZFWaOpsNmAf8Sx273HfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871164; c=relaxed/simple;
	bh=uZjjQYeu6mpdH3vgaMvFmLUM9ltgPETe19TDPWXoREY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEYpOsQMplWv7Zyl7+/Z88RKtKt7I0QdJ6Hsul2GJ3WoQ57JvkHG/cCwK4jXPdEnIrmDENNrRFmA4LwyJRwTmxti8hvEA+8U3ZaaFey1Xad/seJAbmc4PBHOECvRXgyV/O7xVKyImv+p+Ins5ibEKAlp2O3aWW0lcsK/pX+rtCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdo2x-0007PV-3L; Thu, 08 Jan 2026 12:19:19 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdo2w-009fU2-2p;
	Thu, 08 Jan 2026 12:19:18 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdo2w-000000005td-3MDH;
	Thu, 08 Jan 2026 12:19:18 +0100
Message-ID: <7b4aa36772039d6607bf0aee38bd897b773e3f7f.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 08 Jan 2026 12:19:18 +0100
In-Reply-To: <20260108102600.3477012-3-claudiu.beznea.uj@bp.renesas.com>
References: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
	 <20260108102600.3477012-3-claudiu.beznea.uj@bp.renesas.com>
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

On Do, 2026-01-08 at 12:26 +0200, Claudiu wrote:
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
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>=20
> Changes in v3:
> - collected tags
>=20
> Changes in v2:
> - used pm_runtime_put_sync() in rzg2l_usbphy_ctrl_suspend()
>=20
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 94 +++++++++++++++++++++----
>  1 file changed, 79 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 9ce0c1f5d465..1a1581643bf3 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
[...]
> @@ -266,10 +273,67 @@ static void rzg2l_usbphy_ctrl_remove(struct platfor=
m_device *pdev)
[...]
> +static int rzg2l_usbphy_ctrl_resume(struct device *dev)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(priv->rstc);
> +	if (ret)
> +		goto pwrrdy_off;

Do I understand correctly that this reset clears PHY_RESET_PORT[12]
bits in the RESET register such that rzg2l_usbphy_ctrl_init() must be
called below?

> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto reset_assert;
> +
> +	rzg2l_usbphy_ctrl_init(priv);

This assumes that consumers requested PHY_RESET_PORT[12] resets to be
asserted in their suspend function. I think you should warn if that is
not the case during suspend. Saving the relevant RESET bits during
suspend and restoring them here is probably not useful.

Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

