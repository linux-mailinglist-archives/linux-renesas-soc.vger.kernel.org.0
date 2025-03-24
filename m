Return-Path: <linux-renesas-soc+bounces-14771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFFCA6DCFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 15:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3E43A5A8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5100B25D523;
	Mon, 24 Mar 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TaBcbcyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471525F970
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826456; cv=none; b=TZFz00/z8MycLOhh1QLF7CBDGXsSJ6XWkm1MI8K79RHmFpmq6mNxUqc1n0i/qRyz8cBIHaGUq7BCcLFtJD5MwCM/wMuYNVrOegLRKUgkFkI2B4hmHgingOhQvvkTtjbKdVX5CSlGq6fAgLtCxAGnCN2PZ16vIL1ErDSFJbG53gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826456; c=relaxed/simple;
	bh=3lwdxDscI0P0ZCMuOz3AECl4c71z2E4Iq712q68T6Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Al6UbWwtKsFFzI52i6Ey8mgDR0V/cjL/JVXbZ1KP/7BE4xvq9HxuRmGnh46TFi7m3XJjqN0kXV51xcSBwWA34ZnpNxQn2pC8UJ4hYnDJIeBKUzSs8P3NatHkxnLsYxuyoUCxSr75YBH8drKKazkq2S5DZ8D7PpLOZXd6R9IhvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TaBcbcyf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3lwd
	xDscI0P0ZCMuOz3AECl4c71z2E4Iq712q68T6Gw=; b=TaBcbcyfn17ehXsQl5pq
	c60ns5SvPypjnQ28B9IEP0kM7A+C2LnTPMldKFeAlCUo58odEBTVFDMJGnLiUWUW
	vfYHoXaNkJtCTR/51V86SlMhQ5Y8EoSyAzWSXVvwzy2zG97Emp2XNGFmVK0ixxmM
	ke3qxhMTqqhd1GA1gcecNMEjkShQy0i2J7/t92Fu96YL6ura1MFI0ABzh0A2lTqX
	z3Wozl43oTD6iNF/zTeL+wAkpRHaeJaiKpVf7WWIn311Wru3dw1GcXAeep7WFwBW
	pb5bohzFsjxU1+DNLtGf3Quc1cP3Eo6i9JeAuS5GHcRWgKLRpfRhsCOv3uEA3pzL
	Tw==
Received: (qmail 2593770 invoked from network); 24 Mar 2025 15:27:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2025 15:27:27 +0100
X-UD-Smtp-Session: l3s3148p1@fKtPZxcxxlZtKPC9
Date: Mon, 24 Mar 2025 15:27:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z-FrzyEY-bgvyKvs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uO9i9cow/SSxmpj"
Content-Disposition: inline
In-Reply-To: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>


--4uO9i9cow/SSxmpj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 07:56:29PM +0100, Thomas Bonnefille wrote:
> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>=20
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since this
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
>=20
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>=20
> [Thomas moved the dts to the renesas directory and declared the leds in
> each phy]
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Niklas and I made it and could run all 4 ports of the switch. Leds work,
too. So, with the whitespace issue fixed.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

Thank you for picking up this patch again!


--4uO9i9cow/SSxmpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfha8sACgkQFA3kzBSg
KbYx+g//Y7dU8PiFHB/QtCllzLzHedrhZonVblaLwmzhRlQwz37WCUj6dTQgQSCH
RZ6dpa7m+Ldk63MP0v/uh5a18X+DhGMijFJGElxMWv30DpWD1xo4EomNVaSOJHWS
hzmK89YAvoThKc3l4sk0MvpVYDYo4AZftDApldx7RBY8RuWGaqi0MfLNZvo/ZMq3
NUlW4Dfm7t5xdlH1SBMnxMnYaWbnxF57XNsQAwTO/NNcRNnK8MEVaBDBed9nPAC/
2sTzJVua80OWKj9kfbYSylRhE4+fgcmrC4CXS9WDtuMgxQs56lFULPQft6diBxuT
wNoiADAk71GFdOBtrJXDjDtKD/jt1/z+KFHaM3A+Mx2MFsYWYx4Y0F6KQnh8+oL4
drkFhI44LFnVcYuJuyrGGPWQdmctwLbY11mQcsSRH9PnrGCL8AqcfRYsNQYfQOAa
pRBQRTue+pzl5i4y8gGN7PlZux0kHbe4lqZnjgGnApCgAyAlAsC3AUXkWhvcepbC
UvTIxUbnuPvG1Vev7YTBBYMy9pbPugdsc7DFgdK/nOgDLE6l4P2emYv9MLUMCc+k
OXaAtSTmbLO7yPC08DQDZLkx68eRBIMKgr2xHoxrSMJVRczfhaYoXeoIezG+m0z0
0GYhSoVFfL6T79E37bojctn21ET0LtUR8C3n/sCUKAFdlwLRg/M=
=8zdt
-----END PGP SIGNATURE-----

--4uO9i9cow/SSxmpj--

