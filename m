Return-Path: <linux-renesas-soc+bounces-23487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31524C00AD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 655AA4E756F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138E430ACEC;
	Thu, 23 Oct 2025 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tn+wXoL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985130B53A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218338; cv=none; b=i+uIN6oF4oTCaeyTXAZgxD/UD/rMvGs6m1W0hs5BwkMUo7Jyj9QnE5FEXy4ir/ZrNmTyA1nJEq1RjsT1AEu+GZPKndT9yZihREX/GNTwfZOgERj7YZnRU/b/eF3Z9qbQU2mhtoxFP7tkjHhLtpCAGYvFyxCpXBBNN1G/SkffwI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218338; c=relaxed/simple;
	bh=c2Z0ZAfHOTIX/VnV8rwDoyuTKbIGnlTQvCu+31TN4jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMpsRmhZwsSJZYxbGDmFofuRGyMGRirbDSZoXoDpMh5KL+aJiXCwBkuxMSXekYq6O0uzjwf49cPff8alGuaqjNDDUw5Iqf/X+0fXpHisxdv6nXsSC61TH9Wb+12autFbGSzaP8IgzOgm94KY5LJfnxd3as6cwLsPCMIRMXUdqlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tn+wXoL6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=c2Z0
	ZAfHOTIX/VnV8rwDoyuTKbIGnlTQvCu+31TN4jw=; b=Tn+wXoL6aRkQMSYpVLua
	PI5yY8vZ3roZGa2Kw5R8pm0G/NG1B0IdZC96Chl7p446AeeL82PgAFGNHmIbWsDq
	TD7cTTtpKh493L61d8lDzV39HNZwQh8AAZ3Dw8Pqc34MUWs2Ugq3nW9tQjv+fosi
	Ta8llDWsMnRdCgJSNZ3HvC7F9Ot79GiPc8ZxzRhmnZlVOZiQ+Ht8WFOjfRjk3d7Z
	JaF4BCxRBSS4wYyDooPxScrNCZRicdyaamedK9EYrvZ996CzKiYpRZof+BiSP2f6
	3zYcmlXiupDMpGJxFTJIxs3dItaJ/RBFsapgD8OLsCIIUvWjW/6VZzSvnARswcFe
	+w==
Received: (qmail 2182918 invoked from network); 23 Oct 2025 13:18:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2025 13:18:50 +0200
X-UD-Smtp-Session: l3s3148p1@oLrumNFBKQltKPAY
Date: Thu, 23 Oct 2025 13:18:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPoPGauSQCoaonl8@shikoro>
References: <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro>
 <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
 <aPIfF-3SgzW5V_gs@shikoro>
 <CAMRc=MfVPO292xmnXBWJzWuhNADA_u1yvpJ4kkK8TgZyQgaP+A@mail.gmail.com>
 <aPInv9NELU7N9QDn@shikoro>
 <CAMRc=MdWS2OSeJAkTRnAFMtXcVukwQ=JAWwJ3OHxogmgZnan6g@mail.gmail.com>
 <5c9761d5a6a14d4c250df6cc4201bca72d963133.camel@pengutronix.de>
 <aPnz6U-fcodRoobU@shikoro>
 <CAMRc=MejA6DsnOW3hS+aFtecXn38UypJU2TUrAWPoo9Ly341uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cgsYnhUh+Js5TNzp"
Content-Disposition: inline
In-Reply-To: <CAMRc=MejA6DsnOW3hS+aFtecXn38UypJU2TUrAWPoo9Ly341uw@mail.gmail.com>


--cgsYnhUh+Js5TNzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I see. That kind of spoils my assumption that it is a fallback supported
> > by the core. Darn, I would still like to have it, but it seems more
> > complicated than I have time for it :(
> >
>=20
> As soon as my two other reset series land in next, I will finish my
> work on converting the reset core to fwnode which should help.

Cool! Then you bring back my argument, that it should be always compiled
in because it is a core feature ;)


--cgsYnhUh+Js5TNzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj6DxUACgkQFA3kzBSg
KbaHeQ/+MdvUnPLHM1qIlXU0X2n93eV3DFZ+c/jh6eNu8/4O/FtjF3sV3pOXDkKL
ZkbycBv9jHaKmmUFv9cGd6cEIoxnyb9cQZs9/CD0IvTORqwqWtMPS6pMf3/mqYgt
9tKvt4qqbVsoUosLt/2OdWymNk99TQ9M9hZ2BjKZ0ER7aCwXJAVA0DmMX2XkgBcp
q1sIPfxtFaw+FxoJYhHxE7XllfPmBmnh6gsrV+ZhaPhGxuwB6QVukdOgURB5AB2j
icDtwhRIbGo2mudv2F5JIfeKVLGA5dTKOVrKXjwRnJYoTqzwedpm1FQ76v/3J01X
RxLsX0EVoJCZX1x9jg79tRbTx0qPDPk87R3DHAFRdl6r39kwY/wb0kwVmOPTQlnu
U58BJ77X7I/owXUnUKa4dSu0uTyDvs36MX5riw1FwrAXKDUKtRhz1N0CwhbNrpOB
+EYpqZ8VtfyF4pBen3J5xYfMuD61Crp/dgYs3c06wIGq1zG2bbSiJUGOy95diFMX
uZGDYbVgbVjOcj/XnAnV7ptGv/uP7IFc4OBjBDitYmnNnZM5Xoqel7BGm5mQ9brp
0fc8w6DSVfMMfTow10RA1yHiijynKChqB8iKk5ryygBX6Ckv8nvbW2bAdbLABnZz
BI0SYHRWZauj/uVGy5KNONVIaMW00MRkIMXxIFg2FMKQwzjNho0=
=OvuC
-----END PGP SIGNATURE-----

--cgsYnhUh+Js5TNzp--

