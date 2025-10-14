Return-Path: <linux-renesas-soc+bounces-23038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 856F9BDB97E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 00:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10C90355216
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 22:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A9730DD22;
	Tue, 14 Oct 2025 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl0ltCIa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6D30CD88;
	Tue, 14 Oct 2025 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760480114; cv=none; b=IgRl/AI9VvVpp7vX8gJOh400BHbIls0827Jw0V71S0YSHJ0pTwSaVzbgJBJIsruba/ZgKmyVa4S0OUZTupMFcflgLL8w+cXqNNW7MRpUf0DqF2SbzV3cQOknRpzfZ3EeIod59ul9ronm1eC0blpmd8+RLHKoGW740qR74o1mN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760480114; c=relaxed/simple;
	bh=KgyniKiyFQd23HrebtH3vCuphtXuSOMM+Bh/BfGRffE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCocz4kqG8028MWtp1IoNDrZpqF1h7Gs0X/18SL27S7KWNEKqqgsfdnQv1ux2j+m1p7pK9FIkH6/NiztiG5eNWo6Af0o6G0L86bf+JjsVN2uIAhbt/ZUPJK7qzhWppsbFPEX/vCQ0I8NBw/oScaLAwDo0NBMJ8RMlRHC/A+QZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl0ltCIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941D7C4CEE7;
	Tue, 14 Oct 2025 22:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760480114;
	bh=KgyniKiyFQd23HrebtH3vCuphtXuSOMM+Bh/BfGRffE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl0ltCIaQzg15GVBhSlGUF3hZpn9xqKCszU+Bdt2RM5W8c8LV3lIhxpJpPZk0bfls
	 dXg3GRaXErfEMP032i8bQDDjecno7KBm1MbQnuIoaU0ZHKEHJ1qsQB0OTrr2ZC2CFF
	 qVMh/T8PBHgWVkt49KwymYodOVz3iyMA2qT4FGAKjgG7F7IozYVUsBO0hK2fRFrYnr
	 zRkbzG2sYwy5puMrOVS2TQlORXvDdfFT6H23NDvHbPuGB946AtTMcLMgjqv4NmAObm
	 wF7LMcYDTummp9q1MNAmLymjyBVDvKYRjtdKqkqT1W3NEbO73JLpbJeSnjZxiCnfja
	 V2neNP2AElBOA==
Date: Tue, 14 Oct 2025 23:15:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: rs9: Fix DIF pattern match
Message-ID: <20251014-limit-mom-fa96e8498dd4@spud>
References: <20251014104626.10682-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khdArLaV7tas5Ih6"
Content-Disposition: inline
In-Reply-To: <20251014104626.10682-1-marek.vasut@mailbox.org>


--khdArLaV7tas5Ih6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 12:46:03PM +0200, Marek Vasut wrote:
> The pattern match [0-19] is incorrect and does not cover range of 0..19,
> use pattern 1?[0-9] to cover range 0..19 instead. Update the example to
> validate all parts of the pattern match and prevent such failures in the
> future.
>=20
> Fixes: 26c1bc67aa2f ("dt-bindings: clk: rs9: Add Renesas 9-series I2C PCI=
e clock generator")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../devicetree/bindings/clock/renesas,9series.yaml    | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml=
 b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> index af6319697b1c0..a85f78ce29702 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> @@ -62,7 +62,7 @@ properties:
>      description: Output clock down spread in pcm (1/1000 of percent)
> =20
>  patternProperties:
> -  "^DIF[0-19]$":
> +  "^DIF1?[0-9]$":
>      type: object
>      description:
>        Description of one of the outputs (DIF0..DIF19).
> @@ -107,6 +107,15 @@ examples:
>              DIF0 {
>                  renesas,slew-rate =3D <3000000>;
>              };
> +
> +            /* Not present on 9FGV0241, used for DT validation only */
> +            DIF2 {
> +                renesas,slew-rate =3D <2000000>;
> +            };
> +
> +            DIF19 {
> +                renesas,slew-rate =3D <3000000>;
> +            };
>          };
>      };
> =20
> --=20
> 2.51.0
>=20

--khdArLaV7tas5Ih6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO7LbgAKCRB4tDGHoIJi
0iRtAP98fuLWwi2rj6BMCq3LRsL0F87fvaNaTczkkSsFtG63WAD9E0Ze2gsjxvy/
xuZ752LZnbtlTZLPDImbROP8GhwIxAw=
=z2F3
-----END PGP SIGNATURE-----

--khdArLaV7tas5Ih6--

