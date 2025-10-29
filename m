Return-Path: <linux-renesas-soc+bounces-23882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E89C1C68D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 18:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5ED3C34AE3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 17:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F35034F27D;
	Wed, 29 Oct 2025 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELB/AyL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94B34EEF5;
	Wed, 29 Oct 2025 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761758413; cv=none; b=rWG8BulD+ynt3QBztYhjN20Ncq4VKtN2wPmf6jhI1OMqOrjscYZ5rVSge4U//g+nFgptgDlFG7j15ltgrGzrqv4YP+Tpm+KjLyGZjsGaCNAQjnVJXXJ1gESNKzGrYKoQwYPntruBCu59LEytMBigAZYol/XYmIpPz6hDBbAcia4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761758413; c=relaxed/simple;
	bh=65FyGIkkwp1js4Wp8sYOXm3ey3tzmJJd+jmMKiQaV04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPiACl9qqJ4UBGpJGFflFN2GVTwvtDSC8bEX0Bl5eiD3nsBhq1KZAkRKpUm9MIk4K9xrUpf/Rlsr0VEnb06Whf+4CPo9qGtB1Ba6ytbZxYKp8tCocy4duO2JyaVT6ymwfVZN8KAZBcDbwlSc2wmBiQZhtGihcGJ4GzMCJzer/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELB/AyL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAA8C4CEF8;
	Wed, 29 Oct 2025 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758412;
	bh=65FyGIkkwp1js4Wp8sYOXm3ey3tzmJJd+jmMKiQaV04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELB/AyL5deaCCKeGWvWoISjvsovIELLv7JxG69kwZkivbdlvFql+jNUxowLqXhfkd
	 2tcHQHAcubLW7AiZUDBtZErD7AJPGx834uygoyufhw3tKjo6bfBicHS3HLbjcwSmgK
	 cVCd6wcMHiIbcVt7PlG3MRWS6QwXtb+6wM8oaXt8XeroB/73QiNaSdS937TqMxbJs8
	 +Mis3OcDljRo+zn/EwRRhybxl+zNwmuEjFqEma7lj6YIhfPC4hFWhp77UFNripXmF3
	 bkq5aNqVkefpMXI2PN5exJu5C9FNc2tJj+om54urPocotzQQzhaTo9BathW3GeVlus
	 pJTnUokzdLt2w==
Date: Wed, 29 Oct 2025 17:20:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Message-ID: <20251029-tannery-antics-f47cd59274b0@spud>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-4-biju.das.jz@bp.renesas.com>
 <20251028-mower-mundane-316cdd6b48b6@spud>
 <TY3PR01MB11346372AB6D191D30B4F058B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20251028-veteran-smell-963bb76ab3ff@spud>
 <TY3PR01MB11346239D8EB6EF5D120ABA0086FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8/owQVjh2mo2RhT/"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346239D8EB6EF5D120ABA0086FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--8/owQVjh2mo2RhT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 08:26:08PM +0000, Biju Das wrote:
> Hi Conor Dooley,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 28 October 2025 19:52
> > Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document =
RZ/G3E support
> >=20
> > On Tue, Oct 28, 2025 at 07:41:33PM +0000, Biju Das wrote:
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - renesas,r9a09g047-rsci
> > > > > +              - renesas,r9a09g047-rscif
> > > > > +    then:
> > > > > +      properties:
> > > > > +        clocks:
> > > > > +          minItems: 5
> > > > > +
> > > > > +        clock-names:
> > > > > +          minItems: 5
> > > > > +
> > > > > +      required:
> > > > > +        - resets
> > > > > +        - reset-names
> > > >
> > > > Does this need an "else: properties: resets: false"? Or do other de=
vices actually have resets too?
> > >
> > > It is not required as resets are optional for RZ/T2H and RZ/N2H.
> > > RZ/T2H and N2H does not have Resets.
> >=20
> > This is a contradiction. Either they are optional for these platforms o=
r the platforms do not have
> > resets. Cannot be both!
>=20
> Some RSCI IP SoCs has resets and some does not have. From RSCI IP point o=
f view
> this property is optional.
>=20
> I just try to avoid complex if else statements in dt schema by adding
> Per SoC properties.
>=20
> If you prefer else statements for resets, I can add that as well. Please =
let me know.

I would prefer that you do that, yes.

--8/owQVjh2mo2RhT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJMxwAKCRB4tDGHoIJi
0vlZAP4vJX6jue1CICENBLmOUIFC2Kwhpbkt+1Jks7YDrIlgBgEAurOnuml7ge9D
q/Oxs5telN5mLXaaJdzUPYQ9gSsE2wY=
=oa+q
-----END PGP SIGNATURE-----

--8/owQVjh2mo2RhT/--

