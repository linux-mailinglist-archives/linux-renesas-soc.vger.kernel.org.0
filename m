Return-Path: <linux-renesas-soc+bounces-23415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A41BFB310
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 11:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 781BA5637EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D91030F54C;
	Wed, 22 Oct 2025 09:38:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261D2F39DA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125929; cv=none; b=JV/0wrFfuZXFWW0QVR02fhDZNU5Zl2W/pBDjHTJmCtCNlU86ZTi1LEENUlkw0dkfyWZZRl2P7eejjCDMMU3nOuvlTrduXpgFlmRprshu7346UH92Dbu4Q51pZz9gMy1rRKf9+9U8GsooUwVTVWu+uQ5R+wovWyzHVBKRV23ZZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125929; c=relaxed/simple;
	bh=RXI86dWsUOVLWMDkiSyvCC8/ZeCCo4YfEijOuemfgj0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VOVxN6DGKsNRKy6QTrOXGqsclzjs+eW4rGtRP5TP8i9vYDcaUVxZVdRv5eEUEfZacShjqfPlH1JgMsj10aBPi/TtPxs2cWlF/YaEt33y3yco28IOdZCk724Qid50nB0xc09Qe6Xqay1bmsHaRbLwjrEJNLs9IVl2mVUaFGTXFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBVIQ-00004t-1Z; Wed, 22 Oct 2025 11:38:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBVIO-004rvs-3B;
	Wed, 22 Oct 2025 11:38:17 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vBVIO-000000004t5-3n5a;
	Wed, 22 Oct 2025 11:38:16 +0200
Message-ID: <08fbb2fc1a2e581010b6b28cd1a544053a4f1fb0.camel@pengutronix.de>
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	geert+renesas@glider.be, magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, 	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Claudiu
 Beznea	 <claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang	
 <wsa+renesas@sang-engineering.com>
Date: Wed, 22 Oct 2025 11:38:16 +0200
In-Reply-To: <dc27ae49-d60b-447e-971c-6b5b51ab9f29@tuxon.dev>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
	 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
	 <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
	 <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev>
	 <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
	 <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
	 <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
	 <c1099a8e422abbc5d12bf3f325cb9f2140c8c006.camel@pengutronix.de>
	 <77678dd6-071b-4911-a5c5-f1519c92e91a@tuxon.dev>
	 <6ba1fd1f07753c9b98a57c87bffbbee16971da7a.camel@pengutronix.de>
	 <19746f65-bf10-4687-9e2b-b259220a9ea8@tuxon.dev>
	 <dc27ae49-d60b-447e-971c-6b5b51ab9f29@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Di, 2025-10-21 at 11:48 +0300, Claudiu Beznea wrote:
> Hi, Philipp,
>=20
> On 10/15/25 11:19, Claudiu Beznea wrote:
> > > > > > > > I see v2 and v3 tried to control the bit from the PHY drive=
rs, and in
> > > > > > > > v4 we were are already back to the reset driver.
> > > > > > > v2 passed the system controller (SYSC) phandle to the USB PHY=
s only (though
> > > > > > > renesas,sysc-signals DT property) where the PWRRDY bit was se=
t. The PWRRDY
> > > > > > > bit was referenced counted in the SYSC driver though regmap A=
PIs.
> > > > > > >=20
> > > > > > > v3 used the approach from v2 but passed the renesas,sysc-sign=
als to all the
> > > > > > > USB related drivers.
> > > > > > >=20
> > > > > > > Then, in v4, the PWRRDY refcounting was dropped and passed
> > > > > > > renesas,sysc-signals only to the USB PHY CTRL DT node in the =
idea that this
> > > > > > > is the node that will always be probed first as all the other=
 USB blocks
> > > > > > > need it and request resets from it.
> > > > > > >=20
> > > > > > > v5 and v6 kept the approach from v4 and only addressed misc c=
omments or
> > > > > > > things that I noticed.
> > > > > > Could you please let me know if you are OK with the approach pr=
oposed in
> > > > > > v7, so that I can start preparing a new version addressing your=
 comments?
> > > > > If the PWRRDY signal is an input to the USB2PHY control block, an=
d not
> > > > > only to the PHY blocks, I have no issue with this being handled i=
n the
> > > > > usb2phy reset driver -
> > > > Yes, this is how the Renesas HW team confirmed they are related.
> > > Ok, understood. I concur that usb2phy-ctrl is the right place for the
> > > sysc property then.
> > >=20
> > > > > iff it is not sensible to just control the
> > > > > signal from the power domain driver.
> > > > As mentioned above, that can be done as well but, passing a SYSC ph=
andle to
> > > > the CPG DT node will not be valid from the HW description point of =
view.
> > > >=20
> > > > > If we have to handle it in the reset driver, I'd prefer to see th=
is
> > > > > controlled with a dev_pm_genpd_add_notifier(). If that is not pos=
sible,
> > > > > I'd like to understand why.
> > > > From the code inspection I did, that can be done. From what I can t=
ell at
> > > > the moment, I'll have to register a gepnd notifier from
> > > > reset-rzg2l-usbphy-ctrl, before runtime resuming the device and con=
trol the
> > > > SYSC PWRRDY from it.
> > > I'd like that.
> > Now, that we found the genpd notifier is not a solution, could you plea=
se
> > let me know how would you like me to proceed?
>=20
> After discussing all the possible (known) solutions, could you please let
> me know if you are OK with the approach in this series?

Yes, I don't have a better idea. Let's revisit the issue of ordering
guarantees when suspend/resume is implemented.

regards
Philipp

