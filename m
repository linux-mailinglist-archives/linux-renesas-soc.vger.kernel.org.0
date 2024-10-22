Return-Path: <linux-renesas-soc+bounces-9966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59429A9C8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 10:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3BCC1C23B7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 08:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234F016F85E;
	Tue, 22 Oct 2024 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1j4v1zMl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8MCYbWCx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0E1487F6;
	Tue, 22 Oct 2024 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585764; cv=none; b=dD9K1jUKBMa5TdsiIfVDSEoDpInTmYqnfc9LDy1u8PYQLL6exRumgmCxzq21Ybo1NaFM6ocWqunZiEsb++qs72RYhFI1hmpOz9XFplOttOBFfTI6rHhkZV4e1SwlnKdzOwhy5iFD0GE4jPJtBqK8ew8FBEX3Pb0pDBBEwyYPX+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585764; c=relaxed/simple;
	bh=HFosTYhyKr+C+KLkXWCYor4oOAgCwvU/aasxydfeY9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LtLHt2rELx6ZxnIVo0nUy08R+4+xD11Iu858xXD0X4FIwioM8EiVuw85eF5nb4qZHI1wZpFUvthWvVq6Jd5RcgbiOvgdJwAhFY0sEFykS2oV+gICdyFKdh9QZaM9XwLR/8SvNNjDzw+lJBZ+2ZjG6g099I6/Xn2Jg9qQxM5QrtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1j4v1zMl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8MCYbWCx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729585758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FUaoNmgtEABq6PFpi80zajqfsG/YF1uho79gaK6YFOE=;
	b=1j4v1zMluN5LxCrABzknAZ3WGgIW/x1m3aAL97biAdN48M/0sabhTnAZXCjt3IpxkOhzOZ
	4lRU9tWP2x27tLz5YfAfx2njUEcwbnASQc9wylOKqRV8GT0E+4KiSEkNXukU7NXhfnMG11
	gQs4Zmm9zM7vZtUxJmlPl5C7W3mydpBz9+wQt2G7rFs/1gEcSykHdfGCSyH99swiO317mK
	TnEAgJLC6wv823Ol9aNMx+oYF80sHWNAgIZWBZrXjatZMRRfgwb9qSreXTCOdb289NVBVm
	6seMvF5dADRFOUPvr1gALXcjE8vjQbzK1pJ8qNJtbxyRso5PdzvbG6aM9SZQMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729585758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FUaoNmgtEABq6PFpi80zajqfsG/YF1uho79gaK6YFOE=;
	b=8MCYbWCxL1cLd2QpHH58FCEptlpHqIc4p8X11Ooh2WgYVaigyykOxThbxJ8trr1jwf0nNq
	+6sbJGkBhWTVoECA==
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, "maintainer:MICROCHIP KSZ SERIES ETHERNET
 SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, =?utf-8?Q?Cl=C3=A9ment_L?=
 =?utf-8?Q?=C3=A9ger?=
 <clement.leger@bootlin.com>, George McCollister
 <george.mccollister@gmail.com>, Simon Horman <horms@kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:RENESAS RZ/N1 A5PSW SWITCH
 DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: use ethtool string helpers
In-Reply-To: <20241021235535.603253-1-rosenp@gmail.com>
References: <20241021235535.603253-1-rosenp@gmail.com>
Date: Tue, 22 Oct 2024 10:29:16 +0200
Message-ID: <87bjzcmtgj.fsf@kurt.kurt.home>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon Oct 21 2024, Rosen Penev wrote:
> These are the preferred way to copy ethtool strings.
>
> Avoids incrementing pointers all over the place.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

[...]

> diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hir=
schmann/hellcreek.c
> index d798f17cf7ea..283ec5a6e23c 100644
> --- a/drivers/net/dsa/hirschmann/hellcreek.c
> +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> @@ -294,12 +294,8 @@ static void hellcreek_get_strings(struct dsa_switch =
*ds, int port,
>  {
>  	int i;
>=20=20
> -	for (i =3D 0; i < ARRAY_SIZE(hellcreek_counter); ++i) {
> -		const struct hellcreek_counter *counter =3D &hellcreek_counter[i];
> -
> -		strscpy(data + i * ETH_GSTRING_LEN,
> -			counter->name, ETH_GSTRING_LEN);
> -	}
> +	for (i =3D 0; i < ARRAY_SIZE(hellcreek_counter); ++i)
> +		ethtool_puts(&data, hellcreek_counter[i].name);
>  }

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de> # hellcreek

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmcXYlwTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzghZPD/94PqWHwk/0A8LkS9wnc6YHwk7itehK
omHBEh+6eyV66ftKXbI3rdf2t/KZBPicy9mQynZNh1tMMwWKJBgM4q7abIlCm6vk
M3fdYHYoPz2OLq7j2T+Ca0jFYDrILPDivDUYKpPBK7iTd+8bx/83yUoS+vYOumZf
Q6JyvpAvHPnDfI9cKfT2Y7C0ksU/+seSBmq+zg6lxJ9m8uO+OvJzsyrmRjHEO0Dh
644kSWN1MuovY7goQBvMkoW0WnfOunXMsLD8qzPz2EakmCkQMAAwxN4I+tFoL62D
3FGq4bmCBINav0MGUAFK8hEW+dmhWhzRQmGEYr9fEyhYunVDfNJY/hC/owDnjvx6
nQahMIapVpTturT4huLYcWdeT0HgP9hqOv/PFva0Ir/auQziTSVxEqp9GbG++yh0
3LWQJAeUQwZYPHDiApicAI13RJIc876AvICBGhCNZeHC0U4iLokHpQTV+mBiU/32
MX7x3p8Gxs8i+G3NQEOgx04gUmNbh2bLh3rJhFc3PJIg4nlzh0kYPk3UKbqQDJp4
3b5biLD6aQPPMDyOsAK/BoXoN3Rs/8+lsSra6knn1OBXtJWvVw0NKbAiZFQXY8aS
J4F9rJtZ0M9bk2xktt0/P9nvjbeHcY4fxXjerO+OLQdKvax8g8o1JKdVy7BJBAPp
sXzABhmEtcUdFg==
=biYy
-----END PGP SIGNATURE-----
--=-=-=--

