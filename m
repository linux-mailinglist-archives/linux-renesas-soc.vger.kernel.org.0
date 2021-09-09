Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AF8405625
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Sep 2021 15:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358822AbhIINSN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Sep 2021 09:18:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:44240 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357715AbhIINEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Sep 2021 09:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2dcF6NYtjYgfD7I6wcCbElmuBdNM
        3SjUiUIa0LW2dkw=; b=QR2HZciiVIHLPG04IQDPGeynSHgocwnQkyyaz+6NVdiH
        gj0Dcfd9A/CBDi5ipb9VWrZWmaKzT9YW+RftDlsy7j2RYx0g9ryHARFJ/3iHUCf9
        tzfrACMfWBM341XTTerERHesxSpjySXEHFh1XZK2qZeTnRJVeLpkMVy3J8Na5+4=
Received: (qmail 1573090 invoked from network); 9 Sep 2021 15:03:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2021 15:03:25 +0200
X-UD-Smtp-Session: l3s3148p1@HlTPn4/L7MkgARa4Rc+IAenyySDM4eeF
Date:   Thu, 9 Sep 2021 15:03:25 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH RFC] HACK: mmc: core: also abort tuning with CMD12 for SD
Message-ID: <YToGHbgakZdrY/4R@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210831133349.18203-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFptgZgDsKyHt-sO6yyRBm+LqeWkwOSoB9ED+b3QTPqD-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3lFnMJ0a7tftFttn"
Content-Disposition: inline
In-Reply-To: <CAPDyKFptgZgDsKyHt-sO6yyRBm+LqeWkwOSoB9ED+b3QTPqD-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3lFnMJ0a7tftFttn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> > 1) despite not being mentioned in the spec, do we want to allow CMD12 to
> >    abort tuning for SD as well?
>=20
> It sounds like we should give it a try with the CMD12 command for SD
> cards as well.

I think so.

> > 2) If so, how to make sure not apply it to SDIO but SD only?
>=20
> For now, I am fine with adding a new bus_ops callback
> (->abort_tuning()) and then let mmc_send_abort_tuning() to call it.

Cool, I like that approach.

> I have some additional plans to improve life cycle issues for the
> bus_ops, but let's ignore that for now. I can deal with that later.

Ok, good.

> That said, mmc_send_abort_tuning() should no longer need to take the
> opcode as an in-parameter, thus some additional cleanup should be
> needed in a few host drivers because of that.
>=20
> Would that work?

I think that would work nicely. I will have a go with the above approach
and come back then. Or do you want to implement it?

Thanks and happy hacking,

   Wolfram


--3lFnMJ0a7tftFttn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmE6Bh0ACgkQFA3kzBSg
KbbBow//dgaxVEz9m3nV8v7J0IG7jyi2T5675VzYlhKvmEpkupuUjES4+X5/3oQ+
XG8gILNUe8FUve4M4vRQLH/DTIs3Rk/xpRROi+8KTngPl3D/INmzacbKYgQlEQ8n
XbB702/QK1zWJ+DPq0pdOXrfhn/M3xo8CeAlvlf//4bQx+BDAh11Hvp34sIB/8mA
8GUGzT37ZL05/J7frFmTApF0Beg5g68NPvrYC2I4nJx3jGHtyFDRNWhOUTjfEtDu
prbjNMJFUIXXbg19sKTx6yvj0Df2lCt/7b78WncVrJItF/buer83whS8f/lQRqYq
kdY9jomYBQHKzLzLwXDobLIi3YUampTWjuxmdrgQ9mI8qckAQZRUhvrXD0KaG0iq
XDWzjkdzuLBp/HDlNIy9GI0KDIjTlm7UMLYY03sW4wPBlDFkVdjBuYvoLo/8c3C7
kIuu8+MazWKlw+6sR1qhESfzdOgCD0RCfzEd6f78xa3ygv1RWu+jymd6vTReMg/3
AnmH3qX593cvqQedVtkqZgiwiHwNqiDYUXgaue6Ueb6zMUcLad3czgYP/fof/DCA
yeiKYTMilozyI9eRbwCPqL+/dipL+WPg4iAi2OsKJ1TqB8YB229MAjgdSU9zPYuf
KOC+GnDvgXijko0ea77NbvUGxdflGRafac4izY3Y+WILbIwuoWM=
=yRzb
-----END PGP SIGNATURE-----

--3lFnMJ0a7tftFttn--
