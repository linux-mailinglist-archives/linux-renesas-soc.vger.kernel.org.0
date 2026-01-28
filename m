Return-Path: <linux-renesas-soc+bounces-27563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPuvJDtTemnk5AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:19:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE1A7B00
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBE5A3101DD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC79374163;
	Wed, 28 Jan 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEPNG9h+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34915372B58;
	Wed, 28 Jan 2026 18:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623728; cv=none; b=RE7tyeIOCL0z7PTegLJhSJ1H2Ha5jnciB0fkC0zWJ2e3f+ha4mnRZ1sAKR/hVobGsSv1ROP3lSK3BLddol2OWg2LfEu3Rf30LpW6RuF/50fDvrwCJAnvYu2XE9iweV+fpLiTBcwazeFPHorHNBpj6U2sxlr711yiAPJkpUiktjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623728; c=relaxed/simple;
	bh=2T8vMMg2rf8+1yfCvimfNJF6NzhFISduol0pLG0i8k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSIW/pEjtENTBXir0ix2s76xSTfQlEK5zR/KfdLEnt5nrqd4jwUSRGv5S2XPyco59D1Y4qNFq5sRph0h3XIg13795SGJcPRGadxEaxtHTn/cLlt27UTWHvoXQjdUGvKVjxa+oerUtpHezXFhlq4IBS53S4Yw/5JbXj15LKVIq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEPNG9h+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13AAC4CEF7;
	Wed, 28 Jan 2026 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769623728;
	bh=2T8vMMg2rf8+1yfCvimfNJF6NzhFISduol0pLG0i8k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEPNG9h+z6zOk2rLGkKfYy/JoEz+49mE6uP0elCRJy5W2FvBHngS9zeAsDPE+AKhH
	 M946e9ThxPb3uDGNr+JwxGss1n6O3lK6NHN836xYRo2ypeAvWFLRESKnmrMuPg1tK7
	 7Wf4LqjD2m5Nig22wmhyfv2Cf1cdPzJYOi7ciR5deOl4rkC4qUW2r1lyvf8BPnXpb6
	 0TE9vQp5nhzOYKFQ1sR6Xlk6wLL+Q3eMdN0zVE+iD9YyMJ6BoMDr3CPj/b4rR4dUR4
	 t4uSEayM8PCF471NQ6cEq5il5ViUnIGjjhTLBZ4f/6caN56vlAzSrE0+H0ZDYDMmf7
	 M399H+6l1vdQg==
Date: Wed, 28 Jan 2026 18:08:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Message-ID: <20260128-sequence-platypus-59ae3318318a@spud>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pEGYxEu9IZd+THka"
Content-Disposition: inline
In-Reply-To: <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27563-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 00CE1A7B00
X-Rspamd-Action: no action


--pEGYxEu9IZd+THka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers that
> can be used with the RSPI peripheral. The current bindings only allow a
> single pair of RX and TX DMAs.
>=20
> Allow multiple DMAs by only restricting the possible names of the DMA
> channels.
>=20

> All '.*-names$' properties must conform to the string-array.yaml
> meta-schema, which requires both minItems and maxItems properties to be
> present before the items can be a schema. Otherwise, the items need to
> be an array.

Why is this in the commit message?

>=20
> Declare a generous maxItems of 32, which should be enough for 16 DMA
> controllers, so that we don't have to update this value ever again, even
> if currently the maximum number of DMA controllers on a Renesas SoC is
> 5.

Huh, No. The binding should constrain this to fit what the actual
devices do.


>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>=20
> V2:
>  * new patch
>=20
>  .../devicetree/bindings/spi/renesas,rzv2h-rspi.yaml    | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yam=
l b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> index a588b112e11e..383e97f0dabd 100644
> --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> @@ -57,13 +57,15 @@ properties:
>        - const: presetn
>        - const: tresetn
> =20
> -  dmas:
> -    maxItems: 2
> +  dmas: true

This should have the same constraints as dma-names. You've now allowed
this to have 1 and 33 dmas, because there's no requirement to have
dma-names when you have dmas.

> =20
>    dma-names:
> +    minItems: 2
> +    maxItems: 32
>      items:
> -      - const: rx
> -      - const: tx
> +      enum:
> +        - rx
> +        - tx

You've changed this to allow 32 dma-names, but they all need to be
called either "rx" or "tx", how is a driver meant to use dma-names to
get the second pair of dma channels? Shouldn't anything in excess of the
first two start getting numbers appended so that a driver can actually
request them?

pw-bot: changes-requested

Conor.

--pEGYxEu9IZd+THka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpQqwAKCRB4tDGHoIJi
0kgGAQDiC32wYWDqHtgMo0feJfCqK9GT5ynv9/ghgG3GbuhItwEAh4MHCGZj64KB
Hjq1X1cCblm4zLQB2EdCs9RulMXuQww=
=NMtP
-----END PGP SIGNATURE-----

--pEGYxEu9IZd+THka--

