Return-Path: <linux-renesas-soc+bounces-21049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94795B3A6AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 18:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A9C188C939
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84A0322C7A;
	Thu, 28 Aug 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqOWYKbc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCDC3148C1;
	Thu, 28 Aug 2025 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756399273; cv=none; b=fMEBrTtk2sKhxKkqBLUUIp7X1dRLpprr6FA6MShbAraScpqy02LWMfacaY/mIgh/2JhFWIQWrQajZF+yzqQQNQnC0x9xa6iY6iczvoWAwuQ51otlcGc8GPjiCuZ653kI/iNuZnH0vdCRRdBamgsx/uym+fP2CIHB08sDWUSIYQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756399273; c=relaxed/simple;
	bh=O5WGilvJjn98UwZmdL7/0cFkZ2MvpINIIDYO3zyCnJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAhbW6wKVrMJHDJX0ocWiZO8fUqSR4d/FDZX8xc5UtE7EhA0vqVRCZpQiOlauu1SerC+XPU0LGsk4en2hZsdVaC1JDMg/W8hIFyruauTOM+w7OLM3kGYsOWVnR/6nGHwTqnXdMDtgGZagtmtlLn1l0NNfKZQCrC8907DIKnqlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqOWYKbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3B7C4CEEB;
	Thu, 28 Aug 2025 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756399273;
	bh=O5WGilvJjn98UwZmdL7/0cFkZ2MvpINIIDYO3zyCnJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqOWYKbcXoM8srDe6+iGs3WRik2ouU0WYh4TRBgpE0bM+mCS8CgFL6nCpN3wAieyv
	 4Pcmq6n1ehzOS9ZZG6JrrPfz2owy1NUzxJGeqIN0gS42Mg4UWWjB4Yo3EHaKGWs27S
	 EpUtlYN6a/1nKOtN8jdZloxVHs7iSdtQblrQnNctH5GdHLYRHsCWjnZr3SmAkB+Yil
	 lW9mU6rV3fHfvz8w1wZ2yQuzs68zmzJ+i2XAZIZEf7upEybJzOdsEnLBWbmuJMhb/s
	 W2sQWgEA/jF3jAJv2sayOJG8i0wnAxHi6Y6kWTR1d0gkhQTbEcyKVlZwtfFkS2jzCT
	 ovV0HroKWt9gw==
Date: Thu, 28 Aug 2025 17:41:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: renesas: Document R-Car X5H
Message-ID: <20250828-platform-counting-6578d06e3526@spud>
References: <87ldn4uyof.wl-kuninori.morimoto.gx@renesas.com>
 <20250828-esoteric-vivid-raccoon-a86c9a@kuoka>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z0zlR1hZGpsRTJZB"
Content-Disposition: inline
In-Reply-To: <20250828-esoteric-vivid-raccoon-a86c9a@kuoka>


--z0zlR1hZGpsRTJZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 09:27:19AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 27, 2025 at 11:34:09PM +0000, Kuninori Morimoto wrote:
> > Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC
> >=20
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > v1 -> v2
> > 	- add empty enum to avoid allowing invalid use.
>=20
> I don't understand why do you need this. Where is any user of it? There
> is no such in this patchset, so this must be explicitly explained in the
> commit msg.
>=20
> >=20
> >  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml=
 b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > index 5f9d541d177a..e2fec2afbc6d 100644
> > --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> > @@ -473,6 +473,12 @@ properties:
> >            - const: renesas,r8a779mb
> >            - const: renesas,r8a7795
> > =20
> > +      - description: R-Car X5H (R8A78000)
> > +        items:
> > +          - enum:
> > +              - {}               # avoid allowing invalid use. will be=
 replaced to actual board name
>=20
> We don't allow such cases because it is pointless.
>=20
> Otherwise explain in the commit msg why this is needed, why exception is
> justified.
>=20
> You have entire commit msg to explain anything unusual and if you look
> at source code you will not notice such syntax for boards, so clearly
> this is unusual.

They have a soc driver that binds to the compatible, which is why I
suggested this rather than refusing the patch. I do agree it should be
mentioned though.

--z0zlR1hZGpsRTJZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLCGpQAKCRB4tDGHoIJi
0l+eAQCmwZHZN1FP89RnOkKGhXv7LLa3ems4DN/7vYFc1uMr9gD8CzhRYbfDRTf3
YwnJrw/lU8Ig6QGOPutJynJfuMjjAgQ=
=OeLm
-----END PGP SIGNATURE-----

--z0zlR1hZGpsRTJZB--

