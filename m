Return-Path: <linux-renesas-soc+bounces-19258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51005AF9E97
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 09:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB56566E59
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 07:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC821DD0D4;
	Sat,  5 Jul 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WyNIqYMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CD175A5
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751699324; cv=none; b=KdKTCOSdnFrtxG6fDe9SJL80gwQ5oDXJ3o4LYrVFZqe0ZCYyTv0MrLXOtI80kLqhUg+p1l/C/t0istsn1Yc/H+n5AIV6hH25OqeTPeNtGeBOg+odsaViuYFqqEwWqMEA3lkCMnrM773mHnU3QA+78QkFks19sC9f2M6glQ7L0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751699324; c=relaxed/simple;
	bh=W4arTqmOzSfYjBnaHTnYdWYyVHT9cZTcjhsLWSIUcSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlLdDQAu8p7KwwN/ihpHeUD7VY0u5VMUHFHthmtyzZriel40Qf0UBIjd8rWkXzw9vE/Vv+EFaFcNXYeRDwwi9AcZDCKfBmh4Z7iQ+6sxZyYNj1/acwXaVV1PtPXg8KZXmwET0ChRQmiqLuC2HR/bueUnGbrHvrO90V7jlLfwww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WyNIqYMu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=raa4
	GfdGSI1sWVlD8Ox3PJoZ+KSEylqw0xeEFve236U=; b=WyNIqYMuRogUx9OMxtCt
	ZdtFYLm+mmbBQgMYZvEeHZoh44cgzhDWzlwJG3Qe3aXa41D7ZEuI3FkDBVEhgtzS
	IrujQnOPy0LpTM4NBgyr8BuPnuz9ZiIt0rpXnvQhidvKFmy/DfvFSAHXerN4AfUz
	MP2Po7BPovDIHszhqSQFon82ztEVSpcoGf2Yq/pDbhUsiw+K9GGGrYTfqM7vA97T
	AiePbMDIK299OGykZo23eQxgVUBC3cI/ReDOPeqIxvOBbJpMDFK5cMJLQ3/Rnjxu
	MjFR8nroUcb4Ouv+5sp8erFNAaXrfu6owMfSCCNFbIrNFgPJJEvi2WD6J6+r3nwl
	oQ==
Received: (qmail 443355 invoked from network); 5 Jul 2025 09:08:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2025 09:08:34 +0200
X-UD-Smtp-Session: l3s3148p1@8u5hRyk5JKMujns8
Date: Sat, 5 Jul 2025 09:08:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Magnus Damm <damm@opensource.se>
Cc: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Update r7s72100 Genmai DTS to include NOR Flash pinctrl
Message-ID: <aGjPcpFJo0kdNgoH@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <damm@opensource.se>, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
References: <175109918476.52629.8694334943062364426.sendpatchset@1.0.0.127.in-addr.arpa>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8AxPssZN26NHQ2Xh"
Content-Disposition: inline
In-Reply-To: <175109918476.52629.8694334943062364426.sendpatchset@1.0.0.127.in-addr.arpa>


--8AxPssZN26NHQ2Xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Wow, Magnus!

On Sat, Jun 28, 2025 at 10:26:24AM +0200, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
>=20
> Add pinctrl configuration to the Genmai board for the NOR Flash on CS0 an=
d CS1.

Very glad to see you again! Took a while to get my Genmai out of a far
away drawer, but now I set it up again.

My board won't boot with this patch, though. I assume this is because
the address and data lines are shared with SDRAM and playing with those
while using them is not going to work?

All the best,

   Wolfram


--8AxPssZN26NHQ2Xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhoz24ACgkQFA3kzBSg
KbZcUQ//drZRNTiKdCk+LPHa3Fwshs8S0Yi+IFWlJjoZhMMFHXMrWHRh11Vec2M3
Mh2x/9rp6MCevC/9nnzUcyJJiZfkYPkGNnkTTumZqZGQoR7fdFHxHEtH52im0M+Q
uYENYKl+e2dhuuc6eozV5kUFhrXH1uwqjJrdIvlgzEqfu4hU6gvIJjAD2/u1WpIo
Qp7Iqcxa+nVkXs5+5ZypvHZrs2UF+Epp7hc75OH5TFHBR33jn59Dg6VWvaosH0AK
7tJBzqKxb97jjByIi6IZKZC+CKVGzQrpd7jsmptWw8GcQfG1USWA/UNWgvOzt8xI
NtnOerSKTITXEAblEeeFcfKdzsWZanZi/f9ktPFb4TZ+MneuR2jrVGtuTh8H8mWq
X0CKc6+/EmGRUYQrCFk0FvJWr8yan978TsS+BcbsRoLE9GPAhTQxe3FzY53MJuZ4
Wjz6auo0n7Z69F/rJiHCuqRfnUqzmETuTCO53xn91tCwQUJI56/PhjZdObZ+fYKV
b//kRUznuhoYfgbDzRlciRw2QX5nzh068GDQDxF4wuniiOvbJ0fnFYqjorNJEmBC
suaBeFVo8o3U8PbO5fWYRvkxPb+ofeNogDuWmDNxVLPLH+TZ7aZ1PMSImBHDAl4a
0qEPbD1oVYjGvlcj1DPoEqUbKQA4EdGL6sflTrj/z+7CV7571HE=
=i+cF
-----END PGP SIGNATURE-----

--8AxPssZN26NHQ2Xh--

