Return-Path: <linux-renesas-soc+bounces-27630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOiTKGyde2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:48:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB6B3321
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 765A4302BE25
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0872C2561AB;
	Thu, 29 Jan 2026 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjkb4H4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC33542F0;
	Thu, 29 Jan 2026 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708704; cv=none; b=PBI8xLsk4mZx0kkwM2hvU1Pr9NvuvOWbFXr9xQ0VcJHvbF0YaYGT98aoKpWEinlMohqMTNAzlXwanltngPEez3Vq6Fx7t9TFoTBPsNfqHCozUnnq8HZyVGbi6676RP6Zmz2KyOjocPH5DYfrQVLxHeN9akydk86D9ceuE/Via+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708704; c=relaxed/simple;
	bh=ndBfCHkA2Ayj5nfVXz5sWWveAl4ySbg4uPj6aKsmfw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGRN6WMZ0XIaapYM6oMltl3lHjj/010kIMuPtCM+hkUQIKE3vdPUeR6f4zCutbeLpwObrOXTwDhT6De8oGoXCT4NSQI6NMj823sQ/YAaDV7gLEy3hFuj7QTJvfZLnHBWkvQBrr9T7ROd8PAb1HxqLa3sffi7qjv/NEiMASIg+4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjkb4H4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180B5C4CEF7;
	Thu, 29 Jan 2026 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708704;
	bh=ndBfCHkA2Ayj5nfVXz5sWWveAl4ySbg4uPj6aKsmfw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tjkb4H4Z1Izb5U+jryPtITVTFwnv6AYZJRIn2o+zL4HS47mU+Lwkj/nydqjl7gQoG
	 4UUOXO+NJb9WXHzIhSBG87+BNlg/u08vlIRmCQMRw5tA1jSpXVh9TjGuhvLycMBIZ7
	 kqTAXyyn2pIFASvNfkIPNbg9ykIyra0qBpgZz6z3XkD/zHfQebQtBYdf3jXxqZ5uuB
	 0aR2AT/GJ+OFUo2LDpAwSRIDHb1GklZafgFTucOk97a6wL7KFRFoMFgGIURvigCYbB
	 VOuv8cZ3Rx44dHfFZGVkQCiydGpumr9B8sN3yWGgqoro8zpg7/kBQnj0/5q6kbVJab
	 prevGGY3+Y9Rg==
Date: Thu, 29 Jan 2026 17:44:59 +0000
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
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Message-ID: <20260129-thigh-yoyo-b1e6cf9d455d@spud>
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qSuwrAcANmKz3+ao"
Content-Disposition: inline
In-Reply-To: <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27630-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02EB6B3321
X-Rspamd-Action: no action


--qSuwrAcANmKz3+ao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:51:30PM +0200, Cosmin Tanislav wrote:
> All supported SoCs have multiple DMA controllers that can be used with
> the RSPI peripheral. The current bindings only allow a single pair of RX
> and TX DMAs.
>=20
> The DMA core allows specifying multiple DMAs with the same name, and it
> will pick the first available one.
>=20
> There is an exception in the base dt-schema rules specifically for
> allowing this behavior (dtschema/schemas/dma/dma.yaml).
>=20
> dma-names:
>   anyOf:
>     - uniqueItems: true
>     - items:
>         # Hack around Renesas bindings which repeat entries to support
>         # multiple possible DMA providers
>         enum: [rx, tx]
>=20
> Allow multiple DMAs to have the same name and only restrict the possible
> names of the DMA channels, not their count.
>=20
> For RZ/T2H and RZ/N2H SoCs, limit the number of DMA channels to 6, as
> they have 3 DMA controllers.

What's the rationale behind not setting minItems to 6 here

>=20
> For RZ/V2H and RZ/V2N SoCs, limit the number of DMA channels to 10, as
> they have 5 DMA controllers.

and to 10 here? Do any of the spi controllers on these SoCs not have the
ability to use all of the available dma controllers?

>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>=20
> V3:
>  * impose proper maxItems for each device
>  * impose maxItems for dmas property
>=20
> V2:
>  * new patch
>=20
>  .../bindings/spi/renesas,rzv2h-rspi.yaml         | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yam=
l b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> index a588b112e11e..cf8b733b766d 100644
> --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> @@ -58,12 +58,16 @@ properties:
>        - const: tresetn
> =20
>    dmas:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 10
> =20
>    dma-names:
> +    minItems: 2
> +    maxItems: 10
>      items:
> -      - const: rx
> -      - const: tx
> +      enum:
> +        - rx
> +        - tx
> =20
>    power-domains:
>      maxItems: 1
> @@ -121,6 +125,12 @@ allOf:
>          resets: false
>          reset-names: false
> =20
> +        dmas:
> +          maxItems: 6
> +
> +        dma-names:
> +          maxItems: 6
> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.52.0

--qSuwrAcANmKz3+ao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXucmwAKCRB4tDGHoIJi
0s+bAQCu2eWvDjtlEUBNGPMXObX2cjiaHK1N/qUiyWUkXWqbawEAtK3/nr6DFCgK
azLHXbyOVAfrcjHTGSdUhihWt++/cg0=
=IRTg
-----END PGP SIGNATURE-----

--qSuwrAcANmKz3+ao--

