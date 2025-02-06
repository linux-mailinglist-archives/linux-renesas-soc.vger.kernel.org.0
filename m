Return-Path: <linux-renesas-soc+bounces-12920-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183EA2AE7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 18:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D123A3706
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 17:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFEB239560;
	Thu,  6 Feb 2025 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dX2K3gtr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58761239565
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Feb 2025 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861608; cv=none; b=ZHZDgaVPv60g1RA3rgIsg7dBuidBjgM6QC0c6vBNakgI4f5wl437xdscTDHee6Lg4hX8adSrX3XQ/CPLxq8D+B3xFBYWSf83/NNYU0ZwX91YYSgYds69PtxQchsafIdfyn5zgcy4xhYL6UetbQJ9O+dxrrcbHQH3AUCOGLNgK44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861608; c=relaxed/simple;
	bh=xf/HZFee5jT+Nf+ite3+n5gL05pgSdR63az2gB0bLEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cally1CsDGd33YxGFa4Zgluu5MZ893TGD0Apb8VkHIB1k0EG4S+kDCTAO3pZ8TAe3ckPyuPtmOr6E2gSNaggDldT/jVBE/zra29wheBnjS5VlcWd3wSwb3Rk4V1kl+z3SUe9/dRoISOJBLggkb4PvwFOzb7/TQXbfFjneRKzZKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dX2K3gtr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xf/H
	ZFee5jT+Nf+ite3+n5gL05pgSdR63az2gB0bLEc=; b=dX2K3gtrLoZcQTVQE5Cq
	aNqt7XkAAOW6R1j2P/9rZsM9ECSqWYZLi8PSXyLX8LTUVk4WkffWDOI6FDPGIwOZ
	6awcS2FPEIE5CLD2kSnhjfni92PpfDnGar7LVzsxEq7pSjfWestZkewilzn5OdeL
	RaIGmLKt4rGzykqwYtXVJhWGJn7as62eYBds34gSfp+9O4FSeCvn8iyO5Dk5qIVA
	PQsQrMPxH1BRrTqrqJjJ4l2WE6HpoQtPZ0pG4wPyawAWb5c5YXJ+GP2yGt0icjv6
	zaTTxRV+BYPamcTgd95Oi31yxUukbHJxxGz5F0oB1rxjcKGQRMdz8OkqkVUwkwSI
	rA==
Received: (qmail 3801006 invoked from network); 6 Feb 2025 18:06:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Feb 2025 18:06:44 +0100
X-UD-Smtp-Session: l3s3148p1@b6A4RHwt9MBehh99
Date: Thu, 6 Feb 2025 18:06:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "i2c: Replace list-based mechanism for
 handling auto-detected clients"
Message-ID: <Z6TsIw21EpeJeWPC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
 <20250205134623.6921-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HPrvnWjr5tYCedc4"
Content-Disposition: inline
In-Reply-To: <20250205134623.6921-3-wsa+renesas@sang-engineering.com>


--HPrvnWjr5tYCedc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 02:42:27PM +0100, Wolfram Sang wrote:
> This reverts commit 56a50667cbcfaf95eea9128d5676af94e54b51a8. Mux
> handling is not sufficiently implemented. It needs more time.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--HPrvnWjr5tYCedc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmek7CMACgkQFA3kzBSg
KbbUEQ//QyGkbjnWK+tQ2yYRfnPdXVpwvvjcpnUeahcACjjYTrCPe2nmj13msjHV
MWGQI6ooVlhcNI4836S4lz7fF9/xo75u2tvJash7dfC1FQc30O6SkmY4kpm15bF2
LV5TeclbzWjdchpFR+ZpuLq1ViedLCX1H1m+WxRB5sn7fYoNy5BZwRiKo+QqpA2j
JhnCDYB9XNMuX45fdUqU26RPbv5Qfktx+CEjFa4CfwDhOODIHg+H3IUaNI7uFd3v
AxJEL5OIKqNQPlPbKeRW1GFaCo3anG2J4CE4v9rCRSp9q+MQZXTqNAPT7VaMU/rX
g2GpE97yzBJ3o1Hmn3NvZpS9L+ujrupjmV8Tvs8xOpIvlabo02l1o0NK4v3fdyFm
Fs1gh0EZLOZMStLWU4O0TsrU07c/OY+QqB7u78wRwodjB0vAxAJHcS1aplVH0Pai
ErC20U8WgzcRKxD1SVkkis9J+9rMq4Z9ZUj9bezc5m4JdUcTVzZ4e5K82Tuuq+8z
UrmApG9Yia1asA5qlNTE483pD4BZ+ZEMtUMk5GM7u5dStjpmrYaItc8BEwGpKpj0
B4zSIMLg3J3iJS2x2xQaKyG5EsAVfyrENEO9SedQNN/HIx99oI1hA21W8hxiOFBR
4oy01PfE3RFxhScPzqi69W5O49BQkAoCFJj52manMqBqWyglyOA=
=HtXn
-----END PGP SIGNATURE-----

--HPrvnWjr5tYCedc4--

