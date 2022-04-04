Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87F94F1496
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 14:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239656AbiDDMSU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 08:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245645AbiDDMSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 08:18:08 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6B9767F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=PwshrSy0JdZrEpoNkWjJhvN8uLlc
        rLQ9Y28CrAByXZI=; b=qhQSMceHaa+KVYGxEBgjWBUBX0PWtmdDGhpngt+kqRdq
        G8732mQDsdqDtAFvOxg/u88FdZMHy1XIZjDcOAsSxjdXh/Jl/odnwP/wowuCWrjU
        Jn+oGx/CT5hqykMqx2j/AYgXRYETrB2IK5aFPvrNqrPbsmz86SidRllakFYPESI=
Received: (qmail 1858529 invoked from network); 4 Apr 2022 14:16:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 14:16:09 +0200
X-UD-Smtp-Session: l3s3148p1@ywfuF9PbbKUgAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 14:16:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to
 HS400
Message-ID: <YkrhiUdx+BeWOoHA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dnln/+yA5C2SF07T"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJ7r1RXgoHAP1+RLtm11XMFzs1zht7+KQnUss=Rx4sBg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Dnln/+yA5C2SF07T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >                 bool use_4tap =3D priv->quirks && priv->quirks->hs400_4=
taps;
> > -               bool need_slow_clkh =3D (host->mmc->ios.timing =3D=3D M=
MC_TIMING_UHS_SDR104) ||
> > -                                     (host->mmc->ios.timing =3D=3D MMC=
_TIMING_MMC_HS400);
> > +               bool need_slow_clkh =3D host->mmc->ios.timing =3D=3D MM=
C_TIMING_MMC_HS400;
>=20
> I'm wondering if we've lost the critical mass for keeping the bools?

Might be. I'll think about it.


--Dnln/+yA5C2SF07T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJK4YkACgkQFA3kzBSg
KbZ2jQ/+LRBkOaA35Mlo4r6RJhUYwWE6mBqA5ND4lcUEi580Ihs0YmW7QRTmPzAn
VfQT/QA5aRIgQnbWPnb+s7RbArpAFh4deOY4RXh9+GtEi7nLM+UIoSORTy/pGehe
AlUiFI9XV0tEuX2LmQKmcyT1todWvAvi08tGWzxpkJj5h5k7/jlblTzyQQAT9IfX
UDNBfFHtdjMfOi8r5Pjg4mmcJOMQA8WN4gDFwaNkiIjj6IK7vYwaI84Eb71pA3mv
LyCh2CXRA+IsciFKCyoldQpG6HG/neu2OPpX0RjF57oqu3bpZpYTszSArXgAI2li
bATAXyWcl/oWP6PxC33l9AC9y3Zlsq8MEUkNckxPBljco6RYMT18IMeynCz3AOUX
6m8w2KPx3b1eGsV+ueqp5X4h2PlP+S2zN9HTBzr8DXdhrCbp8kzm/+sNgJQJ4AV2
DRQQGITiO1sy78G+zhDf287fbdmsdTuvSVDokSJjj19QbWzzPHJs31KyTW6M4Ee4
JUQ/izvgjFhqdS8E0vnv83MDFdfRNF4sSNLkGiBTPeAqnVB6OzNSzhd+ry090Jra
adsJOM2n3rjtvlkbs0DlVSgCw3kW4x1ynZjSPa8aCI+kTBgpVlJ9JTmXnZMnk+ns
qPwQduHtM1seun11/pTRkjQJOdKNz4nI8ymZiDfQO94kI7G1+R8=
=Komk
-----END PGP SIGNATURE-----

--Dnln/+yA5C2SF07T--
