Return-Path: <linux-renesas-soc+bounces-21708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88752B51647
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 13:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54703565AD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C7431770F;
	Wed, 10 Sep 2025 11:58:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FB731196F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505523; cv=none; b=ILqdsw/Pv5H+yQ1r3G9P1q6mzTfucfEScbLgNZUHjJWdti/abQdoQd207AvRzURjfStPHiXfE7ljSE6RHuLngUV4OkWxedJ6F3fJ7VzOJY0n3CMQ2VY2MnnoXp2UjZSmXUMZcMRehc/6EbK0sTQdkHphSOps6bCMQl/+uNR3nM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505523; c=relaxed/simple;
	bh=JbYRe5ZhdH5kEd/vRlltLO5l70zEQ7su3Vasf0fb7JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0Uj2MaTTTAdrrwNM6Q3jH5iNhUNv+Q+fR9NEuCV598eOH6t0i3/IsT8ziM41kaaWTf92J9kCNjRVUYZO9z+T/BTu6cFHOijzq+tKzP8Ggh/WEfX5k5VsNQMAT6qvroGzTvoeLOdSeBsQecZZ76Hu5Yp+TNwCHyya037g4cT4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uwJT5-00069V-3e; Wed, 10 Sep 2025 13:58:31 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uwJT4-000aGX-10;
	Wed, 10 Sep 2025 13:58:30 +0200
Received: from pengutronix.de (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E0BE046AE56;
	Wed, 10 Sep 2025 11:58:29 +0000 (UTC)
Date: Wed, 10 Sep 2025 13:58:29 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	"magnus.damm" <magnus.damm@gmail.com>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/4] can: rcar_canfd: Update bit rate constants for
 RZ/G3E and R-Car Gen4
Message-ID: <20250910-glaring-beaver-of-memory-4d8f47-mkl@pengutronix.de>
References: <20250908120940.147196-1-biju.das.jz@bp.renesas.com>
 <20250908120940.147196-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWmMzZ0gCNVAsBOGKDTO4kAF5TTcSo4V+m-_MGfsTo63Q@mail.gmail.com>
 <TY3PR01MB11346BE5957318E1805CF9E7F860EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdU7oqTfpGr38FU6GcbaRjF_Ku5yPyFmA2PpVW-zSyVP4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wvgi2fdpg2eudymd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU7oqTfpGr38FU6GcbaRjF_Ku5yPyFmA2PpVW-zSyVP4A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--wvgi2fdpg2eudymd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/4] can: rcar_canfd: Update bit rate constants for
 RZ/G3E and R-Car Gen4
MIME-Version: 1.0

On 10.09.2025 13:44:35, Geert Uytterhoeven wrote:
> Hi Biju,
>=20
> On Wed, 10 Sept 2025 at 12:50, Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> Mon, 8 Sept 2025 at 14:09, Biju <biju.das.au@gmail.com> wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > The calculation formula for nominal bit rate of classical CAN is sa=
me
> > > > as
> > >
> > > the same
> >
> > OK, will send new version fixing this.
>=20
> I don't think you have to resend the series just for this. Marc?

No need to resend, I'll fix it up.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wvgi2fdpg2eudymd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjBZ+IACgkQDHRl3/mQ
kZxTPAf/ZpApqO4++7F/fm4Wvlf4s7zhuJu+P/qJt6xs/cSsaBdffpcNv4e41uoY
T6eaCwbwZrWk8aBOp9pmjKywPVDGIRFxiDTGrsqg27W/7+6iWvtH5RgJGg7zNB0k
3PtkMEXP1AktDoWOWcC4S1A9DHIuQ4WWesYxH3kmK8HGR9KSyURUHSnpjyYXW3TT
lMgCol2iqhues0wu1U/FRahySvCVkIr3A9kN+GftFh/yt7BM2cmM8KUsRN7eB2bp
VtzwbOQqntJYHD7Gzo8i6tvSgoCuH8GyqYu8JJb6bCIf7Gs/lSL0u1AyBvpueinO
ldop82uQZSRfIZiM4UOhojbn5di/ig==
=CrHJ
-----END PGP SIGNATURE-----

--wvgi2fdpg2eudymd--

