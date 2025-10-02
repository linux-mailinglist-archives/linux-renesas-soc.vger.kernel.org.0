Return-Path: <linux-renesas-soc+bounces-22615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC2BB4E43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 20:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB4D1C7219
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 18:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0352227816B;
	Thu,  2 Oct 2025 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t08FxlBe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF53276027;
	Thu,  2 Oct 2025 18:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759430126; cv=none; b=TXpvVOnOnz5IOnjkvFRU7rDTDqSX/GeIfJD/9QkKF/IsTl2L4rIEwLC1vmbP8XmDXoZjXfSyplypWioxIfANeQ6frN7aD1/1iS43KMRqMC9Knr/l0Ex3iWqolf/ocQP0CrGFgnqmNPrQo1p0AiLtROoHcBktH4BhGj5VeXmAFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759430126; c=relaxed/simple;
	bh=zHJ1GL2dHHNTvje7wfAsF9YbHWtTxN7jX71+3I/wsHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyuBZlQVZLI8hr366H2ilZcKgv3pb1HHBFCuvd2OYVF/Nes95iev4ailaWGpWUuaIJ/MYfqLg9+5qD5CoVLWHuWIoXe72Myv73D3j54cm0tlLbdnqPLNXgnfTHdMSO1OTd+h48YivEt7SFva8eDrE35lemcxp6pnoCliQu3rWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t08FxlBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44C8C4CEF4;
	Thu,  2 Oct 2025 18:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759430125;
	bh=zHJ1GL2dHHNTvje7wfAsF9YbHWtTxN7jX71+3I/wsHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t08FxlBeAOkMnjhbkf8zCIx5OpnQBktugZTsxCd4Tgd6msXMaoGiYZNwwoXi/1m08
	 EycjQh3GLFu5QzD1tlYBZKlY2QpP0xmjwRFgherDKSmdu2nq1v0ymqW5GIxx8CU6Xx
	 x8qgVnGh4GZJumMlTZJtQuDdSjFYpFMwGS+BthR4QsoNAiJmXTq3SlHllrB8yGtxDP
	 tnSKBW9gQsyPA+HIpWpGtAcY+1qWOUZcmsVztryCEIYrwYkHyqRn9zCLUW6xDhTHkE
	 AmReNgMl4mIkh6TfSolIRy4+aKZ/hKgNGHuNKnaRegTr6pXt1FqUxe0SAwXoyimlKf
	 dHfaDyEh4Q/fQ==
Date: Thu, 2 Oct 2025 19:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20251002-outmost-epic-9cb3bab4d352@spud>
References: <20251001-yv5_add_dts-v3-0-54190fbc0785@gmail.com>
 <20251001-yv5_add_dts-v3-1-54190fbc0785@gmail.com>
 <20251001-bonding-surging-af8cd0d09e07@spud>
 <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y+7trX4Eurr9Vg9P"
Content-Disposition: inline
In-Reply-To: <CABh9gBcKt1zqvMQ=390HESPR5KrA42jaMFj9Ca4qmeS0d0ToAw@mail.gmail.com>


--y+7trX4Eurr9Vg9P
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2025 at 12:23:47PM +0800, Kevin Tung wrote:
> On Thu, Oct 2, 2025 at 2:33=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Wed, Oct 01, 2025 at 04:47:50PM +0800, Kevin Tung wrote:
> > > Document the new compatibles used on Meta Yosemite5.
> > >
> > > Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> >
> > You've repeatedly ignored my ack, so I assume you don't want it.
> > Maybe you want a nak instead?
> >
>=20
> Apologies for ignoring your ack repeatedly, that was not intentional.
> I truly value your review and will make sure to include it. Would you
> suggest that I send a v4 to pick it up, or is it fine to carry it
> forward in the next revision?
> Thank you again for taking the time to review my patches.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

The maintainer will add it when they apply, there's no need to make
another version for this alone.

>=20
> Kevin
> > > ---
> > >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml=
 b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > index 456dbf7b5ec8f4442be815284e1ad085287dc443..6f2b12f96bd6ce31b4175=
e109a78d931dffdfe28 100644
> > > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > > @@ -89,6 +89,7 @@ properties:
> > >                - facebook,minerva-cmc
> > >                - facebook,santabarbara-bmc
> > >                - facebook,yosemite4-bmc
> > > +              - facebook,yosemite5-bmc
> > >                - ibm,blueridge-bmc
> > >                - ibm,everest-bmc
> > >                - ibm,fuji-bmc
> > >
> > > --
> > > 2.51.0
> > >

--y+7trX4Eurr9Vg9P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7F6AAKCRB4tDGHoIJi
0sRwAQCwFXlCkLmxyD0w0Te9XN21MKFsXX3OKi+6iraKLaemqgEA9P77/sCLgfDi
ArNrGiKmZ7zFrzI9JsZPFV6Lu0VuBwE=
=wXDY
-----END PGP SIGNATURE-----

--y+7trX4Eurr9Vg9P--

