Return-Path: <linux-renesas-soc+bounces-12771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1FA23951
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 06:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229F21889698
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 05:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6059126BFA;
	Fri, 31 Jan 2025 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N3M4EZ4b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BC54648
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Jan 2025 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738301892; cv=none; b=czLB2oMq/UZ58WiiYyqx2xM9RzxXlHrB1px/ymzAdq9/00lcpgmEDeHxvbXkK5sWJbySwvIz2sOPgeyqPdDiWpsxwjHjRlJS4NcMv37GiS05lvVJRQdMqPi14LXyfe/FZlVpBphIFdf00ap29GGY3MihKxKqMVAOBRF/+q+A960=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738301892; c=relaxed/simple;
	bh=UFz1lPrP4CgzCAaWRHfNouU2QqM00Y9KK6pIZe54VAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCKfeNr0JUPgVHqV7afPO/QmcqTuqDwyiVNfRQmaONLftWKIDlXf8663ZK1s0lv8EwUqpV4cHTsjcWgoqw2BAb9VH1yhDNHTwxRA7+EU08evXCLxhVCixTO9qPpms6sOtF92Ak0Gb2wiRi5WRPMCTRoPzC7Y1P8XvwyHH96Oyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N3M4EZ4b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hAZS
	kX0OCiFwejDrTyWsxluBH8eDnp/D8IWUbOr1SgY=; b=N3M4EZ4bYrwsw/wP6Twf
	nANgO2YrIZr4H9E4owuE3UlnIYDhi7BW9yaAU9AZnnDHfK3f4gyBJ5QNEYEtXQm9
	JQZ0g2HKwa83agx7iASmYnK/evDdSmeLpQ+1LBAyT70ntJi2PwefY7s6Cgjpk1x3
	kr+94KVIogU2OskBPI87asni+7PeClNOuwOtfSHY+Im5xWTlKYNTGPrF0Pxp3tY3
	kfR1s+UpnbUN7a6gZuVPA3rBNttdDWecKDzFn4ajKHU19ofW+uHyQ/GQBoR4IaU/
	BOy5F8n83LibwLfus84EiyG6lA1F7vDUBM7Pw5Yzu+ED1wPG/2lezM/oZjw8o3Rq
	Fg==
Received: (qmail 1537543 invoked from network); 31 Jan 2025 06:38:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 06:38:05 +0100
X-UD-Smtp-Session: l3s3148p1@C55l8vksrLHUph5e
Date: Fri, 31 Jan 2025 06:38:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <Z5xhvfG4GDStIYYH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>
 <Z5s-e0JwnO7o5hj0@shikoro>
 <557697b2-caf0-4d60-8c42-2bcdb69919ce@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HsyF5Ni12jAUB67n"
Content-Disposition: inline
In-Reply-To: <557697b2-caf0-4d60-8c42-2bcdb69919ce@roeck-us.net>


--HsyF5Ni12jAUB67n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> You dropped
>=20
> 	if (IS_ERR(client->debugfs))
> 		client->debugfs =3D NULL;

I have no idea how that got lost :( Darn, will fix!


--HsyF5Ni12jAUB67n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmecYbkACgkQFA3kzBSg
KbaWZxAAlCI3dn5ynEE66rwAYY8OBRvKByoNwI6Hb1v3vtxADPH9+/xfS69bnvVP
V2zD4xZUagzfyq3QLkoNl4yftH5mucR0Bccp8qT6kGdhmMvIeR9Ff4qefNV9RouN
wONfxPIFrQfKHS8KMiGIAX/2nbjE8f43d/aPDhVewS6xiirlQwusE/EtuEOfxlfG
rkHDU1QfYzcO+WpWX5cKbCMbddv5FTxR++ZtXv+lCzO3YQsuwG3QLjs8DdpO4wrp
La14rl2r/BgJ6/ysEwF0I7HFTFYFkK2KxywXGUJM9uGozae7ACuJ6sUTWvzrgi2g
wHlbxjzNLq1b8HqwRDjOO6GPjzbZpdm6VMd/GT9G5kiDhIJQQw14U2SlyB4eGaos
XRr0cVBlSHndiA8m15Ld/+0QNHu17hBqv6e02Pnmstcf6BQ+3pnNKPLlfmh07hwa
mrqbU7ZixrRioWKBzqfmKNSjCcpHXuuagf4smgrHErqSOTqKnnw96OnZTMR7OIVQ
TsqR0TZwFbvMRJakxu/KxdOqwgVVGMgTFva3uJ12RuDLJ6cDJZZuW8sDmdWVOjlo
yPJHB9+euY24cccx8UQWKl2oyljBDO3Q1b0F59gxfmO0t/MT2DB9/IkKZ6/Ob2bW
4wccdc5NFgWWnZBsNRL6sk1/j0f8hDZpVLavBHaKcnPIr+tKtTk=
=QZiT
-----END PGP SIGNATURE-----

--HsyF5Ni12jAUB67n--

