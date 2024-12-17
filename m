Return-Path: <linux-renesas-soc+bounces-11447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFF9F4629
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B1457A3D6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F661DB52D;
	Tue, 17 Dec 2024 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hT7LgFa0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576401CDFDE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424641; cv=none; b=i9oVnmxmsEetiWKd5WDtjVph7yvrLUNQb5o5rsUDNpZ8t/Xkgmm+4uMSmsmMLJtplLZ6vDoWZ00sFfCw4vqdb/thXw9RoG/3GwDu0h3wkQZC0yFLCsnETgALljwuVuitRveDQ0zDzkRtLapx9r9V5Mdf2nOIB5mgWHyA88/z5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424641; c=relaxed/simple;
	bh=ESTrrh5kzt20pKZzHdS7o//3jddwFObxCrUCgu0xi0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4Lh56NtgpmFqkE2+42YWNapO2oZf+UbOlD1H3eCCP2WfbEAeoYnp2fYpUx9Kxb2mBdBkkv91ZH799R3ucWSVMh+ke+dT+/lZfnXZ4jN3wzcgWvgosFvJpjl4eIFJEaurwnwcJyL6+UmK98H0bb7Qc/HpXVQy1ULjDXPMmyP/lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hT7LgFa0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ESTr
	rh5kzt20pKZzHdS7o//3jddwFObxCrUCgu0xi0M=; b=hT7LgFa0MT41ymp9iiH1
	YDM6J+guaFB85z27R3ybw0GkbtYaG+UYEIdPMW4o1YfF++I+Ov1ymvRtbyVapeYy
	P1vrje7s2Bl1EuWrtZodKkKRNqdbH3js2xNG/4so8GmVu5Jh3x/+fHlniSVb+/XT
	GL9+fpk9xMFw+hc9JD/Y0Og9nVHYwIV9dQzcGYvo/H60JW16FeoLqyXe9rSFFgmw
	AnRt/FvGx9szbb2iab5Ohu5TrqUgki2TZQXwskp59sa+V5D1R1XozT5LxB33EeGY
	PTXUqy6EC4L8/5QrX9vc9sXdFCWUycye/kmNhxV6ZwT9Lw/yGjgUOjGwLsjUo1x0
	0w==
Received: (qmail 4001394 invoked from network); 17 Dec 2024 09:37:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 09:37:14 +0100
X-UD-Smtp-Session: l3s3148p1@ZUw6NHMpvL4gAwDPXwAQAA/MfjDm1Sk8
Date: Tue, 17 Dec 2024 09:37:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z2E4OuPA7m6yyXxt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <Z2EzKErhR2MomNz+@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3KMw3RMYawymMT9d"
Content-Disposition: inline
In-Reply-To: <Z2EzKErhR2MomNz+@visitorckw-System-Product-Name>


--3KMw3RMYawymMT9d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Compare the results with hweight8(x) & 1 for correctness when x is in
> the range [0, 255].

Thank you!


--3KMw3RMYawymMT9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdhODYACgkQFA3kzBSg
KbZ4tA/+N7R9phnBnR6QsFmN0MtUJSJEuv06hEdecSBh+6cFEtl4YAp4h4Qxd2Yv
ZW5CQvE2UecSONsWYsne9YOaeThGBHq9bZbNhKzhJTQHVAwLqJO1WZGoUta7hEWA
cIuliLpQQR+O3Nupf9OhTkXz4RT8ieusZLlIofXEr7k21awnmoaJFCMaffkFwBe3
4piOQC6Ec5blWbbb/BQa3sBkpEuCnJQgbfRbMTO9N3Mo3LG+xi/Oo+BJoZvRdZqH
aKdk8fJzULVpCPOFup4O82xwNBesAAWDBaLZ4ZM0QLtna1FBUlSBA9eZURs5+cZu
39wcO53pgFcrvBsCnIbijIty1xbWK9Fu8xqBQ2Tz5rNjuKxtYl74jyoQIMlckIyN
smuCkhPZbfI2QQak8NySB8rNjSYTp29mVB2UrEMSHSajCKFXgZX8AyCoqXk/783w
Abf8Rg3bG983lKXHrXDiPxqCoWdKnW5MLUdJ+ZSv4BrFkspc0PCFb4BQyuh1rMNZ
0c4LSbTBsUiBz299RI1hB9gBl6ZminybZpESiGw7vrAc9ST4uEzrCPryKzXRV2bS
nLCaTceflhondB4IpmLQpp0YxPOO0Kudt2uV0NadVLMsMesR1DQOrrO8zIsLuqGn
egz8ZKXjgHV5YIdrTnOoF0tcDSJxuuInQQXsx3o+LxNOyEGyO+k=
=Phrr
-----END PGP SIGNATURE-----

--3KMw3RMYawymMT9d--

