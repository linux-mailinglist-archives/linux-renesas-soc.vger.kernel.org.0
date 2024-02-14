Return-Path: <linux-renesas-soc+bounces-2758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C18549FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174681C26E06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE9E52F9F;
	Wed, 14 Feb 2024 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E2XCnMR4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C630C52F9E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915811; cv=none; b=G5Qw4QeXhCJzo2D1pjC/FExHOwfXX53jeWiTe56Aaa8kF69gc/Ds/nAOhKarfC2Kp1wo9TbmBqpVdG+E9aq+jJK6qEXFSOaUDAQpqAlCpMvGww+tLW/YDzVd18HB6FAnjaTZL+qircGufRvQVnQp1ioFoxKJ3IKtVdC/27F29JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915811; c=relaxed/simple;
	bh=VazCOfpJEA7KeIqdMGJMMEhA/DGg07WQYUkeXbBf0zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3N85SowiGDCGuj4EpLe6qIgSbhIIo6IQ3WhLn5k+/RSHzI47/eRlNxy9bK8IPdYj4ezt2Zr52DmE/Fjajd20J3Lff6JUTsZGUQL52SIxKjK0FJpDlUWHv89adQxpEKkq1dK3wpu8Oii1raB8Ep3ABUwKWHxh4aMeGKpbwj9i8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E2XCnMR4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VazC
	OfpJEA7KeIqdMGJMMEhA/DGg07WQYUkeXbBf0zI=; b=E2XCnMR4wOrNlZ4w6NaP
	K7XCaByu+PPSzwmAH4ZO8UtuvQtAmjItNa7fn7+BfwFPczjPD4XPTXTnKItoIjEk
	gycOG7iB7qVvkjHFQuP1GDbrC26qLf9VqKBGxuzbYdC9kVz1fE/WojzEw4C0GpDn
	U/zTDVRxTKU1CGf7Z35FbImeaOS0KctkMU0LmlzPnr0F2UGbVIMdESaaScjbrmJF
	/fid2ETTd5IxukxUJA7OTqXCT+jF2EuRM7On0u7RJCba6Y6zBTM7gzeNm9ljnlW/
	QPew8x56FzpiPbW7UX/yKhXg/1UoyV1eaDrvKLffzWaXongDP9cG+QvJxZUwsKSq
	7w==
Received: (qmail 1429072 invoked from network); 14 Feb 2024 14:03:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Feb 2024 14:03:24 +0100
X-UD-Smtp-Session: l3s3148p1@6G/JIlcRnOAujnsZ
Date: Wed, 14 Feb 2024 14:03:22 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4M
 support
Message-ID: <Zcy6GggFaFiEQGr-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZgB2wK3Gn78cFs4Q"
Content-Disposition: inline
In-Reply-To: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>


--ZgB2wK3Gn78cFs4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 01:59:57PM +0100, Geert Uytterhoeven wrote:
> Document support for the SD Card/MMC Interface in the Renesas R-Car V4M
> (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ZgB2wK3Gn78cFs4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXMuhcACgkQFA3kzBSg
Kbbf1xAArpRtQYgefOvNPbGU7V8ZX9RX6HP99h30GPsdkAkWAg3qEXTdM3iQQEY6
y3rNMAZ6FpKPfujH60BHGyQjWDy+f7OMkKhPrZiUi7wrivJ+6ZVBapDOixFk+hL9
ahiij7YwMNSP/1vF7KQR6ZJZK32W0Su98ptmGKhHj3rIWEItduUNngkO8z8qUQFy
YZMWHacKNH138N19vpUbcS3vGUBcYaEYhyN8LD9xEi24z9LP0QsKkfNraL8vnnty
UDsFQ++2ZAdEVN1JNrR0WY/xMFKJMIJ1C0pMraXZfYglVl/xRCwTBD0u7zSz0VC1
F9nWESGtIjoywosnKr7UP4k+u1b0N7mN+mJ49nI10s1zo0NxAcyZ6sRA/4lH61B0
dFhu2Gm21mewDvJGcSb9dGgmjQD0Od4K8RRqBefX6yfAyXaForJW7/mxo6OTwd08
ao4grUuQajivWUJAvmA8g6PDWqINEZv1+fSaxkr9WtMBO4C3WjSjtmHsO9evUPCa
qEbwSL7wjT1vy7AYiy0rUvDaBPCUPMaunXnFVAdptV6/R7TCar4PvjqRBZ7Q7bW+
FyR11QRq8a/B3iuytQQY2P28j0Xt+LhEdIALqPpHb1KI7VX3OXL+svtwMh0TtV4k
UH5FPpZfKyP2HC29GWfFRN+zyTlsSPAEILI9sbseX8mXo2QHQVo=
=GS3v
-----END PGP SIGNATURE-----

--ZgB2wK3Gn78cFs4Q--

