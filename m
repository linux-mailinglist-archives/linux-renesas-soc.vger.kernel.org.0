Return-Path: <linux-renesas-soc+bounces-14626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF0A68C54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 13:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C371896CEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Mar 2025 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F61D2517BA;
	Wed, 19 Mar 2025 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GsXaKg8t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B411E1DF4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Mar 2025 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742385854; cv=none; b=UMSG7kynPFqkbRgrPpx6HoIGq8yfX63j+Ryjovb2pqK+j4VjqHJt8gmXN2Sh6fdt/CukwZVjHxj2tmNHQXkQf74WTOhXD7pTchuozRnFfma9ITmifyy+bFJJHlTiFMC/k6wQmkdOubzAQU4F2gUcbSFctk8+aOGaz5PaEVUbPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742385854; c=relaxed/simple;
	bh=T/OuLEKvLqNdEjyLg3AgAUpe00UsE32US3GO9CareeQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FK5/k1b9eWiaU4ZsmnAKJByNi8YCGEnPzSNrAhZ1g7quace2xoUvwZMK+YmoDmKgjWLK0VEiQqJqGaXzLCUo8/aEtTO1BaIvPmkjWYyZmQZ2PVJ0FtWraFlYNzGu+Y+i5RBwonQcQC1OcI4zl+2aSDRM80pnMu4u0Auq4d2INwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GsXaKg8t; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=T/Ou
	LEKvLqNdEjyLg3AgAUpe00UsE32US3GO9CareeQ=; b=GsXaKg8tfxcUDoldV2Vn
	gNbi4oljajHpBC+9z19iYAMnT3lv5G2snqOltUo124ynnDcTpsssaNEQYkV/eimR
	GOpNinYO2Mk/ynyXw58ox1EKAxhUdz1ZDgWpl6oOdsQNvCjQHN2tfGDc5ZWvJQPk
	PMMcRo9lOv+Sg8Uwnqeli8uxVucYsDm1YxehCpmjb70IkDcH3bXW6+3AGFMxtzGM
	6cm7VfDoAwAs2xrj0hD397RrX6BDh5f2BkIjOIiUGQKEkf0td876eDzUZONdP0oC
	4KEGBH1NEcsaPAXDAYBBjcDgGEEcXzUye43ztOMhMm/hpxMkMAmVzfSnxr1zt9SK
	DA==
Received: (qmail 105152 invoked from network); 19 Mar 2025 13:04:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 13:04:08 +0100
X-UD-Smtp-Session: l3s3148p1@ir+G0bAwHqEgAwDPXyTHAJp038nK7dx+
Date: Wed, 19 Mar 2025 13:04:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z9qyt5RRc9BEL5Ld@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <Z9R9IHyXK0TBcPZa@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J7BSDil7BmeaLmQl"
Content-Disposition: inline
In-Reply-To: <Z9R9IHyXK0TBcPZa@shikoro>


--J7BSDil7BmeaLmQl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Oh, cool! I will definitely test it next week. Thanks a lot!

The network architecture of this board is a mystery to me. Even before
your patch, I couldn't get network to work. Same with your patch
attached. I will try again next week with some help.


--J7BSDil7BmeaLmQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfasrcACgkQFA3kzBSg
KbYeRRAAoUe9YgnwjJKhqArUHleeU+RRbgY8BwTFRacUodh1lfmH7mvQUuxlQnFW
LrJx+flV0Po8DURrKROQC9xVS9hZHH/GZvEhWQxjepwprl4D5YAiBr34IlMXIFKZ
p7t7AjcQm5FcqPApazKgHqZmJHFXsLa/OytoYgtewpkGbxkDA2xB9H8zAlsQZ9yP
H0QfCIsyOGqrz4MkBfXUPax2gNp8BBj+sMdeWbizPNTzeF1lvHO3VTKTzxTRcJj1
4iEUXi3EpUEe8vo0SlJLQDpWHs0cFXst1tsbAp272JJO6YIZk53bCSJMPQ2Jintx
4gjwabFNiZ6Wn3wLkECAo/skhgmWEs5mXXfdnBA1zbKASV52UHgMCTYdzFy5MFIv
upoQj8fHmK0XgzXyicQhizWgR280XkRSBli+1fQRfoAIL7DDNyY7Rg/bCQTbDG32
DgJf4jl64bHdjy4K+lZc2tYePh8toN2RVQ5oVI/LtVh0feQtGi1yWIJveQfQU4P8
DvcgSiQfltoUR/7w8MuO6gek+WnfIn0jQP6RZcQPI5Bqdpz/xTrmrXJ6x+/RVCRj
jF4Qq6iALsb8Bo2Aj6EqxTxRjR5AaW46M/Lkyia8Mlabvw0CzxlqYKxKepOOyl5n
92N28ZzU4oGZ69kLmVMQZlCZurxYpoe3zzIcn80fv/DfI1ar31k=
=XPXH
-----END PGP SIGNATURE-----

--J7BSDil7BmeaLmQl--

