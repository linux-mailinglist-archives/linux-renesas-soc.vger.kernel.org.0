Return-Path: <linux-renesas-soc+bounces-23233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 440B5BE8505
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E43CF35CA8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9572A343D6D;
	Fri, 17 Oct 2025 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fABidgn9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7F343D64
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700358; cv=none; b=dvtV/GlAsN9WIkIRoUmrMc1J8c/pWkYFB01fwKNCJIvnGmGvb3u/9kkxqSCfksjpnDuFQTN/kL8lcp7Wc88XOrfSp/pQItGStLYrI/ERI0NLffv3SRN+l9DUUKMebFxRt2kbhiFIJDgVCtOz7tNF83DhG0WwqvTU2psvklti7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700358; c=relaxed/simple;
	bh=aWvD+LLrLF9YK8GnZm5gsYiNIJjDuBqyzw6Mr1QGTag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFxqPMePwFCDf0pfN/3U2oMXwbVoKvUkVpp+0P5TJXusmZvzEunKFCgXPLfRBmBRDmN9CjRM5dUqlQUJL5Qq8qJCWqMAKExyrW9tGD1GGOPjmsEvQi253aNegH5cdfqbIDq3uDYhLSIpBU7DVhkxCeazNDyuUlrUkxe5sqTAdr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fABidgn9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aWvD
	+LLrLF9YK8GnZm5gsYiNIJjDuBqyzw6Mr1QGTag=; b=fABidgn93jmvg9ZisEcP
	Lk0H3NKOriPyUAhNiEmb58pFrcorfCMfQCUMisFcIOxaOAfeC8ca5aPhgKHlI73H
	ZbohZ53gjJFEx7ICJXdFwuVvksx6wULWJlyZaTYn+nRxgg97PEWBhke66ygKhUU7
	yX8tFG3uV82GmDaCNoCte9P4g8jP2a2cKsOnkx1kBKwtJUhPRWp05rKtQro/4GkV
	USplM4Y3eTLFR49U57Pww26JZjQ0BSmuZtNHWWAKw2JF8QABzrVa+RiqvsTEN2Ei
	lp8jXMtsK6MG8Y3dxCNAHIHFKOgw3AZUw5D4EjBN6NuTbTiJXtlqkkTuf3jm33ZC
	sQ==
Received: (qmail 11438 invoked from network); 17 Oct 2025 13:25:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 13:25:51 +0200
X-UD-Smtp-Session: l3s3148p1@NTwB/1hB/uMgAwDPXwQHAL/S9V79e5yL
Date: Fri, 17 Oct 2025 13:25:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPInv9NELU7N9QDn@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro>
 <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro>
 <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mXhh8XpVdeKHr1Bl"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>


--mXhh8XpVdeKHr1Bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I think the fallback mechanism of the core should work without any
> > module loading infrastructure. It should be there whenever possible.
> >
>=20
> It's not really a fallback, is it? This is the path we'll always take
> if the driver requests a reset control on a firmware node which has a
> reset-gpios property. If the driver goes with the gpiod API, it will
> get a regular descriptor. It's deterministic enough to not warrant the
> term "fallback".

I dunno for how many drivers this is really applicable, but I really
liked the cleanup of the pca954x driver. Don't handle GPIOs internally,
just get a reset, and it might be a GPIO. I think it is very useful and
I would like to see it wherever possible.

We could now make these drivers depend on RESET_GPIO. This would make
sense in a way but is uncomfortable for the user who has not RESET_GPIO
enabled before. The driver would just disappear because of unmet
dependencies. Yes, this can happen all the time because we always find
new dependencies and describe them. I just hoped it could be avoided in
this case.

> Then I believe the platform's config should make sure the driver is
> built-in. I don't think it makes sense to just cram it into the kernel
> image for the few users it currently has.

For Morimoto-san, the PCA954x update resulted in a regression. It is
worth thinking how to avoid that. The driver is so small, I wouldn't
mind the extra space if it saves users from disappearing devices. But
mileages vary...


--mXhh8XpVdeKHr1Bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjyJ7sACgkQFA3kzBSg
KbZEbxAAqiaXS9a0L9TGTMWpxJnVJeLQf+9Ge06OCtpjIwWdYJ5SGNRCSSqXLEiN
oM8lShGPB/27ENIRZPujguWRsXyDII/fqYuPcGpnF5UIaEhfj8HbVUN+gSZzUDA9
hdlxQJ9v7Ewf5ng1w4oWzOdqh3giuXMQ/2jKeCeY71hfIfsj2g687r9UH0JY6vg6
mHD9hJzl9atAhB9F1931utvhQhZSC5Hk+gm4Lvce7I/qOtiPLtZ7UJUCo7s/gXlv
w7C0qalLlU7bKFYldQzJCwzZmYE62JHWTCv353agnE20Vt5TqFf0446RjNnVJBvw
7CRWPuLSunNNFXRwIUQibnT7EM/2yy1GrdbdRMr8wN57y7T2DBGuNR/Esa66nsJ6
CtH5LeE5Yezk3f4rAiVOjLNnxh+bSpSLmwdb20bgJ6NmoUP3QI+OZZot3XjfcudT
anXQaMgQAGnC4yCL3ILENQbSemFpMMmbWBiA1+Wtj6p7dVFl+7gvw5T5vZjrFjjr
pwYoqZqHmx+QSfDSpDBr5PFqxhWCS5gXRgY/WrU1EsTt5Vx7H+oh/pM+hqW9Korq
rXRy3BE8VF/mO9cyhoWQ1mJ/kTN1jLIwRnOqzhrfnr4ycdapAOB3ehZovh07GJgX
IJhnLl0/9n/8RpxRtW5dUBd8TsJ6nJTC9WHJoV6gtwB4prYkvLM=
=1Ev6
-----END PGP SIGNATURE-----

--mXhh8XpVdeKHr1Bl--

