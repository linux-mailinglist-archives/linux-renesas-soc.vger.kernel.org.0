Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A3F359958
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 11:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhDIJho (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 05:37:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:47008 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232042AbhDIJho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 05:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=C3Hrh9uQqNgl/Dm9ETQHS0pl2/Qn
        lcWtGE9+76bqfuk=; b=dFcbLLf8Tc2b9ZOAs6VLqcvIhm/SbnJUYUnBCHZrII/o
        TPxpPJgpCLXcUpHDiLERVIZDOvsqhCtt3ub1ayoGAHH0Q19OUN8QqZXcHgAGYYGg
        Ovg5rOtZrwOfgcaWuqnZelSNNGhZXIHQ4mpDpedVEx0TlYoqPlTGk7SrywjAkhk=
Received: (qmail 3721288 invoked from network); 9 Apr 2021 11:37:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Apr 2021 11:37:29 +0200
X-UD-Smtp-Session: l3s3148p1@mYpt6Ya/drMgARa4RVM+AT5wAMFZBfoZ
Date:   Fri, 9 Apr 2021 11:37:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH RFT] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Message-ID: <20210409093726.GA879@ninjato>
References: <20210408133420.2900-1-wsa+renesas@sang-engineering.com>
 <TY2PR01MB36920CDE15B59DD55825B2E5D8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36920CDE15B59DD55825B2E5D8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,
>=20
> We should add MMC_CAP_WAIT_WHILE_BUSY to .capabilities, not .tmio_flags.

Ouch, can I have a brown paper bag, please!

>=20
> >  	.tmio_ocr_mask	=3D MMC_VDD_32_33,
> >  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> >  			  MMC_CAP_CMD23,
> > @@ -111,7 +111,7 @@ static const struct renesas_sdhi_of_data of_rcar_ge=
n3_compatible =3D {
> >  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> >  			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> >  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> > -			  MMC_CAP_CMD23,
> > +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,

At least for the machines I could test, I did it correctly :/


--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBwIFIACgkQFA3kzBSg
KbZECRAAhx6oFb29Lf8U2obo70DKsKAsfUHSoqzI30tCcyT06/VN+JMvGaUBG8id
T5hOKT8GgIr4HquqOXFBXkX/iX6E0GYOYnN2FOumM6zs5AcqffDgn7fJNW5mv3rq
OMghxEAVQC5ssFO6M7UnrhXE84yGAqdTeItlzqNcxS9W93vQXepsrU9eQ/MiXIRh
Xt/xYs4sH3u6RFaYeDeaqnvuKk8lfAzEYrP1PoHGwHohj+pq4lAT6Yw65WWsNMqJ
22iHknB/SLUrk7q/1h6Xr7tKpwnDe2L6ApJabFMuDSuoAUWmHcTeWjMh9OOSjQkx
lDDM+3SPWtWSyxfTJSS6XnPYfEQ5QDb10r3zi1GC0i0dOYhzu8mGG0xHzH76IH22
Koe0+pvvJcgJAVxP39JSsLpzcZDwblordt4mw5hi/g9rGFkcdpJzRmiI5X3ATdVC
WzpAbMy3kyAgxJWCJ+iF2OXxe+lMVKvV7JVj+DXj8hcTfgo65wet/sBW8hlUDbxZ
Zkro/JjQ2nBrARFqgXYzLPcJ82boN/gznwnmC2CALoeZNCrO92v0z9tyOMQwbHBE
oWk3j3w8jdVVLnPXliHPsMugKeBF7/x/73H3RkHEGpN6Nn29ZJOvODgOkTd5N+uG
og4hL4EVWq4qBHDtFr08WQoFWpq/QiLqAcHLnEufYWmPdgcjbxw=
=ggzD
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
