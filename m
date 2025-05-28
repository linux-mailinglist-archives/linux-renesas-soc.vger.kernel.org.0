Return-Path: <linux-renesas-soc+bounces-17625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD8AC6ABE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A32D3ACF24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4626A28850E;
	Wed, 28 May 2025 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mejfVGoM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159D92857EE;
	Wed, 28 May 2025 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439369; cv=none; b=bazlNP7VVgx9FrjRwa6TkKcJ7i7pCosGidHK887snoyp9+qwVQaXK8pbdQYzTd+NBnVSdLAzuUUX0KZPRDxABMMHOnNtsaKnuoc1TR+LRTWa4koGWk08dxL0rn5nnmfLCbUelwam0878eoh+bBjdZeEnzez/tkn2u0fp1NusoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439369; c=relaxed/simple;
	bh=FhkUHMohrBHoaITaVyjCBqGPqxWKRhauPBqe5J+ZFNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqgxAOHOjQzgczuiMg5GhJ2HWJZSuoRosHAz8Ppd7WNslcwAd888ruOJ03Js/x3gBnDrzNAOBitmvTfnwceiF71JY8Vgd75samvYLOIt4pvw4eoqfCJA20JRuyPc0iNA1jzahBa3PafNs4kVWyQAAYzWaxyjf8wBIkd7TDCSEu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mejfVGoM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F0CC4CEE7;
	Wed, 28 May 2025 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439368;
	bh=FhkUHMohrBHoaITaVyjCBqGPqxWKRhauPBqe5J+ZFNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mejfVGoMxI8Zhe+fiFnLmMr4HCcGZ3Wuuuu0ZBVJxLq7daSTi/gd8hRfTaRXbzm67
	 SgVUUs3Marz6sfS3axwPXX3xFzwoArB7d6olXA3CZji3FEgAv8xQJdhNNiuyqbXIwt
	 jBjGmeOBZwKpu1b3XQicdOqYBBLNAkrdgSQARKSd/SDbW+qnCE7psiaW34V/+2rWVB
	 Tdkq/X8NPmK1zF4Hog3y20lDQ0ojK2xVvowd/UdnTJbE+ib+BcK7fQf3+tqCN20VfY
	 78Sm8EjaSaOIKhqhVI7upQzXJAXH9VHFj5HijWs/H9TUR7nEpN2nSL5Hg41ieZemv0
	 YLx7bB5hJ126Q==
Date: Wed, 28 May 2025 14:36:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Add RZ/V2N SoC support
Message-ID: <20250528-achiness-easel-6ea5af62106b@spud>
References: <20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dCH9tE1cQr8pCh13"
Content-Disposition: inline
In-Reply-To: <20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--dCH9tE1cQr8pCh13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:34:40PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the Renesas USBHS controller found on the Renesas RZ/V2N
> (R9A09G056) SoC. The USBHS block on RZ/V2N is functionally identical to
> the one on the RZ/G2L family, so no driver changes are needed. The
> existing "renesas,rzg2l-usbhs" fallback compatible will continue to be
> used for handling this IP.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dCH9tE1cQr8pCh13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcRQwAKCRB4tDGHoIJi
0lRpAP91o80LW7znud+X5kxB4V/yuWsIkYrI4sDMBxpm3z7+JAEAuR9jTnEYUfSC
aaq/1JLRgjGNV58BDvnty5Acc3s0XQo=
=4pIE
-----END PGP SIGNATURE-----

--dCH9tE1cQr8pCh13--

