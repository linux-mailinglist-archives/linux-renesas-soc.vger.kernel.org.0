Return-Path: <linux-renesas-soc+bounces-22788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE5BC4416
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 12:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906F41885876
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005E62EDD58;
	Wed,  8 Oct 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ElrtqOjn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1A2E2DEF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 10:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918156; cv=none; b=lnb0OAJfOser7RI+768Hro5rCUz++dOh+nPD67aQ9hhZYwTlVKkXVIE9ov2mNPpqCG3wbN6EHwuD+yqujxP008LiJJzfGEhqOD4wStqfX0X8fHEOijEGlZr1owHHYyz43blq5186SmYTuDsvdUDt5JcvSeX8s4F3IVf61YZSnjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918156; c=relaxed/simple;
	bh=dSJGzNmMD0PM8Wf/mSLkvB+XxB0YQ7dp5Al9lqhcXZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItjvqbCNnP07TlcVur3gxV1sPAKTCvyR01QGWVf/7uF581Q+5I5AoDg/afYf2qjsbLohl2pmIX2VrdhLSkWuVkDr0AAwaoLVl3LUPXDFIBV62DpajJ2rZIusdpuse0RLowiHhLAtsUDNlz72vmfgj4D9reWDaV7tHU7hWxvqfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ElrtqOjn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dSJG
	zNmMD0PM8Wf/mSLkvB+XxB0YQ7dp5Al9lqhcXZE=; b=ElrtqOjncH/p9xNSz5R/
	Zb53snOCsBxpY4xgyNFc6znAlwNALislW0vkFODFD97fqxcZXqnp2iMYuXgChh9V
	APXl+IMvOTiiM3/Y4Sr/osfyAmeZHqceBAMvyv168p5APptrpcobjVXoy24zZeNe
	y3Yp3d06lbzZcA8GmIIHyfigyn8BqAvnatBqiyFHoR7PcGjV3QgAS0Kz9lXzhJRg
	a2Hwe9oYOTsstxR6FIvJkJBOVjgIFHvLyI1wChws+4ScPERe/d0bllNaajr/cWu4
	+Mf7ELVL961N0LgO+jE4eQGTgLw6o0pC32FHGx9+dyb33mtGMkkrRrimDSf7IEJO
	Gg==
Received: (qmail 612036 invoked from network); 8 Oct 2025 12:02:30 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2025 12:02:30 +0200
X-UD-Smtp-Session: l3s3148p1@9zpXyKJAcKYujnts
Date: Wed, 8 Oct 2025 12:02:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional
 properties
Message-ID: <aOY2tdEXmhdZ0Yeq@shikoro>
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
 <aOWGWkQn1AK22tJB@shikoro>
 <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6OWaYz/Ekhbcag2j"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>


--6OWaYz/Ekhbcag2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > As said, I copied this from 'bus/allwinner,sun50i-a64-de2.yaml', so this
> > got reviewed already. I have no strong opinions on your suggestions
> > above. But whatever we agree on, it should be reused for all busses, I'd
> > say. So, we should put it where it can be referenced?
>=20
> In my defense, this is a DT bindings file for Renesas BSC, so we can
> (and IMHO should) add restrictions.
>=20
> If you want to go the fully generic way: as per the device tree
> specification, a unit-address can take all characters from the same
> set as a node name...

Well, I think consistency makes sense, but I don't even have a strong
opinion on that. If DT maintainers are fine with having multiple
patternProperties for busses, I will include the restriction you
suggested.


--6OWaYz/Ekhbcag2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjmNrIACgkQFA3kzBSg
KbaECA//aTWLol0grwbYAzqAvWvaAmlCONGLvwLEeBVeu0+u29jQfHwZD+cARPj9
0D0BRdSA4iy563Ype6HpHUI4P7iVU5TsPQQ7agsGhf55Wc3P3CXCV/L9HrzMupsY
d/I7weieJ+wkV3/NpTa33N0JXoEFE7FPQAwTr0SgUDRehROMyQQUlk/azPcTpp10
Fqw5tPcOgnBVU46kRoU5WXXPzeWqZ0vu7JVSfboQ4Pe6vlDoCtcydbG9rXOf0tms
sTeLYHJyqyZQliiOemRjKM4nYkOekUDC0J3KryzodO084sJZ8BBQ97G5Z3d1FaBh
HJd/EGnzOB+VkJIeCuVORPzHKWLX/2jxyqe+TYbhHxhClErSl2m5NsRReHD+T6Q3
3YgKKbS95xUjyGnVJRkRVCGPH66bk/rNwOYIfJuI/VulD8VGfH/809g+rR3vy8wL
vm4lnZ2yOhqr/mqxA/Dii0H53X63KodY8pFdr7uTd28WqMDLrW0w1NNBoUO52XiB
CodkvmeT/i/wn1KE2kZrdxFx4lyWZBiZTmqka6FioQbUZLVO1qhvNfg3Z3G1GEfL
plh5XvOaFN1XpAGr5BRoyTrOe615nii4+tEfpzPGvAbnYt81kCnisdUdjhYKTtXq
NIEG9UlkG8+qtYG8jx8ymrf9rk8M+saQV0yDmSd/nAhPvVXIhnU=
=KH1M
-----END PGP SIGNATURE-----

--6OWaYz/Ekhbcag2j--

