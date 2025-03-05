Return-Path: <linux-renesas-soc+bounces-14017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320AA504D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3021886DA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2666224E013;
	Wed,  5 Mar 2025 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVEDQkNI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB4194A75;
	Wed,  5 Mar 2025 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191933; cv=none; b=RsbS457UvH2lnczVl6OekuvOCZZ/g/Re6z7b0fUm2tGZda1eUOpSr+6YHTdM5HDvgqJPTgkg6V/PZPmfAZ6M/jhtd84yro/07Cz5I7LH8vPppFJ6DTNmLNm5O3OMVRLCbNnR/l/S5ImiexPEcOxW+3AS47X/zPVd4QRmOcDW0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191933; c=relaxed/simple;
	bh=EFZ9G/WtA/pTPK8EaCpTGFL8LhCBxXQSlgDb21teUfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I70eChZvgnIOrlWV+UD/uqIubIOMD0q5HXqoRAmbc/5TRGHCb3Pa4AtVQSqDiQdJZfOkCYieSWAeyEV0HDXocUr0kQlIOEZDbcm3RwwY1lgrrLO+cL6dXgJV3Ef80qq3H6UrWwKgEs8c6sJxeg0n+vXEqChygEqqx3yPXQ/2XLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVEDQkNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D748DC4CED1;
	Wed,  5 Mar 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741191932;
	bh=EFZ9G/WtA/pTPK8EaCpTGFL8LhCBxXQSlgDb21teUfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVEDQkNIpGdnP6b3Jo/fXpVvxkYHeEbBs6avDMlECnvSGC/3JaVGqTIEXiP5Bk/cx
	 xn8Ult6Fx7Bs7dAKHKk6J4+lshuIpVkzNwgJt9OagRMt4tGLcduSSVgIo6ciqCOrK0
	 a3GpbZQEpu53hDa8nuqySsFLaoFNfZBpLg7RjjIy7CKXVKzYpsxTB5dQUd17lPemcv
	 MLqwHD1Jogs7ZQWIITysRhaZwaXJgjR8508AdfBk5UgDMoQLtU9rJU5h4H5w0mjrm8
	 +U0xf5nBltOoUgOT3FNjpkA/ln9eBmiEywLtN0ek1N5TYedRknoDryeeqhAZUKjl21
	 vgVyZyd8y0rEA==
Date: Wed, 5 Mar 2025 16:25:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: ufs: renesas,ufs: Add calibration
 data
Message-ID: <20250305-enlarging-ivory-c9a4117c2977@spud>
References: <cover.1741179611.git.geert+renesas@glider.be>
 <2f337169f8183d48b7d94ee13565fea804aade84.1741179611.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iTCGnuTe6ru2CM2J"
Content-Disposition: inline
In-Reply-To: <2f337169f8183d48b7d94ee13565fea804aade84.1741179611.git.geert+renesas@glider.be>


--iTCGnuTe6ru2CM2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 02:34:09PM +0100, Geert Uytterhoeven wrote:
> On R-Car S4-8 ES1.2, the E-FUSE block contains PLL and AFE tuning
> parameters for the Universal Flash Storage controller.  Document the
> related NVMEM properties, and update the example.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> v3:
>   - New.
> ---
>  .../devicetree/bindings/ufs/renesas,ufs.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml b/Doc=
umentation/devicetree/bindings/ufs/renesas,ufs.yaml
> index 1949a15e73d25849..ac11ac7d1d12f6c9 100644
> --- a/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> @@ -33,6 +33,16 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  nvmem-cells:
> +    maxItems: 1
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: calibration
> +
> +dependencies:
> +  nvmem-cells: [ nvmem-cell-names ]
> +
>  required:
>    - compatible
>    - reg
> @@ -58,4 +68,6 @@ examples:
>          freq-table-hz =3D <200000000 200000000>, <38400000 38400000>;
>          power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
>          resets =3D <&cpg 1514>;
> +        nvmem-cells =3D <&ufs_tune>;
> +        nvmem-cell-names =3D "calibration";
>      };
> --=20
> 2.43.0
>=20

--iTCGnuTe6ru2CM2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8h69wAKCRB4tDGHoIJi
0sCxAQCep3b4T3WYxtZ23B5yEf0Jo1asun/a5AUY+1H931I6jgD9GXv1hOBd0Ian
PsJ5Dl4/8FWJG9jrQ+CCPNJBAWA0XQM=
=wvdV
-----END PGP SIGNATURE-----

--iTCGnuTe6ru2CM2J--

