Return-Path: <linux-renesas-soc+bounces-10684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD789D8C7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 19:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D1528033B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 18:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015221B87FF;
	Mon, 25 Nov 2024 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4xMFVcR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB31AF0CB;
	Mon, 25 Nov 2024 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560688; cv=none; b=BByUmg1uLJZZoPN7q9efr51ChJrsXyQ40sjRoSrKafAcHwfXQJTTv3VMNbhm747szpYxA9S6Q5f0j3Lk9Xt3blTXvdY9mszloC9CEkC7FZzg+fjdcpyAxl1QpmtLYMziomyTaPVI8D8FLpRTtx1aOfowH0V0IabU7WyFqmKYkaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560688; c=relaxed/simple;
	bh=zQrrRKHFaCIYSXlRzi6iLFrsbWprzx2CsC583q2eGwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQZdrYJkAEuX4jS2H56HsBXoQeaZLjv2qrpzyJlRrd5j4innkgZMh2hQqJxQbFYTjztz8ui9Z0E4TzKYFJ/iBOa6k0pjqhTKGAXzWu580lp8py9fq7zcv+02r1y4C/zU2FczrOB3Nza00KWNi70JrSrsw5hm4eT4LAUbt/X6sHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4xMFVcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3606C4CECE;
	Mon, 25 Nov 2024 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560688;
	bh=zQrrRKHFaCIYSXlRzi6iLFrsbWprzx2CsC583q2eGwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4xMFVcRFLmzCd2Z90LKlBQqvIr2XqPPK4B6wYWFTavRKggMVUbi1A3tWA0sFnIQf
	 p3OVfczF05BQHcyHi7Pq7vNeOP4V1XJnTIfXkMaLnNFSlpnqKpjOtduJTJ8g916Vcu
	 i9WDKMWjpCq+SNxZfo8VAZBYHsKM5lXRpnnGoN9a1cNuupS1LQELVx2H7bVtzteNJG
	 +WRjgziUDacBaC29zWGy5wHxy+ialNohryjVExM/COgRNbuPAlmc/klr/RRFBVMUk4
	 qYAIXu7oXgL1Sgn16sRaMnZlQo6ZgmVBD1buD8Ojrm8wHeys0XvbxY80vC04S+WMRC
	 G53P1aNmxP4pA==
Date: Mon, 25 Nov 2024 18:51:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Message-ID: <20241125-siesta-sanded-5476bb4b99fb@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UMCaoNFtTzw9fenr"
Content-Disposition: inline
In-Reply-To: <20241122124558.149827-3-biju.das.jz@bp.renesas.com>


--UMCaoNFtTzw9fenr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 12:45:38PM +0000, Biju Das wrote:
> Document Renesas RZ/G3E (R9A09G047) SoC variants.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--UMCaoNFtTzw9fenr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0THLAAKCRB4tDGHoIJi
0qTFAP0V5ZYeJm+30eEBWNbdJU4ogTE83XXO02qx47U8TxB28gD+PFpg5ZjHe1oV
TMBU0NyNFJFWp/ZqN7FxeWbuhnNdsgE=
=tQmg
-----END PGP SIGNATURE-----

--UMCaoNFtTzw9fenr--

