Return-Path: <linux-renesas-soc+bounces-1876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF683D8FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 12:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A4322859CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF77134A9;
	Fri, 26 Jan 2024 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF71ulct"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927051AACB;
	Fri, 26 Jan 2024 11:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706267108; cv=none; b=r3hzDGADJ5vccDJceBptKr5GREgPcr+LID/hRQt7CENblQIpilBnYDhnxGNtRVwPubIkpckSJUj9HgE2xfu37DTRqGeDLMTbdw6rgn4Vk5s8JXPpN5U6GUtR5rfr9hAWvw1wOrKaoFNhnzDaaQWPY/76GbVAqNTM/d2QGJWcrgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706267108; c=relaxed/simple;
	bh=sKKBwRhVjDDSpW/xrhUl7xKSnnX9RSDLylyguVsoENU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxOyjImq9UPF9WMP/6bYKORER2zApT6udWzC46rxCMXtbZH3YacswfYud3xWA0LinGylwpdeGVSJZtO8+U+Va5EzYNp9GgmA+7xZ0SFqkOcqPsgIGDdzZCW2MS3I4lxoynx5cKZHAX/bff1XPw12/eGK5GXblxSjF1uoqRM4tKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF71ulct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CD6C433F1;
	Fri, 26 Jan 2024 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706267108;
	bh=sKKBwRhVjDDSpW/xrhUl7xKSnnX9RSDLylyguVsoENU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF71ulct7TkwjD4J8g5q0DLy6JRwVjjPGuR/h9KYPTKSU1J7RUYNOvvsu/K5DN+xM
	 Y9a2Jc1QAy9tMLYNL0Da48HQJw1i7sxgd4jae89kizsdqZ0r8C9JnUjrCpCmKWRfbI
	 OpFm1MlD47n1EXRNISQasgbWuwS31ZcH5dWCbOeJUfN8Ul12pTxihkc/x2oxvCMl59
	 7TJb+OE768ZdzeSkLY3RtvR7uvI9aOVqT+UV2ukO0fO2PrCZj91Oe9zGPtB+d9ZKPm
	 Pi8+IqXMbWuAUcSJ/ntUYWTvSyf94e0oRsO64ZRPtj22+w8FhVwSuvt4rakSyAdkhP
	 c6uUPdQSDBveQ==
Date: Fri, 26 Jan 2024 12:05:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/9] arm64: dts: renesas: white-hawk-cpu: Restore sort
 order
Message-ID: <ZbOR4KI6owaqtXMP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1706192990.git.geert+renesas@glider.be>
 <f375293d6e21659ee30a86e2b46e4998a75ea3b5.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ksWrmbRuQDQ+aNjb"
Content-Disposition: inline
In-Reply-To: <f375293d6e21659ee30a86e2b46e4998a75ea3b5.1706192990.git.geert+renesas@glider.be>


--ksWrmbRuQDQ+aNjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 03:48:53PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>=20
> Alphabetical by node name.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

You probably want to use your "+renesas" address here when applying.

Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ksWrmbRuQDQ+aNjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWzkdwACgkQFA3kzBSg
KbaH4g//SfTLwkRzIaU5tb4W57pg9entgqrBAvb15Doxcowk0U0Y1SlktKlvuAqf
WdyPI8ATJvC3k0uXNjtF7nqCWT5fbYsjww5e+TTtg1H/tBBPSWHmlxNBFUELPWk/
NIN/47iiV2uIZaNkWHrRNCATHZ/ILXVn29WbLaXfO+RhpEMeh2zZkutLN3xiXLv4
xjFr6zmehii/MHc3WaCJthM28f+wEKcmWJQ3DSjeKzmiI3ElcFM4KnTYjb7DBXx3
T4rC2mPDbf/eadvqBvj8KJot5shgSSMuy/15cLgQqN8f9kmxBauTIT0o1qKaAIR9
DVfS5ptkYojuFcb0E+lrCwXR74qcrhpRRoutOLbsftObbd00DBTWBddNHTrrMDuZ
p9y1OSGlmCMYdl73h8jkeB2jdBY1MIy9OqyHv1seJ3ZCTbk+GG3yO1gyCaENEu33
7gYWEmQ+ro8/praZnVjMwDo2L32xDNamWf1KiDhyC8HCVWwZvvbl344kZjctjwPW
JoodsWRttskS6hyd3bMnzynvPxmPj0V3J+a+kXiq0IIYfEeSzQi09jo8t8FU4T/v
qSzFZ7mOlwiZuw96rmtEiKm0pxZbYasEc1KF8TfTROXjpoG/ahK9UyQYfv2nwfkk
3o4aynq4E7ZT0XezIOeSdFm8wqfzJuaqlJgNqtt1Mk7hTYiPvws=
=izkY
-----END PGP SIGNATURE-----

--ksWrmbRuQDQ+aNjb--

