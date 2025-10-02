Return-Path: <linux-renesas-soc+bounces-22617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A62B0BB4EEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 20:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C0716FAC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 18:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61B21E412A;
	Thu,  2 Oct 2025 18:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlPSXAkL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14112C544;
	Thu,  2 Oct 2025 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430945; cv=none; b=kj4g/LvcCwJK8TgvPXaBp4hlY0siRjCTC7K8AGXdJAxNieZBah18pdK50Ctt0jKN7DqS0IUm2FHz87eu409L6fc5xGgMmuxWx1qQUiGQwJ7/LhKKV0uATMcA+2RF+jmbEktsgEFWaY6lBwNjoevTlJtg6OJ6E5Xsu8CLf1lxLv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430945; c=relaxed/simple;
	bh=NI9tbW1dRs+FSsXJo6G/jpW6PG0lao3tz6eQ+b8g5iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtHNpEgR51wB3We2cLQcs0pgq+k/K4shAcEk17uyxngvugvXdbMzYHm6VXwqNGnb4KP+F22n7rZybybNVXCNacosCZTrn93ctWDfoYli4yJO1ciq0pFeWNZqvGPh3n25aQ5VcwGIpI4BgoyBG2yi4OalWrkHyCW3obHgAbjkgPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlPSXAkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C6AC4CEF4;
	Thu,  2 Oct 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430942;
	bh=NI9tbW1dRs+FSsXJo6G/jpW6PG0lao3tz6eQ+b8g5iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlPSXAkLUYZ1T/pGUYK2oK6ojCZup540aF7OCb8ISwdHgcCg4nmXcwnUAm3tRkU1t
	 RP3sLYYVuI3Na+Gqp+06H9wMkquPs7ZwLwgF4oRxUzA0tGmLl2NCJyWrfd8fORHurT
	 yIPeLybzvMa002Ei2ZOXRekvHkB9u2DRbPzk1Euhlq9Gr8QYMaVnj4448o4YOMsM9V
	 yoM6LA/Z62TmTK9at7Tm++hDpfr05s1pZej3MhLO0w0qDtYRiVOgQRhoewwQK/wE/Z
	 iaZOAWVNMWEFfqmfsZ4gbhP50a76xsiA/4VNaWKHoQkNJKVTHCU7FTBzYDRaaWE/bM
	 DT6iH7FiXG8vg==
Date: Thu, 2 Oct 2025 19:48:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Add USB2.0 support for RZ/G3E
Message-ID: <20251002-mystify-idiom-0273ef40b4dd@spud>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eLDSy2g573seoiip"
Content-Disposition: inline
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>


--eLDSy2g573seoiip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 11:26:44PM +0200, Tommaso Merciai wrote:
> Dear All,
>=20
> This patch series adds USB2.0 support for the Renesas R9A09G047 (RZ/G3E)
> SoC and enables it on the RZ/G3E SMARC II board.
> The RZ/G3E USB2.0 IP is identical to that used in the RZ/V2H (R9A09G057),
> so the existing support has been extended accordingly.
>=20
> The series applies on top of [1] and [2] and includes driver cleanups,
> VBUS/OTG handling fixes, regulator improvements, clock/reset additions,
> and device tree updates for RZ/G3E, RZ/V2H, and RZ/V2N SoCs and boards.
>=20
> Thanks & Regards,
> Tommaso

If you're not gonna CC me on all the patches in the series, please at
least CC me on the cover so I have an idea about what is going on in the
rest of the set.
All the bindings are
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D1001788
> [2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D1006104
>=20
> Tommaso Merciai (18):
>   phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
>   phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
>   reset: rzv2h-usb2phy: Simplify pm_runtime driver handling
>   reset: rzv2h-usb2phy: Set VBENCTL register for OTG mode
>   dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
>   phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
>   regulator: devres: Disable exclusive regulator before releasing
>   dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
>   clk: renesas: r9a09g047: Add clock and reset entries for USB2
>   dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
>   dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
>   dt-bindings: reset: Document RZ/G3E USB2PHY reset
>   arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
>     node
>   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
>     support
>   arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
>     node
>   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
>     support
>   arm64: dts: renesas: r9a09g047: Add USB2.0 support
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
>=20
>  .../bindings/phy/renesas,usb2-phy.yaml        |  10 +-
>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   4 +-
>  .../bindings/usb/renesas,usbhs.yaml           |   1 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 122 +++++++++++
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 +++++
>  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   6 +
>  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   6 +
>  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
>  .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
>  drivers/clk/renesas/r9a09g047-cpg.c           |  18 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 199 +++++++++++++-----
>  drivers/regulator/devres.c                    |   8 +-
>  drivers/reset/reset-rzv2h-usb2phy.c           | 105 ++++++---
>  .../dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
>  15 files changed, 478 insertions(+), 85 deletions(-)
>=20
> --=20
> 2.43.0
>=20

--eLDSy2g573seoiip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7JGQAKCRB4tDGHoIJi
0rKdAP9D2KiLyyufhN7hq/rJnj5f3R36WtCUVA2GlgysBGz2zAEAjvU0Qjowphpf
Dlrv1wKDz9xKn/XpS0z1oY5GgtqCYAY=
=82Nv
-----END PGP SIGNATURE-----

--eLDSy2g573seoiip--

