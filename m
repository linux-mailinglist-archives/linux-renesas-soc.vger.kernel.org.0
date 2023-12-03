Return-Path: <linux-renesas-soc+bounces-575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D45802334
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1CE1C20492
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 11:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2A99465;
	Sun,  3 Dec 2023 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fmdsv4Ak"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DA28F0;
	Sun,  3 Dec 2023 11:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA4C433C7;
	Sun,  3 Dec 2023 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603631;
	bh=buvZcPAcm+4JN+L52lErx+iUwSJCvQsdlQSPCe/mgRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fmdsv4Akbvm+rzlY8rlOp/2PHghdj4gay8ypbn/su6If30LN632o4kaTcO4AgERan
	 ocmLOnwpFQD5K7kmNltnognxsAi2OQEaWjNUz3BgVz1bLo8rlf/Bs/tdhyAn/8unDU
	 1qjGeo8dKFTHgdXmmJK7k7clJUGLPwRp9uKvY83RAJjFusAGoIQJeznkPwqy/sp0d2
	 Z7EqdFds6/XDzcjXPftdHFb09dCSfEIeLwjK114cgnDq3a8VPJLlwNrDpNiEoTZPRa
	 uZ9CjiIV+l0OhN1lUkpFGTQENYgILeqSaOUsyPMl6oi2QIR1dJADWBTOrlQBK6D3IX
	 xe2cw1SOPHvYA==
Date: Sun, 3 Dec 2023 11:40:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 07/11] dt-bindings: mfd: dlg,da9063: Sort child devices
Message-ID: <20231203-easing-panorama-f3fe8695dd39@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-8-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eeHzAl0fC37/icXn"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-8-biju.das.jz@bp.renesas.com>


--eeHzAl0fC37/icXn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:31PM +0000, Biju Das wrote:
> Sort child devices alphabetically.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/mfd/dlg,da9063.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Docu=
mentation/devicetree/bindings/mfd/dlg,da9063.yaml
> index 468d31b1135b..ecdef322723d 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> @@ -38,14 +38,6 @@ properties:
>    "#interrupt-cells":
>      const: 2
> =20
> -  rtc:
> -    type: object
> -    $ref: /schemas/rtc/rtc.yaml#
> -    unevaluatedProperties: false
> -    properties:
> -      compatible:
> -        const: dlg,da9063-rtc
> -
>    onkey:
>      $ref: /schemas/input/dlg,da9062-onkey.yaml
> =20
> @@ -57,6 +49,14 @@ properties:
>          $ref: /schemas/regulator/regulator.yaml
>          unevaluatedProperties: false
> =20
> +  rtc:
> +    type: object
> +    $ref: /schemas/rtc/rtc.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      compatible:
> +        const: dlg,da9063-rtc
> +
>    watchdog:
>      $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
> =20
> --=20
> 2.39.2
>=20

--eeHzAl0fC37/icXn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxpKQAKCRB4tDGHoIJi
0pJCAPYyP6WpbqbA8dyiYOY7bR34Nv47qmMkDxFfFszFXcuNAQCp4o4nIExwgZZ1
k++j5xHjkQS/GyV9mMLa5mZhh7uuAw==
=FUz6
-----END PGP SIGNATURE-----

--eeHzAl0fC37/icXn--

