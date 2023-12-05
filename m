Return-Path: <linux-renesas-soc+bounces-668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE71804B44
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 08:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98A31F21498
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 07:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C7214AAC;
	Tue,  5 Dec 2023 07:40:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA09D7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 23:40:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1T-0007nO-OE; Tue, 05 Dec 2023 08:39:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1P-00Dh2K-W4; Tue, 05 Dec 2023 08:39:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAQ1P-00EZzR-Lj; Tue, 05 Dec 2023 08:39:11 +0100
Date: Tue, 5 Dec 2023 08:39:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Zhao Qiang <qiang.zhao@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Russell King <linux@armlinux.org.uk>, linux-wpan@vger.kernel.org,
	Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	linux-arm-msm@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
	netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de,
	Johannes Berg <johannes@sipsolutions.net>,
	Imre Kaloz <kaloz@openwrt.org>, linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove
 callback returning void
Message-ID: <20231205073911.e6nphzhc6yjan5vu@pengutronix.de>
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
 <20231205075110.795b88d2@xps-13>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yvpnmk4qagvgsgfh"
Content-Disposition: inline
In-Reply-To: <20231205075110.795b88d2@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--yvpnmk4qagvgsgfh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Miquel,

On Tue, Dec 05, 2023 at 07:51:10AM +0100, Miquel Raynal wrote:
> u.kleine-koenig@pengutronix.de wrote on Mon,  4 Dec 2023 19:30:40 +0100:
> > (implicit) v1 of this series can be found at
> > https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@=
pengutronix.de.
> > Changes since then:
> >=20
> >  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
> >    converts ipa to remove_new() and introduces an error message in the
> >    error path that failed before.
> >=20
> >  - Rebased to today's next
> >=20
> >  - Add the tags received in the previous round.
> >=20
> > Uwe Kleine-K=F6nig (9):
> >   net: ipa: Convert to platform remove callback returning void
> >   net: fjes: Convert to platform remove callback returning void
> >   net: pcs: rzn1-miic: Convert to platform remove callback returning
> >     void
> >   net: sfp: Convert to platform remove callback returning void
> >   net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning
> >     void
> >   net: wan/ixp4xx_hss: Convert to platform remove callback returning
> >     void
> >   net: wwan: qcom_bam_dmux: Convert to platform remove callback
> >     returning void
> >   ieee802154: fakelb: Convert to platform remove callback returning void
> >   ieee802154: hwsim: Convert to platform remove callback returning void
>=20
> FYI, I plan on taking patches 8 and 9 through wpan-next.

I forgot to mention explicitly that there are no interdependencies in
this series. So each maintainer picking up up their patches is fine.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yvpnmk4qagvgsgfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVu054ACgkQj4D7WH0S
/k6iZAgAk0+g8Khu/Ep6tOFWM4mSMy9654kVheNx2FCbbW/bAMDmjjTU+JefFpX+
7FjzwXTwgg1LgMrgBGElDY2TT6R2655WJe8jWIEOSjXPJLpqH19V1nbyE4D0ESd/
j3Ng/QZKClTPeg3Qm/6ECF3YR2HDwT1xnUOYPEJinZcpBjJ/oyH16DVG11rvhYxL
o+1q0NZqQfR+TEwIRj84WFCmk1UCfG7TVGZSJOmby1+bg7W6Heh+yr/vyyQ+vYEL
4w0ogQenAk2aIlE7RmrsUp9WFA5pTFVYz+xJOA8tJx9p6pzSRpkXWtCN1ZrUTnnY
vxZ07dy2791XsDRamfgrGOZgzi9RJg==
=F8+E
-----END PGP SIGNATURE-----

--yvpnmk4qagvgsgfh--

