Return-Path: <linux-renesas-soc+bounces-11681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DBF9FA590
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 14:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1633E7A06A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 13:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247C4189903;
	Sun, 22 Dec 2024 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bi4Mlr/H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA3172BB9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Dec 2024 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734872430; cv=none; b=knsUhs/S3j95gCe2k4nhf/aDyqQtrdEjv7tPcSZjMbfXxZC0t0wFfqGbw5WQjMiSe6VldxRi+BcJS83NL1m6IPv+QykSLvUsqRd3w30WHkL2dHeaPpLpr1NcB+Y4h1rPGhvtMlPaj91l3j4rOfCNA4JW4s9/Koi8ccX239uNm1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734872430; c=relaxed/simple;
	bh=GGFsBiGKwhM5y647BruClQrZsKtOLav7/B7Y2CVIbxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2/mOCbknRQXtnhkfRHDPyJG0hOx9UY7e3itd+Tyky3jwb168+8W33WgNhX4QEaiWtVuW3ItWG5QB7oDGqvty5GkrjyB4hJr0rX1VhtyEkqsGklFnY/or/nDxC7dnYa5bIabBgYD+El16UO0SXXBOuibsxzDCgJjllGRo7UFyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bi4Mlr/H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=85Q5
	7pJ9L44ANNodD02Ighvv7ke0BLVIzzEJ65CFFoU=; b=Bi4Mlr/HShwc3urVSPYa
	RHcpT9ruO/uR9oa0CCnv/0Mjl5x5eZbh7uvQiHZ8SAzhST2JoID1K2NA4YOn6FQt
	SF8lEmim8vo3KnoMKAayw9WP0yMpcbF7nO0nc/sn5kfiphz5tJ00kp1LMheYJKlj
	fjUU/ts7e2yty6KMXDws28WDe/gcmsV8tEEXTuQK74ZtqKk14yIGm6WUoMr5+uRF
	KBMzD/pwBDYgKDTHlqxvFgJcWHTZshgfOcqXxV84FyZ/9NMnkooyolpk1w9w18JK
	qZmomNUDrjWP9usdqrGVBd7CNivI+VWs1HJylsdg5j0I+55+Ro7dVrQp+30Usw6d
	yA==
Received: (qmail 1593706 invoked from network); 22 Dec 2024 14:00:23 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2024 14:00:23 +0100
X-UD-Smtp-Session: l3s3148p1@TxB/dtspAKYujnsY
Date: Sun, 22 Dec 2024 14:00:22 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-renesas-soc@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: Re: [PATCH RFT 1/5] bitops: add generic parity calculation for u8
Message-ID: <Z2gNZtuDSwpwK3T-@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-renesas-soc@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com>
 <20241220113000.17537-2-wsa+renesas@sang-engineering.com>
 <CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WVrAoGt8mL2kMsCu"
Content-Disposition: inline
In-Reply-To: <CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com>


--WVrAoGt8mL2kMsCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rasmus,

thanks for the review!

> I know it's prototypical bikeshedding, but what's with the "get_"
> prefix? Certainly the purpose of any pure function is to "get" the
> result of some computation. We don't have "get_strlen()".

Hmmm, can be argued.

The reason I chose the naming was that the open coded implementations
were sometimes either returning the current parity or returning the bit
which you need to enforce a certain parity. And this was never obvious
=66rom their names. Sometimes it was not even clear if the returned bit
was for odd or even parity, just for "their" parity whatever it was.

So, with "get_" I wanted to ensure that people can read from the name,
that this is about the current parity and one has to draw conclusions
=66rom there. But maybe the kdoc documentation is good enough for this?

> Please either just "parity8", or if you want to emphasize that this
> belongs in the bit-munging family, "bit_parity8".

I'd go for 'parity8' then.

> > + *     if (get_parity8(val) =3D=3D 0)
> > + *             val |=3D BIT(7);
>=20
> Shouldn't that be ^=3D in general? Of course in some particular
> application one may have constructed the value in the lower 7 bits and
> "know" that bit 7 is currently clear.

Yeah, that is my use case. True, your example is more generic. Will fix.

All the best,

   Wolfram


--WVrAoGt8mL2kMsCu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdoDWYACgkQFA3kzBSg
KbaPfQ/+KXvt/O81S/uaaAUllhpIUPdhnKs56MKRTQyXzeb63z2z6PU1QItQv84F
CkFotiZASwnqpYv8t0mqv2ITY75WvG1CqduI7b7xPsFz0k4cEod4lKwR6tdN0nTZ
BVAWPT8XVgNzIfGsdm4++DjJaueqOOK92/HKVZF2PtcKuHI6fKstHnmq+FAJ673k
enyFFcK0SYxGoXWw9pdW8aXJo4aLiXE3qDtOKJPJuAsVJqYu4IHWN5hix2jmyFW9
8wmICrI+aJ1ndTuqy24MmNNobWHwHiCjzAq5pIIdFBUqZuYCwXUvOS6OhDpr2nWT
B1vElWGPlgVQoQ4jGSjCQQoaamCU+LvB7/wUl0UOmYnS8TyYDDRZWozNsnxA2msO
ezW7DQLeeMKUyCLiw6ZExUYGMduDlq4E/QIZNStukp7ctAxK4aQVRuFBAI9jmWMT
XnJFN6f2MKVBrZ0eVbaV9pV78fckr+bH9wzSHV2G921XULF2RZFdxqMnzM/IZqV1
jNT3C2YuP//XrtuXI6FoCOQiH1V2nuwnkiful5rRO7Eea6PPEljav6Yi6yb9G6GK
IdQ2kxKWoM0Za6QJEov7K4qLugJ0gNVdIsarNUeWzZMIc9OlXd5oX0GR+p4zx1QK
6yA4GClpm10YrR2eCvvIuU7hW6BIAygIV2ENlH9UtmyvH7fYYLY=
=XpOV
-----END PGP SIGNATURE-----

--WVrAoGt8mL2kMsCu--

