Return-Path: <linux-renesas-soc+bounces-20863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE4B2F487
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 11:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46DC3A5C50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6879C285CB5;
	Thu, 21 Aug 2025 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J2bWGm7x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124119C560
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769784; cv=none; b=TN407tRWFBuLAGXIFcpzTjB9+/TcuZJ0t+L027RIw6xh6FmNXlm1epxBCmgxaxtjwh/VNqm0/frGhewx4ntGQ7xPcba/4Ue9MnslMR0aj52OeWNPz6x/xtOOkeqRrXPrFDPdyPmWMJFC1Oz38zuq1jvF3yZz7toL+ek4Q+5PzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769784; c=relaxed/simple;
	bh=KGnr7mlsNJ9SOoLjBMKZob7b5N+Dnsa+6ff9WZFvsvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISl+0VyDLPQc7LE5OVQoNbdYYs0h3j2G/skhM+S3J6oWBVRKH1W8WGfkchndjlOZmknJn2++SZHZhiuqX0UHtanWAaMBpzx5jJXx15dgmrNDOORmKZK4NfXMeppKclcdYbRf+AmvPYvcCaG/kn9VpG7hHc1elVYTrZAGGzosHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J2bWGm7x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KGnr
	7mlsNJ9SOoLjBMKZob7b5N+Dnsa+6ff9WZFvsvw=; b=J2bWGm7xe/lVqqk2bJKM
	aZQikBKT7zuo+QvCFnXTTSzE5Kl5pfFiv0e5KMDm38B/TGWW19vpBGUcgTkjd48K
	LuVQm6XrxNLNKKbyffFnEEaw87qlVIpwbvaQtObZrfkClPFlb5DBJujxMqKmbkcS
	aEjZN0Uej4KiAig7HTG8adMGqjrl5lMpSwpi2mSlXkbX3QZuB5hi+zV8pe69UPkT
	Vtcdx45HX7pUUqUmQCeQXpZGaRLZRB3WzKAyg7dXuHKq5N+aSEMB6cJWak7cESMl
	HVJgKb3cZNDWL5BYLst5nI2XAYEGbJ8Wcg6Uoqu0yNSpIwIlSTVzVrHXLkdYM+mn
	wg==
Received: (qmail 3463395 invoked from network); 21 Aug 2025 11:49:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Aug 2025 11:49:38 +0200
X-UD-Smtp-Session: l3s3148p1@aojxAd080rbUtcd1
Date: Thu, 21 Aug 2025 11:49:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] mmc: host: renesas_sdhi: Replace magic number '0xff' in
 renesas_sdhi_set_clock()
Message-ID: <aKbrr0I7KuTeYdNY@shikoro>
References: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Okd/WNIiif9UVfeC"
Content-Disposition: inline
In-Reply-To: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>


--Okd/WNIiif9UVfeC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 11:48:01AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Replace the magic number '0xff' with CLK_CTL_DIV_MASK macro for finding
> actual clock in renesas_sdhi_set_clock().
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Okd/WNIiif9UVfeC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmim668ACgkQFA3kzBSg
Kbbu6A/9HUajXMEY4wIt4hhluNYp7gc887lMKQ4NzKrOqXU+X9xgPsXvOzEPZdmy
3Hwdi+Kkae35ycVwRTL/pR5AAE9oTRmBw8TMgM4Ogyg5uNZjRhmEUPkzgF8Av7MZ
hvtHTz49//7CHQ6UB+hnNpKHOJsqQ3m5oiWwkkSkl3cv774HzItfldwf88hjW6Fi
4m/YQ7QjuRJ+n3wBuGWZ1ZhV2RihHGeHPtYQwC/T22GsqUiq9GcAKd2wFCfnuA6N
kr+suzGtbKPymRfYm4+O6lmCSDH6Vdxip7JSB4+NFjAkIvAcGt8e4rMjs43ri/d0
93I8chudB6hVD9rV3TPfGvbrYhcS/JQFQNTuwWrSrFs3jt3SyLeENSe1VyQwH0Dp
YLVKTcOVXx6fpIMB2O/eml4+egDKge8OirOnDdVXehsi1WfkXDF1CETFrG2TybYv
XHvxHGy4SpOScOe4Msmg/KsY1T+7mx7DdgqTi3BltjDxa6hd+0AcxDqsnJIeDtPB
i96xsnm9Y76I1F6WgnKKkVCQB211xtYT5AtL0mxFqGMYoA1+SnQmdmHdQ7Yy5XUA
iUKShltmESTVEIum622avla6OnfN6ZW6IcNjZ8X4nOKON1M6hLpz0zeKbvrlbqDf
N9Wu+9uqIRW3vtRRICRrw1Sq6e7lSMDueM0dbNkJ+xVYTHTMc9k=
=llvT
-----END PGP SIGNATURE-----

--Okd/WNIiif9UVfeC--

