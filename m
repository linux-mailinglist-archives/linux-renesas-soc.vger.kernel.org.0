Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B4E4E66F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 12:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfFUKu2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 06:50:28 -0400
Received: from sauhun.de ([88.99.104.3]:51884 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfFUKu2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 06:50:28 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 368C72C077A;
        Fri, 21 Jun 2019 12:50:26 +0200 (CEST)
Date:   Fri, 21 Jun 2019 12:50:25 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rabin Vincent <rabin.vincent@axis.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mmc: remove another TMIO MMC variant usdhi6rol0.c
Message-ID: <20190621105025.GA2987@kunai>
References: <20190621060511.29609-1-yamada.masahiro@socionext.com>
 <CAK7LNASGVbkGgu7psy4DfCxmr-AxSQ3fmGJ=aDAiuSkJ5hrDwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <CAK7LNASGVbkGgu7psy4DfCxmr-AxSQ3fmGJ=aDAiuSkJ5hrDwA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 21, 2019 at 03:16:11PM +0900, Masahiro Yamada wrote:
> (Added Lars Persson, Guennadi Liakhovetski)
>=20
> On Fri, Jun 21, 2019 at 3:06 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>=20
> This needs Ack from Renesas.
> But, I do not know if TMIO folks are sure about this driver, though.
> (If they had been sure about it, they should not have duplicated the driv=
er
> in the first place.)

=2E.. and from the original mail:

> Delete this driver now. Please re-implement it based on tmio_mmc_core.c
> if needed.

I was never happy with this driver existing, yet I never knew which HW
platform needed this, so I didn't touch it. But I'd like to see it go in
favor of merging with the TMIO code base.

>=20
> Perhaps, some code snippets in this driver might be useful for cleaning
> tmio_mmc. It will stay in git history forever, and you can dig for it
> whenever you need it.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I double checked there is no user in the current tree. I also searched
the web and did not find any out-of-tree user or even a reference of it.

So, for now:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

But this seriously needs an Ack from Shimoda-san or Morimoto-san. And
maybe Guennadi has remarks, too?

Thanks,

   Wolfram


--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Mtm0ACgkQFA3kzBSg
KbbYNw//U2nOKt1qTxm7Lxvm3Ii9b1Qhqs/pvoKWphHfPaQw+dgf5vXSZlMkE6QR
hG3it64ADcyRC+zdjUf+XUgF9GLHHTSZgGtECW4CYQSGjCEQ2Qfc+8WXr5AHCY8h
NIK7wRhy6MVn0pkLUL0iFQqAYR1a8aFIPim3omAyEjDN2fj0abHuImzoTHtxTgQ3
kklk1LlsCDS0yDOjkljhxHySzIOY2YkzRCTaOvYYVuyn30G0/uUXL9uuafF1jYPY
lCPj+88A6px1qXROIJmYTzYpFxdHDmTWBfMtenRHGTM79vXf3nswy8Mxt5PDom04
C872tCkhTo859e9IwcI24SYr576YZsSU0sw3GY23AJotsg58ifXVrzDjzEZewfNU
s9MPvBXPhmjlMCEbwOkfEOGtwsDgcXOJdxjKPVF+bMYDbE4XGLxV375axcmf13Vw
cj0OYvNBpHf9fcejEbYRnYHzAfc1Y4QMLF5NHccF2V1AAAVpl5hADEs+ypcjPBfe
HChlxkw0rwz8e+ZdEr4FjcpXoIaVHIXYPAcyMn2u/XiADa8XUHmRJxvf0Rz6A30r
h4ox4TRJrKQy69gPJMxNx4FGyZJjlPlMfa6khtYAhPoiEzruUttVdryTMIRwOD8l
j/MmsFwAsK06IpUOqosDwNXoUpU/DHXtmk/i/xOo4+9euVaLMrk=
=gcmd
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
