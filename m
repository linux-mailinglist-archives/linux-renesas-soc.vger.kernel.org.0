Return-Path: <linux-renesas-soc+bounces-10270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FC9BAE02
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 09:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBA1FB211CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 08:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B161AA7A5;
	Mon,  4 Nov 2024 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BaReW9qi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED91A7AF1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730708739; cv=none; b=oVDaQz65CXBDrJLn9vi+gC0fRay5UNpTl1Crjx3el/Uz0rQ87MAcNRNM14ZM37j+9tKOnA+XwhPXsa+DQfS5OApYE04S5qtN0m1+cVB+msmnEKdXDZ0Y2JuW9RgiSoxQI3OVnFvJVhTt8UsdJ2NMd42j5FD9o7muqIXhdDDgEH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730708739; c=relaxed/simple;
	bh=jscPegkRziWzyu9oWZiYe58XCmYqC0XMnkqj5xf6d6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSIrHJy8jN4+tOpPjeytmzxC5ogEk51i9eJZVa1gunCgaJd40c4MoyRLSjdq7Jer5t3Ho3fAoK/d5ErVEMMxqDrAS9yfLX01egajg+neoDwaui61dj7AeNYvkelqE9odo51muf32bupNB+nHo/GbmYYkohwF1xE1xD+YTF/FJTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BaReW9qi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jscP
	egkRziWzyu9oWZiYe58XCmYqC0XMnkqj5xf6d6w=; b=BaReW9qi6j3e4kuF8Z3c
	FbmVWs/jdCCguK/Ptw1sKVnfIhZBURfRBnPnUBvJO3pqr1Oj7thiJS/gABBYIEyt
	0YuME3HveD0CJpOi15d5FoCQixDPmB5mwHPa9BJHfcboQOmRPwUs52Zd/xaEtr0x
	qhcH1KPW6p1g9FYQubW85aUbG8pktSvURdNUTzqV3aUVsO9eTHPn3WEcrfhvwVuc
	Q4zmcH+1dWZrRIpjUrpbU65+r7q82ck71OSf92xxBB64b3H/IQooJwywD+vgNFP6
	Euv13nGkLkqgMHkkBF5KB78wjKJlTo6xOb7dxHYiOcBpDfglgSM22B4j9R7koRmr
	Ew==
Received: (qmail 302239 invoked from network); 4 Nov 2024 09:25:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2024 09:25:25 +0100
X-UD-Smtp-Session: l3s3148p1@0zjMBhImuqbVHA60
Date: Mon, 4 Nov 2024 10:25:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-mmc@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: suspend MMC also when unbinding
Message-ID: <ZyiE9dgzmps1exe4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-mmc@vger.kernel.org
References: <20241007093447.33084-2-wsa+renesas@sang-engineering.com>
 <CAPDyKFqfSgmPJtjLyf+dU6uz15EerOYPTp9Pr9KYt1RpCzRDMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pmk3/D8cCwKcIUUk"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqfSgmPJtjLyf+dU6uz15EerOYPTp9Pr9KYt1RpCzRDMg@mail.gmail.com>


--pmk3/D8cCwKcIUUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> To be able to put the mmc card into sleep/power-off state, we first
> need to prevent the mmc-blk-queue from serving any additional I/O
> requests, which is what mmc_remove_card() does. :-)
>=20
> Although, we can't call _mmc_suspend() after mmc_remove_card() as the
> mmc_card may have been freed by then. Hmm...

Okay, this means there is basically only one place where we can suspend
the card. I made another RFC. Will test it now and send it out later if
all goes well.


--pmk3/D8cCwKcIUUk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcohPAACgkQFA3kzBSg
KbaeVw/+KNNRhWZJVrKACM8rSEWRv1g1Go7MDZQsxQqoesZ965mAVtNdMK+cuXWK
yLKhfhqnBhAul5n5gv0cCa140GvIzliHHnXl4iLG1Pzrr8dmUi1Xe5n/E1gdMJxI
df8+3y9tQ7p+MqMnRPU/ZY+lig7eMnUqq2rH8AQT1LQBIzTnLw8+31g/tQe2SCQa
UMMTz9+EP484yWLZNN8k9ET1wNWBGFtNI6ezMPGzXFFSOX6Jx4e2yZx80j91kEmt
62rreWKK2rc6TPSDjM+2StQlJTsJzcO19wr4Mhy8lLHIKSqLnQ3wOjRhs9FQ/hNO
H6/nBmvcAF2B1GDCaY8EZZU1/oMyRDDkxL4BxUg0RWUqABGuc5pQ0zSpTRsm2lih
z0R+KPe8NU2hT0GE9euLvkyhLJkVRCv4u7p32L4R396IHJUXTz8fomnMZDVHpltI
YlDLZw4pa/VqTgGsDt9uPDwWglBwmfaaM7HAT8F3jkwdqGOocAB8RXhHp8Osy5/Q
/vH9ZajgRB0T3iyoYGgcIcyCz9cCLyVHBxctRr6KExGsIxSnS/ff8pKFxp0GYKak
d+bnNoZeP4HQ40vmGFl5wX4Q5852KjG3/2dl4DzXyZFhCvMt3DM2HiJ002f5eY3S
/orkOHNH5XukOxZe86hmgGuz4+NuRO/wGXX2kvELwaifW07+fV8=
=6Neo
-----END PGP SIGNATURE-----

--pmk3/D8cCwKcIUUk--

