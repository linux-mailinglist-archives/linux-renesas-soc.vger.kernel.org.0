Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7C811E7F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfLMQSr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:18:47 -0500
Received: from sauhun.de ([88.99.104.3]:47994 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728096AbfLMQSq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:18:46 -0500
Received: from localhost (p54B3318D.dip0.t-ipconnect.de [84.179.49.141])
        by pokefinder.org (Postfix) with ESMTPSA id CB5522C04D3;
        Fri, 13 Dec 2019 17:18:44 +0100 (CET)
Date:   Fri, 13 Dec 2019 17:18:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [RFC PATCH 1/2] mmc: renesas_sdhi: Add manual correction
Message-ID: <20191213161841.GA1208@ninjato>
References: <20191203203301.2202-1-wsa+renesas@sang-engineering.com>
 <20191203203301.2202-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUnC=PM0iM7NwoeVLb2v=r4g-uUU3h4dBn9-St75fLyAw@mail.gmail.com>
 <20191210222844.GD8683@kunai>
 <CAMuHMdV8+35xLVqAX1mpU1gBKhkw6nBRFwdJwBF0_UXJPh18+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV8+35xLVqAX1mpU1gBKhkw6nBRFwdJwBF0_UXJPh18+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > > BTW, why is tap_set unsigned long instead of unsigned int?
> >
> > Because we use bitmap functions on it, and those have all unsigned long
> > as arguments.
>=20
> Do we? I only see bitops on host->taps?

Point taken on this one...

>=20
> > > And perhaps it should be moved from host to priv?
> >
> > That would be great, but other tap_* variables are still used in
> > tmio_mmc_core.c. We maybe can refactor all tap handling into
> > renesas_sdhi_core.c meanwhile, but this is a seperate issue.
>=20
> tap_num is shared by the Renesas and TMIO code.
> tap_set is Renesas-specific.

=2E.. here however, I think we should keep all tap_* related variables
close together. The driver is messy enough as is. Investigation if all
of that code could be moved to renesas_sdhi_core, though, seems very
useful.

Thanks for the comments!

   Wolfram


--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3zud4ACgkQFA3kzBSg
KbbVbw/+P7nyvi+BkOHUztBGJxNsQNmcbTahuYyAAuF3MJAeFc1SPEDdwNcxmLww
owyJRFWrlCuEpG4RqugMpEOvPaW7C5ueNSp6ShKe6Mu0HrZAlXBiVDoWPKkhSKNr
aM2MGQ9wEpl6PyqcQrYAaneXhNm1cf/WBPzsK9YJR4JHApjSl9Tpy1t0BuLMqVnV
jLpwybRn/Hys+Mhv7FCzE/KXlHxAo88Qamme3maQ3MWLd/nsD4xgtULNu4p1D0aQ
WvKD9sPDoyC2DWZZ1NmsDn7qMUzqROBxr0Gif5gxi1ETJCAYZwVODsUtf9N/vTdM
CYuUmw0RmadFcfCvMyk0Qru7x2fKFRBsRdqsFevmpJ1ZvZTxsB4Sl65vUEPeySYM
AG5GU5dJNnEumduHFMO28RfTyX2l412AIMj8Hu9LO71DWVEspSzPI9dTo0/XBd5J
T6HPHUIl+rVReeg+yKBvr3twBO0dUr+BdL/HtkqCBjlWKcF7lnfTqVQbxesszrWa
/1/l/L78ggMM/j4wSRstJvBAVGiK7PAgTaH1L2mxUMvhjRYCZVpF+hbvIwkoZ0kn
0BPmxaIYM2g7yAT0V3APCNUB9bmmrZrQf+has5zFf9kIP0JIQG3CsvDJUo6c7Kpg
qfKaYBZxzJouPxtKtoy9dK8ZKwpuoIu4YlSOtgfnAcJiYYqjiX4=
=/t5q
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
