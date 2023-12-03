Return-Path: <linux-renesas-soc+bounces-576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB13802338
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CE00B209D7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 11:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08FD9479;
	Sun,  3 Dec 2023 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h02LdJUY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40828F0;
	Sun,  3 Dec 2023 11:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47062C433C7;
	Sun,  3 Dec 2023 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603669;
	bh=WppOhn+V4cibB5jAHxFZ6BrLfNvTp12F31fCylrnoyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h02LdJUYvoBJbsmPJ7iqYbTHZEp2sHNoK81kwiJrAvkBAc6Z7WQ3OAvWGVvhedxrb
	 NGStz3xCYWAAyrg+bfKTqo8G7cJ2gmilXJKcj940zCKQIoYqrr6y0eCA0BOPrJ23uS
	 HWQTQSmvOR1O9n0u6/zISet9aegZMcpwPRaWqg0vz+G6jcdQXYChQ4tEIIqFfMMtJ/
	 zbhEA0Nh/BAmr+b4YIijFj9dwEPHc4zM4c6HBaZdEKPX1FYthCmiEsVI1B+N0m6YJW
	 2b8XAHlAQfyL51buV2MYGpeLR0pzV2nJy46TEKNQAItsHKOd2KYhAvYsfQtHo+R8rm
	 QZ+31xik5x1PQ==
Date: Sun, 3 Dec 2023 11:41:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: da9062: Update watchdog
 description
Message-ID: <20231203-unblock-xerox-cdc5dd68230b@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-9-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LZxcqQnrMeSSRTwB"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-9-biju.das.jz@bp.renesas.com>


--LZxcqQnrMeSSRTwB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:32PM +0000, Biju Das wrote:
> Update watchdog description by referring to dlg,da9062-watchdog binding
> file.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documenta=
tion/devicetree/bindings/mfd/da9062.txt
> index e4eedd3bd233..020106322b08 100644
> --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> +++ b/Documentation/devicetree/bindings/mfd/da9062.txt
> @@ -86,7 +86,7 @@ Sub-nodes:
> =20
>  - onkey : See ../input/da9062-onkey.txt
> =20
> -- watchdog: See ../watchdog/da9062-wdt.txt
> +- watchdog: See ../watchdog/da9062-watchdog.yaml

Should this not be squashed with the conversion of that binding?

> =20
>  - thermal : See ../thermal/da9062-thermal.txt
> =20
> --=20
> 2.39.2
>=20

--LZxcqQnrMeSSRTwB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxpTwAKCRB4tDGHoIJi
0ppSAPj2ocWXzisf9CBMsBgJWCXIPbagg21Gpha5t/bZETbQAQDxff1YCpSn+s2W
EkQjtc8mZUPHM7JFr1PV7IWFKaHjDg==
=3nQV
-----END PGP SIGNATURE-----

--LZxcqQnrMeSSRTwB--

