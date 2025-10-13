Return-Path: <linux-renesas-soc+bounces-22948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CEABD44B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F17244FF6D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 15:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C04D30E0FC;
	Mon, 13 Oct 2025 14:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907B30E0F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367477; cv=none; b=FdBhMMG9zSNJbCirNWHPFJhFcGqIz8jIO66KQusfRDgFThodcQ6jxglaEgLu1IeZAa4q643ln4s67j8iN5u1QGMy6l4egpsZaJ4609rMn7TeOPJ33VnAjqdAfw6KFPwQPjYAeLmryifOr/sfxethfNN+3Z+6wsZTF0ICTMgnJ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367477; c=relaxed/simple;
	bh=KRcwaq+/XU7W8rFBdjsmHKaeEjcYfHLbae4GLMSZ7FE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Li7xF/2BBxOq332f9x8zI8sgd3QsfdaIrmqwHWrhbweAKJl17tYEZ1nB/BQ+X4n5ezeJDsGZpG+W6qOpK5BimZu517oPSrKC0WxnT5NQRPgKLTDdhM/yzE2G+E2/7hoB1C4Joxww3DOqVgpJcFEYINeaFxgvZOhh9Lm5PKvvg5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8JzO-0003Bb-Ux; Mon, 13 Oct 2025 16:57:30 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8JzN-003Ovy-2v;
	Mon, 13 Oct 2025 16:57:29 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v8JzN-00000000CO2-3Ql5;
	Mon, 13 Oct 2025 16:57:29 +0200
Message-ID: <c1099a8e422abbc5d12bf3f325cb9f2140c8c006.camel@pengutronix.de>
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
Date: Mon, 13 Oct 2025 16:57:29 +0200
In-Reply-To: <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
	 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
	 <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
	 <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev>
	 <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
	 <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
	 <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
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

On Fr, 2025-10-10 at 14:26 +0300, Claudiu Beznea wrote:
> Hi, Philipp,
>=20
> On 10/8/25 15:16, Claudiu Beznea wrote:
> > Hi, Philipp,
> >=20
> > On 10/8/25 13:23, Philipp Zabel wrote:
> > > Hi Claudiu,
> > >=20
> > > On Mi, 2025-10-08 at 12:29 +0300, Claudiu Beznea wrote:
> > > > Hi, Philipp,
> > > >=20
> > > > On 10/8/25 11:34, Philipp Zabel wrote:
> > > > > Hi Claudiu,
> > > > >=20
> > > > > On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
> > > > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > >=20
> > > > > > On the Renesas RZ/G3S SoC, the USB PHY block has an input signa=
l called
> > > > > > PWRRDY. This signal is managed by the system controller and mus=
t be
> > > > > > de-asserted after powering on the area where USB PHY resides an=
d asserted
> > > > > > before powering it off.
> > > > > >=20
> > > > > > On power-on the USB PWRRDY signal need to be de-asserted before=
 enabling
> > > > > > clock and switching the module to normal state (through MSTOP s=
upport). The
> > > > > > power-on configuration sequence
> > > > > The wording makes me wonder, have you considered implementing thi=
s as a
> > > > > power sequencing driver?
> > > > No, haven't tried as power sequencing. At the moment this was start=
ed I
> > > > think the power sequencing support wasn't merged.
> > > >=20
> > > > The approaches considered were:
> > > > a/ power domain
> > > Letting a power domain control a corresponding power ready signal wou=
ld
> > > have been my first instinct as well.
> > >=20
> > > > b/ regulator
> > > > c/ as a reference counted bit done through regmap read/writes APIs
> > > >=20
> > > > a and b failed as a result of discussions in the previous posted ve=
rsions.
> > > Could you point me to the discussion related to a?
> > It's this one
> > https://lore.kernel.org/all/
> > CAPDyKFrS4Dhd7DZa2zz=3DoPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com/

Thank you! From this discussion it still isn't clear to me whether
Ulf's suggestion of using genpd on/off notifiers was considered and why
it was dismissed.

From the DT patches it looks like there is no actual separate power
domain for USB, just the single always-on CPG power domain (in rzg2l-
cpg.c). Is that correct? In the thread it sounded like there were
multiple domains.

Is the issue that you need the PWRRDY signal to be (de)asserted
independently from the CPG power domain enable/disable? (Why?)

Why can't the power domain provider (cpg) have the renesas,sysc-pwrrdy
property and set the signal together with the power domain?

> > > I see v2 and v3 tried to control the bit from the PHY drivers, and in
> > > v4 we were are already back to the reset driver.
> > v2 passed the system controller (SYSC) phandle to the USB PHYs only (th=
ough
> > renesas,sysc-signals DT property) where the PWRRDY bit was set. The PWR=
RDY
> > bit was referenced counted in the SYSC driver though regmap APIs.
> >=20
> > v3 used the approach from v2 but passed the renesas,sysc-signals to all=
 the
> > USB related drivers.
> >=20
> > Then, in v4, the PWRRDY refcounting was dropped and passed
> > renesas,sysc-signals only to the USB PHY CTRL DT node in the idea that =
this
> > is the node that will always be probed first as all the other USB block=
s
> > need it and request resets from it.
> >=20
> > v5 and v6 kept the approach from v4 and only addressed misc comments or
> > things that I noticed.
>=20
> Could you please let me know if you are OK with the approach proposed in
> v7, so that I can start preparing a new version addressing your comments?

If the PWRRDY signal is an input to the USB2PHY control block, and not
only to the PHY blocks, I have no issue with this being handled in the
usb2phy reset driver - iff it is not sensible to just control the
signal from the power domain driver.

If we have to handle it in the reset driver, I'd prefer to see this
controlled with a dev_pm_genpd_add_notifier(). If that is not possible,
I'd like to understand why.

regards
Philipp

