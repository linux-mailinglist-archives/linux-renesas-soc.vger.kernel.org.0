Return-Path: <linux-renesas-soc+bounces-2982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD685B79E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 10:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDCC71C22214
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 09:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE355F875;
	Tue, 20 Feb 2024 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UDNwCMhv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5C5F480
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2024 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421696; cv=none; b=eQo0jtf9LB8KLjJoj/mCT3pSGtam5BxKdlChKoxXaxF98VHbLQb29eIa5GhzjaoRMbkotMvQM1dueJc/iJlvGRoBlviNjevrWCT4mQ2c3oeCe580jxaXH9zwKQbSPfsPtUZ4fKlSvWBnalqA2rAKV+9YTe/+HyJdDRQYs5u8XE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421696; c=relaxed/simple;
	bh=ubBmdog1G6r13px+LgWtTYrjoS/lNCUCCesWZnqdIwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irwrYJYDNGwk53z1DGWCdpRL9W0Qci4xuZOqfh7h3o5mKg3yejktU/znAKS9jKqMI8HIiDrVWMTr47iL2T0uCsoJL1G/bMhg4GCYEZyLl9D88l2hizsmtE96OES0Q5fLXN9KKk8d+oWuKxwBBmLV5U2wrLdqjlYtExLcNcLQgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UDNwCMhv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ubBm
	dog1G6r13px+LgWtTYrjoS/lNCUCCesWZnqdIwk=; b=UDNwCMhvdGYQvpqfnj3T
	dEjjeWVu9h7a4urGwSMIT+WkGTPigFPawyu9wqgzDDLlnUaiHWv0tNaqZTDBUXHW
	aPg8+xD8gQ20VaV1FPs3I0S88LRWcKm4ql5pPiu78kjkNaythn90SMguzgsDHVOn
	uLj20RrUMsdh4zqNa+FEW7H1qqBc5QAPAPxTAIpa/lAld57Nlfsz0gQWacSiSgZi
	wMYwCZNgsZK+FryuH2kBiIu51qlPHnt6iraf++70y0W7H295f51PQW79iyqfbeZl
	XhEYQU8q8VKWy7pQoOG0o4bw3TTF8qQeK08j+ldFL+rQOZp6m6MGlezWnebPPDry
	Gw==
Received: (qmail 3222328 invoked from network); 20 Feb 2024 10:34:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Feb 2024 10:34:42 +0100
X-UD-Smtp-Session: l3s3148p1@jcmF68wRMI8ujnsZ
Date: Tue, 20 Feb 2024 10:34:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] [RFC] mmc: tmio: Protect the asynchronous usage of mrq
 by a lock
Message-ID: <ZdRyMgWkcwLmdesl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20240220061356.3001761-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mldc9CCWIlyw7q88"
Content-Disposition: inline
In-Reply-To: <20240220061356.3001761-1-dirk.behme@de.bosch.com>


--Mldc9CCWIlyw7q88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BUG: KASAN: stack-out-of-bounds in mmc_request_done+0xcc/0x30c
> Read of size 1 at addr ffff8005df517738 by task kworker/4:1/2308

Do you have a reproducer for this report? I.e. can you say that this
patch fixes the issue?


--Mldc9CCWIlyw7q88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXUci4ACgkQFA3kzBSg
KbZZOQ/9FGRWq9Yjv1nvLfiLBubiQ1ubD0XwtwdTC7vPf0LVq4ESzNAx89KrwVYN
akIfOFAeEjl7iZXs3DDxnWemzC4HIEajxpQa8D460c9eKyTyr1k8gIYUNsiscy8N
hzy59KJcPfEkF+0Ef4HUhfhLKXncOBhwqZJtw/AS70fg7Vu/kf5uwDWtuuEGOPbM
DSf6+vrxP6AJ/8KElFRIx5s6FG8Sx55rI6BOnUDhHW8uFErSNvM5fttsjyyydMSE
INJsd/fPd0/mho1++oQ3Vjs+BzTZYKmY7odIQFO4AxYqZoIwwz8HSJgw+KUmeFIj
hCtGz4cCfqASQLKoSxwuYM+rRgFkOhqiYCkDSMTfTh/Cg2r9/BpcajqAR1muY5Ru
FqEmP+6RMG6lrcWrAacvMK1OmlDlsz79PDbfpSzi6bTjRE2V6UP1wFKAYx3fSQEw
wDJ7XZnEoV5mRwz/9O6TDSDzzd2P7FI6svuqQmLdbgTMCS6gJGlgHmWryyO2ThOC
ID/hoyVThX07NGaptrfxlCBsw/7TE2SxC/VwV9EcwxeYWKlRuibrMEXBrIuvuXuG
u8Ii2X5Qv/HbLWSfM9OYEYFUCCu+YrQaYW8k83SQ1PRYQIk3hWG3pBW6fgSkc25i
YOhNsB85jspSH8yQGai2w1HXmYBrWqqqwik+MVDxpGi7A2sq0+c=
=Z6br
-----END PGP SIGNATURE-----

--Mldc9CCWIlyw7q88--

