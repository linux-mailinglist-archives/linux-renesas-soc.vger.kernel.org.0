Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55B8542CCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 12:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbiFHKOv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 06:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236193AbiFHKNA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 06:13:00 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7974737015
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=T1rS8zesQyxdpf+ViPOIJ9P/MVvK
        JqsO3z2PRt0+Ir4=; b=Q9iZbsKfHCUm81umx8so9epw3Q8M8qqbC+UF1TnYWeJE
        atIrvHJj59cUIQVIo/MKDz/zW3CWv1yOeavp+Yc7AkazXA83gi8aFJzmMvcFWqsG
        gFeZ9HomrD11WbHAPMfRol+2uKsTIYyMu94Ui6MiBybQt8kjMarE06p9a2c3kfw=
Received: (qmail 2849558 invoked from network); 8 Jun 2022 11:58:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jun 2022 11:58:34 +0200
X-UD-Smtp-Session: l3s3148p1@k+iJv+zgeE9ZD+1N
Date:   Wed, 8 Jun 2022 11:58:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: use proper bool
 operator
Message-ID: <YqByyfzgqvpHGX64@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220603232940.21736-1-wsa+renesas@sang-engineering.com>
 <76a10e61-4222-9c87-d641-e7651b34eb2d@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NRmBguwGVUzD+t0p"
Content-Disposition: inline
In-Reply-To: <76a10e61-4222-9c87-d641-e7651b34eb2d@omp.ru>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--NRmBguwGVUzD+t0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > When checking for defined macros, we want the boolean AND not the binary
> > one.
>=20
>    Do we need the parens though?

For consistency with the rzg2lc-smarc files, I'd keep them. If we want to
remove them, this should be a seperate patch over all files.


--NRmBguwGVUzD+t0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKgcsUACgkQFA3kzBSg
KbYKsw//alKRvXalo9ulkkUadw08lflYPHgfHc1/QPhG+ui8NdS5M3tY8+ONF/yM
2V9G+bDfIScgiAe55QI4476wm7D+5FuKGK1KSaa2hTzRRJcKYHNTYqxcI5NrqQVP
BMtglcDW+LSVbC2UcYCkHUt7wItUrAj8bb7iLIyXed+yTfmo+CqgTvEViGNsE+Pm
by7HtEPAf0HM4agEuWNWj72/FhwJ0jLH+12vyZuMqSil+QcsoM1MSzIlq+8yJYTv
oIXy3sS4zUuYmQRkYz1RgHtzS6owvJIyR+xQgUYBYr7U3yyG2RS+dGtHtcI8VfPo
0zHqyJTpeyde94Z6Aj5SXUEFwltNAYqWa+vn71tXV8UUbGIOUvgjLzsQLCIWPtgE
Sqa/rcKW7gYmj2bgdyA6SD+rambDz/ZAcp4IN4Ion2On+ntetjDA0HPsT6WEwFf7
eStjaW1KjrRFou/QCJ+zF+bW7TUogAMfcpi2k6wcI4y38e5SBcXjF+LKI022jOre
Y6nnKZANysj8aal3QLVbONlAaKkILg+9KE7Qmqlou0Kg/++zO93baL7ucruzgOim
qSEo1Vmw2R2/LohTVqMx2CwWNSDhZ2j/+CbhRqRbgQFUh0ecymkwU9Gikku2lriN
pO2hYHWADOABPD/Q619BaG2C/+oU7I56d9P0uCbNQlcicwApyJo=
=0f7V
-----END PGP SIGNATURE-----

--NRmBguwGVUzD+t0p--
