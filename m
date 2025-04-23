Return-Path: <linux-renesas-soc+bounces-16258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21386A98AB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 15:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FB53444551
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 13:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EE1156C63;
	Wed, 23 Apr 2025 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gb6LJDix"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954E1632CA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Apr 2025 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414256; cv=none; b=jTCUuoUFp++EJPJKoS3KQ56poJoc0gOillIw/p4oqSa5iInHv7atjg9RPVeG6e9o6jbRcBMh0dLUm9XFU8EMOoaLuGGaBh5RyrdJOc3U7Sd+lLm+VRY9QGe/u98ZIxA9rNmWXVGnuaMGOpor3ZW3hbH4dDDdwYweUrH8FvT9EBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414256; c=relaxed/simple;
	bh=zdbDvq14KN2z+9iQkDs0XYDCtdtOrh/uxg2SCguqfiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBnDsBo2GpsecdjEOJ1yqf+Zp8fMiv/Ja7aBWW8RdtW1NZTlBffN116LJjPUq0KA9d8pv8dWeCnBrlLzur5zfXMvLAX0+smlm8/wsOg5nrUEQwUx7mBbTGrbXLSOZPmy++2KKQhqOCLHXBrGM1lHfq5JskIBfiOkePZCoEBdM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gb6LJDix; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zdbD
	vq14KN2z+9iQkDs0XYDCtdtOrh/uxg2SCguqfiM=; b=Gb6LJDixOJeWFMQ9d9J7
	guKDxWuRc9HsReLqTaYFU3ZXiE/lJ9wQbo1Ydxeielf18vsaHpidGNcRV3FXJQtK
	WraJm9pruG9QXVjcA9DitsG85Dg5F2KTqxz0599QEkN/Nk3N+Q6TIc+ui/Zi1nAR
	Xkfwkez7ARngShGqDgUyxeE54fBI+qvAoyiwV5INEXOfjOzTbGZphZPQEpCpuaNT
	r2ZSJrtbheHF5erIE3oalpHOQtJwOPOswroG806+6IoILAMXIPFp56kwm3YIHYuf
	6mhvfXmsxvwkMxst2jOKRfE2luzJVYXC0aq8cV3+0KJvgyqL/34VfclCEaLqOMgB
	Qg==
Received: (qmail 3089874 invoked from network); 23 Apr 2025 15:17:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2025 15:17:28 +0200
X-UD-Smtp-Session: l3s3148p1@C6VH7HEz2KUgAwDPXx6JAAunYj8Nf7DC
Date: Wed, 23 Apr 2025 15:17:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [RFC PATCH 0/2] ARM: dts: renesas: r9a06g032: rework UARTs
Message-ID: <aAjoaFnWoHy9-m1S@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdUVqCfFQn5tvONWqmz-NerB7aVqj2_jythEPW51wEN3jQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+hmr2NZA+hC2OWQQ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVqCfFQn5tvONWqmz-NerB7aVqj2_jythEPW51wEN3jQ@mail.gmail.com>


--+hmr2NZA+hC2OWQQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So I am in favour of not renumbering the UARTs.

Fine with me, I'll resend the latter patch adding the new port as uart2.


--+hmr2NZA+hC2OWQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgI6GQACgkQFA3kzBSg
KbaQhhAAksBBmSTGE4eLPHQcn3kBbCJD3M2H7nHUOIi/CCDq037W/rl6O7dqpKk6
ePDECVqmwjci5H6kBQ1EeZeavaoXQLjm34jwM32xNWSOsWEF5SXFEIZ57vWUzbFO
UovHTn1OSH8/uWGto9lAfDkBohl3V9YFfcixbjJCCQwIT4Dop2P+LI/ALDuDRsWK
w0c3FpFw7o1uslTz5mdLRtJwmyKWS9TvHHiVVoWY7LlxqUXI0fg0e9/Xb8jTVDM1
wYUFWF4f7n3vZez2u/Nu+NriOce2LGeRbCplLXZqOUpTVSVX8NT/mxYXxwdMhplC
fORLgKKtFGuPPTbZolgmduvQRgZgXB+8dGq3WVhu581aXlH7iYNhZOz1FW+XK9sg
VZBH7kZJIUnaipVzVsZxD0IFdVYpf358ASoCSySBe14sK4+M3jWlLMjtecGNrCH/
LVVZfb33jtE0BPiqy+wWypQQonxf9ULqqmw/e9SjieR2KQw5EgshxrS7hDJdDWVD
MzPDiaR5d0CQmeRVrFwdGpUW7AbNMlw1oEoRHudID6a3ZKOXkCFNYHV6PiPzAGak
932/fLZlNuB+V1pb9NV9rLgXmRzVlw13N8kkkwUkEcvAEjq/O3xYTFXhOcEsRCp7
QR5apDEVifp8Dd7xJW3iB8ubZhfkbC0IsIc+dRzxA7Mk5b76vx0=
=sxhZ
-----END PGP SIGNATURE-----

--+hmr2NZA+hC2OWQQ--

