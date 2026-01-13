Return-Path: <linux-renesas-soc+bounces-26656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53961D17952
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 10:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7E7A30413DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA39389E18;
	Tue, 13 Jan 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MHW/d/2M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00351389DF4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295784; cv=none; b=AtIbWUE8b0eL6EfMuag9CKULHkjN8gSRxg7P+5/tuQFFIrTY9tH+jSGJC68DgQ7+DebBL/eJwiuxOETYA2lxs8GaLziz2/rwmaF8BwFMZKj7mnh59ariwU6bPqK5Q71UAknxq9mkz5NER3SMNAzO0P78C1DE+pXUGxzIeKpLhLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295784; c=relaxed/simple;
	bh=iYchLemvFrwaJEfP7NsLc4nNbLrNPJicHpngYb3v4VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrr99Oc8Z9YfMULpkS9nzmnD5nP1cQ9Kvk8BH/DuZ4uDo9uJ/E+lnZaVhrcfS+vxehI4eWxXphKgA8onmrO1E1HaHwF7mYyndcG4yZFs+BYnH8u+LzGUYBWBxBPssoZbsGtmnmFXWvAkf2J7kWVFniqLsIY44YJvPn3PKAB6vzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MHW/d/2M; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x3+7
	vZX2TEFHbN3RkNquEj0eGc3Xte60jVRUSoMB6x8=; b=MHW/d/2Me77EpcfdLBhY
	/k4GtGTyLWN2ik+b3VNJKj8qcw1VLyuqXdehzJcNTJXMZSnNFHXF0sKaLjYvWiL6
	yxZf5qTy1xd5g1tgnMaO7NRS8/hhc9wHK/6u1RVVi1DbOKDkuymKyxX7KPUyhy2A
	5bF1xXn4uzoRM+LyUIhB79P6zgqBg24aRKLSFEgu9w4NskgQTsLHgDSXQO16A6R6
	srVY+kYsX8x5398aQ91bopnQ+fNJUxyD+I3L8N/G07WGRvWGKMe6NckeOF7RKXqM
	g4xC66RvtA8CDP2eUXJ4yPYvIJrbDTIRNZdBRqcvWaOVX87QOerboWpqYdk9OqlC
	NA==
Received: (qmail 1617120 invoked from network); 13 Jan 2026 10:16:05 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 10:16:05 +0100
X-UD-Smtp-Session: l3s3148p1@tUD1cEFIpJQujnvx
Date: Tue, 13 Jan 2026 10:16:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH dt-schema] schemas: cache: Add missing clocks
Message-ID: <aWYNVHuccULw9dNB@ninjato>
References: <20260113075243.1192477-1-geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="960RuQkyescd2PwV"
Content-Disposition: inline
In-Reply-To: <20260113075243.1192477-1-geert+renesas@glider.be>


--960RuQkyescd2PwV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 08:52:43AM +0100, Geert Uytterhoeven wrote:
> When a cache controller is part of a Clock Domain, it needs to specify
> both clocks and power-domains.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This fixes Linux "make dtbs_check":
>=20
>     arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: cache-controller-0 (ca=
che): Unevaluated properties are not allowed ('clocks' was unexpected)
> 	    from schema $id: http://devicetree.org/schemas/cache.yaml

In more places than only the above...

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--960RuQkyescd2PwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmDVEACgkQFA3kzBSg
KbZRsg/9GjP2NMxSKMe878otqlVuvaYNs7lnSIb56zmbEjsSmtcZYPZuUMKdWy/K
xn5M8l5edpzmJPbE/xWE0K18OM5TgglUpIQh+pKZgbDFsUgQ8F8KhbmLIaZV+fiu
IQ39uBk7fbPFIDx2BswegPazP1itoMfNBzt642DDHrnvwx/e3rSbK9Ouf6dk20UC
ufsYReZuHU9DUQ+HA15lzdGBVt0g6Imfb+VG0e4b3WwlTwUHmBcdtnHSUUrVXr2B
I4fHxCPO2dkQYoSC6JVvFppGsngylgDAIEFxd4zUWbUIWqYO+wYNLps8dPA5jHdc
2xG3Kv74i6KJ+RuRk4X8JYn4V5WGN0w8HpG8kHtyfD5Icg90I2370NQuTvDQfstz
ll1VptH6G/IhhpM5rnDJE9u0RhLRCTL5eqTVT0en0it8TiwfnLusT2W7fFSfWZ1A
mKU/IZYTwS+14U/Rcexl+FVrhUgt6WPcN2M4vhRahcWI0lM+plvcpHCWEWM92DMC
V8dhP4vA1tDvvsGdvNAx186RWcF3FdeDb5gqdIYaOiYWjwRRJ5aAzBaNe0uOy6iV
P9/rEnqPwRI+eRemJbPutUfbwrCXLQh1ICWUOI0z//geR4BQ08AsCMC/UQ/9uh6V
HUB3rHjZKp2efu3BCrU2e6Mov7pSPOOKhjUcHXasDil4iL7FZPY=
=vTeN
-----END PGP SIGNATURE-----

--960RuQkyescd2PwV--

