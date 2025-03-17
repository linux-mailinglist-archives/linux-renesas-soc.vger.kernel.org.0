Return-Path: <linux-renesas-soc+bounces-14494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7BA64FDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 13:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F0013B394D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 12:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648E921E098;
	Mon, 17 Mar 2025 12:54:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5CE149E00
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216042; cv=none; b=UFIl1SiV+M1BEMy433rH5h7Sq1oIWg6ltbQdNFKPVqtlrchd1hSPX+G7hG8IHmH1FsD/tIEjMsh2Sw9BsJwcioyzmToYQMZsSgDIGeRehrHiYCoQF/CRRAOkvJyV5k7+H1FKsm/GNC4qObvVQHCWNFSbMMQTQoZPq8s2s2v1igc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216042; c=relaxed/simple;
	bh=uipBXGLs+vfZafCbj4SFHOml66FpdN6uxnIAcVtib+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGLzIOWmGfzi3N53Nz/baEu0MOevw7W3Mgk/MZ7sigohLoH96m5yAC+0Wxzy1rz3SPYkh/HV/TCyT/K0Ll9+864e1CCLoIJQdeRfmFyjUdB0nJaixeRBdhMNhUBIZtdV+yRFuONonbrD8wt/c8PpknDyqyIx0ru4bPopww3ivkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tu9x6-0003hS-LO; Mon, 17 Mar 2025 13:52:22 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tu9wy-000FqB-30;
	Mon, 17 Mar 2025 13:52:13 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 062533DE875;
	Mon, 17 Mar 2025 12:52:13 +0000 (UTC)
Date: Mon, 17 Mar 2025 13:52:11 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-can@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/16] can: rcar_canfd: Add rnc_field_width variable
 to struct rcar_canfd_hw_info
Message-ID: <20250317-carmine-wolverine-of-discussion-a45336-mkl@pengutronix.de>
References: <20250317123619.70988-1-biju.das.jz@bp.renesas.com>
 <20250317123619.70988-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcx6wmu7jh3xcmbx"
Content-Disposition: inline
In-Reply-To: <20250317123619.70988-8-biju.das.jz@bp.renesas.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org


--tcx6wmu7jh3xcmbx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 07/16] can: rcar_canfd: Add rnc_field_width variable
 to struct rcar_canfd_hw_info
MIME-Version: 1.0

On 17.03.2025 12:36:01, Biju Das wrote:
> R-Car Gen4 packs 2 RNC values in a 32-bit word, whereas R-Car Gen3 packs
> up to 4 values in a 32-bit word. Handle this difference by adding
> rnc_field_width variable to struct rcar_canfd_hw_info and update the macro
> RCANFD_GAFLCFG.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * New patch.
> ---
>  drivers/net/can/rcar/rcar_canfd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rca=
r_canfd.c
> index 32d700962d69..924a116cd9ab 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -85,6 +85,7 @@
>  		((gpriv)->fdmode ? RCANFD_GERFL_CMPOF : 0)))
> =20
>  /* AFL Rx rules registers */
> +#define RCANFD_RNC_PER_REG(gpriv)	(32 / (gpriv)->info->rnc_field_width)

Nitpick/micro optimization:

Rename that to something like rnc_stride and put in value you need, i.e.
1 or 2.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tcx6wmu7jh3xcmbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfYGvcACgkQDHRl3/mQ
kZykoAf/RSNDqd5JKwaZQMvn32yXT2Hn/N4JvdVkxwSWDv2ckqciXdO52rjgwtzj
VzgKBzTC4p+wD6aOT/UGaWEK1uuVIJcnvN5NTD3omV7TOCmK8M24N+gKZ0jeDOfs
8siOtvsEjL9KFUKjcbMzJK8huo6H9C57B+kahnpid07nMRKYL2f59h11nery/67m
HDu5ZmZNhnB8jBESnbTqOmBbuJT+D+r+yc4M4VeUntOvt17rRP9Rpabm3+aM0h9f
EQBEg7jU11CckCbLZqocJ94cbEiyOuWdgX4DPl+J4rgNtyOrYvvq0LXXWUgd3LW1
6BkXmGuvymCW4IWqyM1+lWw+9Livbg==
=9Fxh
-----END PGP SIGNATURE-----

--tcx6wmu7jh3xcmbx--

