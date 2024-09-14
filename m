Return-Path: <linux-renesas-soc+bounces-8963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A4979317
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED851C21093
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 19:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A8A199BC;
	Sat, 14 Sep 2024 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RZw5RP3z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1DBA49
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 19:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726340604; cv=none; b=rPlqUN3Tye5FrnwEYxVcjS5cXwVofjW2nj7g06TkZdDfmvygVUi4uoC4ZdfJ/urvX+rBuXffsnPxMkeu6k24Zp2jMXniWZkinoFqmyrcxUssOfo+y44I8QghpTJ0gTZiRKdFt/F0sGpSUval1QFVpJIAKo4sCLh88pWuMJtZPD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726340604; c=relaxed/simple;
	bh=M0ing7sm9ujZQXkplyNj4IalrUV4jfEOZT/huewW/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7/7pIEmRt1o5z4vLqL5PIZlKCYbxae8HPC+sN9P/CAtcLDC/93d2S/tTUqgt7CJyX/eJYxLQXT9gxMinHQPyg7INCDt/deGD7+qouC9jbZXtMCXEZwaqLdMxfIyrMFngB/XKGBkEAc1jw5p7bcFZsTkMQQ1f2mWCupHFS1uEtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RZw5RP3z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=M0in
	g7sm9ujZQXkplyNj4IalrUV4jfEOZT/huewW/iI=; b=RZw5RP3z5O+Z7Hh7/S9X
	cHutPLfjd4puGNtoxRGwLpmeuksKx4duCMZKINHqAAOvlIZZT63woXxwubDQ6lU+
	lA9THPfvxAfetU1fBhrsl1JRaFLHeyoOg7A4wI0hBBVNY4zHpgzMs8o075bts8KW
	b+23fFSUUZj0T/YwNd34IP2+alkWGebFCc2wujHBEpBRYfEEcuUw84jh+obvq5Wj
	6iPXTYLtT9vjQ6isgiQQwv7ZNcc5kMaWwFiLvizoKFT/+i2DcDKBkq3uUYy3UmRp
	GLoII2be1Vunzp5Y1bXIahcprWtb07wzsnYtaalgbU0f0CsH6DtuDeZ4HrbIpm5G
	5Q==
Received: (qmail 1538995 invoked from network); 14 Sep 2024 21:03:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Sep 2024 21:03:20 +0200
X-UD-Smtp-Session: l3s3148p1@jb48/hgiJIdQT+F6
Date: Sat, 14 Sep 2024 21:03:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: genmai: Fix partition size for QSPI
 NOR Flash
Message-ID: <ZuXd963lKqwqEmEo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240914182948.94031-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npS3hTjcRxfK8iHi"
Content-Disposition: inline
In-Reply-To: <20240914182948.94031-2-wsa+renesas@sang-engineering.com>


--npS3hTjcRxfK8iHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 08:28:44PM +0200, Wolfram Sang wrote:
> Second partition was too large, looks like two digits got mixed up.
> Fixes:

Hmm, maybe this "Fixes:" is ambiguous... perhaps we should leave it out.

>=20
> mtd: partition "user1" extends beyond the end of device "18000000.flash" =
-- size truncated to 0x4000000

--npS3hTjcRxfK8iHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbl3fMACgkQFA3kzBSg
KbY80BAAo9zsaw6nX6EFMkBzh3GyyPi1qeAoIekVRfSEEOTC9dkNS00rnjFCaFzC
oS/b9Kp17RSJTvS7wuzACok6V8R44B5on7fVxObvGmAcGuxT2ovcvhmm6z9IotXM
vJnkToJiTzhzcHUt6DyS7w/MwlN4jU/wc1hhAZbih1UYb6whWbXKgvdlINWeurm0
PgIJ8pDwipoqvz422T+CaHOXO1RDzz/yQFPOrzPjwHY8LAwP8+TrR+4+no+AX4+R
Ol0ISHh/YsL8WsQdUnnecAo/jA0vTHgUBxBdJNfUGjs8NR2Y70kljb8LLxuZe41+
s6CdT1aik2wKucZ8SSlR4xJ4FeAOnzmsNZtJ7BHsQe2a+11N7rfiST9+Lyb/FbYA
bO8e5FWz0Znqm/bwB4Sl7EB+w9zx5m0BQlgcQh0K8rhXsyL++3pWS8dakbPTJEH6
fDNyyNlMOVx0IBfi/75yI244+ZdY8ZaALSG7+6jzDRjLL9pAj/P7k5RKt5wQI3Bb
Hju8+iTP8eiKVib9ipEi7TWZRFm0q3SDZj//f8RdSBTdv/ZsNA20Y3+qLqoqhr6V
TcFlQtm7NuIZEPl42wVE3H9OO0C7cAzsTNqdezmU2hmKdOaQ7zZrdz40sLGbfk8z
IjYaK0amoP6bHHraVO+m6Td7OqrdcFPK2qCn+0sI2fsIceqEcIg=
=+AFc
-----END PGP SIGNATURE-----

--npS3hTjcRxfK8iHi--

