Return-Path: <linux-renesas-soc+bounces-16595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 595ECAA6611
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 00:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C4A1884EEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 22:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9391B252296;
	Thu,  1 May 2025 22:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kyPHF/IF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FE20E718
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137495; cv=none; b=Czdot6Zstl0wK/BYd8ZzXe0eBjCmLuD8brEfOZmLviUBYctJ01iMoxTVnthn4LHa/hUFFXfKyuv/eKuV6FT+TaY1Ent633bDBDjdOuIeKbjVZby8QkVIHUXVBZR9/lSowuc5Y+2ClMzq6JPXNMr3JLLXFshkZFcTW5xxFc3PKEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137495; c=relaxed/simple;
	bh=3hm2HhT13H+1YT3wpMUCEIU6hwlsQ7uojdPrpSXeszk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U940Oktsv74L0KnLBYUfx3snjVxMvPuCJLUwBrT0us5D/ytz9q2Qgb61jsk0rOKGif2/orynk/scxM3vngrjB332mOinS11PCmKb5A6HNFHsZ+vk+7XLBsyg83txYXCZP4x0Y66WIS/rZvoWPlyV2C7SspersUT7N/b9qOGIVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kyPHF/IF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0yOf
	NJewwuXZVorCncLc4pxGtBwvhW3nQZsAKduMfvs=; b=kyPHF/IFBujVRO5JXgVA
	v0Gu7+JRP4GFatR+3OYpwBuUsMoHISC6d9Gh5RhYuYM5hdGxARK5XYKuH7Jfw7VP
	ksO+6IHJzQX8tBjaiaC2SOAno1eKl2gFyhrpsR656tlUKEg5S1R1FqMzlMZUn9kB
	ZwnC7DASo6Jhtu/8VlF19TLX8Pb9aog6qvLLukUZE93HIOVyeGX2WA3U3oQJNLvu
	LO5KPpa3/oc2MmkR1OToKstFMRA8pJjs+ixIKLbHl/7Aa+TpzqsYE+Whs6pA7cCu
	xsryNrc4y/G/1aYeLOPb4vlAFdIvnGTRADl/FgkW93lVhIaCi4E2840z2tl6FFCT
	zw==
Received: (qmail 1185925 invoked from network); 2 May 2025 00:11:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 May 2025 00:11:29 +0200
X-UD-Smtp-Session: l3s3148p1@jLrIUBo00Noujnsd
Date: Fri, 2 May 2025 00:11:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH 3/3] rtc: rzn1: support input frequencies other than
 32768Hz
Message-ID: <aBPxkYyEanVZkx1T@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
 <Z_glj1NS6yRHHkyR@shikoro>
 <CAMuHMdVnu3+4Gkca0nTp7nWFSX7RjXe_GRG5PKDShC-WdpMSqw@mail.gmail.com>
 <Z_i5NZjB5aSV1BmX@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3BOGcYoyLh+htK4N"
Content-Disposition: inline
In-Reply-To: <Z_i5NZjB5aSV1BmX@shikoro>


--3BOGcYoyLh+htK4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 08:39:49AM +0200, Wolfram Sang wrote:
>=20
> > > >     if (rate < RTCA0SCMP_MIN || rate > FIELD_MAX(RTCA0SCMP_MASK) + =
1)
> > > >
> > > > ?
> > >
> > > You really think this is more readable than the original code? I am
> > > really tired of bike-shedding so I don't care much, but I do wonder...
> >=20
> > I don't mind the literal 32000, but the "> BIT(22)" looks rather
> > obscure, IMO.
>=20
> Really? Ok, then it is up to what Alexandre prefers, I guess...

Alexandre, what is your preference? Everything else has been sorted out
by now AFAICS...


--3BOGcYoyLh+htK4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgT8Y0ACgkQFA3kzBSg
KbYznA//cXVQCVesvIw6sYC5OODARSTjd0B90V1CMou2aUzZD2wB6J/w63GMOX1O
J2b+7HaJ5fGgaJhr2Zgrc0YEmC+DRAZP+uu8ZKF5b3PyGqDaCgmsCpmsTmHGZ04Y
mAFq3bePhrU4yHCJ9OyWHmRr3yaQGs0BUyanxJ6yWRCSjDSHHPfZTfeFnpnj81Gh
3JoPJXDhYhAdrOf81uwLl86pjNk32WLJVK0UBjyWhbNUbr8KGsaRFZwHaOuyf39G
iMkCk8nX45Mc8Fm77f9E0I9c7HgvBAyfL4fy3/pPDUAg4G097reLtJwMM/DD4wL0
tjxGgJO8Jk0szb4XnVzBZk/hQ+e41FZBQjYkpJPXV+k+plUykXXHa1Zs3MNNPl3Y
cCNnQnVJ9DWmDA9qYWTErvG/CseWHhqLrjDO1wjeJL41rtSzXugf+Xt+DWUwvbRo
P29anUz4LM9wnNo7X9nUTNDO98vuybiqtUVyExJY9DfGWbZWZBmDrsPCLCicUK6P
sgQm5PdlqhvHD3pgJ9Hm3DqpDhdjY0ZlnaplllCBQCuoLro192bC+SBnfYSRPf8n
dy2ASIe8pBq1HVXOAGgJYbFEZO+XrJm+wFgoCA/djblulxjVXrzO78Soc3YXMqVo
dwFGS1KtK6AWG/1PvwpOVm2xC3Zvhmr0u2cUtkdm9TXj+2/CJpQ=
=qC/d
-----END PGP SIGNATURE-----

--3BOGcYoyLh+htK4N--

