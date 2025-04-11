Return-Path: <linux-renesas-soc+bounces-15843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D6A85C15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 13:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FCD418936F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB5020B804;
	Fri, 11 Apr 2025 11:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WCvDM6JX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF222127C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371646; cv=none; b=cnXXKJrl8AHJVYyPHe76Anp0SOv6TQbZpP+ddmnYgsML8uMW+v85nD4e5Q6VWpy10p59qI9Ar0nT44bliLz2vLmFKbwZuKgrib2mry0Ch2dvJUyDUoJnjcpNVscCknEbIE0IqBlY2ib4+42c8TdNjadZt3VsFZqqdGXoHNkMm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371646; c=relaxed/simple;
	bh=7D7DwKH4Z28/lnIj8g9PPDtM+tjAkRdvH/ab0w7e6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAhX0WXEawAg/yRp40nFWaUNxpqPMwPBX1V3gtaiB+8PhwhNWe9MUy3+lhW0KHirGwmDU/ELQGeUEvpd7PiTlLXZoIOOfQliU1WcK3R9Pn3SDNEF6PefdJ6Jmsc9dZNP6V4OuLVD0e+CDbcdVVW0qSnAz6NUQXNdPXrgIocCWKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WCvDM6JX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/y4u
	xEyL5puU+gIeFGFN1UxWPVX2K0jI9A2dB9O4HKc=; b=WCvDM6JXTBfcINSEgghX
	VY8rb8Dp9JRoWvMdw1K+XeM05MZYVqOJt/+WYPhHaQ2BpVjaA617bankzZEJ/pm5
	uO+kdT9dn9gUAcEHG2MGx6uQAY0J8obLGTTAB8cEuvmHKQ+DkGa98IeXKL6msB24
	v+e12OE3s2+zzlIjQdsTer2Wvuk5kuP+FNYjk28dXJ/2F7oBPBu0cemSg55fsOzs
	EY7EumEDyzqYqq/2n7tK+MW1g9XdaI0lcfIfTy37cky3ScZJ6V1khFWqlxcMaYoS
	e4XKRZiFdvI9sY7xuw/guNLxLMtEWuEiA+XAnSbozsP9nu+h1k6UP0ZpikhdgjVP
	3A==
Received: (qmail 1279329 invoked from network); 11 Apr 2025 13:40:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 13:40:39 +0200
X-UD-Smtp-Session: l3s3148p1@UJ/oK38yaJsgAwDPXyfYALbiJ46yNPq3
Date: Fri, 11 Apr 2025 13:40:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 LEDs
Message-ID: <Z_j_t92QksnSjg-c@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
 <20250328153134.2881-11-wsa+renesas@sang-engineering.com>
 <CAMuHMdWO0662Qk7BxgMW8nr9OpP-mjPSxYKT6Z-pp+syacrtOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mn4nbnL+OdRk3A5O"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWO0662Qk7BxgMW8nr9OpP-mjPSxYKT6Z-pp+syacrtOg@mail.gmail.com>


--mn4nbnL+OdRk3A5O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> These are called LED1-LED8 in the Board Setup Notes.

Oh, where? I have a version from "Dec 14, 2020" which only calls them
Software-LEDs or "Port0 BitX". Schematics call them DBG_LEDx. I don't
care much. The "db" board has a "USER LED2", as long as we don't
conflict with that name, I am fine.

>     color =3D <LED_COLOR_ID_ORANGE>;

Hmmm, they are definitely GREEN here.

>     function =3D LED_FUNCTION_INDICATOR;

LED_FUNCTION_PROGRAMMING?

> Perhaps you want the first one to be a heartbeat?
>=20
>     linux,default-trigger =3D "heartbeat";

I recently removed a default-trigger on another board because it was in
the way. So, I'd rather not.

Phew, starting with the PHY LEDs on this board, didn't know LED were so
troublesome...

Shall I resend only this patch and rebased on the keyboard patch? Or
resend the both?


--mn4nbnL+OdRk3A5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4/7MACgkQFA3kzBSg
KbbM+g/+JA9RSj8/Ajgtvn9dNlrwyMvp+0eIYiMKujGEpEqPlbxnMSxTcpEBQHzq
9bVqKlXLU4vhg+IgjXdQZ/iynt/yXjOHY7BSd4LWOWm2bg/eYqNBiSPprTzJl2Cw
ZtH15OcBuufGAXgOrXN+zGY125IkflNjvvg/bbDqZX+g2+rc7FiT8+GGp5CjqY+7
G2J36wDtR3XHRmWSFl9vYnV1qxYX9cizX7IF926c3E7SLmLAvSZwM5RHafG3iaXS
osdTx09Yn8frl6Q9xsVkeSRawfyq0/iW8exJQqG3ZzxewZsxezfajSpJ6U5/RWut
9qBGJ9vfT15HY13P7qhz7zm7UgQjDLBNnsyEmkVVwqLW2QVc5l3FvT3N0AMVNTJK
lMis3hnvqyioD4fCWXSj6l002dNEGLpF9/M1JiISQaX8146fNADQzYogPfvZqzn/
a8yp2WOwvmfZ2IyD8E2dUVJ7cVUCwGn26DuIYvAc5rtLWOzTJ452sdLxRtcOSAeB
ar6z8GPfAiXageEwgLjhZAeGKk88pQIRnemFkhADnPoft4ICT1CfNF8WqGcKvoHo
5zMLcsgWQ02falfcxncwhcWsxsXMZY/8oa1OYav9G8CccMfK8mvg8Uwoqs/Lu2n6
OTMnEiayLdsOwO4TnrADE8Kh68n3NiYkPIpnYED1M34QSRaFl0g=
=Zj+I
-----END PGP SIGNATURE-----

--mn4nbnL+OdRk3A5O--

