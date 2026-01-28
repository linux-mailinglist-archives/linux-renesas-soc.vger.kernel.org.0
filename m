Return-Path: <linux-renesas-soc+bounces-27567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBSHFABtemne6AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:09:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78742A861B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B95230055CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 20:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2FF36F435;
	Wed, 28 Jan 2026 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1+ussOA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66F328614;
	Wed, 28 Jan 2026 20:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630970; cv=none; b=T/dfL2oPgNx214Fhl2MHE+oqA/QYJbZ60zkjmptt9bfmPzEc25POsB5IOS1QDrs2zkjNCUVnCVlXkO2+zIAdVU4z8RYrLH5xNr3J+HTI2RD6Y5oNh9+EZJzqhea2P1yo7/Uf9G9UZo3icZhq+inv0tU218aRevCLbJm4pm+FI6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630970; c=relaxed/simple;
	bh=xP1UrJYoo9PqSH6m3cGOzNBpuoatCQeonA4dE8uoyt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTgyL73o9DHAoRv3VIzTakZ6nxIiIq7heuW4AI7wtL/4L8PEJcHlQPdsCzzD7B2tdqZsCZOlFkPX+Ny9Ejy7pVY/Ao+ghejdxLjmIiSXz5oRebkes1em7xdnHyNOOq7mgHRAL6LFNs26PsRTEnWqfYv2Tw02DZcWPaHSH0iDh80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1+ussOA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F70C4CEF7;
	Wed, 28 Jan 2026 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769630970;
	bh=xP1UrJYoo9PqSH6m3cGOzNBpuoatCQeonA4dE8uoyt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1+ussOA6D74+DDBHmWN/G4Jsyhy9stzvol0jmfEahdAOqtYY/lz1SXXYiOIC9wBk
	 3JqOF7jrlf9rZtqDYBl0gjB3QXysGPoYcR4TPjCQrkNB53AFNce+qu7TzO1Trpb46U
	 1Gvdbr8onzOsulpjRsf8hmkG/2U/nZrnQRpjuxsgzcE3GP8wFjLXsMah9somh5InLb
	 h66Jpf3shJ/ae69WMCaL5c6QOQQqoFr2CyqXxKySH/4rwQaTOcqdp9ZfsFA39Uhp5y
	 ZKdKsrKsFHaXXI3OPtOD3Q/f9VjsK4Trdu7H3qkXV4EA2zNFeKMe8VEgD7ol8bWlV8
	 QTABrY2Vfo0Ww==
Date: Wed, 28 Jan 2026 20:09:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Message-ID: <20260128-debatable-scribe-4e55c208b31a@spud>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128-sequence-platypus-59ae3318318a@spud>
 <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pLCfrU3bVE1x79WZ"
Content-Disposition: inline
In-Reply-To: <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27567-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 78742A861B
X-Rspamd-Action: no action


--pLCfrU3bVE1x79WZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 06:51:48PM +0000, Cosmin-Gabriel Tanislav wrote:
> Hi Conor, thank you for your response.
>=20
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Wednesday, January 28, 2026 8:09 PM
> >=20
> > On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> > > The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers that
> > > can be used with the RSPI peripheral. The current bindings only allow=
 a
> > > single pair of RX and TX DMAs.
> > >
> > > Allow multiple DMAs by only restricting the possible names of the DMA
> > > channels.
> > >
> >=20
> > > All '.*-names$' properties must conform to the string-array.yaml
> > > meta-schema, which requires both minItems and maxItems properties to =
be
> > > present before the items can be a schema. Otherwise, the items need to
> > > be an array.
> >=20
> > Why is this in the commit message?
> >=20
>=20
> To provide a context for the maxItems that are needed below, even if
> there's not really a maximum. Which is why having a maxItems does not
> really make sense but it is expected by the meta-schema so we can
> constrain the names of the DMA channels.
>=20
> dtschema/meta-schemas/string-array.yaml:
>=20
> if:
>   not:
>     required:
>       - minItems
>       - maxItems
> then:
>   properties:
>     items:
>       type: array

Right. You can probably remove all that since I'm asking you to add
actual constraints to the property.

> > > Declare a generous maxItems of 32, which should be enough for 16 DMA
> > > controllers, so that we don't have to update this value ever again, e=
ven
> > > if currently the maximum number of DMA controllers on a Renesas SoC is
> > > 5.
> >=20
> > Huh, No. The binding should constrain this to fit what the actual
> > devices do.
> >=20
>=20
> Should the binding for SPI be updated if a device ever comes up with
> 6 DMA controllers? It seems a bit unrelated to me. In this case, should
> we constrain the number of dmas and dma-names per SoC? Some may have 2
> DMA controllers, while others may have 5. Please let me know your
> thoughts, taking into account that I only added maxItems to satisfy the
> meta-schema.

Yes, I think you should constrain it to the correct number of providers
for each device.
Whether that's done or not, there's not all that much reason to set it
above whatever the current maximum is, since the binding will have to be
updated to add the compatible for whatever device exceeds the current max
and the limit can be increased then.

> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.co=
m>
> > > ---
> > >
> > > V2:
> > >  * new patch
> > >
> > >  .../devicetree/bindings/spi/renesas,rzv2h-rspi.yaml    | 10 ++++++--=
--
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi=
=2Eyaml
> > b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > index a588b112e11e..383e97f0dabd 100644
> > > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > > @@ -57,13 +57,15 @@ properties:
> > >        - const: presetn
> > >        - const: tresetn
> > >
> > > -  dmas:
> > > -    maxItems: 2
> > > +  dmas: true
> >=20
> > This should have the same constraints as dma-names. You've now allowed
> > this to have 1 and 33 dmas, because there's no requirement to have
> > dma-names when you have dmas.
> >=20
>=20
> I agree, I will fix it for V2 once you decide how to proceed with the
> other comments.
>=20
> > >
> > >    dma-names:
> > > +    minItems: 2
> > > +    maxItems: 32
> > >      items:
> > > -      - const: rx
> > > -      - const: tx
> > > +      enum:
> > > +        - rx
> > > +        - tx
> >=20
> > You've changed this to allow 32 dma-names, but they all need to be
> > called either "rx" or "tx", how is a driver meant to use dma-names to
> > get the second pair of dma channels? Shouldn't anything in excess of the
> > first two start getting numbers appended so that a driver can actually
> > request them?
> >=20
>=20
> The DMA core handles multiple DMA channels with the same name by checking
> their availability consecutively until finding an available one.

TIL

> I agree that this is not pretty but this pattern is already used in the
> bindings / device tree for many Renesas IPs.
>=20
> There's even an exception inside dt-schema specifically for this.

Hmm, I see. Can you please put this into the commit message cos otherwise
this looks really strange!

>=20
> dtschema/schemas/dma/dma.yaml:
>   dma-names:
>     anyOf:
>       - uniqueItems: true
>       - items:
>           # Hack around Renesas bindings which repeat entries to support
>           # multiple possible DMA providers
>           enum: [rx, tx]
>=20
> > pw-bot: changes-requested
> >=20
> > Conor.

--pLCfrU3bVE1x79WZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXps9QAKCRB4tDGHoIJi
0sf8AP9pbUvn4s5qF0PCWtCLb1jAA/yOxrWa6f659scDXYSBDgEAxzfDklN9nHqu
5GOKbb6nNI1RWhMrVMyb8bQ7bXqDPAY=
=XoY0
-----END PGP SIGNATURE-----

--pLCfrU3bVE1x79WZ--

