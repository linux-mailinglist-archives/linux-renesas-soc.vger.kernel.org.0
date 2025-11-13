Return-Path: <linux-renesas-soc+bounces-24603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9458C5A0DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 22:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E8E34E5913
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AED2F6186;
	Thu, 13 Nov 2025 21:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lzKHAIFX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A84E2C0271
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067991; cv=none; b=aIJ+W/9whp8E4//ENKFJ4722Huwig9QI7px2QCsczGEOcnELO6AF6bZMTE+IqCV5/10kmMXMiqOs5HtHDCDKkn699rX+ALSXMy8j5Jkv+j/GJ2d3gkI3lz5tv5bGL8YL94bTzVeNFa05z7gd++hDI/XG+2Kim96uj5Q+KErKtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067991; c=relaxed/simple;
	bh=LA+AYTXaboBCeXMUYA/8qK0lyROmo8+g8ciMxm21qzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+6Ax2xfGjCZ0eVOejdpsy0kK8MVQ8Z5oeBvzaZsLDWML3fu4OBxsc7vUH2x1VwkHWRGZALj+R14Hme3kbOGYiN6xrWKlh3sLNJo6ucLFCkDU+41P4tTSlUmT44AFnxlEDcutEW9yNmeczR3tXyyFd+A8PC7tCZPY29PxcC7Zac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lzKHAIFX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LA+A
	YTXaboBCeXMUYA/8qK0lyROmo8+g8ciMxm21qzc=; b=lzKHAIFXiIk7HVzpqlKU
	hhh1foOJbWe8vglAYPpVHgZHUBh1z7bB8J3A/9n4WxGYaQhIcAnkqNpvnT9N/e5x
	t+b+s4bmt0cQFs5+kg95Rj6v45WK/TT7B7Qf2ijBNt1mUaAOLCJdKMCegoX758k6
	IiD+hrxrQ+67mnVA1UUzTlaU8lGv0CiVEzgpmQe6/7JOAAIOLGONarawkcGXDZCG
	TgTHSOeRYZxOzLmJ76H8J9dYhpDYpKbVoNTXXIE4Fo40XzLNX3LVH2p23JjJOePE
	4Nl3fJbwugpSI3wAa3Xa2xTNIcb8reuSxa4T09lVf7imC3tBg8DXrYONDGp+efTl
	bg==
Received: (qmail 2050776 invoked from network); 13 Nov 2025 22:06:17 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2025 22:06:17 +0100
X-UD-Smtp-Session: l3s3148p1@OQaAQIBD7N8ujnv+
Date: Thu, 13 Nov 2025 22:06:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Deassert the reset signal on probe
Message-ID: <aRZISINTsymbabe4@ninjato>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/IIM76zHQOhlItqo"
Content-Disposition: inline
In-Reply-To: <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>


--/IIM76zHQOhlItqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 07:25:23AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Deassert the reset signal of the SDHI controller during probe to avoid
> relying on the previous bootloaders. Without deasserting the reset signal,
> the SDHI controller will not function.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/IIM76zHQOhlItqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkWSEMACgkQFA3kzBSg
KbZbQQ//c5MsW9GD+ptuf/ibkl9YUTt2FTCAGtP/YvXEWDloKs1HPuKazbjTYawg
k2DL8ZHya1kv3pqFs6D+aDDI9PlwJtU0RQ0EsLVI7fWJaLtWHAEps8o4rZ9itezT
ciWRVjLxVEFEOH4bMxIjAkFBMstXmTSrjl483gPkSyE4UphgBCxQDSc6IYaOn4w7
AGV6ybUt2Ct/wooluu1TTGYd8YJ3kZOY7KRF6PtlyLVjvDBPcTX/4/KgwaVvY2nZ
2huJmy3blr8p7uKVepq7pTxGj5EiuoGpeW/1jZpBXmKPAp3f5QZsFstGLL0xYYhk
0jdkjWq6j/HRCnOyay0J1/woYFfCu/ykqx5ctUlYczEhptLiYNrNQtjU4VzeoDYN
Caze8vqjAvVNFCvoXecsCz46ZiFOzHpiJ1gfs4OWAy+M7TVsBJaVgSE0dpHlUu/i
/yicbl66XWxsAnBQAf1EfluyfW5aizzof5Ygu8Zo6z3/8f/iPesIpZq19DonYIxO
cadTwPbtyEgQuGtM0e/8ri1byV2Ld7uVfxIT1NZnp5mWnLKA1BNcET5UV6tNaQzt
7xWkVFMnpElSYaUhyoM0xO04DAjEcsHuQlIBSARKxSihAcRYpWqK46TjFaL0zcMv
fx3Zb7yjl7060kuTLc01jeDJCZ22rPfzvkmcPumxaUCoD2KuTIY=
=iv7E
-----END PGP SIGNATURE-----

--/IIM76zHQOhlItqo--

