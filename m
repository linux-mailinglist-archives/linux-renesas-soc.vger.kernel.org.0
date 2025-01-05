Return-Path: <linux-renesas-soc+bounces-11859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE45A018E0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 10:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B9111883515
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jan 2025 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7838713FD86;
	Sun,  5 Jan 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lku8/YFM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F813C3D3
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Jan 2025 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736069767; cv=none; b=AeVofbv6WaazEHqUT6I59o+cmSoYQ71V88GKbzMdPnSHubMo960OoHprostjDEVAZxPxaZhIVt+AqqdS3czxNRd62M5m1Gl8XboRYYOp18PorF2hokk30a+6JlNEq8OjQxT72D/yKoLpExS4hEFb+sDM2bxIvRwhPUs6mxqxEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736069767; c=relaxed/simple;
	bh=pRYQfZbiBtsMuo97kw+ZT5IfMPZ93xcpojYLU+ouZzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/t5MvF7moatWKxlJ8aSDFXcuTzqjwoXY8Oxoie6JWHL7npLcMj2YmcX4LTQk6Uj2JoXCqv2aPU29dgMP6s2sVd60gev2KNeUy8o3hnvpQQBRbyE8zADNbsz5hGfgEk9uECO+36OFrsf2t4YFByH2dAzcG4gHv/M/Iyf9DIoXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lku8/YFM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Lg+N
	BRfh54fWFx52Hkh4gEJKYKU2srlPITGlMgvSBrM=; b=Lku8/YFMGHSESXSA66o4
	duPWSjRPQU/D8Ye2uuVKnfbsLKcqu7jlryY+NTK5Y0sWXy7ffKWKqfl9oeAg/zXJ
	QZ1TuCcpBzQBTORNEBPeW24vRO8jYzSekO0Jh3jPrhY/bi3lqKxXfBQmhmT76oRB
	PJZRtR8BV01OV/MHYeW4S9ecNuk1Fvne5gDdYVs1HZbJss7fZPGdukzLy5FmsiZ/
	7rrgwinRJeB0Ebm6MhA0GguKtvoKIyXZuaxTtPTPg3AJIYTkGJUb4K5Zh74RP8+c
	K2udpZY3842iPeEW1jcCnGeEKJZXekGFsOg04FlMiH9GCzXweCBM6O+6bJ6Dc2Me
	ww==
Received: (qmail 1374028 invoked from network); 5 Jan 2025 10:36:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2025 10:36:00 +0100
X-UD-Smtp-Session: l3s3148p1@ikRYPfIqupQujntM
Date: Sun, 5 Jan 2025 10:35:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linus@ucla.edu
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3pSfU2fNd12csNP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, linus@ucla.edu
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
 <Z3hhw_pwFAicsEDi@shikoro>
 <Z3n-z5xA2ue8ojiF@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uDaZtfxN/yUvTHs2"
Content-Disposition: inline
In-Reply-To: <Z3n-z5xA2ue8ojiF@yury-ThinkPad>


--uDaZtfxN/yUvTHs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

> Rasmus is reviewer. I'm - maintainer.

Oh, sorry. I just saw your both entries in MAINTAINERS and missed that
Rasmus has "R:" instead of "M:". No offence!

> I'm a bit doubted about adding a web link in sources because it may
> become invalid one day, but if Wolfram commits to maintain comments
> up-to-date, I'm OK with that.

I just added the page to the wayback machine. We could use this link
now: http://web.archive.org/web/20250105093316/https://funloop.org/codex/problem/parity/README.html

Better?

> I already acked the patch, so no need to ack it again.

Thanks!

   Wolfram


--uDaZtfxN/yUvTHs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd6UnoACgkQFA3kzBSg
KbZJURAAnv6nzkWmoKQYH7H4SS+GZuo/ko0u5I1imRm8pogda6eEpXSm29qY6IUI
YAnWotXTJr7xLPkcJszZ+Q9Al5akFGwyuH+nnwKtkBlNmhK1WZS5Mpw1QCPR4RN5
GF2gr8cj0tR7I04rF8U65lbPAy99LWQNVwXX02smR8nZy18bi74MVA2gqy6KicoT
kmF28gqONIptdwrGyS+chFEcOO+dtrAtKfL9IsB8evIOzzDYTRH/SNLJ+kEumvZT
8lxyTdWaEtvsnAx9KRRltPsP2wRTGq/hXTUoCrOd+6RDiLJp4rip0oumqPXTg5f7
iPmehB8OzB96akmVGYMJtxgBoF9DMy6A+CkHfj6yOY/zEq+TbNpRWsoVg0g3Fv9z
O9MfC320Qz7E/3xfWqy17jFt7DcNLpGWkSZ/c/AuvZODYRTdR8xkX7r6BdJekiCg
vDyDCvYHVMuuQrU+X8jpdBcUvR5mNfNS3kuotG8pk/wLw8f2yOaNhIz4GZkPPXxw
JsKbMaANCOoQqcEQS8GcPiJ6zSQJYuZjOf63x6JM8PCrYnEnaLrGHqcl1Sn+Oem7
UB2VM3ETAZ4z+QhQ7OMGZ2ii+p2Thm/frOhdvjzvqapKHddxIdBqMUMhaFYv/ELv
Qq2c8jEpA9eZyFlOoorCoWJEL6v5CvFAfeMXIWNPUUST9JiGl2Q=
=706U
-----END PGP SIGNATURE-----

--uDaZtfxN/yUvTHs2--

