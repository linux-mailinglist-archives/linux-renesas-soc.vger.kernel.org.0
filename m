Return-Path: <linux-renesas-soc+bounces-10714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA19D9CFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 18:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25AA1B29B72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 17:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECC11DBB32;
	Tue, 26 Nov 2024 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aorIiGYt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E961182BC;
	Tue, 26 Nov 2024 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732643590; cv=none; b=Pm35xLZtyHEEig5GT5rmPrvCmSndq7nLtkb5/GCrOHeNgfrZUjYT4A4MMioCgNkRX8ctcmsZFSZM059B1ZErWsoiuRR99xvJymI9eHowS6X39/rqw/QEY7fbgYs1i0DG6PkuOSudZ4fKkcBxjymVEs8BScklEdZ6ANnHQXOvdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732643590; c=relaxed/simple;
	bh=NehC+ymsbPFPPJe4qVuy3PA7quIwdBzhzboTVNy83O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYHvSLCybB/saRwjdMf6xgUX4tBDtStA6CAmO3K9ImC4H9CYmtxnEI2z8MSknSlkHRzYLhE4fopOYlZrjt5Xo0u/Wc4XXcxnsb6iPvSK++46zLX7h9MbVB7jgSuQ9pq/pyw8Q0VedALyQJ14//vadjVPZrfSDZHAA0INLjkessk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aorIiGYt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF56AC4CED0;
	Tue, 26 Nov 2024 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732643590;
	bh=NehC+ymsbPFPPJe4qVuy3PA7quIwdBzhzboTVNy83O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aorIiGYth73xyfIGQblyPd2La7YxQE6w8xxfLLyL59BAoU/09Ue8aNqiI+RhuuZb4
	 LLFwb0RO0PxqYflMp98eVEWpLcc/zq1zs//jTzLbVwFm2XogBwXaU6T+w6zgGPYdbd
	 YDci2mxHI6BY6ave/gBGKANsUioNT17f7S8b6pPevqvwtGg8L3UkHQdgOr7kFhGF8b
	 fVv2AjDm103zy/65GNzymBKNgGlL60pJ1SHTPQmSkVuBTURgu7yQ+UbtBo0WpG4nMs
	 Zt2mW6OvtpJqVn2eNOLtmAk/j7Xkq2cwLmhtEGkOc8tAkw7ovCAwuoR9cNu6p6bx5O
	 sA4ukR+wCkzVQ==
Date: Tue, 26 Nov 2024 17:53:04 +0000
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
Subject: Re: [PATCH v2 11/15] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3S support
Message-ID: <20241126-algorithm-wiring-b4339a222536@spud>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/lz60/Ptmbm26ZvV"
Content-Disposition: inline
In-Reply-To: <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>


--/lz60/Ptmbm26ZvV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 11:20:46AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S USB PHY control block is similar with the one found on
> the Renesas RZ/G2L. Add documentation for it.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/lz60/Ptmbm26ZvV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0YLAAAKCRB4tDGHoIJi
0prBAQDBbakfQEYNvZfj558SOgCPRr+erB7IDZqbZqJxAKQx7AEA3xTKW2+0Eruc
7HuLCJAmCAFoNyfoAYEo0UE8SD80MA8=
=CybG
-----END PGP SIGNATURE-----

--/lz60/Ptmbm26ZvV--

