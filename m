Return-Path: <linux-renesas-soc+bounces-15842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74672A85A4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 12:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CA19C1EFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8124A27EC9D;
	Fri, 11 Apr 2025 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CYvwwGY8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E630204080
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367915; cv=none; b=bjUcEqXnk+K9W2zSrO0o//RgmVF4U+V6uk/fCStPxfbVUIjfeMuk7bENpBtcbpblsnhaogaiYzQDNKLXaRvm+D+1piskYRp94bsfHNbeB/gPo44pVmXjjt/bK5N82C/90zFE9DOEtQVogSQkCxmT6unm8iYKphZaXVvDnklrP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367915; c=relaxed/simple;
	bh=LSFvTnNTsbpJ9swbTsXsXWuYKH66fTIbQ3NKlbX2TmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpiihQTWiHLn/46P1qqeKfUzM270hxeUoKgne50JVMk9gZZnmSX5i4Ko0X4d/zHE/LQY7y8cG9M5lmRYEvh+SQOwChZJcooByWhyFEit0j173LpQmYVssVgv/oJpLmZm16rJOQObRnzn3/PWaDXLF45e+/HYLOfUXlEdPoP4SfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CYvwwGY8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LSFv
	TnNTsbpJ9swbTsXsXWuYKH66fTIbQ3NKlbX2TmI=; b=CYvwwGY8fapqE3k4T6vJ
	kfy0MIemphfYiUMP85LhP+Rzr8q+Gf7bIuCDSv7kBoGT/eVwUq9+3AISYnn57lxB
	/owSIxAggWXoLxP3lK61qVx1ZxIgQTvnasVDwo8nh7G0BDPEQx7j5wmGBV5RXyTF
	QuE8zhpMpbW2Leg0gf1WRg/W55ku8Qd4XQmHxvEgtQD1IFTYM21lqBgVNuphPHm4
	WRRkh4DK3RjyEPj48JQNIREGRsw8qcM6Fo03jExRpAMpkm4vJ2hG1ZvJR3YBeNWl
	jlbJMm4hIjXlG1CH6hiTGd2RxJd2pAiwC62YnU2RAMOfqMz/NpqlP0wLqFY2kMzC
	Sw==
Received: (qmail 1257912 invoked from network); 11 Apr 2025 12:38:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 12:38:26 +0200
X-UD-Smtp-Session: l3s3148p1@bcZkTX4yvsYujnsS
Date: Fri, 11 Apr 2025 12:38:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board
 device-tree
Message-ID: <Z_jxIV1Oavm2J2wq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
 <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
 <CAMuHMdVs07oLC=rch8qvgdaLZ9oyPah4UNaXqteAJPpK1G6POg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SDJIJ+gmpVbSOkxP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVs07oLC=rch8qvgdaLZ9oyPah4UNaXqteAJPpK1G6POg@mail.gmail.com>


--SDJIJ+gmpVbSOkxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will fix these while folding in "[PATCH] ARM: dts: renesas:
> r9a06g032-rzn1d400-eb: correct LAN LED nodes" and queuing in
> renesas-devel for v6.16.

Thanks, Geert!


--SDJIJ+gmpVbSOkxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf48SEACgkQFA3kzBSg
KbakQA//dLcHMf1flK8numBv8QKSOf36e8peyc6be9wP6VshVho3MkJR+4UbKHiU
x52tROipe5rZ7+QlM23WSXU9v8PCt55BeS9OTlIiHOvb11xQeZk/dmNejd2WZVGD
UoDvu324Ae3iQM8mFA9b9hKDVbNEYYSZTIluv7avhPGG122J2IhTvg+PPaS0ig9g
MWGtysg329sboMLQrMjE1cAiXefhFvyPWU4TzXHGottNYK2ArFQSb6QmTOS4WdMs
se9666q5hKri4lZMnnoAolpQufvhuwufKB7VHQny0CGg/NtEWZcozeUcFFMvj6UD
Zpqw3vxOOdGrGCbY65aONrUWmJu4JeswdNusDc2yAAelh+jrwEJWs4Dpb1a9cZf0
OINJxDpBtLO+D+PtJ7pD0+l6/21t4JzX6VqtGh/5rxWdxNN1hjP2C874ybbNbXjo
uiTp6+924TYTy0c/qFnYidkBZpnc98+O5y0Ecbw7Bf6eu8eirVPEgRnscoUVF+cE
FINXF/ZQwzWB9qPzq1feVKnx2hbhWZYCsv6In2t6nE0AsAyAV11303q3RHAvXFja
YqYhusTbDnZTBAT9hC6ZOhbBBQwtOFv6mO0FmUz9zJGeqsDOf8/xVj/qBVtxXgWA
/f+ZwBFqWYgnxEbsysHmCqrPrg9KSjWadyFxchWd5k6TIT3AONA=
=shHn
-----END PGP SIGNATURE-----

--SDJIJ+gmpVbSOkxP--

