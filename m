Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE394F2DEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 13:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfKGMJH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 07:09:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47440 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfKGMJH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 07:09:07 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 763D728F853
Received: by earth.universe (Postfix, from userid 1000)
        id F27DB3C0C78; Thu,  7 Nov 2019 13:08:59 +0100 (CET)
Date:   Thu, 7 Nov 2019 13:08:59 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@vaisala.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
Message-ID: <20191107120859.zoml7cmxbtaetjsk@earth.universe>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
 <20191106142441.GC32742@smile.fi.intel.com>
 <CACRpkdZ2F3zR2bdHgUV9GJX8iSojiM34BTWizTV_z+j7sS4jtw@mail.gmail.com>
 <2ca76ecb58b9e6377925d6790ff4f7722604f57b.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="folqfx6rberhaf33"
Content-Disposition: inline
In-Reply-To: <2ca76ecb58b9e6377925d6790ff4f7722604f57b.camel@fi.rohmeurope.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--folqfx6rberhaf33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 07, 2019 at 08:52:11AM +0000, Vaittinen, Matti wrote:
> That reminded me.. I got 'unknown recipient' replies
> <nandor.han@ge.com>: 550 5.1.1 No such user - pp
> <semi.malinen@ge.com>: 550 5.1.1 No such user - pp
>=20
> from both Semi and Nandor - who seem to be the only maintainers listed
> for XRA1403 GPIO EXPANDER in MAINTAINERS.
>=20
> XRA1403 GPIO EXPANDER
> M:      Nandor Han <nandor.han@ge.com>
> M:      Semi Malinen <semi.malinen@ge.com>
> L:      linux-gpio@vger.kernel.org
> S:      Maintained
> F:      drivers/gpio/gpio-xra1403.c
> F:      Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
>=20
> Anyone knows new mail addresses or perhaps the separate entry
> for XRA1403 should be removed?

+cc new mail address from Nandor Han
+cc Ian Ray with valid GE mail address

-- Sebastian

--folqfx6rberhaf33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3ECVgACgkQ2O7X88g7
+pqKSw/+ONn6O1gk/4+S4c2JkCLB7H8lCrV50kxU2YmcYNaDSI8VjaSEp1LTOuDp
+4Ja/OJ1zrVQOfT31pVmq6j4OsFIkmELfjYuWJbTIaVKDFCjgSG42bIPPpY/n7my
a/Tk0KXXSJ/bZ2X/KS4Ji2vMdVw/ILs/cJYZLvexWVZu5XxXuSodbGWnObWkha88
wWMn0ec7ECXaVyxKWlK/XwuEEr09c8TphiyE2KgC5l0LZoWKnEEVM2/VXPJXLmsh
aZCWP1WOHb8ozvF6KXzlfVu47N7tWvUMyBYaOSfqb7M5ftJ+y9U3U5I5oSv97ROY
N2oqWgCuYzOxrgsWFOXZXuJ3sQ6d70opOF5mUccQ4xjpIrty56H5bnLkXrfy0XeS
sYjhmDpsbvreOmGIIV0HLiLdAknXBsVviiMYcMN4qxlzAYn97/jdrMoLEbTF/zMX
AWOpIF5+RxZfNsLTfum3ePkCkHT5vhskznEIyc/WCN3e7kg47oP8Wjy92NB/Q86U
i0DkrGjg2hXJrNohjFX4RWz75AErn1QmpKxydkKPysA74l5TOp08Jpgqf+taLiKQ
EuxlhgyNgKH6i1z3hhBR23ZzTluCHjYW3omivrJPXFI9pnuBD50YmoCMQf0wPBMo
QgPVkIT1ty/hVDGOva1DL94EDaA3xaeMaGiviES1YriaYKNHTwc=
=CiYZ
-----END PGP SIGNATURE-----

--folqfx6rberhaf33--
