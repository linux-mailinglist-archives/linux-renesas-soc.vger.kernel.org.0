Return-Path: <linux-renesas-soc+bounces-1783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABC83AA84
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 14:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5892822B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72B477F05;
	Wed, 24 Jan 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgMxKeSb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB87764A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101209; cv=none; b=E7++ovEIKLejeXpajf6tbL3m6gR5uYc8SMb9GadfJ/V8UivYWvpEmUvNcjb3mncriIEqi5K6I+rykkznUUrt9dtLmhWXoDi3hR7O+YWT6dtDOcdDvHPcW4WxExfGYx1BeuMAXw/b4GpBdo8oSAdGUw7P5zFr0UzjURU4cdfotkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101209; c=relaxed/simple;
	bh=hu/BLznX9xL1pG1tBTqxVj+MJaQ1hWdmmowJ81yQ0LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsd6uXLIMrPnu1BFNQfS0D5Qgdy3+u0Jfwoc7vDOOL57THlOjxgOdtu4PL9JqCec4+wsO6AjavT6yoNtz3fWcEmhIf8McxJSResNHJNAUnyMsORIHWQVhFu5iTXX9Sr5h6Up0Ib/P0rKpKlLqKo8ESR4f7miY8z/q8kFntE2wdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgMxKeSb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD3C433F1;
	Wed, 24 Jan 2024 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706101209;
	bh=hu/BLznX9xL1pG1tBTqxVj+MJaQ1hWdmmowJ81yQ0LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgMxKeSb/nkHOBsreQs/ZxSDuWd2JpNk1H9hmFXLOoSvbvphX3QYWWLSndMRZMIQG
	 amfbqySExZYhSfz+C9Ylt+/ZdjGt9ZhNVNrt8uoR1YAGtjSjd9hdOXOa5ALfPGcwM4
	 VC2CplUHjlwlGznApsEn9PH9WYMHq8nFE6soN9kZvWs2lQFWJT77ByL2Mj0NelcOvN
	 x908LEnnPq2raw96NIC7U5MXfrkE+iEv4qOlf+gFtKbVa1nG4aW48sNqgiI2AZ5iGl
	 44KRwo1rHX6dGHUWwQ2/11GYLTfTyinMl/TZVOe0FlKaY6ibISe13KxHEsK4uKbKLy
	 6MlKYGId7HKNQ==
Date: Wed, 24 Jan 2024 14:00:05 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 6/7] arm64: dts: renesas: r8a779g0: white-hawk:
 Factor out common parts
Message-ID: <ZbEJ1a2Ib6mnm8f5@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <f6c8413b688cbb5648deecb8859162adf442910b.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIRf7gLxrouF10fw"
Content-Disposition: inline
In-Reply-To: <f6c8413b688cbb5648deecb8859162adf442910b.1702309604.git.geert+renesas@glider.be>


--JIRf7gLxrouF10fw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:21PM +0100, Geert Uytterhoeven wrote:
> Factor out the parts on the White Hawk BreakOut board that are also
> present on the White Hawk Single board, so they can be reused when
> introducing support for the latter.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JIRf7gLxrouF10fw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxCdUACgkQFA3kzBSg
Kbb0mw//XTYDpgdv/ZakdOMMn+rmTIafixOHPlPHmbPlt1fkaW98Ugs7IX6Hsbwu
uw00auDeP37+HKkJyhL8ieYOXkDoGDJgBZLP800FP7vtKU1K9wB9Skoyr+A+91V1
H0jwf/rcsKRI6PYYuuCAQHopNORAoI6J0qD05SwjQnagtjm/MU4MIVpmEf7lCf21
q+PSFjYgbKKXsX8YMPixJtiBnaQnEFKPo2umZ7epxTlq4+r93IoiLe2TYIC/rPlO
uCXGsp1om1wGSMoGZsTItYQgBnJqAOB46DBU1JzbQgHAEeHs5HLzzFIveGNgN0qQ
3URCOIAMJychCRhkK2O8Mj36fMm2t1vIHFisdvXZQpcfm4ABhJUZYSpSJ0Ibb5XR
53By+VURhalrXfkK5jP2k8oTzOAVd2ChCnVVWcoBvK4qAdi6OqNLNhDZdSwmT/av
HmZnHS11v7o6QE5HkL8nQQpz8Mu7ikdlWMUdl/di5fO3ydMQYBptUTRuvgOqOcnJ
uYua692XyfydScMGPNzkuIFbQYvcA9JxYzGmOKfhAQxGRVOqhFjix5KR5TKEBHsa
GQf1Vq/T4yKIo9igmIwESOqmqg6lOlZecZXBBN+1NTxxd7Rcc75gqkE0arSN8U15
e2yKfPzIHeWjNsX704SDHZBNZD4cC4Lwm+AinwgeQdHoeDSOr98=
=D+Mx
-----END PGP SIGNATURE-----

--JIRf7gLxrouF10fw--

