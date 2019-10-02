Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAFE4C4955
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 10:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727651AbfJBIUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 04:20:35 -0400
Received: from sauhun.de ([88.99.104.3]:56790 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727683AbfJBIUf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:20:35 -0400
Received: from localhost (p54B33447.dip0.t-ipconnect.de [84.179.52.71])
        by pokefinder.org (Postfix) with ESMTPSA id 6441E2C3720;
        Wed,  2 Oct 2019 10:20:33 +0200 (CEST)
Date:   Wed, 2 Oct 2019 10:20:33 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Message-ID: <20191002082032.GC1388@ninjato>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
 <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
 <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Exactly. Is RZ/G2N affected?
>=20
> No. RZ/G2N is not affected.  I have enabled HS400 mode on RZ/G2N board an=
d without this patch it works fine.
>=20
> Note:-
>  I also tested with quirk entry added in sdhi_quirks_match.  That is also=
 works fine.

You can't really test if this is needed or not. You need confirmation
=66rom the HW team. This is also why the patch is not upstream yet because
there is still more on-going investigation for the HW teams.


--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2UXdAACgkQFA3kzBSg
KbY/kQ//Y+hUM0l0sI1G+5m2c3SX4iDlFHNS44espuCrBzxp4IFU0h5wkcWfLCYK
HxVrE3aok0SyjWNvL7edc1DbYYNwH5ID5aZGWw0Lbp8vdSeg4fgQbxdItkNyzaT2
EppMnVkY8zuvnAdqpq4cpykORBhf0BleUE89MRBHBkevobOG+1K7pYFkjeyO+E3+
yABJ1ReLcMT6Piuf3s10ABpzyBrAdR8kjgeaVZbPFk7bJDYIB90PAqrIO6f7BJnR
yHKM1gvuaCeYlbEWCrhM7AvJR3ULE8IL7vTIe+MZ1cuppaeFyoC3HRni9kyfu/eC
zZ9Fm2PO4c9VpeQl26xpr7EqzaN6FzxwviLilCfWWqymI6562r1Bbdxn7zuEtNso
CPfOubfH9+2awl4vbFXb4sqnzlnkHVVVoNk49lhs6pXJ8cer//NtnLQxk8tO8DFE
aQtPiC7DWYJq3JWKJOXbQ+IBPRRcwCaNtVK5Qt6DSR0FrrHyYBpHIvoyLPUYX63H
UfcNJKmQwehaocJVB805sd79r9mGs1GG7rq3WiKg/vYVmGJS4QESpUVOg3lA+g3S
hTCc1qLD58QEwjoWqlfj5v02Hz8lSko72M5sN6TrmAqLmM7dBVfm7uig5NpugM1e
h7KbHTHuqTTFBGElzeidp2pa/K4Gp27Bk6xxvCuA/wYiMPdM6d8=
=1Fal
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
