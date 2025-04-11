Return-Path: <linux-renesas-soc+bounces-15820-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA807A85453
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 08:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB4119E64AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 06:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6334B27CCEA;
	Fri, 11 Apr 2025 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EZyMv8uv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF327E1A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353526; cv=none; b=nl1sxUQaj6jPAN4qGaYKp7X8P2hX11sZoBwpwVQjpb1Et0m2SwPfb0DjZAf9CmSknY+JZQmzQdCODS83wd3Jhytp7vYePZkV7cOehoT8WBNqJNCE1AmCKzLIf4jqDq+shvT+uKIgxPyB6iekLYLLqml9ZV46k5GY6qCpaGBw9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353526; c=relaxed/simple;
	bh=/r3e6ANnplQZb34XqIp+ha7TLfJpSOt+PW0RsUwC/AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4U0URm22xJbFgsNXlCbygUczf51MACWZjZWnDld6WUS4vDqzv86w6XXK+/rl1ZfX4en3AH8W/tUfWZMyforP74N4t5anIbqziYCuRpfmpY1WmrhbtKDDtVkESdpSaP+PB7UtDtZM5FyBeXxvT7Vj7/ve35k3s5igC0o9NCBDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EZyMv8uv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/r3e
	6ANnplQZb34XqIp+ha7TLfJpSOt+PW0RsUwC/AU=; b=EZyMv8uvZMwwIM2edgWQ
	+IIq5zxZo838XmXuznjdIx7M+ga6uA69GhOBjV8m0nuyPeEBfyW+rPw/4er9TxZI
	kOqCbrZuHYsi5LwlqgyvWdXfu9YeTLkHX3IGOeMjOSJmtQHoMtt6XS61Sji9WmTO
	v/B3Zsum9l+g+iNeqKweTR/eM2Mg8pK1IrFdVz5vFEf3rWCIPDCuiallX5TW08vO
	3TYPLHTGrCI2Dk1t9+khHsCjvRo5ELnDYXQlwooG54rLgMQ7LhiRZ4Qq7oGXPHM1
	K4Aq5I/Pca8OCXTHDDGPuMOGIusoJrWo2nkBV4+8byfw5gPzV9lw+fx0MWaI2RR4
	Jw==
Received: (qmail 1169367 invoked from network); 11 Apr 2025 08:38:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 08:38:39 +0200
X-UD-Smtp-Session: l3s3148p1@L3Pd83oypp4gAwDPXyfYALbiJ46yNPq3
Date: Fri, 11 Apr 2025 08:38:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: rzn1: add optional second clock
Message-ID: <Z_i47pkkUayLm22v@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
 <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com>
 <Z_gozhmIeQiPScKK@shikoro>
 <CAMuHMdURcyViCd8EhhAZQjgx3vfBWBAmhNahwA8qoa_G5tPm1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8zvd0hdnVmtpJ5ER"
Content-Disposition: inline
In-Reply-To: <CAMuHMdURcyViCd8EhhAZQjgx3vfBWBAmhNahwA8qoa_G5tPm1Q@mail.gmail.com>


--8zvd0hdnVmtpJ5ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > If it is a pass-through, I wonder what it would gain us, but I can do
> > that if there are reasons for it.
>=20
> Let's go for your solution.

Thanks!


--8zvd0hdnVmtpJ5ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf4uOsACgkQFA3kzBSg
KbbI+Q/+IUkTDtv+Mt/GR1mhW8Ia4ETN4ZgvsLOPhEPaIfOvvk5++Mv851LAAjo8
XoDBKM+GLf86ElEZ9rFKCo25ubun+o3Hnf7EE34KnEUcjl8MTu25fPE9H8GzuOcn
LsaEJt8R0WIMv4pV5Ft6Jt1DZ372hE/XpnVPNIcY5XpsbK8M2T2+TVK4Q1CY9+n/
yMe9iStXcIvltEgwypgINYNl81Wgk9oFA+G2rbKXHzHnACfCccavD/Q4H9KC22ab
R9PF+rI10kf58ic/hE69af8xu0C0jySYnind5s6aZH0pSbgXTPKZ/FUgWzv4axC5
lIpAUYbhQ+x/aLW38dY9Q9iG+Noxk01jljPQxMLu8Xnp4tzoRMZr8nxxHQOcrqt7
gqA9ln+kqLHVrCzDnE4MhNteE06hFdDspo3ztlUbIm8pnInhyD8Fi7U54NCy9GR1
07Bbr24TOxIcVRpCMsG7ZO+0Xq9tLlyMOV9WtJQiYgAi/OCaYlHcBnXZVDBJAirs
Hs9QD7OCWsAY6smYMXDF6B3wRLPjv9ud2U5m47GKCaclTw3NhH5FZ2PQZMy9eoBp
Ec5VR+dau5t/31GOB+ElpGiS9VyxTB1tdQc1dY3EiGhFdkNDmLqVpKHynGs0zTwg
/43efUt20Jr1On4+iFHlJ5Ro3h6wRA+rXddfQTO8S4rlb3szq30=
=14ML
-----END PGP SIGNATURE-----

--8zvd0hdnVmtpJ5ER--

