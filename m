Return-Path: <linux-renesas-soc+bounces-24605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC23C5A103
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 22:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53E224E0400
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCA12F6585;
	Thu, 13 Nov 2025 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="abSu4hpE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E032C11DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 21:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068158; cv=none; b=lz0mJsWXskT2pIJNuPIB5OA1IwlH1GNhwBOtF1fTuKx1VlJY5cpsoAwvpyVPcTXyVrAeNfPNH+k0QwHC1OD277FXV6/JUcnVlBJOQmuPcZw6vL/pvl/901jsqs+8pUflw5ARjnyuSAxzGSzpr7hGN7zCCMBac/MBGrgy/029DUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068158; c=relaxed/simple;
	bh=mb9XMyk6bobdTqGxuqFAyh5/hN64WktEe30lzVt251g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXvg+bc9Ww9rINTCOJkRNktQ2ImKlVPRvcV3zvfurNLi01WglRN0lmmO46rZWQBit0Xgq7gZ2zP3ld04vFuDuJhGZ0WVZj1k1nkV0dNwWy6iS5bg+qYVfPbsMVONdDG7Keo0MOHnHihVjSHEfCQ6SymWc+u5O+wr49qqC6zkgt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=abSu4hpE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mb9X
	Myk6bobdTqGxuqFAyh5/hN64WktEe30lzVt251g=; b=abSu4hpEdmP441iz2JHN
	Wo+nvynDcobZalGwf9oF0OrL1+ZuQe3MpxtQkI9JlAGPTwyTBY2aWNTbhBtlds6V
	kzd5J9YqLg0KM93z+9s8fbc53xiPID3uDzSsovXSL8fowwmT5drf2rQcYlYh2fMd
	3TLoWpAz853XdfryY5Z2iyOURR3XIU5f0l36xUCkHEkgQRx95zSCsgghZaihP8hC
	W4x+cfQknx7JNWd6U250f146Ut+LtyWrSCr7KPyucoRALYaJ3ht87DdJ0oRJflpm
	hjbSPP4eF2XC0TNkJUUHiiknSSOrJBHCD8de0cDJwDwFiJjCTAbDUzH4IyzYKzA6
	uw==
Received: (qmail 2051596 invoked from network); 13 Nov 2025 22:09:14 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2025 22:09:14 +0100
X-UD-Smtp-Session: l3s3148p1@zeUOS4BDot8ujnv+
Date: Thu, 13 Nov 2025 22:09:13 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: Add suspend/resume hooks
Message-ID: <aRZI-dnmQolK7tZL@ninjato>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-4-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1al4z/e/pKW1V0NP"
Content-Disposition: inline
In-Reply-To: <20251008042526.3312597-4-claudiu.beznea.uj@bp.renesas.com>


--1al4z/e/pKW1V0NP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 07:25:25AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Add suspend/resume hooks which assert/deassert the reset signals, along
> with forcing runtime suspend/resume. This allows using the driver in
> scenarios where the resume is done with the help of bootloader and the
> bootloader disables the SDHI clocks, resets, IRQs before passing execution
> to Linux.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--1al4z/e/pKW1V0NP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkWSPkACgkQFA3kzBSg
KbZcJg//ZFisPPeinkMmrOcn2dxDqcflTQNV/HSRN70jbN5qHc9LZIhcPLP4InCY
36wssvGXSVbTRHBYrE/4c/Nj87uYAYea39+/afIj6R9VUT6Dapjej+J2UCpZKkLc
xoWSV9YaiOWLc7sFVHPmWOzLVqo5QbMsqTvigC/dAtiA9+BG2Fi1VlqvffFvAz+m
/1j6ygDykG34Yc6B7+2KpTW/0JC4vUAnxrev8hNSOzvnfncHcBsfbM5NNZj1sfsp
+jQ4zzRKfsFZwKK1HXjduvWMZkt710grbiA78vfLnzgxQiSXtK5bpQ3wLmZaMdhI
Ric8QoscCl6wAP/tQX6dLlXDOmZghaTaCZroNy2j+JnH8X+6wDUa1HjiG+IRlHcZ
sL1rplc7JvySwsB94BidZ27LE+qNFuThDvWTfckwmlar6TqmmE5LF5AOQ/MrP41F
XKU4P5GdLKsU7uZWuU9JhWq6eOB9encJkmNeONKJo3e//thTZhKi0B0kNklv9MVr
0Kyh/inkfATsVKKtrJWABQ7Ak4pEmuJhcKXts0QhZCTFWYbfKbCo0K90zhcuSDJP
bJccPFaAjOL2vvO+XjJEHSbx2IMzo1CiJcMTHllh72RLs59tgDTjxHTnjjQ0cAOO
+OfvNd8nMsNpQqBsPuGyt9lZNBgVsTAGtXbhYT5tgy3Z6GDYt9s=
=7ZPl
-----END PGP SIGNATURE-----

--1al4z/e/pKW1V0NP--

