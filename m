Return-Path: <linux-renesas-soc+bounces-11434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA329F4339
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5ECB7A360E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 05:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7514F117;
	Tue, 17 Dec 2024 05:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="M32O1Ls2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460D83CC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 05:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734415045; cv=none; b=GCIpHacdlfcSsLeI081xPrZ+ISwhEv/X4+PpHnnyof90gWglr/H6Fp6YDCvUQQwYrttTm9kpy103Of5093t8wPlj7Jsnb8TexHDEPMRDU9cfa8nvHeYYHBjEGupIHfKq+m/G9DpAkOMcPtTrgDTsVfeyH5+BFl32RO6J7zs653s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734415045; c=relaxed/simple;
	bh=yWkvKPPV/ze/7mn7+IE+lAOxYJSRUtwgKXwbbYbg4Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJbtn3MekXsYOtD1EWK4MHGfjVJH1LMtOpsA22g00HW9rN3kGx+cYJ5k5mVFleUEe1gjHetlyFhWpqd12PniKyG/r7rAOwg1IV0rTeVkVjYMePGtUO59p4RDvioiptyI1mc8V1JpvKAHZSZ0q8hPmA7Zz9fLDFPh6B44XR+3xnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=M32O1Ls2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yWkv
	KPPV/ze/7mn7+IE+lAOxYJSRUtwgKXwbbYbg4Gc=; b=M32O1Ls2cyomHp77l8EL
	WDo8FG0UrBV6rkt4NPe+jj6HkSylkymnrB25HPA4gFMTVs9BVCknchpKUt2M/tNn
	za85bkT6vjznTrttD/i82BTP690F/uu00p6GXetVOjRYsbuXg2PmdpvpNTK7VYLH
	rPly4v1jCI1c9BMDkI/nmB/G8MXu2qh+Gzqy+JvWGxLLgg6cEW2HsCLGamWKgQ1o
	kXE+r70odc3lRGYqL8SStUjR45ctFb+pCRsWW4ey/Gg+6ClP/DQr/VYIbJiXt20P
	H816hdSBHVuNPjonsiNIIpBQTP02M80FXOynnb0X31D40BOtTnJPWXiC1LiHQNqM
	Kw==
Received: (qmail 3963030 invoked from network); 17 Dec 2024 06:57:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 06:57:11 +0100
X-UD-Smtp-Session: l3s3148p1@/3LP93ApoqIgAQnoAGvhANJNcnpwwj5L
Date: Tue, 17 Dec 2024 06:57:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z2ESttIzF4kX7JA-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <Z2Dg6ydwN6CfxgTe@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yZvFp6W1xzXD/xL8"
Content-Disposition: inline
In-Reply-To: <Z2Dg6ydwN6CfxgTe@yury-ThinkPad>


--yZvFp6W1xzXD/xL8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 06:24:43PM -0800, Yury Norov wrote:
> On Sat, Dec 14, 2024 at 09:58:31AM +0100, Wolfram Sang wrote:
> > There are multiple open coded implementations for getting the parity of
> > a byte in the kernel, even using different approaches. Take the pretty
> > efficient version from SPD5118 driver and make it generally available by
> > putting it into the bitops header. As long as there is just one parity
> > calculation helper, the creation of a distinct 'parity.h' header was
> > discarded. Also, the usage of hweight8() for architectures having a
> > popcnt instruction is postponed until a use case within hot paths is
> > desired. The motivation for this patch is the frequent use of odd parity
> > in the I3C specification and to simplify drivers there.
> >=20
> > Changes compared to the original SPD5118 version are the addition of
> > kernel documentation, switching the return type from bool to int, and
> > renaming the argument of the function.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Acked-by: Yury Norov <yury.norov@gmail.com>

Cool, thank you!

> Would you like me to move this patch in bitmap-for-next?

I hope that both patches can be applied in one go to avoid a dependency.
I'd think the hwmon-tree is a tad more suitable, but I am also fine with
bitmap as long as both patches go in. What do you maintainers thing?


--yZvFp6W1xzXD/xL8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdhErIACgkQFA3kzBSg
KbYj9xAAkJ1bWQzXu33Jsvjilcx+g2gaXpmFCYiBw6wGM9uuEKeMgV6fW6WOdylA
+N7nrxUf6iYieXakIgn/yzhQTS4CmwWd+XsTuPDLRPWRtC8CXGL6tj+ezp70Fthb
aNM9yt3SzWuTVMoUxloAKDzRUTsuIOVmcx5offoXrWMdaN7XhfcEGPx1M8Q1G7Go
k3NVT6rJfeEP/r7TpOxLtIXbkrfEWKVRsOcuUSG0KZI0n1u46qI/auSCfYTh7scZ
2+u+82AiFArDZIpQiVzjAqF8UZ1mNNBQf7qJmSdz22XP/4jSn6MdJKPn+/aUQSHB
OdsQ92qwFa33yFuoIXMtSH8p66CYt+PoNzmcmGMM0B9/q6j2kOn0FC/sJzNAZZ3b
WsmDh9u2Z9/Wh3QQ/MuDhkKjHqiaK2i0a0joAU75/HR8Tg6FU6INSHjn9NUYudc/
57HPHJ1vYf5XDxPMsBnSO6vXDv3xFHY32ZtI7+xXF3CjBd+l+2ftVu5bJBTlPvx1
3WqRcvCxzWUpBl/511CYxY9RfbWcSg/heH0fJdPyO95xs1U0cwwFqY3NZZlQsN+X
Dljnvxg2fptjH8fFHu27k4rnB9/Gnex1yHNknGdRIs7dSUepxlqorXifJBtvSsUu
o3ZjvrpBbG6radSHEAic3FpkiafarN4o2U3HXh2fWH0TDtkLAz4=
=3RK6
-----END PGP SIGNATURE-----

--yZvFp6W1xzXD/xL8--

