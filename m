Return-Path: <linux-renesas-soc+bounces-23478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CBC003C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AD9A4FF54B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5083019A7;
	Thu, 23 Oct 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NfiqOg+/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641C23D7D1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211374; cv=none; b=cqU5VWq+ZvivTRCvkEy5O8WQpkRRlsuFZoeoGb7ddHi2cMylFramSc8yb9Hns9a7LZZVnwT6WqmNO6/8PopLZALHih0QMuAXapI1gHj66+fXCKQjff4KNlykUyK+NgmUJlQ+uUWzxd8JZf8i8pLHtgTD4LB47VrMG+pk6geI2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211374; c=relaxed/simple;
	bh=MmxmGHctKx7kK+Uo36QkuOd3XsUhd7hcJDU/dGKBmRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUi+XlUbb35d06hnZhViwLcMwfk0ocWHRd++PmCU/Wkv60QJNWo/VZjxdAW3xYcsj+j96GLMfr1W5hg4zHdzXpPAMxSRK9m3iSJofyom5bBfioU2tU98aglZl+ppIatV9X4KYeLK5zZ2ssukfiyy90sE1Wa/ktG7AMfD3KYuAz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NfiqOg+/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uaeh
	pVOpUf/cS5+cRmy5O8nlh0SiDkHpiLE/Lc4/G3k=; b=NfiqOg+/Cg8RKkmcycE3
	CHVR1V020X5xIQRnVa/mJrEdgWuF0MNIIqk/8lFWAISva0LOoOQg2BhIprjv1mV6
	riOlmdmAWtMgVD+f+bAtQvb3v2/5u3xAKs92HpZQuCpWlVXwnL1xWH/3kFm6c1hv
	Qnrr35FwH86g04JHAK+Wyf3U7HcWlZJWuTel9PUH8zoihBWiR1h9E/onAqmoxBdC
	Pjhe8cbVZ4AIoHS+/mOVWMkZxI3wYmbAE94iyZjtX6eQmZ973nfi0TfWDFoM6THf
	bM+2t8aojoXktOJsQ+KfzJONnieAJSHMYfAIbdP9lodmMcN3L+/coh14yoVRRojX
	rQ==
Received: (qmail 2145142 invoked from network); 23 Oct 2025 11:22:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2025 11:22:50 +0200
X-UD-Smtp-Session: l3s3148p1@Z84b+s9BYlptKPAY
Date: Thu, 23 Oct 2025 11:22:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPnz6U-fcodRoobU@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro>
 <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro>
 <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro>
 <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
 <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mKofs96cu7kGmLt9"
Content-Disposition: inline
In-Reply-To: <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>


--mKofs96cu7kGmLt9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

> > > I dunno for how many drivers this is really applicable, but I really
> > > liked the cleanup of the pca954x driver.
>=20
> That cleanup might have been a little premature, given that the reset-
> gpio driver currently only works on OF-based platforms, and even there
> only with gpio controllers with #gpio-cells =3D <2>.

I see. That kind of spoils my assumption that it is a fallback supported
by the core. Darn, I would still like to have it, but it seems more
complicated than I have time for it :(

> How about selecting RESET_GPIO from I2C_MUX_PCA954x? It already depends
> on GPIOLIB. Although I don't like the idea of drivers being converted
> en masse, all selecting RESET_GPIO ...

Well, on top of that, reset is optional with this driver, so selecting
it doesn't feel proper.

> To be honest, I don't like either very much.
>=20
> Yes, the reset-gpio driver is only about three pages in size, but
> force-enabling it for nearly everyone, just because some hardware
> designs like to share resets a little too much, feels wrong to me,
> especially in its current state.

I understand the argument of 'too limited in the current state'. I don't
get the 'share too much' argument? The fallback would remove open-coded
"reset-gpios" handling and sync it with generic reset handling?

> And just default-enabling it doesn't solve the regression problem when
> updating preexisting configs.

Yes.

Well, at least patch 1 seems okay, so users at least get notified of the
problem...

All the best,

   Wolfram


--mKofs96cu7kGmLt9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj58+UACgkQFA3kzBSg
KbaifQ//Q3wcCTFzd3BHSUa+0++ku3/boJCNnTrasBVNJeGvrUsI0HblrxxqB+D0
oSfi7y2UvH8DyeARLoBd6nKDZlE+KEbG0PEcZXSkkKlqrMpNpH9X0eWBLO3PCWBh
zlI73MIirI3/PBDwi/5YPkkuynw5A7OgyGnxHy5xxj8obnIa70h5w/DpdSMNgSD8
KaCVFhAHUb3hNNOW8IyQxgkYTijj0zFs2bbdj4Heat9v0dtsiuKKChY+RazaeBMM
4u13pzuxyrTFSl3yQ6EDxZcmn3tkkZW+HTMBrhPFnmf1SNEpKGgGOEsGOraLqmhe
lOqB2I+H43T9+IVhcTsFwAd0vRvQrz6sVYrYmicLJt1WzBf/6gFmaYtLSPCUo9ju
zSvp1vEqqyaHdkAcjT/DDRtWljKxU59JXHSdeROKld+maRLUdHsmU8dJviutAfUB
QhRw9mja7q3ahBsHoCBoSBdQ+Sb2UM6D1uLq+o6ugd7f+/1X8OFMXe358Ym+5QYT
fbAqp5CddWDLVJNA/po2dFL6uTZu4+y+zjYLr+lb6AlNi04ppS5N9Xnliz3Duuul
nHMwqgU0cVerXdjqecDeC2vTyJoG5fcDty75jR5RGAFYkBspQvSwLCCYN9cLt2CQ
mNVWYKUmf2cidYWLAIhVrdLg/MxcIMA6XwLjhohdwEoZ8qHV7xk=
=CZiO
-----END PGP SIGNATURE-----

--mKofs96cu7kGmLt9--

