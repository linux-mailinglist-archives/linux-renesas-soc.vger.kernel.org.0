Return-Path: <linux-renesas-soc+bounces-24426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376BC48E09
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 20:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28B9E4F2967
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 19:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC9E33436F;
	Mon, 10 Nov 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLoVqT2g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10085320A10;
	Mon, 10 Nov 2025 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800882; cv=none; b=DMtziCqcWuj/SYlHwD1uT3UuBC4ULoCAGAJXoPFLBq/haxTxR/hKFV11/LnyM15yuzYHmMsZEJYMhLV3sXUblNPpUaBwZw/QvIW8V2LH++yiHAw86jx1uj2+uyoGPkXbTgsMNhiTFxx9tVNPVMdo4FEyi7aVOOCqWr/+JKA7NlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800882; c=relaxed/simple;
	bh=H0v+OwJx0QjNHKVhVp7rC4x7aayHKNL5i+kxcvOuROE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIlhf+pJcUaBXN6sHNPK2VhvaM8sAcU6mFiOmrIJm5FyW82b/IiEExNO8pAA8Qovhh0gIutb5FDkzWKIbiFsrS6WnB8XwZ48NL5EPX01erbjpQxsze87pLDHqbENJHIgfZ/32w1C8JZbybxeB9diUXd/jB3HwcUJEczxePOFyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLoVqT2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2310C4CEFB;
	Mon, 10 Nov 2025 18:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800881;
	bh=H0v+OwJx0QjNHKVhVp7rC4x7aayHKNL5i+kxcvOuROE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLoVqT2gdZeJTE5wcBLE6E1+ccfqOXsNvEqBwy+2AyppmwOZV8bnnwaU41/02JcAx
	 lx3opxKuzPXkuIBSHzJsoY2WwiqlgmCUqgAIZNx4FlKgTAtFK1SI8X4WpuvnhCYlqW
	 X1k4eOEVsmXMfKiQN7rynVyLRNscOdJLrjZnSCe17akr/v0kq0pR6kLxrPH50Bxcr9
	 aV9p6PWMKcTHhHE+P9S4PKFzf9T5ZN6LselMadIdrwovRxxpPHyuUYLDhPJqLQYyra
	 n+ruvqeCAEZtmW3BIthhzNleMLi7ArGg1gB/X++bk7A1HAVak3h9EMKd2FXC1IRYKH
	 HNv5BxGzKSdnQ==
Date: Mon, 10 Nov 2025 18:54:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/21] dt-bindings: phy: renesas,usb2-phy: Document
 mux-states property
Message-ID: <20251110-outshine-smartly-881d231d644b@spud>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <bec1905bcee1a396f5b004611353af922e6d7b55.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+RtN6zclkAwEkiig"
Content-Disposition: inline
In-Reply-To: <bec1905bcee1a396f5b004611353af922e6d7b55.1762773720.git.tommaso.merciai.xr@bp.renesas.com>


--+RtN6zclkAwEkiig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 01:08:08PM +0100, Tommaso Merciai wrote:
> Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
> configurable VBUS control through a multiplexed hardware register.
> This register allows selecting the VBUS source via a mux control
> line exposed by the PHY.
>=20
> To represent this hardware configuration, support the standard
> `mux-states` property in the Renesas USB2 PHY binding.
> This allows the DeviceTree to model the VBUS source selection as
> a mux, consistent with generic binding conventions.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v2->v3:
>  - Improved commit body.
>  - Improved mux-states description.
>=20
> v1->v2:
>  - New patch
>=20
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml =
b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> index 2cd0efa75f81..448da30757f2 100644
> --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> @@ -102,6 +102,11 @@ properties:
> =20
>    dr_mode: true
> =20
> +  mux-states:
> +    description:
> +      phandle to a mux controller node that select the source for USB VB=
US.
> +    maxItems: 1

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +
>  if:
>    properties:
>      compatible:
> --=20
> 2.43.0
>=20

--+RtN6zclkAwEkiig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRI06wAKCRB4tDGHoIJi
0v7OAP98vVeDC+kQ2uRRRDomYLClLg8a+azG/FWf4ni19mRfNwD+NeIi+aUxvEj0
U9R7D1VMAjlKfmek+xh8OSHDKJcaCAc=
=SmNm
-----END PGP SIGNATURE-----

--+RtN6zclkAwEkiig--

