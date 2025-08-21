Return-Path: <linux-renesas-soc+bounces-20860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A372B2F44C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 11:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83CA5163FBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D0F35975;
	Thu, 21 Aug 2025 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G4X/M0Q6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F62D9ED8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769318; cv=none; b=WZpqi61xs15ci9YphAD7kFDMTgYePR8wkL0pidjMpL6iAPHRkS3006CdpXVti4NSTKDqlQPQmvWk6e/8OP/wn5SnjvVRx1gd6XX0DsK5v3JkP/+BgWoJb/uV5dOVGiG7OYf75KL8b48fhZGlx5+1pCJJ/ZjTBEOP6xcAAK9nd4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769318; c=relaxed/simple;
	bh=IhW7HmV9mJhOlMqoyBCHHKJIqpojwruMT800LcEvyg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3K0im7ZjgtWNQxs5EZUcfKdmg2xwooKobwOow9EqX6aNSUXKlvLZTwgbItNUFkl5ZURG+o6h5WE/7x+0fhuCJOJ490jNws2ve8Kfzfq79BgI08JffKpxvd9t7CnU5T/CoBbQJBvAf7345+Us5J94fvgkunuZ0HPgyGbKH4inys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G4X/M0Q6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IhW7
	HmV9mJhOlMqoyBCHHKJIqpojwruMT800LcEvyg8=; b=G4X/M0Q6VPA58c5LI1Td
	FCyoO0u1unB16IKjVrqS/E/phvGEWASRjZ8Rejae9DcwUOMiD8R3Wjz09yhbuIHm
	//pw0zGhzndYtlyyk+MHHsaeqcurQpLBaVyvw+JFayEWuiJYrt0B3jKOcAQYwFAZ
	m4anpQxnpSq1B/3nXcf+2p8sYImBMwBkPcB5sYoYJBPIsgPXU8ooJSzGzFmbS9bL
	E/18zZsr9U3cXlEyBcw5ivgQuH8FyczYgirXJ35jrJzhpAYsD6yQn8jmJjvOrg9Z
	YRVQultrahG5pMDDb/byrFmYeLsQAr7ZTAZEv0EUgCtmTcFlRBQhtvOtOuQVjq1J
	MA==
Received: (qmail 3461051 invoked from network); 21 Aug 2025 11:41:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Aug 2025 11:41:51 +0200
X-UD-Smtp-Session: l3s3148p1@gM8Y5tw8ZJ7Utcd1
Date: Thu, 21 Aug 2025 11:41:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Message-ID: <aKbp2x8MaBelS4Wc@shikoro>
References: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T7+8/5yuBWif68E+"
Content-Disposition: inline
In-Reply-To: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>


--T7+8/5yuBWif68E+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Note:
> For HS400, the division ratio is 0. I don't have a board with HS400 mode
> to verify the fix.

I can only test remote this week. I tried this on a HS400 enabled board.

cat /sys/kernel/debug/mmc0/ios

and

cat /sys/kernel/debug/clk/clk_summary | grep sd

both report clocks of 200MHz with HS400 enabled.

Seems good to me?


--T7+8/5yuBWif68E+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmim6dgACgkQFA3kzBSg
KbYjDxAAsy5FJghTjgRxhD6ItrAkNZT1b4QFk/3wvyoHjycB3nlhyTyOJJ/lhoUJ
htoAvxCZAQmyq7kn0PHg1SPzoNfXnwMADyNt4WjYEHOaeMs2JHog/SqjJSOTfvyv
LG7X3SIXexJhi9hjRGnyhTaZxsGOzKMzhDpD9iYJxW47QNWVXzGFb++N8O/Qbfi8
CXkCL3/2m294lNSCM/026vxZTMZXZZT8mLRwVC9em+Qil1zvooA5jz4Npks9Re6A
WWmOt99StmZ0r7JAxcOANbfemxmYEaeLHe8kEbwElYW4sZd6+5b342ZFbQt5+yT5
60H7yroY5sjk+uFTNCR2YBDiTKOzwGIAMy2h+zElKM8ktUJydWWI+fF/2+Ld98zB
OqPvspIlYDeagom/wkVqKO5Egh+mp0RezpnQFBaiLr8cqlSb676dmFuvYva4qSlJ
34rLC3fwkPfBS2HMw4ccvBteqfANyFoK39CT5EExuLj82G5isvGokT3KPyWuSgzz
Yf0t5m83deLwC1KiOuaEjK+qKtqjOc6dNdDWyOG0gRHpKe7dXwIrN4uzekQ34DWR
0N8Wl/gRvsnvTYPhLTtNK6CKePTLlHX5xP0/PQ7fOJ4tTpsSuxG/BhmmaMQO96/9
EgKNtuBtU8wvXopppIBTgB2vffLAOf1eySRwKZJB2CNCxUSCEb8=
=1OwC
-----END PGP SIGNATURE-----

--T7+8/5yuBWif68E+--

