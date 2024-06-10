Return-Path: <linux-renesas-soc+bounces-6022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E705902AEA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2C561C20E76
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 21:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466425473E;
	Mon, 10 Jun 2024 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCjKh2VZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D31879
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056315; cv=none; b=Y0g+YuojKE+gwswlhhKI+yzFYxXpHz2dDMdr/qsCZQ0VzV0V1ISfVbwoz9EPk9KCjouRbILs10Hm8f919FIA1Al/NnmKXzeKzVWq9WLDr2eNlvMzv+O96i6/Vy2ngEEGRc8ZKejANIOt02SSGbkOGKV5mch4WTqrjBmqYIdLoXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056315; c=relaxed/simple;
	bh=gVSHYb8vrQlWBwKEUXzqXe8WoOplvTz9iQcPwjxIhiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ62zrefCFmyB1xo8aJH+uMHnmn59Yy6lbXM0UXgRqg70bXY2N7ADqxK1J3PGRstYk6qcgN7YJRj9M3bZ3toKYicOJ0IEayGTSDOpXMI6CcSPs4zAlG8xqfhEMW6FZLoz7JJtWMxe/cb0DvDNiEHVWJdPjew8Sq2ggaSrinAnh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCjKh2VZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CDDC2BBFC;
	Mon, 10 Jun 2024 21:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718056314;
	bh=gVSHYb8vrQlWBwKEUXzqXe8WoOplvTz9iQcPwjxIhiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCjKh2VZAsKHO8M1Ww8Ut9JvxmW+sGcOeE+kUALsHcF5ZNfMilijPnxlMnkMSMQyl
	 /VnzakbrA3Tg18QKrJ63g5INu7F4YqVF2W69ic9roUUEHYOIVUhCb6csneFkNGul0d
	 tK+sTgW2tUefs912dboaJX/Vy6DvFrWduuR1RZSknm2lOwDg5Hp4+NE+u+wn8+9BBL
	 c3Qt51PBNsEq8tfKELXT+Rj/iGzVcG5epO3bAJVVGqsufY+JwV3iMrZTLmPYzsNsB9
	 vTXEnFACMItoaFqbmIWr0U6g5oZExpPUGfcdoYc4JQ3SON210kuuPXFKPfx6+WxIcl
	 I6NT3ool8ANPQ==
Date: Mon, 10 Jun 2024 22:51:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] regulator: core: Fix modpost error
 "regulator_get_regmap" undefined
Message-ID: <Zmd1arKQ1bCRKAl8@finisterre.sirena.org.uk>
References: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tFsK59KXKVw6Npes"
Content-Disposition: inline
In-Reply-To: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
X-Cookie: Your love life will be... interesting.


--tFsK59KXKVw6Npes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 08:55:32PM +0100, Biju Das wrote:
> Fix the modpost error "regulator_get_regmap" undefined by adding export
> symbol.
>=20
> Fixes: 04eca28cde52 ("regulator: Add helpers for low-level register acces=
s")

This is fixing the user, not the initial commit...

--tFsK59KXKVw6Npes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZndWkACgkQJNaLcl1U
h9CwYQf/TJsfIdPFb9PKOh6nxgB2SdnLWGggKoeF6WHKgB6P0/hGrOnPTwirIn9p
eJwJwLVPWxgm91wJVVpON/MFIP8ZN658b18mw+BLs1m+cTmJO5HjigGjtElMbyYc
bTmmFM5psrYg7RuwE3nbqC9E1OenffBINqse4ZTNkQpjbCn5h8MYcnh7hULPNfrs
xRDRW5ke76INxsOqYA4llfbgrTAyXxy6RxI9unZjpsmzHIrdz9RBa0YRYXSPIf44
lbdCSYzijNA8DtWeYuCowGC2AehAYWLu7p98NNMI8U5o9gKXi4KJOVfKDGvLybUY
XczshYX1jlAbi7QQjpvRHz4y9ZdjkQ==
=vRVl
-----END PGP SIGNATURE-----

--tFsK59KXKVw6Npes--

