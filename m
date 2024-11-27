Return-Path: <linux-renesas-soc+bounces-10744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A339DAE40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 21:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C41B2B233AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82323152160;
	Wed, 27 Nov 2024 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7pIX7hB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0D12E1E0;
	Wed, 27 Nov 2024 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737736; cv=none; b=XgYIjis4GC0qABZehpdOQfmCeizJbU7X6MxHTDnYmvbp3pxLBcWxMjfequpVe6o1iBZEqpURvcc1w7mKxTN32N3y9xjF9m9iG0hTSACO230Z1LitfqwGg7H41O8bS8OIJZKWZ8pZkNaanihyZWqYyScYQa1jTRJyFD3RAE1E3ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737736; c=relaxed/simple;
	bh=HINMPwX+chpDhUbOm99hBn0iqzJWQbQVOk3jDJe6mzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMK07wVQjoKZapHw2ItT1kMshB1xz6uNuKvxcfX4eZeugq1KPcO4P0PRo8AAubDMUWixKh/JX8gvfEEdUTInPehHu1VC3PEWjb4FwgJkE0M3EUcjs2lJy0LAtk1JZJhzQVQ8S//4Kq5FkVLSNqOKAM/iMWZnhir8g8UhySwEn+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7pIX7hB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE2BC4CECC;
	Wed, 27 Nov 2024 20:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732737736;
	bh=HINMPwX+chpDhUbOm99hBn0iqzJWQbQVOk3jDJe6mzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7pIX7hBTjmzaMQ5/jO1aRfOBJtEcaNx3IX1IRnqxGMsLdEsq16GrWNpC1C2u4jF5
	 0fDw1cVrRl0lSATjpndvvJLGVFdob2R+9JBXLLR+KIPwBZ/Fo9jL43nBzqVYsHX7ru
	 EfYEWMkfkE66HjH0CHgZO6o+xYFKvZTSwlHRs5sbhs5TCgQy2o9/pBiYb7l79aCXIZ
	 6oZwbKqixD9ETiOa1gAQaXj0GaMT9Dx4RF/mcfz1kG3kC92LViYzCcGYAgnvKhYBlZ
	 Gmct5U6BPpvE4hPRmK2QQTON8v/G3QwFN0uFWZq8p1a6snCItk+r1SJiWEhlKV7el+
	 eNs1q7mN1qooQ==
Date: Wed, 27 Nov 2024 20:02:11 +0000
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
Message-ID: <20241127-cargo-impish-9117a49fa425@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
 <20241125-straw-oozy-f95e18e4704f@spud>
 <TY3PR01MB11346BC7FA5C81C108B4E7A7786282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20241127-epidural-violin-651fd0ee2526@spud>
 <TY3PR01MB11346A0C7A4DAD6A250A6B55386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LhNMcAe6z8woCPxb"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346A0C7A4DAD6A250A6B55386282@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--LhNMcAe6z8woCPxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 05:18:56PM +0000, Biju Das wrote:
> Hi Conor Dooley,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 27 November 2024 16:33
> > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E S=
MARC SoM and Carrier-II EVK
> >=20
> > On Wed, Nov 27, 2024 at 12:34:42PM +0000, Biju Das wrote:
> > > Hi Conor Dooley,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Conor Dooley <conor@kernel.org>
> > > > Sent: 25 November 2024 18:52
> > > > Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document
> > > > RZ/G3E SMARC SoM and Carrier-II EVK
> > > >
> > > > On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> > > > > Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is
> > > > > based on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II
> > > > > EVK consists of an RZ/G3E SoM module and a SMARC Carrier-II carri=
er board.
> > > > > The SoM module sits on top of the carrier board.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4
> > > > > ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > index 7cc2bb97db13..1785142fc8da 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > > > > @@ -527,6 +527,10 @@ properties:
> > > > >
> > > > >        - description: RZ/G3E (R9A09G047)
> > > > >          items:
> > > > > +          - enum:
> > > > > +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> > > > > +          - enum:
> > > > > +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
> > > >
> > > > Why are these enums, when you have a single item in each?
> > >
> > > I just followed the style used in [1]
> > >
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.12.1/source/Documentation/devicetr
> > > ee/bindings/soc/renesas/renesas.yaml#L531
> >=20
> > It ain't the same though, since you additionally have the SoM.
> >=20
> > > Other than that,
> > >
> > > In future some vendors can add their RZ/G3E SoM's here
> >=20
> > Only makes sense if their SoM is compatible with the smarc2-evk.
>=20
> All our SMARC Modules and SMARC Carrier boards are SMARC compliant.

All of yours might be, but what you said was "some vendors".

>=20
> So, if anyone have a RZ/G3E SMARC SoM, that should work with SMARC2-EVK.
>=20
> >=20
> > > Or
> > >
> > > They can use Renesas RZ/G3E SMARC module and use their custom carrier=
 boards.
> >=20
> > But allowing this part does make sense.
>=20
> We already have a use case for this example.
>=20
> Renesas RZ/G3E SoM can work on both Renesas smarc-evk and smarc2-evk.
>=20
> But we only officially support RZ/G3E SoM with SMARC2-EVK as it has multi=
ple display support.
>=20
> So, can I use const for both SoM and Carrier EVK as at the moment there i=
s only
> one?

That is what I would do.

--LhNMcAe6z8woCPxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0d6wwAKCRB4tDGHoIJi
0q9eAP9OTz5Ux+R5qxE6TezNbQ4PNdXCAMQwQp+cJ2fuzMC9lAD9FhtosMpsvIdz
AEEbuTu3CAS7clHEZEp1AWuwxWM4EwY=
=dEEA
-----END PGP SIGNATURE-----

--LhNMcAe6z8woCPxb--

