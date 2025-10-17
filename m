Return-Path: <linux-renesas-soc+bounces-23223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B139BE8215
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 12:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4BEE5667B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39432318136;
	Fri, 17 Oct 2025 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O9oZdZhc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8174F31815D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698140; cv=none; b=Op4PLjAeCcycADaEIvRxlqA83lTHhap8J4Z8BrsprQ3D5WPKh1/wcYv2Uxo6d3UKcLvqlXRmcBKGqOVNN5Is1CKUsKZc9K0AKfwwCarP7r2qzAlkTphMrRkrh8kPhwbn+zYdJjB5kee7kPj42NcZZvf1T+FTZDOtDMKE2m4Xa48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698140; c=relaxed/simple;
	bh=95VN5tGZ5majWlgXiME+5rDf3dktfkel7ODceo+E7+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4s4Wl9FOCVuDqCguqQDivPNl60RrTvrwFrSYiHXt9HOXPeKnEBMFJ+cSyn2epmf577k+YVDDS/S1/HpDWN9lQUWJ6WutGnu/6+WtG9h+XYtjmz+Or6anzJ1sW1jHSY0556TGvQKEwfKHp6sJwLOWP259g2KGV6O1ihdh/HOtW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O9oZdZhc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=95VN
	5tGZ5majWlgXiME+5rDf3dktfkel7ODceo+E7+4=; b=O9oZdZhcbml16oiXN6oy
	z6HRZMaxq9nCo5NWIFcQfl+hNYfIx9IlMlBkLHotfuKdPMOeoNbaVAuc36Ut77b8
	41tnJ9ov55irQt3E5E2A6v05dftIRLUQOgCxhFu/Rk66vn6VyIxA2uXm39nR8JXx
	vAeyWDLAyET1oOfL+Y+J6mNlZ7V34A8z9FGyAES2CTPBhnNI6mapzvUzDGSQH9oN
	vCqD2UhwJpno6QsfIwPgeGKbfv3C2l9cK0ENAVyqZYGW+vh8exFzCDe2L7qjF3uT
	Syw21tnUPmZ1AMNeG6W7LNL4q4U2wUKYLfdegwphWwZ02K7FCvjaMZ+6n9FeKj4S
	zg==
Received: (qmail 4194264 invoked from network); 17 Oct 2025 12:48:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 12:48:55 +0200
X-UD-Smtp-Session: l3s3148p1@BzDoelhBVK8gAwDPXwQHAL/S9V79e5yL
Date: Fri, 17 Oct 2025 12:48:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
Message-ID: <aPIfF-3SgzW5V_gs@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdXqHncXxBZ00mxV=pzdgQEU4ju2F9XMejnibbu=QnLfDg@mail.gmail.com>
 <aPEAx8ZGHBcWZKJF@shikoro>
 <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OsdqGLUzQojksygi"
Content-Disposition: inline
In-Reply-To: <CAMRc=McsbAirEYjoo455mbKU495VEvPmMEqBmZCq2hw113YHOg@mail.gmail.com>


--OsdqGLUzQojksygi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Interesting topic. In fact, I think we should make RESET_GPIO bool. I
> > think the fallback mechanism of the core should work without any module
> > loading infrastructure. It should be there whenever possible.
> >
>=20
> You have not said *why*. How is this different from any other device
> whose driver is only loaded when actually needed?

? I just did that, but let me repeat:

I think the fallback mechanism of the core should work without any
module loading infrastructure. It should be there whenever possible.

I might add that module loading infrastructure might be broken in
userspace. Been there. Also, some drivers might need their reset early?

Looking more into it, I can't find any 'request_module'. Am I
overlooking something? The fallback feature is only present if the user
loads the driver manually? If that is true, it would make it rather
useless IMHO because consumer drivers cannot rely on it. I must be
missing something...


--OsdqGLUzQojksygi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjyHxMACgkQFA3kzBSg
KbZs0Q//RTgyXoXE8+CDDjjbB+Pt0VuSZZBBts6ROzFLrC3HVN9PfB8o9bRVuRs0
vEGHpOdH12WjUj1fA9eM8oGPUItdcHB/Ra3u6Gi+8qidAVgOiHUrQ1VeavMHIi0k
jJhh4V/aXlMd5LkYnCRE7k3a2GE/kiVqZoVyf5HPerXJc/wi9j/96czmNKExmDmK
Bfx9hb7D1qf5GmJo0cD9PQjubMnppontSp+hsUTmW21yr3vfDRBzZQfCSx4eOY8C
yr7NwdE0KwrNAf8AJgKjkLfyQtCpAAdwMwoGPYRpfxdw3YNY0jo3W/w1KxYRHNaS
Xd39RiPXMgNEeoPHkQkWbdU2S7KWLmfIhxO2lKxxaSZlASY0cvu/do6RRwgo3p2L
V5fhGzAtdnmhi7NMABkomya1dzDvrJTC0BGYLGFrXiRG78KPHNr0xgsnq5ejU5dN
CkzDxlY6P896C12yH3WlIHA67Ud1nqJ8EP+uJ9IYhGlN5IhFYQEv9EL9YeLnR1lt
CjNOAMAdZL3Ce0BkrHltmp4dJsnj4WGLAniszRoy7xl3dbKPPF2p11CPsBxrKpk4
kqvq2EyrF1cGyQYYDaIRNvs4tOiXuXzkxPYKfEztg/F1qElkffyIkVfiPb3q3yS0
0lrgJUamwxj8RSxBF2C70cy30aHovE7cGu7OJefMf8zuyl269wI=
=zAMK
-----END PGP SIGNATURE-----

--OsdqGLUzQojksygi--

