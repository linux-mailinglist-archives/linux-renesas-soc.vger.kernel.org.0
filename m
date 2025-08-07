Return-Path: <linux-renesas-soc+bounces-20102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65EB1DC10
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 19:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D11561543
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55FE2737F0;
	Thu,  7 Aug 2025 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EYZkSGpq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EE273816
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586013; cv=none; b=Ho+GPr8snjbZOPU9dsFKHqYTbYlBiXU9p0D5LShdVWkGV8ipcoM+VJgFQXvrSXzHVAtxRgAXA6d6yijyNhtPEl3zJCnxKPs2YjwiUwn2xs2B6Kn02EreftGaZejhokiBLVwraH+zDulMMf+Jn14ESbdScn2+Ap1KSENgW0xW3hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586013; c=relaxed/simple;
	bh=rRMpC/WIh/XATi5A8/vl4uXGO1/nAMpEgW6dEHv4VQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcAaR1CVAaN4lUTPI8YXd94pQxggqXhe+P+awmy90J9oUpJDVx5Jcjs07OFOINipIQ4zG7y65t1rzt8SrFcuVgDi6C1vkeCmd4/6NtB0g5Nih/faKE3YYAxNjdZrvmRZ9RGspVD5T4ql79rZXX7AiYP3Wy5iU3kqzQvOCMpbiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EYZkSGpq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rRMp
	C/WIh/XATi5A8/vl4uXGO1/nAMpEgW6dEHv4VQM=; b=EYZkSGpqoBJ1+VFUAVqx
	219a3csW6GERQTeAS1nB8Yd0p2G2O3RnwFsQX2PbpB62NIKNR46F6RPhmZqZ07ks
	fkNOuV3cgoSWeKXdH5SUnqise2Nr8H5lnnPwxDUULmk+I3fd6SniT5stORNCc3h1
	rSXmfjzQ23v0txkWhtfZ7YiAlV8kXBrVvuHQZk8IP2/e1EkBqNLJqLEfs21CH5Ef
	PNIEy0mNFOr2PYU+evNxuLtZq1ub0D30kWPoxouCn6lrV9nKDGsXfQ90xBYaahiu
	GUAMqnfUjOq17xyctaRDuyFx6rD6/Eri0eX9WH9+2yCxfDUQYPUdT1Nx5KkLYWJh
	ew==
Received: (qmail 1318772 invoked from network); 7 Aug 2025 19:00:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 19:00:06 +0200
X-UD-Smtp-Session: l3s3148p1@OQyfY8k7kL6S97a6
Date: Thu, 7 Aug 2025 19:00:04 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Message-ID: <aJTblGZwYSBqzavm@shikoro>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
 <TY3PR01MB1134633EEEB64A0F24711E522862CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlQYkzDjMaec/XX2"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134633EEEB64A0F24711E522862CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--qlQYkzDjMaec/XX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> What about pinctrl settings here?

I overlooked them :( I will let Tommaso handle this because it is not
as trivial as on G3S.


--qlQYkzDjMaec/XX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiU25AACgkQFA3kzBSg
KbZbxA//dH4+LXBirXDgZYhh8+ihULXNbqk4cFCOtEDbZM+EGZfGFRkPrW5yGrv2
riY4hZBQrFa1u+qt8qVjZ3VgD/5uoWe6OqeKFMAC5M/IeMnreShqYr9a37nqLp30
BM5vjvaqFRxbRclU5A0dYxx1EHQbrdLyIyxtuCogy0trOGZbWHdBC+TiANeiFEAX
mpes8fnn1QRHB5BhVtV119QikmK33lVNQBVbunhRmI4NqrWnmniwZ60GlzvUkR8c
bGu/+koRhbkzGCftjIJjfro37XeFewrkZo4vAm69gxgVgkZuOszMr8sGY1X1TxlQ
8go25CvCx0/78+0tvb41uYoVrFmzicDsWpcq/3N7nmHkkiNZHCE/ylL+czeO1B0I
4GYDAybgzatDT2VShUavVQIcgQW9WXEmVxHdZ07W682tpvZHoYVP8y9epbkLtzGE
0K41yeZefJjVASznDGvWbmIFddlgZgv+nRyMEPWbd4Wijqqgf1G4n+VwYm3x5673
CZWlByVUFbtvWFm9nTvqeOJdiSr8A9RsV7xMabQqv3kNC2uiVdFfIEKAcwnSqFgP
sSZWn2gaS/xOaQbCzvJqIgSc6FpWLczeWvpAh3++qJRSgkLiQUe1z+qrlOIyRc8B
Thj9HSc5TfFyweuy3jsZh37vIYpycxAkxYgA0ZU+LMv5J7s/5Gg=
=aZXg
-----END PGP SIGNATURE-----

--qlQYkzDjMaec/XX2--

