Return-Path: <linux-renesas-soc+bounces-11769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB229FF771
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF5A3A2542
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C986E18CBFE;
	Thu,  2 Jan 2025 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="laUvLUEr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85578383
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810450; cv=none; b=LTT/y9uP5ThTuIgL2iN8CK5Rq8RFF6dRkYsWxOb34pnad1MAzkq0YFIfIcZOwLvGcn0hbWd8bonN85F3nWhLj2kziVv5nlFmKf8vFOEChe45STGOqfOoo06jMXMdz9o6A7jXq+pn0i4bhUmX6y3BYsEgTVxXKolxri4mHIHg3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810450; c=relaxed/simple;
	bh=/ah5xhm6mtrySf6gsY3Egz2SD7FibMEgTbn2LDw8Un0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRAEuFJYDq3rVP81kWP4hdy4oBa9PZ4qJ49mGgMni3xRsLgDBOqErSRoN+A/evJK+xKAYfCcTnuVcb+XK6+5kAAFcBJTyFKVwbnZNuUk8ZXp0+loIXl4+oyDz1IR+Gq7FYy4tUgQCAodJ3uG0sNupoJF+FJycBWactybr+3fm5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=laUvLUEr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/ah5
	xhm6mtrySf6gsY3Egz2SD7FibMEgTbn2LDw8Un0=; b=laUvLUErUFBxGEnolQny
	+yeaxgT3or1obE2jkH1yzN0xsDjExJFnXqD2Ci4u9GdxJweIgWR5PGETGDtqchH8
	J8hYyCw7PVNs/ZF47IwMhY7m+LOKMLCiqbu0pCCEkB5EAuuqgHjJFgGygPwTCpl5
	ktol4wibhQSmrF0SUO9LaXXHEa3DNqZD0WGVPHLeb5S2o/jmNByeRCACfvRLgLRh
	fTX107iUZsLyAMzVP27ZuRyIvKPJ8jrA0828Uq98IQAb8iHRjSl3Z2d7BgCbY4Pu
	i0Oe2WZedX3SOJVnKzLwALW0X8pputgwCQ3H/mGv/al0WIAtPNnFCM1vhfJEGFm/
	tg==
Received: (qmail 576982 invoked from network); 2 Jan 2025 10:34:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:34:06 +0100
X-UD-Smtp-Session: l3s3148p1@VscJ3bUqrKwujnsY
Date: Thu, 2 Jan 2025 10:34:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <Z3ZdjRQa0nF1IYaU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
 <Z3ZWt0Whyppr6GKX@shikoro>
 <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dG7YwNWMrpV0uZwn"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTUwtVFV0o-Hsxp+eTscHHuzOmnBjv7BPoK8moQ7i9Qg@mail.gmail.com>


--dG7YwNWMrpV0uZwn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Let's add more bike-shedding in 2025 ;-)

Yaaay... :/

> There's also a general dislike for the ternary operator (BTW, I do
> agree it has its uses), especially if one of the paths is a no-op,
> like ORing with zero.

Well, let's see what Alexandre's view is on this. I'll switch to that.


--dG7YwNWMrpV0uZwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2XYoACgkQFA3kzBSg
KbZuyhAAiV3y/bQnMst/gXIaeHGX4FaSgRuGw0HCqDl/yvD4AcPuD3AmmfOJ3/+J
bMcnOSoGve2OgFK8vQR//GuXh3qb6EXO2yteIC7veSYnmqWTJAer2T+660zXd0gh
yedlGhkN5YLIPcPxSS8057lczfBm2rDs1MlbRa0vBwxI9i7rSXH7fDCn+FGA5wve
SrrSHDol8TmZPw+9xn6Faukgai28dhbwIZ4vRHpgE15VO4y8wUBpNpIF7yqdNWFS
2iWkXMwGLMThGAsRWrUY3u1HEaf3PDf0RYp0Vj8skWiS7jNFVaB91XDi51nGD9YJ
NCq1zoIBfyJNJ2JrsDJTcPcez9uSu1++J+NnPh+SbzuZB5rhU8ehXqW/3pIDipQ+
6sjPcSfaamJbcgl+ED0cnuGohGqSdPoL+vD5FJYnJfNkKcsYP8+1+a6I8QVZ8Bq4
c+zTDKyog1EsQNJe5cVNaqWTow2EL7kqceZUp1GtSbQJ3uL/RL+D5mXTdUDLvc16
XduvtGKrioCBPO4OzcuqN/cxEo15dA7UTZEsWSvdd7PlpZo/Uf69VgrW/n1+sjHT
0tCC5a+gJd+r7THCE+DDkGy1RBQEt7bv8fq+ANvUMCdy1mhYIEZbDsUl7r8s0y0r
k4ExQbIFIhY2WAAhUwMudQNWsUAq3dDLvXIIoChkv3TqyGvcei0=
=U6wC
-----END PGP SIGNATURE-----

--dG7YwNWMrpV0uZwn--

