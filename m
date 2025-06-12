Return-Path: <linux-renesas-soc+bounces-18154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7CAD698A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 09:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C919E174126
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 07:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F9B22156B;
	Thu, 12 Jun 2025 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eUS2Fwvj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAD21FF48
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jun 2025 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714623; cv=none; b=VhuXv0POHMCAnm89VbngrE7H0qMOa8U/XmjdPxW1OS8VcdB6KzedLJ0FWx+vlshHGIcsjmn1EY32uS1NEoMLHS23p7yaPAX4NkOMoffGQdrkDdOFMIowqnLTR461seh4VcN+XCNa5zvXezXGClrvf+LVMlcciT101bzKQgh3rJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714623; c=relaxed/simple;
	bh=asGUIZZs6HKRiLaci91mPEgp868GgHNmV+kuUJBygRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3wlkWQv6MGrkVvHPqcUZg9pv2fMkSXOPCtQo4rYcLtkE7KBuXaupXeD4y/9KilWmG3NjIbJMOBgkzwhwviX62PxBjNnDgSfEgj9SmLpOqr+w9CkIx1/SqYZwokLmGCiV/JD2ZIBFPUTcNoLKBiJfgiYDajgHPv7orPVONuyRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eUS2Fwvj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=asGU
	IZZs6HKRiLaci91mPEgp868GgHNmV+kuUJBygRQ=; b=eUS2FwvjW12aOCRfywim
	nGBVsPe6A1HIiOhLwJy1aTG68BL5I0LDA5IdmisK8NhYdXtdecUqPUivVIZ0fFFP
	z83/p0lStL23tR9bTI5igWdbGfyPjh43dFzDPIrqaj1P0uYqAPBtJlQfS1qWQ5Nr
	oNFTOAX4UQ7jxrWSwPIa/nQKv7PjzxETFLWFZT86jkpx+/SzBcb9Nai2h2qovJf4
	0YW7x9NVuP2IQuqEHvTc7uKeNb24Jpvkn5JU+0+MCb1HqTYZm3nl/EaPnf1aek+o
	bNi9fx3ovUignYVP2nL950MF1syW5soXElGKLE5Oy1LICIbG1/DVLw6QzUPAVMFR
	dw==
Received: (qmail 3537286 invoked from network); 12 Jun 2025 09:50:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 09:50:14 +0200
X-UD-Smtp-Session: l3s3148p1@60QMLls3uuYgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 09:50:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aEqGtjc7F8vvY4ph@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
 <aCtbg0_vD07g394k@shikoro>
 <aCt9e-rrOOR0C5HI@shikoro>
 <1cea4f55-752f-4581-a003-1c9d31a36039@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DcIQ3DvmppdGZo1d"
Content-Disposition: inline
In-Reply-To: <1cea4f55-752f-4581-a003-1c9d31a36039@kernel.org>


--DcIQ3DvmppdGZo1d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Where? I cannot find anything in my inbox and also no pull requests on
> Github.

https://lore.kernel.org/r/20250519184530.21845-1-wsa+renesas@sang-engineering.com

You prefer to be explicitly CCed on such mails?


--DcIQ3DvmppdGZo1d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhKhrIACgkQFA3kzBSg
KbYUSQ//SbP21jd8zqSNAKM50DjZ2UD0RkAZr6n17Bf4u6jCm1qnIWFJLPIPPLCH
EsyycQAgW1jJx2yJBcaA/uvQtdhKQbjfzOeHhtXxYpzm8QCggLRdSsEHuB+C3Wis
MMTAs0OtD0HyZjVHoo1X9o7rFilWxaTcNiFXeTv3Ctme3le3cK3Jf5lMK2kbP76s
+/6MEYTtpoJlVJyCiST8zRvW/79OzZpmIUsW+uad5mLRIJXs9JdUD2zAqcBE0hcf
46tl8cW3A6wOxM97mq8j0OxtO+joMhHnl/VO+QItXJaViMVNONUJu5D0bK71Po7f
wTCxes2W7UL8Kty294H//SAhgx/gGs09TfZCZQ+PDks3tFIi86+oQ2i1sKW2N5tB
hdkHxRGdI0K8U/7ZrKpVipxokCKVT6hV/tWa6Azls7Ci3U6vFMsT1eNJVTfTMME4
q0zx1zyOJABJ/lWXfxHS1R55BIryms2i4Q+EjBd5gYb0RfBOKrVWG/k3Ir5XWLNA
oNvR9ljQuXJEJKrE1u8h4blLVio2Wk8LIpuUyPIWWVJCZ4V/U9KyjH/5ZBQu/FY+
y5VkRa3hIeWU88fQF1FIhayoYAmOAJpVgNNLQY0BLP/Nc31edsNCCxpFnjvYfgiO
hbPEeBV7axh+fllilzfsPF50AvVLfyA9DrKZuBDagDOheed2LS0=
=0ZZ3
-----END PGP SIGNATURE-----

--DcIQ3DvmppdGZo1d--

