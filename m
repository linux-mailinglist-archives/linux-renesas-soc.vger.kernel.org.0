Return-Path: <linux-renesas-soc+bounces-27588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF8dJXEle2nXBgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:16:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE5AE099
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EA7A30037C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA137F8BC;
	Thu, 29 Jan 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mr7IhBj2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263937F8B1;
	Thu, 29 Jan 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678186; cv=none; b=QPxSZ+SGYM4QULVP5ENDP8VHdDMnZfpkURC9TYUe3/zJXZVah+atbHh5jIRKxL1VjJYqqHY8H5yLhkZ49ijLrdLi5LE+ss3G/acTPntqWuSEam5vpjuMMY5ToLZw1auOzQHmlyPJUwy3FMyGsg2Zlp1zJ8L6VLe+dLpvnBO2OK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678186; c=relaxed/simple;
	bh=1HIOr9VqVgD+lxbUBD7uTKdPs29LMRiAJ8svnoIwY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCRGc5O8iJwQ+Q0761viD+OSErPazEd7enS03WgZmK6BSkw6qPZfmz+cy3SWkLkWT6aYXyqiydTr0bR89LGC1obGb+K5itu9BEGF7HASvPr2ktR6eMQjp6wNLaJT2uuSAmfiuPuNhMAQB4Cu4L4YHmY94JusU7CSOFMcN/Av2Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mr7IhBj2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6619C4CEF7;
	Thu, 29 Jan 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769678186;
	bh=1HIOr9VqVgD+lxbUBD7uTKdPs29LMRiAJ8svnoIwY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mr7IhBj2Pzbp5FXotoHGbmDxEe2LdR34si8ZN7qog3ATafMGOeWQGczCYUXpkUiGL
	 UkPFclrsLSw05vg53pCEAY1OYevxG8oD36d3uistZ7vxnR3kAJ0BBiVDqNjKTdVy3z
	 YWBaEP2aVhgJwYXDj8jnXyaBzX4EDmqjEAT9fjJqnrvnyNiTYQ0YiejFjTzcZYlPVi
	 /6bDH7AUIqWvzqk/yW7JrocQuK+jrQ7vpdqfNmzpwU8RRBzAvYckGtsOeEGBN3upRm
	 2zR/t0CUQBdymskYWs8QHKpMJ7VB/3XlnlvxUzuKI5MEo9/uY1V0DbEWBAMRaWQ1pW
	 qRlHL002bzgsA==
Date: Thu, 29 Jan 2026 09:16:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
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
Message-ID: <20260129-public-musty-ff00b2f8dda7@spud>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128-sequence-platypus-59ae3318318a@spud>
 <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <20260128-debatable-scribe-4e55c208b31a@spud>
 <CAMuHMdWYKFoBnGaCfvVJFwYXEvtVyxXiAzHC2JvmTCwc5H91wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b/mrbCtz2k8FTwAK"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYKFoBnGaCfvVJFwYXEvtVyxXiAzHC2JvmTCwc5H91wQ@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27588-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D0CE5AE099
X-Rspamd-Action: no action


--b/mrbCtz2k8FTwAK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 09:04:45AM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Wed, 28 Jan 2026 at 21:09, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Jan 28, 2026 at 06:51:48PM +0000, Cosmin-Gabriel Tanislav wrote:
> > > > From: Conor Dooley <conor@kernel.org>
>=20
> > > > On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> > > > > The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers =
that
> > > > > can be used with the RSPI peripheral. The current bindings only a=
llow a
> > > > > single pair of RX and TX DMAs.
> > > > >
> > > > > Allow multiple DMAs by only restricting the possible names of the=
 DMA
> > > > > channels.
> > > >
> > > > > All '.*-names$' properties must conform to the string-array.yaml
> > > > > meta-schema, which requires both minItems and maxItems properties=
 to be
> > > > > present before the items can be a schema. Otherwise, the items ne=
ed to
> > > > > be an array.
> > > >
> > > > Why is this in the commit message?
> > >
> > > To provide a context for the maxItems that are needed below, even if
> > > there's not really a maximum. Which is why having a maxItems does not
> > > really make sense but it is expected by the meta-schema so we can
> > > constrain the names of the DMA channels.
> > >
> > > dtschema/meta-schemas/string-array.yaml:
> > >
> > > if:
> > >   not:
> > >     required:
> > >       - minItems
> > >       - maxItems
> > > then:
> > >   properties:
> > >     items:
> > >       type: array
> >
> > Right. You can probably remove all that since I'm asking you to add
> > actual constraints to the property.
> >
> > > > > Declare a generous maxItems of 32, which should be enough for 16 =
DMA
> > > > > controllers, so that we don't have to update this value ever agai=
n, even
> > > > > if currently the maximum number of DMA controllers on a Renesas S=
oC is
> > > > > 5.
> > > >
> > > > Huh, No. The binding should constrain this to fit what the actual
> > > > devices do.
>=20
> The device is the SPI controller, or the SoC where the SPI controller
> is integrated?

Whether the SoC's number of dma controllers is the limiter or whether it's
the number of inputs to the spi controller isn't something I know the
answer to (and which it is in theory could vary between SoCs), so I used
device instead of "SoC integration of the spi controller represented by
a given compatible".

> > > Should the binding for SPI be updated if a device ever comes up with
> > > 6 DMA controllers? It seems a bit unrelated to me. In this case, shou=
ld
> > > we constrain the number of dmas and dma-names per SoC? Some may have 2
> > > DMA controllers, while others may have 5. Please let me know your
> > > thoughts, taking into account that I only added maxItems to satisfy t=
he
> > > meta-schema.
> >
> > Yes, I think you should constrain it to the correct number of providers
> > for each device.
> > Whether that's done or not, there's not all that much reason to set it
> > above whatever the current maximum is, since the binding will have to be
> > updated to add the compatible for whatever device exceeds the current m=
ax
> > and the limit can be increased then.
>=20
> The actual maximum number of dmas pairs does not depend on the SPI
> controller, but on the SoC integration.  I think the (single) DMA
> request signal from the SPI controller is just wired to all DMACs
> present (on this SoC, IIRC there were some Renesas SoCs where some
>  DMA clients are wired to only a single DMAC).

Right, that's largely what I had gathered from Cosmin-Gabriel's comments
and the patch itself. I think the comments I made here are all still
applicable? If there's a new SoC, there'll be a new compatible for the
spi controller's integration on that SoC and the limit can be bumped
then.

Cheers,
Conor.


--b/mrbCtz2k8FTwAK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXslYQAKCRB4tDGHoIJi
0uKTAP4/jiLNrrz+gQV2hmFeqaAc7+mUUn6ERJZQEFt0ivyM/QD+PtCjUjHX5RKk
aSa0BCvzov2G0mJ8s4yiTFXGlOtjgAU=
=hJtA
-----END PGP SIGNATURE-----

--b/mrbCtz2k8FTwAK--

