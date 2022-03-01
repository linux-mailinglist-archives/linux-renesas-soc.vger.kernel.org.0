Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DA24C8E3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Mar 2022 15:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbiCAOut (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Mar 2022 09:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235396AbiCAOus (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Mar 2022 09:50:48 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E5796808
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Mar 2022 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yGGppxEG16RTXq0yehDXklpKmtJe
        60Z2xNgIyioCZxI=; b=V19faUqNnzAweXP//tp+4nWvOTn0KxszJDI7FMqzE7ks
        gy+nVJggCvL0j323mew0z/D7X9AOMlptaaqJIxWbXIDSaosOUbgNxDZ4P3G6e+93
        FrG1sCGue5q9lUUGkL7U5sxFUm/MbJdUGEQbea/DEcnJY8+GIuClozAOxFwGloU=
Received: (qmail 3899439 invoked from network); 1 Mar 2022 15:50:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2022 15:50:02 +0100
X-UD-Smtp-Session: l3s3148p1@U9GdRynZ5tQgAQnoAGI9AP6D0HJXVmR3
Date:   Tue, 1 Mar 2022 15:50:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: sh_mmcif: Simplify division/shift logic
Message-ID: <Yh4ymcHsCK9rU85Y@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <68d689c39c769d298b53ee8cb9de0e594a2999b2.1645460780.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6xXqU3Svdn9icg6S"
Content-Disposition: inline
In-Reply-To: <68d689c39c769d298b53ee8cb9de0e594a2999b2.1645460780.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--6xXqU3Svdn9icg6S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 05:27:20PM +0100, Geert Uytterhoeven wrote:
> "a / (1 << b)" =3D=3D "a >> b".
>=20
> No change in generated code.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Better late than never :/

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--6xXqU3Svdn9icg6S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeMpYACgkQFA3kzBSg
KbaCvw//dw3Sz6fAoBaBH+L37exYw30woNnbdX0QkTAAPSo+CUVNe5O6pEGbxnjQ
vpDBr9I/EXFw/X17YdSRZzJ88I/3vsFecPtJFp4f3L+IB5DcWMIgv2g84VGd21is
rykGUnh7UMY4BegCYCjfkU9WD6ll3+wtefQ/2XsZZaRt1u+xq3yjI3o/TuJsrmdB
DIoadDbBAMDTHXTlhb8/vpGIx9Vr29jVQiKeFoUGN97VehG+ZpHL7z7zaFksuaNN
HM9GFw2AMZE0fgENo/Fxn+csv6wgUcRtBSpdhdYbrozpy63i6D1LFpeqYzlND/4u
/OGGWGy3g3gec4C/UYSBoPWi7ILgjWPWbJNMOmrzA6uvf7+k6nWZJbMo+Og/FVLP
eJ/26HUvv76C7zvGEo0Dl+vQucBjKI/+AK0PaziXxtj3q2WnwgyuRYf6hBKYb/j6
0k2f2uXF6Ca/WAvxrujYI4saanVcPyjFMYA4HyYH9pS4VrDBA3XSlpA3YJPWV5SM
NCobHX5eEzgBoOOQyShVSJg9UECUTiWw2ZmV56oCZABThpCMebxOPm/mZr1yr9Lr
NFmYf5LSnhfELXS2YCePJoboSnQbv2vdxp0zpTkSewEwFGsd43Q+b+GNIRVo+3Bf
6AOozgPcFJNMBafsdDNh/vSR+i05XW5DV1JefwLUjpu1YmV6mJk=
=FCz0
-----END PGP SIGNATURE-----

--6xXqU3Svdn9icg6S--
