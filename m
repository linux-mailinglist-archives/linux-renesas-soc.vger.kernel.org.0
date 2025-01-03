Return-Path: <linux-renesas-soc+bounces-11834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11603A00FC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 22:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 755E33A486C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 21:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515151C549E;
	Fri,  3 Jan 2025 21:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZJxcqJ6t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C201C3F1B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 21:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735939039; cv=none; b=j92lIrr5h7WKfasnJgI4QLbX+jnZJSX1GK9IS1kQWqH4pRYkU9BhzFyaF5hXedFXT9Ztou6rVvnNoFDxHko4m5IHsUAw3+eEwSWzqzAW6uuk+Ee70HxjfU3qXTheuOb00tI+o+lb7POHcjba0dGFr4gfJp140/IuXitDENgsxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735939039; c=relaxed/simple;
	bh=lW9q216v/MpYpcldJp7rmupZIQwjR4e7csFThX//ud4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAU2DW8KaUHBDme6ecXxpQRIVZyitLMYUJ5DGmGlGn8bmrO4+XObeWhOwlnFr2LRV5iiJXA8mVqXdduMPNq4lCy9JVBeXe8avo30jW0sK4yB0h3+I53pz7078pi+EKj4rJlr3h/LCQ2vQlfZxcQuDNeokmUCP4AdaQzdhJf7/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZJxcqJ6t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lW9q
	216v/MpYpcldJp7rmupZIQwjR4e7csFThX//ud4=; b=ZJxcqJ6tjzbqh6Dc8V9G
	O8kgOEtaxdYpIjK6rdk4J78s5lzivO/BoodISSw4JHHZhdDTwLI7JRXpbaoYpa/e
	VRMnMGrzO8BN+6/oj+EqInpEXTaaiAfZFLEQIryGfIWu9d5f1fGiXv4npzdx+kxO
	/AFuLcGWd2rvQ9db0JMdx0C/NFoJFR3GkDz55JBjWLWo/ZjPSmpu3OuSlBcXafnK
	+de870OwRTrW2dxyz5Ez2JaDDG9BWpND16geNz8K/NIFL6YaPfVORLK/bRdEfGts
	NsQuZrjsNc79hdLN+zE+jkdWBI/P3cNqZzksaT9nsEO3Iv+RUQGFn1jH0tY3rnAn
	Lw==
Received: (qmail 1005039 invoked from network); 3 Jan 2025 22:17:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 22:17:03 +0100
X-UD-Smtp-Session: l3s3148p1@ou7UzNMqSpsujntM
Date: Fri, 3 Jan 2025 22:17:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3hTzvxp-Hzqnlj0@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <20250101121431.05d831c7@dsl-u17-10>
 <Z3ZV_D5AIUxFR1Bw@shikoro>
 <20250102185109.0862cae6@dsl-u17-10>
 <Z3e1tuAR5GsEhYLz@shikoro>
 <20250103134935.2a341ce0@pumpkin>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EcPlJkNb456QJKj5"
Content-Disposition: inline
In-Reply-To: <20250103134935.2a341ce0@pumpkin>


--EcPlJkNb456QJKj5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Right, this is why the arguments of the ternary operator above are
> > exchanged. The old function was basically 'is_odd'.
>=20
> Provided the high bit isn't already set - which it may not be.

Not here. Temporary I3C addresses are in the range 0-0x7f.

> add: 00010001 =3D> xxxx0010 =3D> xx10 =3D> x1
> xor: 00010001 =3D> xxxx0000 =3D> 00xx =3D> x0

This point goes to you :)

> I bet the target isn't checking...

Could be, I can't tell. I don't have this HW.

> So you might be fixing a bug.

Heh, which better argument could one have for a generic implementation.


--EcPlJkNb456QJKj5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd4U8oACgkQFA3kzBSg
Kba2VBAAmBhXzsbbdQpWixvV4lFcW6UgXPdolUdoXYNCvH5vxoem89KEyLTQjit0
HzbKVWbXNb2MpTnBIrukZjB+XV2qacvxYhyXMc9mPx+GyAk/5QnaSvng+n4ycf04
MYwLQcO2003DJLJff1rOUGCeBVWGWgnNS0bII7h/UZlsuBNBtrJcGUk0qq9zPEqy
rqyT2bMK4O10T1+B38ZeVqJTXOX5LsJYjluYk5Szbc31qTfaVBavnOYoqlPONsMs
Ql8TZFeNU6kk8u49yFZej7gQBdGNHhur+eByy7u8emv7XmmA+SIzsvhb72Rc2ut3
+OmB5ZdCsoU8guzZmnoZtX31N5GFA4vHqfqL7edgD4n8fCOYwXze7Z4XJH4jIAmM
HOX1Em1gC+T3YIC4KnVP8+kMWMm+4K+yK9O/AHWeO8LKwMxet1c02y9lA3kjQMmQ
LOL6UVuiTuqPPfNBtYMH8Hq27ivh9ZYPGh51bamR9l0F9ntx0fze4qa+4Wy8z1ZU
0AbB8ldlmKFOuMNUJdQ/+AtE367c/qDRnU81ggpJxOV9dPL8tIzPM4pY1uz9nIEk
9Q6MywuN8kvl9zj2T6j/PqeGR7Gsv/aSsiE28reNJpRGH4lUeD6TCPCkwCSfr96H
lvahmkVIRiJ3CNxfGvuu0rtGcReQDnNp8HPeUSYTb0p+Cs8VQcw=
=sQJU
-----END PGP SIGNATURE-----

--EcPlJkNb456QJKj5--

