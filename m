Return-Path: <linux-renesas-soc+bounces-669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA0804B6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 08:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED611F20C17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF732CCCF;
	Tue,  5 Dec 2023 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b4vhiER6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6D4CA;
	Mon,  4 Dec 2023 23:50:55 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15DFEFF80A;
	Tue,  5 Dec 2023 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701762654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33Cr2ldAlMbcSRdOfjbnL3I/Zg4ZMoiw1vVYuAFexRo=;
	b=b4vhiER6a0L6V8r2zxzPP/QzfzSTlhkeU1AriyKxFIiplNb1XZ+XCg2+EjeucXV/uV/YO1
	A6h6P+g9lkmW+V/niTIfxHvrUoEZvRPzOqCAIDa3DT3VFQTc+CsmYxgkF04Y5f60h3AyTB
	LGT8ZexvnP/khyItrTvFEaSAjyBJLtzeazAio64kaoWBvk9/Cf5MbKMwt/WGwhkx/tsdFN
	mh73fi+AM6pxPwChmWZxPfMalh+OE/yLyktflvwxRIlg6Tb8lQh+mjSaNsubYNsZFYEufg
	rM38OiIl0V2/qYiI4jNoAbSvYw49xiCSmt3syB9uLbezVsY4n/msm/yXn2SWag==
Date: Tue, 5 Dec 2023 08:50:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Zhao
 Qiang <qiang.zhao@nxp.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-wpan@vger.kernel.org, Andy Gross <agross@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?Q2zDqW1l?=
 =?UTF-8?B?bnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Christian Marangi
 <ansuelsmth@gmail.com>, Nick Child <nnac123@linux.ibm.com>, Stephan Gerhold
 <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, Loic Poulain
 <loic.poulain@linaro.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, Johannes Berg
 <johannes@sipsolutions.net>, Imre Kaloz <kaloz@openwrt.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove
 callback returning void
Message-ID: <20231205085046.7307ca9b@xps-13>
In-Reply-To: <20231205073911.e6nphzhc6yjan5vu@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
	<20231205075110.795b88d2@xps-13>
	<20231205073911.e6nphzhc6yjan5vu@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Uwe,

u.kleine-koenig@pengutronix.de wrote on Tue, 5 Dec 2023 08:39:11 +0100:

> Hello Miquel,
>=20
> On Tue, Dec 05, 2023 at 07:51:10AM +0100, Miquel Raynal wrote:
> > u.kleine-koenig@pengutronix.de wrote on Mon,  4 Dec 2023 19:30:40 +0100=
: =20
> > > (implicit) v1 of this series can be found at
> > > https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koeni=
g@pengutronix.de.
> > > Changes since then:
> > >=20
> > >  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
> > >    converts ipa to remove_new() and introduces an error message in the
> > >    error path that failed before.
> > >=20
> > >  - Rebased to today's next
> > >=20
> > >  - Add the tags received in the previous round.
> > >=20
> > > Uwe Kleine-K=C3=B6nig (9):
> > >   net: ipa: Convert to platform remove callback returning void
> > >   net: fjes: Convert to platform remove callback returning void
> > >   net: pcs: rzn1-miic: Convert to platform remove callback returning
> > >     void
> > >   net: sfp: Convert to platform remove callback returning void
> > >   net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
> > >     void
> > >   net: wan/ixp4xx_hss: Convert to platform remove callback returning
> > >     void
> > >   net: wwan: qcom_bam_dmux: Convert to platform remove callback
> > >     returning void
> > >   ieee802154: fakelb: Convert to platform remove callback returning v=
oid
> > >   ieee802154: hwsim: Convert to platform remove callback returning vo=
id =20
> >=20
> > FYI, I plan on taking patches 8 and 9 through wpan-next. =20
>=20
> I forgot to mention explicitly that there are no interdependencies in
> this series. So each maintainer picking up up their patches is fine.

Yes, no problem, it was quick to figure out.

Thanks,
Miqu=C3=A8l

