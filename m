Return-Path: <linux-renesas-soc+bounces-23799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D5C169E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8028C3493D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9D134F49C;
	Tue, 28 Oct 2025 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxUFZdGh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECF341ACB;
	Tue, 28 Oct 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679864; cv=none; b=T1AQQDUSLiuK/LHAfCxOseK2ltNOuXfTfD8cLMXt73p64BuQbkm48stiYQlFbGWLPCOuDEBnqi6vzCLamkas9fIh5jbexny5V/WB0aB7n6O2NtKu8q/bry+d1iJlJk+S/5YEKDSGs6pyt/cIE6Xf0rSkI1krTfGSEBIBE1rYoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679864; c=relaxed/simple;
	bh=Ap2aDiKKgM3tKJAnZU4Q4B3TnDOwGltx6KfPJhNhQVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ4eY7EJaA0DF+H1KfcvNg15uDdP7zf3bIe7Iv+PSI5ZEr/EhqzbEL8cJhtI7vj9vCyVftSGGWvhywAbc9KuHSOrKxbExt2vzlk1172feJ7tJJ5jmzoWSMyRn1JzPu6cvzLikLMFQLdSIHwcMtHQLtDRshe5TMNT1sTLtZZP2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxUFZdGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA12C4CEE7;
	Tue, 28 Oct 2025 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761679864;
	bh=Ap2aDiKKgM3tKJAnZU4Q4B3TnDOwGltx6KfPJhNhQVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxUFZdGhRnZM0z40KMY6YSizaPIMvp6WZfdcSA0K9AHjK8AgltfHcdJvoY+97btXc
	 WZ19OKL/Jx66G9ZFqHjkApnaKFNxiXTeHRc7FrK7e8zJKzIDGCnntpQilJsuhJPITt
	 SNm+N1M233FJP4lcxwOOOkiHSk1Nnjbs5ehUGy+QqVGNVG6uLB8Xh4GATgxdZMj6jq
	 EEKrf7waFqEoOW9Un5oeZ4rJEhGZIKldMHsbNwrAdB2NcSSCmSu30G3QE//Zkc2WWR
	 /gDtNqJo0y1Z2zYGVBQMVxC0jnyAyO8nDY1dqOtcD8KJpDfXD/QwSNaQ80waMCKM+G
	 UFa3RhVTCd6wQ==
Date: Tue, 28 Oct 2025 19:30:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Message-ID: <20251028-mower-mundane-316cdd6b48b6@spud>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hzAPfaYWKFynogrI"
Content-Disposition: inline
In-Reply-To: <20251027154615.115759-4-biju.das.jz@bp.renesas.com>


--hzAPfaYWKFynogrI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 03:45:50PM +0000, Biju Das wrote:
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
> to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
> has 6 clocks compared to 3 on RZ/T2H, and it has multiple resets.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/serial/renesas,rsci.yaml         | 82 ++++++++++++++++---
>  1 file changed, 71 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b=
/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> index 6b1f827a335b..7cf6348e2b5b 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -10,17 +10,16 @@ maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> =20
> -allOf:
> -  - $ref: serial.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - const: renesas,r9a09g087-rsci # RZ/N2H
> -          - const: renesas,r9a09g077-rsci # RZ/T2H
> +      - enum:
> +          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
> +          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
> +          - renesas,r9a09g077-rsci # RZ/T2H
> =20
>        - items:
> +          - const: renesas,r9a09g087-rsci # RZ/N2H
>            - const: renesas,r9a09g077-rsci # RZ/T2H
> =20
>    reg:
> @@ -42,14 +41,40 @@ properties:
> =20
>    clocks:
>      minItems: 2
> -    maxItems: 3
> +    maxItems: 6
> =20
>    clock-names:
> -    minItems: 2
> +    oneOf:
> +      - items:
> +          - const: operation
> +          - const: bus
> +      - items:
> +          - const: operation
> +          - const: bus
> +          - const: sck # optional external clock input
> +      - items:
> +          - const: bus
> +          - const: tclk
> +          - const: tclk_div64
> +          - const: tclk_div16
> +          - const: tclk_div4
> +      - items:
> +          - const: bus
> +          - const: tclk
> +          - const: tclk_div64
> +          - const: tclk_div16
> +          - const: tclk_div4
> +          - const: sck # optional external clock input
> +
> +  resets:
> +    items:
> +      - description: Input for resetting the APB clock
> +      - description: Input for resetting TCLK
> +
> +  reset-names:
>      items:
> -      - const: operation
> -      - const: bus
> -      - const: sck # optional external clock input
> +      - const: presetn
> +      - const: tresetn
> =20
>    power-domains:
>      maxItems: 1
> @@ -62,6 +87,41 @@ required:
>    - clock-names
>    - power-domains
> =20
> +allOf:
> +  - $ref: serial.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-rsci
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g047-rsci
> +              - renesas,r9a09g047-rscif
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +
> +        clock-names:
> +          minItems: 5
> +
> +      required:
> +        - resets
> +        - reset-names

Does this need an "else: properties: resets: false"? Or do other devices
actually have resets too?

> +
>  unevaluatedProperties: false
> =20
>  examples:
> --=20
> 2.43.0
>=20

--hzAPfaYWKFynogrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEZ8wAKCRB4tDGHoIJi
0jr8AQC10zxwsXijde5bsel7snQi6OfPDcFW0GiEiqh+cx2nSgD+PIWDM1s3mr71
8MFwrONSM+wgriZwn6Wp3KU/b6BVQgs=
=Es4J
-----END PGP SIGNATURE-----

--hzAPfaYWKFynogrI--

