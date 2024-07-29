Return-Path: <linux-renesas-soc+bounces-7604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233693FE02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 21:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A4D283668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E515A87C;
	Mon, 29 Jul 2024 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jl3nEfUi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87E189F50
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279627; cv=none; b=Tm2newluXv4FbxNqgIVZURKoO9YwcIzERtq8VveAYln8CPkCaEYf9I5XS+kEMs49DFxRaOFqmrjd/RdWBsaI69UOIW/dzIIm3BWj5YBa87wqoXB4xoS7Ku+rvFEoQc2AQylUswEsb7Z/pRUteglEbETmQ+6PeE/Y7YZDYOgZ/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279627; c=relaxed/simple;
	bh=s2CPZUm4BaOV3PmotdvpX6kcGEUWy+6SWXePmrV6yZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnOa05/v860unNAyqWcfxjxYsuu1CqONUNliagP878r7icJ5czzswzO8IRI0kLGEI9t8HwiiSzlmVzflXOR83nrudvrHIZU89XAx+tjlR01sbvJKOFTf1oEYSBen9j0ej0KhIabiwLSVJjtQlecDmpMOONa7mr/haNcXKNUYRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jl3nEfUi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=s2CP
	ZUm4BaOV3PmotdvpX6kcGEUWy+6SWXePmrV6yZg=; b=jl3nEfUiQo1ceuAmPhn+
	1hP12hTGmm/CT1hdKSZZsLumlZ/xVHAbfzDIJQG7li2zXGM1uwIvZqfNYFmhkmNM
	FHJ6QUo+70WS5xQa4DGoq3hcqWJnGsI5x2/+Hr9z/owEMEqXsDkUcGbmbhk648pz
	3WEc6SPNL2Lc3O6EUreR0W3ibkLxbwoOdJIRZ2KVUdCcfvCYJ6X6iJ9q9HZa1Zw9
	S1pmynQx+bfexv1XcLDMxM0Rvsb7k4osTTSjY5Ro2daEt3P7+V630UvhA89LiwVJ
	PqB2Jq+GHKfGyAIIvS0UD5RIHMegypX7sxTgR+ONXf/md1jfu4w7pIWBnj/pgrzi
	9Q==
Received: (qmail 4186847 invoked from network); 29 Jul 2024 21:00:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 21:00:22 +0200
X-UD-Smtp-Session: l3s3148p1@TmgOeWcefSFtKPNb
Date: Mon, 29 Jul 2024 21:00:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH RFT 3/6] arm64: dts: renesas: r8a779h0: Add PWM device
 node
Message-ID: <ZqfmxPPprQMWAo1p@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-11-wsa+renesas@sang-engineering.com>
 <CAMuHMdX44RD3LLB_seZs6tkGyCxg8rjFyhd6zkrZMx0GWJAAyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="02eJFdhcH+6va7lD"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX44RD3LLB_seZs6tkGyCxg8rjFyhd6zkrZMx0GWJAAyA@mail.gmail.com>


--02eJFdhcH+6va7lD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This patch adds device tree support for PWM/TPU on R-Car V4M (R8A779H0).
>=20
> Dropping TPU...

Oops, right. Thank you...

> PWM1 and PWM2 are working fine, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

=2E.. and thank you for testing this locally!


--02eJFdhcH+6va7lD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAman5sQACgkQFA3kzBSg
KbbSWg/+KXyaFPAidXFgWe853Se6Qv7j3X2RkWmCmDk3A1EhEgJeJgDMuucqldmN
jRCPrI6SlvgkrufXZEb5grKM4+bzjErr3npyWcFEqHys8F6Ng06KuHpSdHEWwZgQ
7Z4KaUytiw10VIyOw+9qIwJfsQ8nxNcMM6rw4Sfd5eHTwMjKfiuyYCIiI9oDIdSN
y0CHGj+lfcpavA7mgJpmB5wW4POcxZpcEunGfVK8YhHqvdzyFcQyFROkaqhJbVTe
L3vsmnEoKpyR7GrXd0zZt4yy0KU0fDaV9/qCKNxl90K8mQ8W/Iw0HLG54xcLPWDo
hpd6dzx8j4caxFbKKLGUbVfV+fN4ilxWagHmG+2TIPDGZdTbMRB43JJ1y3PvyWpV
1nRxTNL275AUbRHNwP3VG3yiOmmOzNdKf43K5e3Q7moBgUdAqzeFUkcPi93cxlWe
S3gGykkidfSQYyjNzBlOSArgq4NEG73MSkmCcRb8LmN57ZGq1Yl6iL4ArMY83rCx
C7HbcDCTR5jIFAfKSPyHmlOfS8hftm7yMCHeLtwriivgr1tZyaPD4E64O6/HBgv1
2ZslCIBSIXSXAZca6cRRLhOM0WrCM+TO4u0cuQ2OPDQyo81pUaiGCHxZtXlaEcOr
5PqIRE4l+SP4R4OPxRrcdQJkdGHbH/cxtnXjHShLKiS4LGRCtoM=
=3qM6
-----END PGP SIGNATURE-----

--02eJFdhcH+6va7lD--

