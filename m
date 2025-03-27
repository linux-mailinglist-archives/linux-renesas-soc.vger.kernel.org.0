Return-Path: <linux-renesas-soc+bounces-14930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67538A737A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 18:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E7F188607B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 17:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD882AD2C;
	Thu, 27 Mar 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZpluMnlb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC81A28D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743094927; cv=none; b=fCCD8YCT3X446tBwyOVkwH9u2a4L9mgobElY7RYz7FRGo5klgAa57Z9oG9IpokQADy5rhPPX5xrOBtWDd9T65AFTwyWxrQVyPVW1POL+/YEj3mTwC5ZKommFKzU5n/jZKie9pfFUu7603O8y5dL6sfy/CkVLiv0cyewvfBS6m5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743094927; c=relaxed/simple;
	bh=3GawMYBcBvUhMNeeybbXQj8VnLFf8qOR9bKuarOQweM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgPqfLlYs6+jfPXv7iYSmhOBry+nw+jXk/x6akjYYNRFeSG9frbZ4mmehXAXAfAKThEB5Uv0xIhOb3Mcw0MQsgyPBQaw0mza7VvYQgq+vdnDch3utmEkC3fVAwrsxD8YF4xyLXOLJIWqbIILYDsNJc6EG1nKPN6sdMcH2f7eilw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZpluMnlb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3Gaw
	MYBcBvUhMNeeybbXQj8VnLFf8qOR9bKuarOQweM=; b=ZpluMnlblPJnwpHnrPck
	v4sgk0AZs5NBgJqOS3ZQuYilLcBfDWAwaAwe4n7liQjYV10JCnuAQ+xp5wNKEDcz
	d8QmEQqSasjwLs7JqFprxLStl+tOKe7+ywhj3rfWfMQegPtGieQ3OS17tAz5zrRe
	QhnOdukscchmA+cULEv2/zj3kZmuPDaMH0gcVLRjKsP5nYrAHVp8tVlJ8CqNAvva
	ZFKbMIirqrcfgO/P4MDZPCMWPAAjwoc3pUOZTwGGbpEgDVsB+fp+fHvO5TGKtW1Y
	P395hrmLfb6nDV3E3m34RrTONF5BRbiswJlCilRb/Z6nTEFWCgGTecUgrw2U9wSv
	Vg==
Received: (qmail 4089692 invoked from network); 27 Mar 2025 18:02:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2025 18:02:03 +0100
X-UD-Smtp-Session: l3s3148p1@0Bqy6VUxfp8ujnsv
Date: Thu, 27 Mar 2025 18:02:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH RFC INTERNAL 0/2] soc: renesas: Introduce
 ARCH_RENESAS_ARM64
Message-ID: <Z-WEiqdpzHCZ-1w2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5qc3Et2OM5Tiho1"
Content-Disposition: inline
In-Reply-To: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--z5qc3Et2OM5Tiho1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This an attempt to fix adding each SoCs to ARM64 defconfig file
> by introducing ARCH_RENESAS_ARM64.

Why not use 'default y if ARCH_RENESAS' as suggested here:

https://lore.kernel.org/all/6323eb7a-03e9-4678-ac4f-f90052d0aace@kernel.org/

?


--z5qc3Et2OM5Tiho1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmflhIoACgkQFA3kzBSg
KbbsThAAr0ZQMmj4eYVaYw2T9BDYaD6lCK5/9pjtwK1+koSykrLAvHa/R7Hy91w9
LMbYQrybwKayQ8suzUemw6pw+bTs4ra+ZWUag3uuJ7lRID3f84a8yoBkoWMfdSvb
PSrE848R+TP21ioF6SYiZXD6J5Y4QyFWkHFVbv+cQAB26qxqae68uZrQFKKc2d1W
YCXq0r6lV62kiILB0ldAUzX0Eha8kRrMJE+b/wScem4/T2s8tGswFcp5jko5RQfC
qI34PbdNG+9jEWvXVOQJWEmo4aTbzDlvxw2dbUaNnqjKdDL2A9IQpOlI1vQAzbBw
x1pS04rWOKm7OEUECFWgLC2Yow5M820o7Vnbd/m5rZ7P03n3WfeDUVQEpd3zk1qU
K6dx2jWNUcne425g+ZF92LWwrEmnILRwDnlGTeEjZNCaXiuCUULvyeGUXXvDV0aP
fkldRQmdxmmlRSxcQ2SJxtICHRcf3PD39Lqk9Qsk6HWc83nT7ky1NLepZs8vlBlS
iq/zLv7fcf4xnSQBGAABrV48MntG2xVci/Re3xPdAGOPAdXvnEgLuYgJRrsYbwea
Qd1XFWRnJPiXeV3ln7hf9f3g4mZvc8Hr31hskgZcsz6x8w9mjE+E8AwTDy77Erk2
TQ3JQIF8LzVC7vjMeoWRN0cT6grCncJ64/9ND0P+Ck3V51x5LAU=
=91Sj
-----END PGP SIGNATURE-----

--z5qc3Et2OM5Tiho1--

