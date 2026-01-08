Return-Path: <linux-renesas-soc+bounces-26422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC35D02DE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C091300090F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A4470BDF;
	Thu,  8 Jan 2026 13:09:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7346B7CB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877783; cv=none; b=JKTUs6G6enGGkP6VRimMLZuLOL5GzX5xj0D0KveFTL2/oAhFOJoOM/JKpBErSeUr6oC8pp5TgccOj0YpTUA74ZqPa/pLpGyubos4FxMey2sqelRWlIB+lHSbb6OqaEa8SYA7W7HaDS6Zg+rqqA4t8TzM3pLOeMmR60qDxo2VjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877783; c=relaxed/simple;
	bh=W79c8cd9Bh8vqYzKHEhPnqpfQnUTWg4xPXQh4d2yIbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9Bs6oC0/ceFt5tpYDMAzVQFn0H5e+dUIiBnbV2pwCFwB8iTW6xeKB5pq9sYNhqOi4QudPL+MHoKPMWKIyAMtYKoxAgNkKfYQ+7gK+iWQm/fJg+UdKrHBXsZ5D0y3fnwiPnxxPafwcxpzn6gLL6eyKsfkNeJYxO2oWyhlYwABck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdplg-00045l-Iz; Thu, 08 Jan 2026 14:09:36 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdplg-009gKZ-1G;
	Thu, 08 Jan 2026 14:09:36 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdplg-000000007dP-1Mby;
	Thu, 08 Jan 2026 14:09:36 +0100
Message-ID: <f2c7583d863feb767b59f6b82b47a621aae8fb86.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 08 Jan 2026 14:09:36 +0100
In-Reply-To: <83ead495-04c9-4dad-b971-29dca4c45898@tuxon.dev>
References: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
	 <20260108102600.3477012-3-claudiu.beznea.uj@bp.renesas.com>
	 <7b4aa36772039d6607bf0aee38bd897b773e3f7f.camel@pengutronix.de>
	 <83ead495-04c9-4dad-b971-29dca4c45898@tuxon.dev>
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

Hi Claudiu,

On Do, 2026-01-08 at 13:44 +0200, Claudiu Beznea wrote:
[...]
> > > +	ret =3D reset_control_deassert(priv->rstc);
> > > +	if (ret)
> > > +		goto pwrrdy_off;
> >=20
> > Do I understand correctly that this reset clears PHY_RESET_PORT[12]
> > bits in the RESET register such that rzg2l_usbphy_ctrl_init() must be
> > called below?
>=20
> No, this reset is the reset of this HW block, controlled by another HW=
=20
> block (the clock controller).
>=20
> Bits in PHY_RESET_PORT and other registers specific to this driver could=
=20
> be cleared due to the fact the power to this USB PHY CTRL HW block is=20
> turned off in suspend.
>=20
> The Renesas RZ/G3S SoC, that uses this HW block, has a power saving mode=
=20
> where power to most of the SoC components, including USB PHY CTRL, is=20
> turned off.
>=20
> Due to this, we need to restore the previous settings. priv->rstc need=
=20
> to also be restored as power to the clock controller is also lost.

Ok, thank you for the explanation.

> >=20
> > > +	ret =3D pm_runtime_resume_and_get(dev);
> > > +	if (ret)
> > > +		goto reset_assert;
> > > +
> > > +	rzg2l_usbphy_ctrl_init(priv);
> >=20
> > This assumes that consumers requested PHY_RESET_PORT[12] resets to be
> > asserted in their suspend function.
>=20
> That's right!
>=20
> > I think you should warn if that is
> > not the case during suspend.
>=20
> AFAICT, that could be done by adding extra logic in this driver to store=
=20
> the state of the de-asserted bits. We can't interrogate directly the=20
> registers as there might be the case where these resets are used by=20
> previous bootloaders (that might let them in the de-assert state) but=20
> not by Linux.

Isn't the RESET register initialized during rzg2l_usbphy_ctrl_probe()
before rzg2l_usbphy_ctrl_suspend() can ever be called? It seems to me
that read-back in suspend should never return a value left behind by a
previous bootloader.

[...]
> I can add those extra software cache for the hw registers but this is=20
> what I've tried to avoid.
>=20
> Please let me know how do you want me to proceed and I'll update.

If reading back the RESET register during suspend can be used, please
add a warning. Otherwise let me know what I'm missing, and I'll take
this as-is.

regards
Philipp

