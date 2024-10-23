Return-Path: <linux-renesas-soc+bounces-9980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5119AC069
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 09:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DB4B249E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD31153838;
	Wed, 23 Oct 2024 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="De5s9PI1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33804154435
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668929; cv=none; b=X/60S/QblMR2K4rraxQM/JoUgTyVgu5g010GgULVTfevosdAhDz/hhPYjrRANJEXAJq8GWKa3YIkny0ogAbfb+WjjzqGQxbndexQdxEVx4TaT+CDUP5cSziXJrK4HymL6TaNiKgroHK1+pGg91pj5oCs7gJiHc+RoiBy0n6t/Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668929; c=relaxed/simple;
	bh=CJVCsjtmqlolvP8T95op5e8Bp0jgk8PygP4uV0ofk9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGCOABPeJHjvderZ+9CH69pw3F/TvwQ3XAYDW8QpMQYX2RzigIcHH/eqNE4W11fCcE8wqBk/tmBnnQH+GuHGuHAFLA6NO2uG4dEvUg/XmYqfwJitw4ZhDxRIWU+ijsij+OfAf8ZI6f2gVS8DM51FOiMcX+ol+i9+gPRTg7Wqr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=De5s9PI1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CJVC
	sjtmqlolvP8T95op5e8Bp0jgk8PygP4uV0ofk9o=; b=De5s9PI1MT4+HbEb3x1x
	7fUrYa/xRp5xH5M21z2/j1Xo1gpCeoHWKUTKOPcXqi47hB+AJ+WV5tphSK3G4Qiy
	jm6JVpL2rWDIO+Oalc7ClQgJ142N4mCbI1+m+tKzjzP00L/KVmvJkDSEw+e2jPwR
	VfDsJFNYX8bL3X8zhcKi0TQpeWDXeE7eC6yoy/VfcGTq37DzAsXQSZhiL3prnUOv
	IAgxgaR/BPLmsN/b9kr1/7Q/5fnnli6RlJXPEaQ/kdfxeAEEbKQnwWElhtvIoNmh
	4iN6KLsd4QQT62oHu57N/DRKGXeZcGOikWQx8rw2474KPNYRZO7iInlYDz01ZTqI
	jA==
Received: (qmail 799147 invoked from network); 23 Oct 2024 09:35:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2024 09:35:16 +0200
X-UD-Smtp-Session: l3s3148p1@5vFW7R8lojRdtTDE
Date: Wed, 23 Oct 2024 09:35:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: falcon: Wire-up Ethernet
 breakout board
Message-ID: <ZxinNLKFW6Ijuyc7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20241022184727.3206180-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="38Q41HeGmQ6GBwDM"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+4PdxnRCzr7fnHnGYiuypem1hYMbXLac+x2db7yfpkA@mail.gmail.com>


--38Q41HeGmQ6GBwDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Are non-v100 variants widespread?

I'd say nothing related to the Falcon could be called "widespread"...


--38Q41HeGmQ6GBwDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcYpzQACgkQFA3kzBSg
KbZMDg/6Aw4oPvWH4LikPufRbfzwrvo7zCwQ/4NGd3utm4Owpwed/SmmAfYrfZ3O
aXw028EmBc5u69/dH6p26nQVaMWXkzNQg9KLwcjBScFr0ArL8tVMRAHFaErpVA6v
ymI9dYHlSXZpSUfkjjem1e4le2W7dgzVARqBkFZdRl251O0XCpIp6Wz6fmwNfovT
KEWKKxTzhJ5Eho0zSNwM5OWDcaxRnFXuK62sygNwik4zJ2OiwR42Pj10YsVbw4mZ
5o5VabGZ620vSzxvjs3fw5g78Yq+DfBKr1T0myAd+ssidItxIR8KeYIWlGxwkatM
kZyUyTnz+FPgQvpiw/tllZN+a12Yq4nxuodN6M/rb99jMT96r19gnuZc6qm/W0JC
Anm29WSSUoM5NkXOmeYxs6cfjnDvPMoWfRWm9PUsZPmKUHM0VKf1SNSIH2VH4K/E
S0NhHj4qwn5MSb5+gIjTf6nnloXnZ83JMkfl9UGPgpzX31rEXA9Woi/bSfq3DEEX
PRoxndpt+xAjlGCKlmL7sqTHUkxM7FEwHxJc2iOZUrYNqz5Zx4CMsTsjZrIzGgbt
jwNmfKkA+POh74P5E2pE7jmqz5FjrQ2RpxbdpbMHS/u1sB310nrd+rm8x0p5J/sj
vwBoBCCAfMuOaDfM6d3S9aX+H5HfgZwXP1OMNIUkoIVbpNNk5Co=
=jSvi
-----END PGP SIGNATURE-----

--38Q41HeGmQ6GBwDM--

