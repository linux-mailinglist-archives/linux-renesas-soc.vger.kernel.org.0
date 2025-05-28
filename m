Return-Path: <linux-renesas-soc+bounces-17628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16574AC6AE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 653707A7183
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B990142E6F;
	Wed, 28 May 2025 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8Fh4VjZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB37139E;
	Wed, 28 May 2025 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439926; cv=none; b=mYKHj+T0dfMmFPXtYlmyqjCJvwHS9VA+2AArUDWed+jfGJyBruWayF3SSZPdzG7IUkDLFs3pq8vKwhDE99hc1YuD4b1Q08m2z4Bt1AHi6kszxwg7Uu5o3SSj7OttRT6wzrpA8zRKoIKv1L4nHCHyC89KlnsGBsOs6dGpwr+R86k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439926; c=relaxed/simple;
	bh=YpI7VKMUnaWy2OYCxLRua4soQ2wih1E7n3F4O5SEpHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSg5oyIJDDaQUWricjs1kWr/jv5gQNUTJxyZL3wfjzFQwqozoZV0l8NvHNvdX4wtH/u3zv9DMy1nIKZcRdRzp8zwVkvmENSiXGlbn7x9M+G1lXfJx1QHN6i9s/ESTKCWDk7BTK6Ksptlho0DJ5oJ+Ndu5i2yxFg1dkLFOhYTtI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8Fh4VjZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64CDC4CEE7;
	Wed, 28 May 2025 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439925;
	bh=YpI7VKMUnaWy2OYCxLRua4soQ2wih1E7n3F4O5SEpHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8Fh4VjZflZWOyDxuwWeoPAWKpSMpoQGfH3d/UzptDGO0ayaOZLubXxI9zBphBWnx
	 3IpJaRKCInlxC7w0dzWQwiDw7+DgyZ76zNjiWE6gqVOy+aI6U1AJxjIyxJ1045AKr4
	 acCGwsvoMUp7L3GGl0fkMZozYOzzXjgr6tH8iiVaz/An2AT5aP6Ekneq8wJn9mK1t4
	 3CW2M9xJGTyL/iPKHgieqkmLhULPwa9mXsEYCYfv1BPmKnUqdLsyXp4WW/Pl2DLTQ7
	 LY9TXLQF3+6CIYnMES03m1DTM4CM3UOck4Vxy0w7Rk9bxWtIJlDWTAzMKt0vaOQYsi
	 /vuUCecnjrf3Q==
Date: Wed, 28 May 2025 14:45:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2N SoC
 support
Message-ID: <20250528-taekwondo-selector-997da403fbed@spud>
References: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x5utOjCwDC7uVpEq"
Content-Disposition: inline
In-Reply-To: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--x5utOjCwDC7uVpEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:38:58PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the USB2.0 phy found on the Renesas RZ/V2N
> (R9A09G056) SoC. The USB2.0 phy is functionally identical to that on the
> RZ/V2H(P) SoC, so no driver changes are needed. The existing
> `renesas,usb2-phy-r9a09g057` compatible will be used as a fallback
> for the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x5utOjCwDC7uVpEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcTcAAKCRB4tDGHoIJi
0jO7AP4pKes/qNTY9Yn16W/MygrNIOvDmAvPi1ZIGUZQOZHyiQEAowAYXVSdz544
hd3YgUOaEQLB6HYBhRVH2x/O4XH+bg8=
=FbES
-----END PGP SIGNATURE-----

--x5utOjCwDC7uVpEq--

