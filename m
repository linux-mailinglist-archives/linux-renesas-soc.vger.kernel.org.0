Return-Path: <linux-renesas-soc+bounces-10685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BF9D8C7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 19:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5C6A280A12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 18:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36471B87FF;
	Mon, 25 Nov 2024 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3J1IcwF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EB1AF0CB;
	Mon, 25 Nov 2024 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560727; cv=none; b=uvM9FFN/8h3zU5jENgfP/iegNY0lFJ8ffBpYsGjvHXYSk3CLW5EjjXUGYsBTQ0WT6Pt0HKs6aTzvEY1XWJDxw4Ufrn4Vsi+aSsfyM/QCgzMqdKGy7thkenWOOqdY5/kffuywlc1Yc5XCqArFDGz5VI9nLOmm9AVTYKlch8tbOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560727; c=relaxed/simple;
	bh=mKMQ/0/bebR+xzmVNwCCwPb6SZTFkeNtsjOlX+uifcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJQKnEj0BQVBVOuzvhbsB6MMumggjGFGFbaZuLLx+Ye1H0asnA+RIhjC4lHsOqcSSadBtIiQWY63hjJP5LcPaFqaGouwq0hCbUPoNHJFm6v9p8OhY7jEwcmKgG4HbquvI1vnnTGj+mPiPi9nzD/aRLxv3uqb/G+gaKU3fH7Qc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3J1IcwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E81BC4CECE;
	Mon, 25 Nov 2024 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560727;
	bh=mKMQ/0/bebR+xzmVNwCCwPb6SZTFkeNtsjOlX+uifcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3J1IcwFR4pRE/WD4jTH3kToH9TR4oF376WWibSxmJu6VGQiiBHR5YMvEFtGSL5Cf
	 0yVZN5KWLKgoHyBFg6h7edoMX1m6+nThmT8l1Qy+DhwPxhoK2XQb/Jr88kKTr/FIQE
	 FwJ7UXoxjtnZAbx+PZLkUZTGFPcevxmbIgxN0iPW4RqSk11tvvFVtbuAiLOF6O7Cwp
	 UyMA7f0gNZbEdaTdJPRDhS7F2uN084rIJOzhgbfEiXXYEzeQb9Q5z9Uv/pnkxmMXz6
	 EjrXl6uO33s8MoFmXenyOo9yDPKPh6U9qZapyvntNFFvvfEegrmkYDDKJnCxKb+U0V
	 qBWzhIdhvGnQg==
Date: Mon, 25 Nov 2024 18:52:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
Message-ID: <20241125-straw-oozy-f95e18e4704f@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nurXU/Tl5/Z17flC"
Content-Disposition: inline
In-Reply-To: <20241122124558.149827-4-biju.das.jz@bp.renesas.com>


--nurXU/Tl5/Z17flC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 12:45:39PM +0000, Biju Das wrote:
> Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
> on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
> consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
> The SoM module sits on top of the carrier board.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 7cc2bb97db13..1785142fc8da 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -527,6 +527,10 @@ properties:
> =20
>        - description: RZ/G3E (R9A09G047)
>          items:
> +          - enum:
> +              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
> +          - enum:
> +              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)

Why are these enums, when you have a single item in each?

>            - enum:
>                - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Et=
hos-U55 (21mm BGA)
>                - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 + Et=
hos-U55 (15mm BGA)
> --=20
> 2.43.0
>=20

--nurXU/Tl5/Z17flC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0THUwAKCRB4tDGHoIJi
0jdpAP9fwetH+VZoexF7NAZb10AHoeGz59YVjCzqmBxebDlWyQD/ZnjWMrMAXfby
7Ga2hpZP5J3xRGX757OkwQfU+h0BqQU=
=wvB/
-----END PGP SIGNATURE-----

--nurXU/Tl5/Z17flC--

