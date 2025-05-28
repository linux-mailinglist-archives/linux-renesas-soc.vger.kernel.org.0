Return-Path: <linux-renesas-soc+bounces-17626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A0AC6ABC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C85FA1888933
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814A728852C;
	Wed, 28 May 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KizkiBLZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576F2857EE;
	Wed, 28 May 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439395; cv=none; b=q0ao/47bWfdFH7KsnrTkPxm4P0YgosUIS/2cBaB6rk7fR8N35IBypESJQq0lEUGjLI/rM7kWjKIqRvesuHlS0/Q+URycfHGq0oPERXny2aNXK6mGhxFwvLjoyAfBpY3RC+FYk0AbKefegJWsWC8RZAOZ0LyTuzw9YCHdYk0ULf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439395; c=relaxed/simple;
	bh=1upF5iqjxie2p7TO11TXMuHwHpi5QAhmmGahibyTmRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvUvOOuufOyFukghgmvLRHIvvxmFulc5yjCptOkAK8cGf/V9Dus20uYd12+2mqrQUon4E1/q2t2DdIvC6cZOybPDYz8w0mkWLfOIC9IEVFR1bMoxkMxj0lWOh42md+YkLKiJUZMnjqCJ1VCXue57K026ftAxTEKxbhq9O6jzPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KizkiBLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C895C4CEE7;
	Wed, 28 May 2025 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748439394;
	bh=1upF5iqjxie2p7TO11TXMuHwHpi5QAhmmGahibyTmRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KizkiBLZAvJq1dp0wk5UwNav7sFxYW7s9dOAxxFGNk3wiyID2XMmX/4IsjxAlhFZO
	 00FCiIlVGe55e5eFHn7amFqjUIz5fYZR51woYb0y6alZkrUY52zZFB1csi3NldnIY6
	 Iau7wOUu1aQL/rO8B067HyBMjLdduV2i5eaum/vcRNagWppuXb5uT4o4cqzGN1W7sj
	 Vi8yUMqwS00rRDyxLlahlSkQS3MVFWvvfMFbR4O/jjxDDg6EXHpGPpr3P1OXwrHIob
	 FK8RQm2sjjWmPFFxUSFNlNUZhLOHGkim90IK30AlKLrxh9AngEnTSnGMZs0vnw9+ug
	 jPW8lZ+Wpr3mg==
Date: Wed, 28 May 2025 14:36:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzv2h-usb2phy: Document
 RZ/V2N SoC support
Message-ID: <20250528-geranium-eternal-571bc93bca54@spud>
References: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2486ZaeyJjBnH63V"
Content-Disposition: inline
In-Reply-To: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--2486ZaeyJjBnH63V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 02:30:31PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the USB2PHY reset controller found on the Renesas
> RZ/V2N (R9A09G056) SoC. The reset controller IP is functionally identical
> to that on the RZ/V2H(P) SoC, so no driver changes are needed. The existi=
ng
> `renesas,r9a09g057-usb2phy-reset` compatible will be used as a fallback
> for the RZ/V2N SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2486ZaeyJjBnH63V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDcRXQAKCRB4tDGHoIJi
0m4TAP4m919fURQSYEeYPyRVOMhCTQRkpeLhKNoSI8BmCWHspAEAksc112ujTGm+
9iwV9UyyPP/XWB3mR2i2SfWvY/TcnwM=
=4/Ob
-----END PGP SIGNATURE-----

--2486ZaeyJjBnH63V--

