Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5752899005
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 11:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730760AbfHVJwj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 05:52:39 -0400
Received: from sauhun.de ([88.99.104.3]:58244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729797AbfHVJwj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:52:39 -0400
Received: from localhost (p54B3343F.dip0.t-ipconnect.de [84.179.52.63])
        by pokefinder.org (Postfix) with ESMTPSA id E4F302C2686;
        Thu, 22 Aug 2019 11:52:37 +0200 (CEST)
Date:   Thu, 22 Aug 2019 11:52:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: leave clock handling to runtime PM if
 enabled
Message-ID: <20190822095237.t7lx5qzwsj4unlcs@katana>
References: <1564589857-17720-1-git-send-email-uli+renesas@fpond.eu>
 <1564589857-17720-2-git-send-email-uli+renesas@fpond.eu>
 <CAPDyKFotQvTAC8OVVRiEqLc0ij3XNVdL3eyNHioK0YEWxvER0A@mail.gmail.com>
 <20190822063530.wzee6gy4d2lisj2x@katana>
 <CAPDyKFojrZB819DvViyP_cAf=s1y4jpHjYKis37XO2ZOSkH1Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hqlwflu46tjfljz5"
Content-Disposition: inline
In-Reply-To: <CAPDyKFojrZB819DvViyP_cAf=s1y4jpHjYKis37XO2ZOSkH1Eg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--hqlwflu46tjfljz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> I need to catch up a little bit more on mmc reviews, so unless this is
> urgent, I can offer my help and post something soonish.
>=20
> Is this fine by you?

Yep, totally. Hope you had a great vacation! Just wanted ask if you are
happy hacking on this or if we could help here somehow. Not urgent, we
will wait.

Thanks,

   Wolfram


--hqlwflu46tjfljz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1eZeUACgkQFA3kzBSg
Kbb/ew//YkbRDM/uctqNfV71vexBYts6hlq9LQzO7Jg5uSsRdEEb4934F3Egvca8
vXYqm9lrXk4ZOoozkpSncM/QHe61orNAaUF+PBeM6EPcEJHEJ0QE7ksl7KGlwGsI
R2Nmzm+2sYGwUVqreSQuMqLqnn8jcLq2508wKhIfsYWiSLV10pWhuOX3JReTXgV4
rJCKIq+MUWDmmlQgItoFkl6T9bQmcE+45GDgyy4dkbkqq+LqDhpjCpE//feZRNEY
LxMkf13jE4tyFT90mDtBgO0qMzXrH7hWKlQQxHrulVJ6eZnEvraqVkfTiqCI9Er0
jBkYw61iopuIzkKAn3eAtUw52xfAyB/4Mh27tnXiOir+2O+qxKEu7QozgBhRgQzI
VC+skBKKLBkqp+tTT4FWw/bCs6Pok5TB5fFvE0qDSThEUFkwwpYslRPF0jqBIxBT
sf8tGyiS3TdN2P2jvBFD4vS1Z1gBKpCOuok+rGHZgZ8vXom0qc7aUee2rYEjacsa
17pHexOLbTcV2d7oAWgj7+e5fmlFPRiOkMhm85pg9g+3xRG9cjiuycEAa0Yoe9v3
J9R3r+0z6EXyMmgzJku2AZWty8KpVrcmPZ3zH8kQPjQwdMm8WaOW14zjzQrInNAN
ByJNw4P8inB1qD8XrhLKMdXpwHuEsplIepA8dgi1pvKyE4Donso=
=1YJT
-----END PGP SIGNATURE-----

--hqlwflu46tjfljz5--
