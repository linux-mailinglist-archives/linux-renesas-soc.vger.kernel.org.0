Return-Path: <linux-renesas-soc+bounces-14534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B239DA65769
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 17:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC9819A0A2C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 16:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4E8192D8A;
	Mon, 17 Mar 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R1SUDx+G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F0C165EFC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227291; cv=none; b=lxITSYHOa6+2t5g89Rth6P8Wa9BTWrxoK34QF5wvHX5eZOSxnEXfl4CTauJ6dqEERMVmI9OgXq/Z+6XD72LSXAyP8dKlJzmq+X2U6GgRRdNNjQs6ZV8q0uVUcjwsdWdyvgtgekt0+D3mzFc/FKpBoJfMm1AnODy8cxQpj0cnt+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227291; c=relaxed/simple;
	bh=Hzw/JXdoovQ9Or8mxoBy1TDLHZr0uuxXg4wHcznQOmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVOCY4FaGPYD7fHNpbgcnAoO/p78YusPep5P1m2GV5tcdtG2WX1GBFkFCeRGQFlv86SaESWXouk07KP6lGuv+nXCgzPKLPecQaxWHxkYj89JRj4UII+yayFevkC3IDG6n/i1h+TjxLqUliekrNKrikHn73H8YHGT5rbAgGaQx6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R1SUDx+G; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hzw/
	JXdoovQ9Or8mxoBy1TDLHZr0uuxXg4wHcznQOmg=; b=R1SUDx+GYYzmLPrd6yCh
	VPR6b9btqfehrNpf4lDj4CvrKcin6c20Va4/RhN8jNsNcma8UI6kvVk+9Qia6URY
	Og4D1zD8HHozQuaudr3u2pm4HjB89BTxfDotCgx1YZ4ydSRUeVXGCzM4Uf0FGGW+
	swgFpOSKjEVxfOj6IQ7en71q6PaC2toboIpa3vD+y1LTUYyEkKCOmcU5cBuxTlQl
	A8W9D3dzfvNcOx3N6y4SL2QNbFU5QFen5vEl6WphRw/cMqZ5Um0gAoMo5W48ZXRW
	MwcE30YvbxpGlJzxbum32RUcB3Ioa6Lovne8NIzAgKunV/sVPxOdluGiI8u447UT
	Ig==
Received: (qmail 3246407 invoked from network); 17 Mar 2025 17:01:27 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 17:01:27 +0100
X-UD-Smtp-Session: l3s3148p1@7uqR5osw+KgujnuL
Date: Mon, 17 Mar 2025 17:01:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
Message-ID: <Z9hHVwHpSKSKzIb3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20250317120437.67683-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUzjOGVCG=rrsnwDkaN5aRsBiWP7DhgUAHeEfUCz1_Y7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZcgvY64rqkWLws4R"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUzjOGVCG=rrsnwDkaN5aRsBiWP7DhgUAHeEfUCz1_Y7A@mail.gmail.com>


--ZcgvY64rqkWLws4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This is the alternative I suggested, which Miquel likes more than [1],
> and which I was just about to formalize into a real patch ;-)
> I think it would be wiese to add extra logic to prohibit the dmas
> property when both renesas,rzn1-uart and snps,dw-apb-uart are present.

I'll think about it.

Sorry for overlooking your patch series :(


--ZcgvY64rqkWLws4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfYR1YACgkQFA3kzBSg
KbbbohAAlCS75poiDgj2JgHJUjsC09h4RreE3QJ2OFZNDc1c8gI9YrBRg6uEfKXC
aRrBr8/VkuOQihGHacEY+sS9rT5F2QgbzQxtXaCFaxnsFp9NAOTZtjjPccP3ihxz
Ws19z8jWvQB3394Z2oFwoN5klwsaKxtVCKOzCGnABGTt6GCDCyGBuOAH0WTlJuBp
lSviVN9zHIh04ONEqojdtN7zhoIQwDuS9EAlw+VgcsLyqy3t6KMzpOxrwgqdoIIK
iieovigIteRBdcQ8S1xPzdeYEG4ZH2r+9J7AKIsip8SXxn8nBsFqCDYx3HdhTuE/
OoCgt+DYlVOL9gAalRqTnH4ck+F4hVKbEzJ/zIsvqvTJbPWIsePKQv0yTgsEMpkh
y9/T1FgmfzT6OKsmKnqON1i2612Hho6PNolKs4fHv5lxaEmmkC236wgEWAowU8/H
/mjoAeku58NWDGIv1x3krNCO/zQazpwCMSaeBdzcL8UOEa9hfGg+koioISEfaqsT
HeOfwu8QjUtSPxzxO5VWy10JO3RF8xkveoKnjlmjfIe/Ph9y8QjsL+XHH0yvGtv4
8wP5mKELaA2Xk13UxjdcmdqkhymPk51x0HxfNvksqs3BoZzgkKYdOLPGnRgYk1hH
+dqz6Gac7EP2+q4WZ9MxwEmyRo3VAyAJWFLaatU9VJ1dVOAdJQQ=
=8l8b
-----END PGP SIGNATURE-----

--ZcgvY64rqkWLws4R--

