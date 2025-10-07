Return-Path: <linux-renesas-soc+bounces-22740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E040BC0E2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 11:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2168D189F7BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B623207;
	Tue,  7 Oct 2025 09:44:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0802D781F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759830271; cv=none; b=KjzfNEo0vBUrJgzTSLk13/4FHxRCz6dtW52lbiudx8dNCdmG2ZEjk7ZjYW7WnfTD+0LSwEB+wJiZLvw63pUXV6UOtIHP4Br88BV+L3QybkKy2+QVw4H57Jm9WoOpnYteJPl/xxJ+alFthvlAX7ZijAHoL+f6EI5zs4EENtI+FGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759830271; c=relaxed/simple;
	bh=asAxx4tyn5H1OOKqsxgfkLYzALx/7qKW/pZdrKFxEeg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R752GRZrIfN7ggDcIvHknP8mIo+rz88EATnUgH/pEwl56X3TL9oIFcT9aLqYmpk1m6RRiPooiNIUNk1KuNf/LqTFPP6Gz1tqaL+xSorL/MxQeYbgPinmztbXXKJHXMxlXpwb+eUkYddc6Rc4VoQ5pyR1Wpp6D/yBtQsP5ISp5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v64Ep-0004ZM-CM; Tue, 07 Oct 2025 11:44:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v64Eo-002NZS-1A;
	Tue, 07 Oct 2025 11:44:06 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v64Eo-000000003Jb-1BSq;
	Tue, 07 Oct 2025 11:44:06 +0200
Message-ID: <01fc3101ab2e3898932afeaaaf060a6676cdf323.camel@pengutronix.de>
Subject: Re: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register for
 OTG mode
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>, Tommaso Merciai	
 <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
  Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I	 <kishon@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>,  "magnus.damm"
 <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-phy@lists.infradead.org"	 <linux-phy@lists.infradead.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Tue, 07 Oct 2025 11:44:06 +0200
In-Reply-To: <TY3PR01MB1134635745721CC005B35702286E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
		 <20251001212709.579080-5-tommaso.merciai.xr@bp.renesas.com>
	 <593eb851ae6ce0ec03ddeacf436180b6538fdd1e.camel@pengutronix.de>
	 <TY3PR01MB1134635745721CC005B35702286E0A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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

Hi Biju,

On Di, 2025-10-07 at 04:02 +0000, Biju Das wrote:
> Hi Philipp,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > Sent: 06 October 2025 17:32
> > Subject: Re: [PATCH 04/18] reset: rzv2h-usb2phy: Set VBENCTL register f=
or OTG mode
> >=20
> > On Mi, 2025-10-01 at 23:26 +0200, Tommaso Merciai wrote:
> > > Add logic to set the VBENCTL register when the USB controller operate=
s
> > > in OTG mode. This is required to ensure proper USB transceiver
> > > behavior when the device is configured as OTG.
> > >=20
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >=20
> > I had reservations about this driver before, because of the opaque regi=
ster initialization sequence, and
> > I was told that no, this is a reset driver alright [1].
>=20
> The latest hardware manual document about VBENCTRL register which sets so=
urce for VBUS selection.
> s

I still can't look at this, right? The USB2PHY control register space
appears to be documented in the "RZ/V2H Group User's Manual: Hardware
(Additional document)" (under NDA).

> > Can you please try to find a proper abstraction for this, because drive=
rs/reset is not the correct place
> > for USB OTG mode handling.
>=20
> Sorry for the confusion. This driver is not handling USB OTG mode. It jus=
t configures VBENCTRL(one time setting)
> that selects the source for VBUS_SEL. Actual USB OTG mode handling is don=
e USB PHY driver
> which sets host/device mode based on ID detection.

So this is a mux for the VBUS_SEL signal?

Why don't the USB host controller drivers parse their "dr_mode"
property themselves and control USB2PHY VBENCTRL via the mux API, for
example?

regards
Philipp

