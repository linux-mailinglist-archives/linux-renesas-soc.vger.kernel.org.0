Return-Path: <linux-renesas-soc+bounces-11947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E7A0546D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 08:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC1287A1C1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 07:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B481AA1FA;
	Wed,  8 Jan 2025 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iS03Qn1G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4AB1A9B48
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jan 2025 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736321038; cv=none; b=TMkO/ORi8bvdfI9V5haYMtc43u2U2We4YB7JiDsKMPH0zpeLhZ0B/8msLRqBK7Dyd9DQRuq43/jTerZlrrZNcSf5pO6DILSpHRkliKyevP03VCFjP6NnYUpvbX9635jEayPGVwc/hOWOUIcu/GJW9V6yjwmxTijkdUCRnoY2O3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736321038; c=relaxed/simple;
	bh=6jocAxatsJ0SrTGjfAKKJL3B2gDniLv9c+THC51JLak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6eWBCUZxhg7GEEca06qUeXtMAR1KeIRcqStamKPfxsnvapJ/YyQ4ejlE4bYcGB+3GD6k+VyOtq9Ouyx0fzIR+BK/DyeSXbsztytmkXrlnzd/unFM+5GeXBLTQXlcXnmJSXfnuX9sm2ObQX11RhsCUr25FWvUxvFoUw2wwcdnsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iS03Qn1G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6joc
	AxatsJ0SrTGjfAKKJL3B2gDniLv9c+THC51JLak=; b=iS03Qn1GSGDly5gUIrdP
	RSmbq4k8G71yQH+2rqPHoP8Eqd16y3QMCN4dQNA2yxL/uNmO7XQza3/2plhCfoBV
	wYKIf4y5iP5saMn7afwmsw02G19MIO7i0GxOq9qD0eWx1BNKuKArDdoCFJ0bJ7OC
	RaPe6Yy5x6GigMg71DOG8nSTe8vTxa6SHzddeHC+Cm5rApT47xrr2CJFIS2Lmfsv
	CNHP2SwF5dXrpQOH34txIr4XheEAhnkn0k4DtYLEFHHk1yAt4hX5GppDF6bxJV7n
	dZvBBZmWG1KJPeS7ooY1VWsCTExoxAfK6dFd5rbHmSOT6J1Fr6wyf97h/vlCfXRr
	4g==
Received: (qmail 2471148 invoked from network); 8 Jan 2025 08:23:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2025 08:23:51 +0100
X-UD-Smtp-Session: l3s3148p1@8NtFviwr6rAgAwDPXw20AOMQ2KO98fSH
Date: Wed, 8 Jan 2025 08:23:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z34oBoS0KL4Uz2Jn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gQCqiv636RgPLUc8"
Content-Disposition: inline
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>


--gQCqiv636RgPLUc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> A build-tested branch is here:

That was locally built. Now, build bot said it is happy, too.


--gQCqiv636RgPLUc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd+KAIACgkQFA3kzBSg
KbZUwQ//cNA+Jq4G+tNxrRgij4GTKhU92VoCTEFy1Z3KZUj86bOqqdA8CkzyTSjh
QYdPeTp4HKr7x8suKiD491rfzETb2V5yzVk7g8bqg85PEPb8Cm0KigGZXK0E4Ko/
M6k9plqnxHDWr86GXB3c3n2Ko1KCpGzZ/g+igiPSBlEweUXsCNTJamv5slBT4FOr
lhurV8N9dLRD++daOnaxedhHrubX0P74+Xwnk7jYmT/c8ljpGZT/W2l6YKBR3ixc
fdJAN0HtXSdbaTFDezc68/eQUmWYbJJA3+7r6HbhfjmvnttCYOs1eCzD2kbt70zu
t1fh6G8lmkC9bjI/4c6jYMxy9ZLy6MCgrrI3X0ebGspx3f8LfCVStTu9Vt6xy1sP
g/pVHBi1WgebVgDeBZN9kijXXV1A5Qcw09T109nr6c8bIK2T+1ZX9dGCMm/hwbW1
LfOyLKQ4UIEDBF4Qq7AhjblJJaKYOX0d4GVvhsEpaLP0heFYsVmVXf1GDjsBXhVO
RHpoUx5QolDlRSHO4vNfRbjh17pJcEKCHtq1Q4zdxkw7BxIHPurMU4bJo0kwholJ
UJUU6D+YmWF2DEAWiaeRRBllT3nbKKBXP3kP4C7xcGvAmjqJocMib563V5AZ+igB
MbHFOErQS8KbjGZIS5P4D4rLFPnqNEvwck25ddQbfFBO9wdkgg4=
=IhfP
-----END PGP SIGNATURE-----

--gQCqiv636RgPLUc8--

