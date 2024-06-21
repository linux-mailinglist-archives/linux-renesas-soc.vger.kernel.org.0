Return-Path: <linux-renesas-soc+bounces-6591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD64911D34
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 09:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE982839DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 07:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BC916C69C;
	Fri, 21 Jun 2024 07:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I98jzGkb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C7B1411DF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718956033; cv=none; b=cMdIt9jvymEU7BPIf8uwmXc5Pbd26bxxygwbs6/fMSGGBeamd5iN3CLyiZ8SMmEsj2MEQPwmwRgHY0SsCjBan8duTMWHkxECGN6QF4RtiiyMcRjZH6WWdzEiU+0kGXVqsg1afVSS/B6sFFwSViLxi0rWFA4oslrsU8qb91XULzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718956033; c=relaxed/simple;
	bh=43wEsokmzAswtfHgmvxKtwd8yObBMAd5Mf0kZWIONHs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NitWkmH5mtdgQrn8sV/HzlsHU1MJfi6plVLoDGhXwpU4QhHatoLZSd32sYS9ymjAgOPAANeiDnN3Ua16ndI7h2YRcaHgHv3oQ7ciNetOqap2C8pYiXgAAQVD7eKKo31XYtnwe1UyqUakwiURUQHPtJcIKtqmWzz2D0sVnsSNgO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I98jzGkb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=43wE
	sokmzAswtfHgmvxKtwd8yObBMAd5Mf0kZWIONHs=; b=I98jzGkbJXmYD05JlwVr
	aLLRxqIqRdsM6R3INlSPqUyVLkryTc3ygMcm/+HPJlsY4dFdR017P7DQSNHJjlJy
	G915k60xUI0NF8TvXjR5XT1FsWqvcql4OWfRtyUrp2pmpKnIcN8Yz49Kq0qf13iV
	gsUComTPTrJlh6Zpf68oMGP2e7Zaxo19qsoMWBTqdRF73dbjG73BvPLQY8SxGfxi
	O1dYYlpeuhdveZOmXHoRUqxXumMf8ROgrgkKphAYOfmf5HyLMFkc+4ymYz+5Kcjo
	LqMCpRkMOHmtNK4o6U53keY5IeDnfddgJ2siiiBFaRx0kS2KjvkR/9B5v0cdHRRy
	sA==
Received: (qmail 1284233 invoked from network); 21 Jun 2024 09:47:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:47:09 +0200
X-UD-Smtp-Session: l3s3148p1@/jmDo2EbytMgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 09:47:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <7b4hwwnzvcjbgr3pqgvi7mx537kpprnmzkgu3qz27qggem2emg@ngac72ugnrjm>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
 <CA+V-a8v_r5efeR3U+J0MK7cKxPR7a6s0z4fws0iHO1-uezAuTA@mail.gmail.com>
 <riweh6pybbbadjfgenwrdclquurzsvoxudq63v63ip372qpkca@frk4gtnxt3bt>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozrb4oab2oirsgzp"
Content-Disposition: inline
In-Reply-To: <riweh6pybbbadjfgenwrdclquurzsvoxudq63v63ip372qpkca@frk4gtnxt3bt>


--ozrb4oab2oirsgzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> That would mean we have a compatible-entry per SDHI instance per SoC?
> Did I get this right? I think that will be too many compatibles.
>=20
> What is the drawback of using an "internal-regulator" property within
> the SDHI node?

Ah, I found the other thread now. Will have a look.


--ozrb4oab2oirsgzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1L/0ACgkQFA3kzBSg
KbaYTw/+JviggwM78QUwekzMP4NcWImIBkdDw8dlviDv/pYqpETaIDxhhUMK3gHi
Bh4x4tEwsrRYjLiLHnj1a5R/GoGg/FsymvBO6z4QMrQ7G0gomH1B4IVUX0AxLQy7
+7sF74F7sOm4z6rVzAb3fzgO8SH4lZILFKp8ghiv7kfmpAeEGpWbIQNe0l7/p8lD
i1w5Vd3KyLbfwSrlGpxrDwYpYQ0I4W6mUZTjc2moWtVh4xvLF7l6IZHj03pZj4fq
yf3p8WJ0Z3MpS35jDw+azrL6eLlpScr5iNwwCz7De66IS+C0XY1bBXAKUvKHJaAo
z3272kds3o2pxllQArQ+0i9N3Ak5S2yXuHYj7ueBmZwRG52wN2ef7XJ4J/akR8qR
8GUiW0zxt3zwWmG8ETKTZ5aQXxtEwaaIg8NZ2LHqG6BED813Qco4P5URfR6coOHV
v9hhN3/Qm/BfcXqKuczoKB/SH09HTeuvUFubhjZ9NuFEKhfY4SM1J19bmRgaaQUr
ConeZoBnQfRza2AfyeuqYeVjYW/qBzIY635xH/Y/mKdxKrLwjQr4KvTyDG3iU/T0
pT1/en6laXZEP+5uJY5AqJIIZE+2l4w/6n5nOcdCxmi2noZcJT1zGlPlRuqi2rl3
JtGsBCfefRjXj70NyoN2w2Vjo1iuL9WtP4WD6B6mc9Jz5ZPenXA=
=08h7
-----END PGP SIGNATURE-----

--ozrb4oab2oirsgzp--

