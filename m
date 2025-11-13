Return-Path: <linux-renesas-soc+bounces-24606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CDC5A124
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 22:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84EE84E3AA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B133320CD5;
	Thu, 13 Nov 2025 21:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hB5r5ZXG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519B35CBD3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068434; cv=none; b=XvQmaUcp3wfPSGLYM18phNELuAlycuvaUOpwiMRAdA23z9fxZsc47x9+UNdTYdRusvSwCWM0NL8dPVCFabP7LNNuCEPNkVw4vphDMvc+7rX0r7ikpBxsezGiFhqdJYiKt1bDhFytxGJuVGihwaIq4YWEuEaOQQZfK6P8XiE6x/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068434; c=relaxed/simple;
	bh=wQJmJS/h5zLAvwIWZyN2zsfMeV7f/1YvMZNgOuWJcII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ay8HcbFZKpwMV5OirYI6mwAJPNYyDh0FGN9Pnyc0mXH14viHDFexYq8BkLsZmQZMjvGYGKbak94iREfbv/wU/wLhk7EyYMb/OTh5DmuuqZFfEYrVzr04YFX9w3doSyTFDiGdkM4xDevBfKWTATC0f0cX0U4s+fM2bpN+gptY1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hB5r5ZXG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=akfN
	X6PbINatqmuoJok9MycNVqFwo1lIUHkdqrTMqpw=; b=hB5r5ZXGKv1QUjY9a3FY
	SLH/M99UyZl5jt9qjQJS6kXIgyIYub+cZxWTyZIf6EzwUQpvqQuspJo8A4meJNuo
	QZvligfK4MJtb8LJNyEGln3QR85KsRZlPZE7O1QguIdZL6MTfM05MHAeu9n/EsDK
	v3OOSA/nBhFaj8kHqyoUThGWeOaVF2twjHIwXrZGVvc63rC2lU4LD9rSUiLb5rYD
	kIah2TeIZP/sGpdxLUcJn8U5wpmVZOcN11YSgeZl/vDzSkDuijDfTFyapC++VTUU
	DFV7IKNYDkfQFooojojCncF1rV5M/C9zjMP9YQtOnKA6xxo2mBNCzik6ThEqlzQ1
	+Q==
Received: (qmail 2052596 invoked from network); 13 Nov 2025 22:13:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2025 22:13:50 +0100
X-UD-Smtp-Session: l3s3148p1@8CmDW4BDTtgujnv+
Date: Thu, 13 Nov 2025 22:13:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 0/3] mmc: renesas_sdhi: Handle resets
Message-ID: <aRZKDp2ZI81sSHzG@ninjato>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <8c654a1f-2513-4afb-b33b-fabbafbbe845@tuxon.dev>
 <aRTRLW4bCoZMtCaB@shikoro>
 <55e9c0c8-4360-4d08-9269-27a3ff5ba38c@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6BBo1QBGjHnw5CXk"
Content-Disposition: inline
In-Reply-To: <55e9c0c8-4360-4d08-9269-27a3ff5ba38c@tuxon.dev>


--6BBo1QBGjHnw5CXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> On RZ/G3S the following were checked:
> - run bonnie++ on all the SDHIs (with SD card and eMMC, where possible)
> - unbind/bind on all the SDHIs and run bonnie++ (with SD card and eMMC,
>   where possible) after re-bind
> - 32 consecutive suspend/resume (s2idle and deep) and run bonnie++ (with =
SD
>   card and eMMC where possible) after resume
>=20
> bonnie++ tests were executed after boot on RZ/G2{H, M, N, L, UL}, RZ/V2L.

Thanks, I did some lighter testing on R-Car D3 with bind/unbind and
suspend-to-ram. Focussing on areas you modified. No regressions, all
worked fine.

Can I get the I3C pinctrl patch for G3S now as a reward? :)


--6BBo1QBGjHnw5CXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkWSg0ACgkQFA3kzBSg
KbbMNQ/+Mn2A3des2YE34MEXSSRd+AJxMVBf4K6JWlifRlJ3Vmj/MrBPHpPry0et
3bBEMzoSgm9QXxUGxoDLL2fmriK84BtY3Gz+UmpSBABeOstJJrZxEhFpo2hFPw+S
UbCoDsLvY27vwLwJIzBmTOYUGX5x6dU8/+LDju9cmmxDs/EFwoSlsxLyrN//LRAK
RWUNxXmpfx3yIz+yvMS1SbhRmtDe557CPIXsYIRtkPAWB753dNKwclQ5vuVK3zsW
yoH4CslLhWOtVRf+YL9mRvvNYsO2xAN8UDDUpMc4pX3FzajC9T725x0ULhZLR0la
P5RnWOjZxVI1oXiA6v/Ig9WzATipKh3cpOT5ZQXD52OHXpDy3lfPbZ6+iH4ianwN
T/SYBGOoJLG57HPbMvneDKCW8ARexQujbWuvtdB4qxa6X2hLeLIsZkOFNSDxeusB
9IHKn9eLsaK18viPUobnA0AWZU1X79bXbBJPdpprLfEz42oXHIvwkvlo7JE3PzyU
Oovs8YLSdWr/VACMid4LzNHATIYd0LiNFF0HbQZeYRGzMPbvpvjOvschEWcabKNw
kNkVvwQ39035+U+L8ucnUBFLKzXwfe1QxCuaJ/X40Aa/GCqSBZZXGTRvvx3eACg8
UBcAMs5KYmOyjVCt0xmYOMu+Dg6MH6XVRsa8GWCs/04TlmMM/o0=
=D7XB
-----END PGP SIGNATURE-----

--6BBo1QBGjHnw5CXk--

