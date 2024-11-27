Return-Path: <linux-renesas-soc+bounces-10739-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B610B9DABD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 17:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66386164C80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 16:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65CE20013C;
	Wed, 27 Nov 2024 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk/EY0Ms"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6AC20012C;
	Wed, 27 Nov 2024 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725191; cv=none; b=cpppLdKhXUpTp+WdZ1C5rhQOuJDXiin3f1L0JL+z0xY2X28PiEDoLi73DEU/cAH/AvtJSypr42YGQmy36/izEBhWgF3Lu75OwIl8XZB+OZEDGBnQ2IeFK0q8oFCyjva3FzMBZLmDM9ie1bKlkfR5rOs+B3bD6AeEP9GqQ2O2xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725191; c=relaxed/simple;
	bh=6s/n1/PmJoMYmBtsywl1+QbvSE5Me8uAzqbPZosEaIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSNZKFY4xidmBVQx2dDhwfc6ltunLt39DH9VpTw9UuWGofUvomK9pOQGEkWTP8TrQRPZ5VnrE4rl0Q/d7T1Utakdhm6q+o+10gDvLfZzdZkHHGcinWy9C+4pDvfaot132zRP9jRacnfXdpUP3wLyfSx0Bb21C8dfjIRbQ78EYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk/EY0Ms; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4513BC4CECC;
	Wed, 27 Nov 2024 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732725191;
	bh=6s/n1/PmJoMYmBtsywl1+QbvSE5Me8uAzqbPZosEaIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk/EY0MsWAs8tIzOLBv4FheAv1QCDeVhaBoUdl1QSJB5EZC85FYQdk4GP0iD8JjUF
	 YGcXvomN2SGLoIsAzy9BGRMW5zC9vxOiwV8l+7UfaS6PeuG6NK3BkjeSBPRTl9iNb3
	 F2WaXvsXnJjlE/phC3aZnHo4TktWUr/kt0UlFnFZOmgB9UV8QgV3WA2bsGZ8GaAlFN
	 4g4Mg4L4p/h9lzfMhk4qB0yXkyP4VRBUY7zC7enc5Nph+0gjr8Dh54AztT9cg++pR6
	 MSh165Az/Bv2fVTIgHdtMBrQ6rmQTYhDSwMSv6qCi7HIXkT3pm1Q6AyM2VVoCOQCMh
	 O2pGWEAsPyh9A==
Date: Wed, 27 Nov 2024 16:33:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Message-ID: <20241127-epidural-violin-651fd0ee2526@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
 <20241125-straw-oozy-f95e18e4704f@spud>
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2J5vQnm8co+K8xFJ"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--2J5vQnm8co+K8xFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 12:34:42PM +0000, Biju Das wrote:
> Hi Conor Dooley,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 25 November 2024 18:52
> > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E S=
MARC SoM and Carrier-II EVK
> >=20
> > On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
> > > on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
> > > consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
> > > The SoM module sits on top of the carrier board.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > index 7cc2bb97db13..1785142fc8da 100644
> > > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > @@ -527,6 +527,10 @@ properties:
> > >
> > >        - description: RZ/G3E (R9A09G047)
> > >          items:
> > > +          - enum:
> > > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > > +          - enum:
> > > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
> >=20
> > Why are these enums, when you have a single item in each?
>=20
> I just followed the style used in [1]
>=20
> [1] https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/devicet=
ree/bindings/soc/renesas/renesas.yaml#L531

It ain't the same though, since you additionally have the SoM.

> Other than that,
>=20
> In future some vendors can add their RZ/G3E SoM's here

Only makes sense if their SoM is compatible with the smarc2-evk.

> Or=20
>=20
> They can use Renesas RZ/G3E SMARC module and use their custom carrier boa=
rds.

But allowing this part does make sense.

>=20
> Cheers,
> Biju
>=20
> >=20
> > >            - enum:
> > >                - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 =
+ Ethos-U55 (21mm BGA)
> > >                - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 +
> > > Ethos-U55 (15mm BGA)
> > > --
> > > 2.43.0
> > >

--2J5vQnm8co+K8xFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dJwgAKCRB4tDGHoIJi
0tiEAQCCKgvVl3T7Rv7WkcXTxwnETv99aieRTnoT28JNuZJbvwEAopq4E4GEQhCI
3/llGDlvkO3/jrvQGLKdCSiCBg+DPAM=
=QJWG
-----END PGP SIGNATURE-----

--2J5vQnm8co+K8xFJ--

