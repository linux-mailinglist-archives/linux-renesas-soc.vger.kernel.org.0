Return-Path: <linux-renesas-soc+bounces-20815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFDB2EEC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9AAD16B1C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 06:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B7E2E7BCB;
	Thu, 21 Aug 2025 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xi2HG+DU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52E2C21E8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759080; cv=none; b=htaJMR5lcF/YtOKAWKo38nz9F7xf9nVkVxbd9/gD8jVuQS59ExMKrw4kUSGtIYIHwfH2r2KfBCslj3pn+9syjuhcqP3rMF/EDXyNIZtNJvy8zR8pqtQ4N5cN9mzt4PoPOQLF3EoCYZtXuv2eG2/imVK659xUd8stIb5/73atAs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759080; c=relaxed/simple;
	bh=GfHgawS+yCqoXN1aSsOTJfn8eRUVQWMmUGj3iS9i514=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm4RgPCkfyZwYd7XSX6Pu9W1wI7s2LJBHDpx0M4/nU60sUCNddZzWJKdVlCSETHS23V92l1g52utSzl4DlZYDgNuo8UjI1uBQmEdbMIEdA+SesXfHgh+JTQ57SU/1Va6NCmJ9fXbEYY6PgHE3c2n5mNp9w6P5808Bqzox6V3mdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xi2HG+DU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GfHg
	awS+yCqoXN1aSsOTJfn8eRUVQWMmUGj3iS9i514=; b=Xi2HG+DUcgxjEZQUE/nY
	JEAesoXELinHjS54J7AN9vorMOOYvvYmqzss4aTBkSJjTUxJW7cicujsb4xMCpzw
	F3Lr/Kof1BtzhhxO41Wcvr33QroeTkJNXMiPQHQvB6IEzusess3EibyuVVwrG1Pt
	AzqymEmC7GDt7foVW89joImI1bFqItKEy0gGA8zEGq0/KTvm+F9IUI/jZPoxNYES
	rLaKBX3tWanxpBiq2PUoA2er6AINmZ8KUwOgWUGvkgOQSDcnQH8UZ4yCE2U/ODkK
	mny2gUpNDMIjdifOjDVp2iHLatAIavksENgNCoB8IbLZhs6x7yjk/hubyrkCnClq
	jw==
Received: (qmail 3407497 invoked from network); 21 Aug 2025 08:51:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Aug 2025 08:51:07 +0200
X-UD-Smtp-Session: l3s3148p1@nL2Fg9o8NubUtcd1
Date: Thu, 21 Aug 2025 08:51:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL
 register offset
Message-ID: <aKbB2XZhLZ7T-y5P@shikoro>
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBeIdkOG2Lhrt6XW"
Content-Disposition: inline
In-Reply-To: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--TBeIdkOG2Lhrt6XW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've just build-tested this patch and found this issue while working
> on a similar IP on the Renesas RZ/T2H SoC where the MODCTRL register
> offset is also at offset 0x8.

I can test this on affected hardware next week.


--TBeIdkOG2Lhrt6XW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmimwdUACgkQFA3kzBSg
KbYYiA//aqr+N4gh4rBtIMI5BbvKJRMwXtKaUmKjVpfESdmbSS7MN8kYKCsW2hyE
7z0WZjWq2ASOzhlP4JAlNlPeQrkBcLt1z06A0/sg17vcoJ8wn/U9S/ZbVFEvpCyX
eM9XlwH2gr8aHbcQKVgV2VQsBNbcb5UTNZNEQTChESNh/I05NMrseGLfaulKihGl
a42Gm8Vwu2UUG/oqKxZtxYeAnnFlnqwLIJG6Ot9ofG+IsO1pM3UazRoruZfxl5Bn
CLurj04UyLCAkN7lHk2qTn9GJoAWQKHDbc9XUSPIYGvtbzXZTiC6Y4TkrwKKJO+n
YZAI5qFxCfTZkPbKILbeGh7lqg4D4WERlWPYWJYoET5A9GaH5UVqg5Jmcg8eX1WE
VU85h7UxOAVvkX2WrrMz9IGQn9XQZA0rkaXmknjV5WRiW2b7/R/T27+2jr50UmH6
S/4leKbxwKb+4AE7rrFUwznqriqnqKgGZLBumuwknAWfQOMae0osqWZg+l7259tj
l8B/TfEEBT3vbx3qdhlS27XwhICa+Vz7Nk41lV6agqXDoVQKknI3ikoD0nmNZK3o
Wg8USc0KNXm5LL+F2mslAPN8NmXv/JYVXqToAyR5anvu9bUx1FkZJ5PYBqJtIKCK
HkI8VmFc4WFBgWRMykJjYeAMOjn3TVfOgBOGxCMI2TTnuNNXNYQ=
=eAE1
-----END PGP SIGNATURE-----

--TBeIdkOG2Lhrt6XW--

