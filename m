Return-Path: <linux-renesas-soc+bounces-14532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8522A65762
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 17:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B784319A018C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 16:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90EE18EFD4;
	Mon, 17 Mar 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iJmaqqMc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9521149E17
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227139; cv=none; b=JQgI3b+Qs16FaO65LgW5FxzyNwnN31OMh+oOaQ6hML09LCcq/11sIRpkYW91vUlcs2pZ6/+gJxmROrdG3Wbl3JCjv+MlWUAqXdRoDHpj4h3r8kAQxEOrjCycqLlQRLrYgaVY1YA49QE2rtHKYFMrcqKxlYo8eRsylkefbuQt904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227139; c=relaxed/simple;
	bh=KCk9cSxHXqD8IIqoe9s9xRJepBH+f0h1cnROsN1nLFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS+bDA577Mz7d0Ck/Te0D9bUhQVHeipkUm9QNFWltg2HEO4t7w3EIpKpTxv1zDTEvzOj1m0zjqaPbWu3jZFVq1zI5L6pfcR+07h2lKTVK2nPqJUJ/IBLaBRTMsj+lMGAGF2RGu7gduxJQz3L/aTcq/ZGzxWTk7L/V/A9SGBwV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iJmaqqMc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KCk9
	cSxHXqD8IIqoe9s9xRJepBH+f0h1cnROsN1nLFM=; b=iJmaqqMcIhw4RkJ+pu0l
	dP2L2eiZjh5yXVlxp0Ud95Jgw8PcJwyrZyWSj9NO/PwoZ/p3XxC8sCeki5aKUxiS
	cNJcc09bBAIGmOEVKXG+mziDx0tbPEvPf6Krq2tKLxxbhRjH8f0rrXnvyRO2CB/N
	pqbFfdWv9apK9QbkFMI3K0AFYx16YYlszakl4aAm/zNQPEmn048WsVTnWy3oeWsW
	RdAgOSrqOPwO63UOKInMdq/PR+zOIMmnbiGwY3mOUA0tr/QTRV3yAAgPcyCI/Bb+
	6I6k2yrEUQfugnpyXj9ZCc+phGCovnbWqhsYc+cVEpDfGohimZHc0YigusFnZeqU
	aQ==
Received: (qmail 3245153 invoked from network); 17 Mar 2025 16:58:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 16:58:55 +0100
X-UD-Smtp-Session: l3s3148p1@aeuE3YswqoYujnuL
Date: Mon, 17 Mar 2025 16:58:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: use proper ordering for
 UART DMA channels
Message-ID: <Z9hGvwrfXz7SGxcW@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250317120356.67609-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdU2eFVxWnSgdKvA9qRVg48mHzh59Ok=ciCkD8PAsMUnCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M+vWMXKi8kjfU4B6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU2eFVxWnSgdKvA9qRVg48mHzh59Ok=ciCkD8PAsMUnCw@mail.gmail.com>


--M+vWMXKi8kjfU4B6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Looks identical to commit 5f7ebb81112c3f50 ("ARM: dts: renesas:
> r9a06g032: Fix UART dma channel order") in renesas-dts-for-v6.15
> (next-20250224 and later).

That's what you get when you think you are the only one working on
RZ/N1D :D


--M+vWMXKi8kjfU4B6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfYRr8ACgkQFA3kzBSg
KbZDmA//fWl3mmwekpKI3x/vTM3LexvT5VkIgbGKykiRgJypDruReaftX9ODNbz2
6MTXWdn/cj1wUs0Hs2p2puMurDtm1vEkS/C9s/DlyiQe3BfIL0RnpgunXXYKrGES
AbWQZ7tPl2MV4J9Uj6FbbH7pSys+6WjswIb2qZDavokgzmio4wpJ9dUJ/8vcYYla
msEz966A0vzmjUKHBPi6K32+WPQXF9so9UI4IkQRwpZj4WsgEIYJFdd4mpfulMVg
GEyUZfFq80BDg08Xg5LGSK3S8FlFHAcVxOqouOR+RveF910jjv5DJ00NXMGhkkS4
2hL2Co/MFfiTyoOFKb8FAZLH56MdzBSadHQYnhZWe5jE6U4hS2hu9/mFhbiwEh1+
zH1pT66HJsz/wET0rBJSfUfvRVdU8yMiYdjjApK839qrC21F8lZ8tjufqZmjFAJi
fea4ozo7qlQDdFLzksW9O3no3P008/wqPpC3u4RfzKy1V+UnJEPtj2tydm0O6RNW
J2zF7de2x/5aoVBR+sHn5x1q+6PK1ZQWKkP4BInrQIBrWGdYKNxoLgDma6UiXe2N
BNZLNxLzJ9TrAroK92JmP8tISG2FhBVQTJy9UmOr1U9Udq+GOx5CU36lUSFu5zvT
UN8bWN6IUr0jgXX2xgcYoMqHxekvxQtN5cY7vgtgZ/lnnxfLQDw=
=LoQc
-----END PGP SIGNATURE-----

--M+vWMXKi8kjfU4B6--

