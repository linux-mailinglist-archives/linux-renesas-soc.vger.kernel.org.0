Return-Path: <linux-renesas-soc+bounces-10715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D879D9CEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 18:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE70168DD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 17:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B7C1DC046;
	Tue, 26 Nov 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="js0fK5PW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DE182BC;
	Tue, 26 Nov 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732643632; cv=none; b=OIBuXJgLyox6wGYGQTNaXUVk/BhQXmqwqnJX2x2psjeCAEAgckqpPcdGAGgyZge2UxtXJ/P+a72lfOwTWjcYUQZwVpy8A8k5unEk/mDtEm5KUV6sOphF7G7d51Gd+czguxrgcaLqZz3D0iVFThk3eiWpa3vKGTc5sBmMKcPI5NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732643632; c=relaxed/simple;
	bh=nRyoSI6TTXaFa8ac1PPIBrrKxQt3KD0SbotwCVNXJ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3Q1E86SwUOz/ZpiAYDERkmgmkK3vuB21X92xpOcwZybxSR9r2AyM4bh8QtceTxX6PGTyU9sJpYXK7kl7kDsVqSaL0RLXuh/2Cw+SgDvaIIuu947nYi2zU4eArhfepdjA1WhM9IY9VBb+h3Wobh28Sx184ZlRY0xTKH44N9gJdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=js0fK5PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B664C4CECF;
	Tue, 26 Nov 2024 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643631;
	bh=nRyoSI6TTXaFa8ac1PPIBrrKxQt3KD0SbotwCVNXJ7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js0fK5PWQulDKym1SEWsenjcvezLya46nw7L20EXkVXX0Q2+xwbJXKNtDwcUzU5Aq
	 67lI9Pcm/xZNV3XBhK+EJ4mTOdec7A9aIOr0iZ0D/ZBFShuVUp69JhiFmQNG/FCbFg
	 4JVy18NCEJRj1zEOcMOVrgO9dMvBngKlOPDcFerS/VENAnnMeUMM8cV43WeQu+u3cr
	 9lFZCXogE4qsIhHHmUpH2Q+4Q9rCTx9R1p3yJ5ueF/Nqhln34lebD7vSm08AuH4NY8
	 8GpILIXz1xMhOue7G/mYbOTYxqhfRiejYy9Ib47vrsCW7w+ntGrojnzOMH8qWeFD6V
	 yz/yC4FbBmLuA==
Date: Tue, 26 Nov 2024 17:53:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 07/15] dt-bindings: phy: renesas,usb2-phy: Mark resets
 as required for RZ/G3S
Message-ID: <20241126-carport-sift-089d6356276a@spud>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-8-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="syivhFzP6qcgIw2w"
Content-Disposition: inline
In-Reply-To: <20241126092050.1825607-8-claudiu.beznea.uj@bp.renesas.com>


--syivhFzP6qcgIw2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 11:20:42AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The reset lines are mandatory for the Renesas RZ/G3S platform and must be
> explicitly defined in device tree.
>=20
> Fixes: f3c849855114 ("dt-bindings: phy: renesas,usb2-phy: Document RZ/G3S=
 phy bindings")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--syivhFzP6qcgIw2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YLKgAKCRB4tDGHoIJi
0lFFAP9r3Rx0rIq1nWVPGrcA/B6a5oBamynv/AoKmix7LGwJjQD/Qo+N+wPLOawE
dl0QeS/IfgNqrgaFARZWVO3l6zNLuAY=
=SFZV
-----END PGP SIGNATURE-----

--syivhFzP6qcgIw2w--

