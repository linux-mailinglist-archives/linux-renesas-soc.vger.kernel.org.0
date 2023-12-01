Return-Path: <linux-renesas-soc+bounces-533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34296800ED9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 16:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D6F1F20F74
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 15:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C931A4B5C5;
	Fri,  1 Dec 2023 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRIP9moF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A84AF78;
	Fri,  1 Dec 2023 15:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09FAC433C8;
	Fri,  1 Dec 2023 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701446092;
	bh=Jtu29b+nOsCTYQenPURoVfRuZhdP2TIPsH0zcju5w4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRIP9moFcb+aF3ZyUlKmTL+xHjvRS03ZH9ayXoFwHKTvTVFbd9fyfKFQLW74XN175
	 VRVx6FsRhQN0OdK/UFwoEuz1m+8MHwNf3eMgxR8sgMZC9wJ+m1IUSfE5WGu2K1mgMg
	 S1251vmjVEEzwYBeEW9zvAr375NMWcyfLBXMYCYLIFHfJS2C4UQsWKn0adZljRaTcm
	 SJsppbmtig1RGghtVzw5jbx1yBhk/iuVPkSI/NdW6WNZ7yLIoRtCRA6oSClzibhYdt
	 taa+SyvcxNsoWJdaHf0EkfbENOtj7XwvTpQrsWoRJBBxxqR2T54BMtVINrcBDbKTi5
	 LChHPGruv8sDw==
Date: Fri, 1 Dec 2023 15:54:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Message-ID: <20231201-rockstar-automated-cdbc70605ca7@spud>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVGuEKOeXkK8wbUzjx3UMOOcpyW2yp=i2A6V4auGbqoEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y0XkUaylXbXKLGco"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGuEKOeXkK8wbUzjx3UMOOcpyW2yp=i2A6V4auGbqoEQ@mail.gmail.com>


--Y0XkUaylXbXKLGco
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 02:33:29PM +0100, Geert Uytterhoeven wrote:
> Hi Biju,
>=20
> On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > Convert the da9062 PMIC device tree binding documentation to json-schem=
a.
> >
> > Update the example to match reality.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/Documentation/devicetree/bindings/mfd/da9062.txt
> > +++ /dev/null
>=20
> This file is still referred to from other files:
>=20
>     $ git grep Documentation/devicetree/bindings/mfd/da9062.txt
>     Documentation/devicetree/bindings/input/da9062-onkey.txt:DA9062
> and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
>     Documentation/devicetree/bindings/thermal/da9062-thermal.txt:DA9062
> and DA9061 chips see Documentation/devicetree/bindings/mfd/da9062.txt
>=20
> > -- onkey : See ../input/da9062-onkey.txt
>=20
> Documentation/devicetree/bindings/input/da9062-onkey.txt still exists,
> and covers more variants than your new dlg,da9062.yaml.
>=20
> > -
> > -- watchdog: See ../watchdog/da9062-wdt.txt
>=20
> This was replaced by
> Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> a while ago, and covers more variants than your new dlg,da9062.yaml.
>=20
> > -
> > -- thermal : See ../thermal/da9062-thermal.txt
>=20
> Documentation/devicetree/bindings/thermal/da9062-thermal.txt still exists,
> and covers more variants than your new dlg,da9062.yaml.
>=20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/dlg,da9062.yaml
> > @@ -0,0 +1,220 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/dlg,da9062.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dialog DA9062 Power Management Integrated Circuit (PMIC)
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  Product information for the DA9062 and DA9061 devices can be found h=
ere:
> > +  - https://www.dialog-semiconductor.com/products/da9062
> > +  - https://www.dialog-semiconductor.com/products/da9061
> > +
> > +  The DA9062 PMIC consists of:
> > +

> > +  Device                   Supply Names    Description
> > +  ------                   ------------    -----------
> > +  da9062-regulator        :               : LDOs & BUCKs
> > +  da9062-rtc              :               : Real-Time Clock
> > +  da9062-onkey            :               : On Key
> > +  da9062-watchdog         :               : Watchdog Timer
> > +  da9062-thermal          :               : Thermal
> > +  da9062-gpio             :               : GPIOs
> > +
> > +  The DA9061 PMIC consists of:
> > +
> > +  Device                   Supply Names    Description
> > +  ------                   ------------    -----------
> > +  da9062-regulator        :               : LDOs & BUCKs
> > +  da9062-onkey            :               : On Key
> > +  da9062-watchdog         :               : Watchdog Timer
> > +  da9062-thermal          :               : Thermal
>=20
> da9061 (x4)

Is retaining this even needed with a yaml binding that correctly
constrains the children?

>=20
> > +
> > +properties:
>=20
> > +  watchdog:
>=20
> Please sort subnodes alphabetically.
>=20
> > +    type: object
> > +    $ref: /schemas/watchdog/watchdog.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      compatible:
> > +        const: dlg,da9062-watchdog
>=20
> What about dlg,da9061-watchdog? Probably this should refer to
> Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> instead?
>=20
> This applies to the other subnodes, too.
>=20

> Perhaps this binding should be merged with dlg,da9063.yaml?
> Or should it be split in dlg,da9061.yaml and dlg,da9062.yaml?

The former sounds like a noble goal to me.

--Y0XkUaylXbXKLGco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWoBxwAKCRB4tDGHoIJi
0g4nAP9DzL9WvU1oaXmeRo+xqDm9uDpnlqhUFG1+NFE5x4id1AD9Ht4G/Syqdm4v
WW9USV2B/b1H+nJKgwdStTjmPYfhYAE=
=XWny
-----END PGP SIGNATURE-----

--Y0XkUaylXbXKLGco--

