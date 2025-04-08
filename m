Return-Path: <linux-renesas-soc+bounces-15541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66FA7F737
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 10:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FC171893978
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21101224251;
	Tue,  8 Apr 2025 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YmlTKyVG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E4216605
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099394; cv=none; b=dx2Us9gdHfpq6U+40lje2MEV6AgarUV1rnemEf1a9TSkwXBTZl3YpjBBTZpHbckeZ5u2VJKg80fTp2ujMe7oK3BigoTN81OlTFwGka+rFqkaEJdZOszpWXd6eyL+VmBh2bntRCWZ+A2qr6Dt7IKU+zI1iBuK2qSXUR6h+R2wmVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099394; c=relaxed/simple;
	bh=eOAw0hyWHLIINvb14CVs1GR58Bxf6TZohiFSnFDaF2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXNbgiH8AXpV4dxM4W+MFBx6qIJBAMYiEhkS1Nn6BuFLIRv/b9lt552BASWfsAoYuaJV5xd7ZHZWNACQ6jKpzpu2NBxbxbMpwehuHQRrVSvVL85CKrYMNVHesDYMuk1XS1c2e6Yd6N+C579N32KbNbjpYCppIHxnZshz0JBKANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YmlTKyVG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eOAw
	0hyWHLIINvb14CVs1GR58Bxf6TZohiFSnFDaF2U=; b=YmlTKyVGuYg4ZkoKlIoi
	PC2qp9kjkR2bU5Pm9PA8uQ8xV68iSkwgBVeqQW/KsbkFjrcUbI5kt8ce48C+dYIe
	MbYBFLDhPn8sS/4WLGF/p9s/yYLQkKvcRqnf+DqbX9clAQhKbQvfPrK/Sryfagkl
	aqH+280eqnHXCcIbqZgGmSeZ+XFEfK12zyQ4nOJx1pETMKx/V9rFy9JkaHWddcvA
	KhqIajrZb3E+M1wOfMc+nIncIcDWruk6U4uUzGH8Z5BSEfPW5t00T3UJMdQegrNC
	SSWhJwZkFCZPvutSnAU6U+MCw11kvlJWQJMGhAeAURMUuVP66dkgWPNxmyxJpbRR
	FA==
Received: (qmail 4102305 invoked from network); 8 Apr 2025 10:03:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 10:03:07 +0200
X-UD-Smtp-Session: l3s3148p1@ahJnyD8yFpcgAwDPXyfYALbiJ46yNPq3
Date: Tue, 8 Apr 2025 10:03:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z_TYOm6xuYcQEt_V@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
References: <20250314-rzn1d400-eb-v3-1-45c4fd3f6e01@bootlin.com>
 <D8IEWP78KVOE.1SD29H0S51FZM@bootlin.com>
 <Z_TA46i0KfFq89ch@shikoro>
 <CAMuHMdWLvqKP6QnLGuR3AT1SEJ_XO5F4119JCqgptv4RFWx8tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O0J9fWFvFi2G9MU+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLvqKP6QnLGuR3AT1SEJ_XO5F4119JCqgptv4RFWx8tA@mail.gmail.com>


--O0J9fWFvFi2G9MU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Please do with the minor review comments addressed. I have some patches
> > depending on it. Which means that I am using this DTS regularly now and
> > it works great.
>=20
> v4 was posted on March 24th?

Mea culpa, I overlooked it in the list. I am sorry.


--O0J9fWFvFi2G9MU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf02DYACgkQFA3kzBSg
KbZKlw/6AjOgH6RhHYUZCXliEOaraIhmt7GNbKOGM1poWQNlOa2Wi4qSDbjE8Q/P
EDdgHu9Kgwfm4C6NOn8Y6heSbnFSxhe2UQFsCHyDiUK5ABVayN1cI4IXldbF0YA2
C1LL+SxWIYf5dNlQt0m+ZL1g1VkIUDNqKLByqXT854g/rk91Gwak/uhbUljhC/d0
D31Q1afnNqc2FLAchDEddbpjW2ejJZIZM2MK1a9sF64Xnru5Y2GSuGAzjV5mKdj1
r3MbgXvj+85GV6UNyoWhiFWhoS8LBe5CpXAoGCjB3zsmgsD6UZlXMnN33fr+1g9B
ooD9YzWiPjqMRM2Fe2k58sM38mu4o2aAwotVXw/Xud50vs0fHd7inR88do+eq6kK
dthigEb7wLkHYMHzXhzaGAWCW5m3Xt68wh36guUTQx0uRC3FgoJhBxGr6M5Scyf/
YMIyu8p5NjE+Aktkjw9CtgC8jvfcICNxwlizqj8pBnGRl0SwQf0saukHf+f28m7P
mbTTSexNVh1NmAdNubwtGcxA/P2zzyfQfCJfglSf4tSO+8vlBzq4s6gP4rR8br/1
25AZM+SHFJvysENWujxmrsqVKzJ5svin3CRzSXvFsUmRbHpmTWUUQBe0zykkGFx/
1jwGRNgo294/N2DpnbhT+Mqi7xQ8nf1pauB6HUUqYbU7lm48zNA=
=0lay
-----END PGP SIGNATURE-----

--O0J9fWFvFi2G9MU+--

