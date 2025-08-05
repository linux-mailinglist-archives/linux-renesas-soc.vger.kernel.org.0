Return-Path: <linux-renesas-soc+bounces-20012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508DB1B900
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 19:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108D218A7357
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 17:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3476226861;
	Tue,  5 Aug 2025 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWxSUOaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEF33997;
	Tue,  5 Aug 2025 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413755; cv=none; b=pNYDNf3TycVCAZyes+ERNdU0x6egAptdwRWBB+sZi/wUmMdqIBnLk1WykT0Advvf/NrXiHYF2Dyo0M0CGQ/IiF000SyG7A9ZG/X9XlSsz0LBrX5DlR7ApUgnGyAXAatROIrndfRlQE5hvZmVCam8CIQDwPl1EfgWu614ssBU9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413755; c=relaxed/simple;
	bh=BiXWWnlklOTycyVkMhtWw6eGx+VQGGndhKiYBydUrcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG/Of9H28KlQPLgzNZMQRcJFCWPLXfsfRuPlp4nePxTYMBukjgdtHJCqPQdIYcgsSuKn7ZiONTk/Z5kS9DV6tZtgFwtlHKwhjM2joXxDoHBgDVP6lqv03LlnKgTqNzoHjSXh+wS9bsPY/CfwXPIhUPC+m6WA6ri2vnxU+iY30K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWxSUOaM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77E0C4CEF0;
	Tue,  5 Aug 2025 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754413755;
	bh=BiXWWnlklOTycyVkMhtWw6eGx+VQGGndhKiYBydUrcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWxSUOaMI4WrFLONGNKEtwMQT0NzeqVS8BR4wL3BcVBDReRaNUnKjVL4r0hJpgdVK
	 6+5JLYkpCL8aGyCYm1o/6HnJwMQ35AhLXbOYKMXXwVHEdTPgN62NawlvHwS78KkUzE
	 eBk60GhBNGtHSzEZa82T7vNTJIvwJJFft6M+dngs/78OOghnUwlStrsWeJFB8LKE4a
	 VZrOu3LohjYFgeSFuDO54LmA1OKxkc4/PEdDGMXbbN0vw8dbI7lgxI+v598s3V1zcR
	 XcJoX+9arDIQ7MZwlihTGPxCbJerIq559rDEIUqm7vQH1rsTmLVYzkwJIUHB3SH+vZ
	 kN+GQ3KdGXVLw==
Date: Tue, 5 Aug 2025 18:09:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and
 RZ/N2H support
Message-ID: <20250805-shifty-gloater-93e1744e38f2@spud>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250805122529.2566580-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dbbV6R/wGD9GE9Gw"
Content-Disposition: inline
In-Reply-To: <20250805122529.2566580-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--dbbV6R/wGD9GE9Gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2025 at 01:25:25PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the USB2 PHY controller for the Renesas RZ/T2H (r9a09g077) and
> RZ/N2H (r9a09g087) SoCs. These SoCs share the same PHY block, which is
> similar to the one on RZ/G2L but differs in clocks, resets, and register
> bits. To account for these differences, a new compatible string
> `renesas,usb2-phy-r9a09g077` is introduced.
>=20
> The RZ/N2H SoC uses the same PHY as RZ/T2H, so it reuses the RZ/T2H
> compatible string as a fallback.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dbbV6R/wGD9GE9Gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJI6tQAKCRB4tDGHoIJi
0jROAPwML1c7LBdAHQaSCXLP4E/8cuHNy+Y0seBfZv4YTOcT7QD/WeKUs0MZOJ/E
aZMA7QNoYpQg5FGyerNNwIBJMVg5ngg=
=X1nL
-----END PGP SIGNATURE-----

--dbbV6R/wGD9GE9Gw--

