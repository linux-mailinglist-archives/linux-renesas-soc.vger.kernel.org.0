Return-Path: <linux-renesas-soc+bounces-11348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F779F1FEA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 17:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB2F51633EE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 16:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9331C194C61;
	Sat, 14 Dec 2024 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c9gifcEO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A11922F0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Dec 2024 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734194448; cv=none; b=RYcfbhOI99b9vKrIPIw82LoAHS80elb5tPUv0qji6p/OEW9kj17Ei5z1ROzd01O1+bNVcdW/8ci48vI9VDNC/F/HhGTxCUnCTp5NQl+fWHwVG1PMqnTGzkMW7wIBgoyJwTeZaIwkgWZQvJcXOJWbk2+WQSyFr/wlAQhgnspYLi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734194448; c=relaxed/simple;
	bh=37m51vzvfSdZ8BLzlKnTToy6RDiKeslUTgn/GzffmX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmQQ3+72hXjn9/Pj1AIytWQHfPBr7/ol2W8LkpMrZZEVQBIW/XTJia6XnmyzYMGeUUg25WSP7iUOKnVCABEVxD44v4EQGkiSMeFKWp5PWaer0jNxM+WXgxCw3p8cISo5D8hXog4EdOi6IuKdv4lOXplkqG9AQzbWF3S0Jg8oddo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c9gifcEO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=37m5
	1vzvfSdZ8BLzlKnTToy6RDiKeslUTgn/GzffmX4=; b=c9gifcEOXaSYgSXrmUKK
	GaN5ZafnHSdQBzrYkMYh04Bx7MzK0R5oDZTZ2wyuruZPVrxfJllTaN75O4MJa515
	cE8JN5gXAG9jK1CpuIZAzuKRlSPAFKR3+d917JtAn3dkOAfkDilUmY7YlHaK4E4h
	xQNQMzAyg2AK/Yq2udaBVHBTZwoIFN2E3CD1D/aFoURNzRbmnknq2z+ucRFkVDuS
	yOjrUiRDH7PxPOi3cvrXzgLZFHsGsrcciFNgJBQav5dpowqcLcQLlbaFSJ0nfh/V
	i0rm/9GWkBu4osXk44PlvamGQ8YYIxE67h8O3rU7Y7aG3VXss+4SIcH5nbncM8JB
	2A==
Received: (qmail 3134564 invoked from network); 14 Dec 2024 17:40:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 17:40:41 +0100
X-UD-Smtp-Session: l3s3148p1@s+Kemz0puIVehhtJ
Date: Sat, 14 Dec 2024 17:40:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z121Bx1RcykazXLB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <6fec7aa8-32b4-47de-8fb5-4ab6890c1f46@roeck-us.net>
 <2e8e63f2-3a1b-4ca4-b095-4a6cbb20ae25@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sgcR6tjkyL9NvYfH"
Content-Disposition: inline
In-Reply-To: <2e8e63f2-3a1b-4ca4-b095-4a6cbb20ae25@roeck-us.net>


--sgcR6tjkyL9NvYfH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Curious: Why not bool ?
>=20
> Never mind. It returns the parity, after all, not "parity is odd".

Yes, this was my reasoning.


--sgcR6tjkyL9NvYfH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmddtQcACgkQFA3kzBSg
Kba+Qg//dmKvI3QW/SN2fFzzpI8DiaqJXReHtZrmwCmN5cb3CjHGVpAQGsEUv2k9
5hVt8AyFq80aUONmYHvWZIJXxNHz7BT+bMs3d/LyIMSH92bYj6GMcSyrJDe0mY5P
o39717yAdg8hnUPCiKWujaLyIXARqbDe8zQLmlsaS6rYxo6smSgd/5jLfRolZ+9w
TmNT+1HieiYQUYX/lK3ODIMrxtKLTFNAkfCCSFcVsuXhQ4xFYIFOWwmd2QibLKoQ
gt5jIijt8c8sVC2TxcYfGb5o9FafAJOJYh443WrhRW6uA92cUXbKngCymTJvq4bz
onhEc1BD9rc/4nZGUjQluvAvJbpoquHQo3iWThD9skaNBBHH2v8uaGHCLAjtiyr4
Pjxq0YRK1nokGHXH9a9Js0ozruTJSxnbBEGi4RPkqd2TrNoU7W7ruuSW+HLH4E6G
dnYat8C8s3gqAIypGiGB5MuWIZTgZ54VPS82WTLkF+sRgYHzwgVjkRBh9o2Fekvb
DJP0PkhcnIvCgS+YdcNpDIFog4TmQRUIp96Wno45vcG/lM6F04dFwFnI51zVHsgd
n3b0WtG4WBA+xsESZ92QfhKEWlml7cd6EMBdMakgHA+5iTBvOuzvK1vS07wZz6rZ
cL9sbxDlPdccW19dvKeMLl8VM+MYFrPMaJi5RM8pIKxLWgyJeIg=
=n5IT
-----END PGP SIGNATURE-----

--sgcR6tjkyL9NvYfH--

