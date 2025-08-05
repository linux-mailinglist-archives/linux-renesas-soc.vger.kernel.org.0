Return-Path: <linux-renesas-soc+bounces-20013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C38B1B902
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 19:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D593ABEB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 17:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46435259CB1;
	Tue,  5 Aug 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhjCiUpa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305B1DF258;
	Tue,  5 Aug 2025 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413848; cv=none; b=oNbExkeQGz3xXC8cnhZcUTUejz49YuCCPis+2h1CYpGMQsF4F4pjr5ggMbWH75dK4fcHdzfGfefhWUs2WsjyveeVS81nYldsmjxcsj5zpPTEOZZAG+6EbbXfUVW1sL+O6JVVQ9AJ7LjcZH4teAiGiC54eyuG2JDBVYMZcHEwcaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413848; c=relaxed/simple;
	bh=1sf/JRZ3V8bfGDagRlSzmSgwhPtXnaKUvMYT5avoy1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slTRNQXo0PK6QOS8mRUGbsWi9xhk2wf5unTWOBmQeKMVNFemR1lnyF1aj1SY/Dvj1oeqxX+O1rDOuEg0+8zLnNXwMDyRuVUw2DdsQPNYXCTnH+LVL9HzoUC2uUwfvZHFgpUavra2nhMN3Orp4xOMeT6KyiO+mwHaFL2seAdLuB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhjCiUpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757A6C4CEF0;
	Tue,  5 Aug 2025 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754413847;
	bh=1sf/JRZ3V8bfGDagRlSzmSgwhPtXnaKUvMYT5avoy1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhjCiUpaVILTMXxH2XAUJ06SOWn80oWAFZ1WNJAOnkJGDt15wyAO9E8jGZWh+FBuS
	 x5t2KkiS6vYTq4ezcAaxCLQgHp9bv5Y7lymAcjJubLYLxdDu6iySjOhcEp+ho4lJVq
	 PQUkK2skWvNht/S+HQDSP4DfXK1Ij8+byC/0ndoE/F8fH78ddDIhmd/XE03vb75y70
	 silc4AZ/Z/XfWKgOy9gwBjPpRNvjLmk1RszGSoruWsfC4Xi67k0IN9hPEJW4D/6uaH
	 RvprrX83gXxoRkv80oZ6pO49EOLiJhIT0AVJL8ZkaOyyB+gP6YFzZAqf5bTPiw9H/F
	 usDqIGAgwPFEw==
Date: Tue, 5 Aug 2025 18:10:42 +0100
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
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Add RZ/T2H and
 RZ/N2H support
Message-ID: <20250805-lent-tiptop-23a687d0cf78@spud>
References: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250805114730.2491238-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qyKjxRWY/MsYfqbX"
Content-Disposition: inline
In-Reply-To: <20250805114730.2491238-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--qyKjxRWY/MsYfqbX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 12:47:29PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the USBHS controller for the Renesas RZ/T2H (r9a09g077) and
> RZ/N2H (r9a09g087) SoCs. While the USBHS block is similar to the one found
> on the RZ/G2L SoC, it differs slightly in terms of interrupt configuratio=
n,
> clock/reset requirements, and register bit definitions. Due to these
> differences, a new compatible string `renesas,usbhs-r9a09g077` is
> introduced for the RZ/T2H SoC.
>=20
> The USBHS controller on the RZ/N2H (r9a09g087) SoC is identical to that on
> the RZ/T2H, so it uses the `renesas,usbhs-r9a09g077` compatible string as
> a fallback.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--qyKjxRWY/MsYfqbX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJI7EQAKCRB4tDGHoIJi
0t0LAP9GcYU3aBgLHPyaSfxMX5QqrZr5peYTWml64R/ts8+rRwD9GYv1Z1Q4IzyT
GGtL1Lix63V9jXAlvk2pLRmU9OzJDQg=
=QN3z
-----END PGP SIGNATURE-----

--qyKjxRWY/MsYfqbX--

