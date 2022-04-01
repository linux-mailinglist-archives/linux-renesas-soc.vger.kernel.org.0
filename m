Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9FF4EF75E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343771AbiDAP4n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355011AbiDAPvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:51:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A3B1D914D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=RfkHJ05n93dl6PkNsnNiP58Jaxf0
        RYOuUs+2H4Vs28E=; b=r5+pHAnJdS5peIzRC6px+kwx8Q/sFkko8aNGVSqaJlR5
        X8dC/3iBfAArUQo2q4W5xbgl+DPAhXxFG0SFqMXUygUnLzs3fx8jY+0WrjCffpuH
        yr8Mk0CXuB6ai90tuEUGmL8fepcyAaddefLMMAJaUDWN6MCYz3UwTpRnlcTrhHY=
Received: (qmail 785964 invoked from network); 1 Apr 2022 17:25:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 17:25:28 +0200
X-UD-Smtp-Session: l3s3148p1@DJ1qY5nbXKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 17:25:27 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: Add i2c aliases
Message-ID: <YkcZZ4PJ+Uhp/z+T@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
 <20220319223306.60782-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdVTDZ+_4in0x6vJViw2d-gjWfXSVyA0cV=3AZZ3kXpAEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YQ82rD2jBXcYqirg"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTDZ+_4in0x6vJViw2d-gjWfXSVyA0cV=3AZZ3kXpAEw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YQ82rD2jBXcYqirg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Unless you have a good reason to keep them, I'd rather remove them
> everywhere.

Would you agree to move them to salvator-common.dtsi then? The
schematics name them that way, also on the connectors.


--YQ82rD2jBXcYqirg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHGWcACgkQFA3kzBSg
KbauVBAArsOctuQwHQRpKLwAAE2XWqb5+An7uCUl5RGs1+Tof9wgyUk6mPKE+vZV
JrJ7bj75syauOsySfL43/86eQyP7ia4DahxIPemn0m9ZAPd0slRrNJT/n4voyOUv
ICuYup/0hwCw9O0vJN2+kA/ySSbwYMwFPtISGUJYqsH2CRwtbaEx0HsksS826Q5P
YRrtGU3sqk7APlsY4OS1J8VpF5hGS3CKLOdU3vcvrfxShgInlYh/+MHdLvmVicoa
q2bIf+t9dEQLLkpv1o3fTUPM1Q5IDHlfiXVaLXPl8Y8SjUVJJd4Woo1zjmenmKSD
VG6ZSK+AaqpPKeKYRPSyQeVeC4K0GZcSuBNnZhvGt9OMAkY9ioiYre8bowC2u2Hl
xigMNI7d2w/B7BlnWFheBPtmyJVEsXpjtxoduTCD4lz/qqL98B/aqrwSoftKL056
qSmTQbuj4+OUcQZh43JNn0di9J0gXto/39qBqU+6ScuDPt1/DMLFcuzBKAkyuLX6
NjeNTKNcroTjM4w5Dt1/hR2haWYQXIXX1SQlCnMXtR25s4qXrgH+VmjzjIxvoKN/
k2RTLvGUk3b5YeJVHcQcgslRHQxfb0vlK2aaauXBMh02zOY23wJW5LE0dHfJ32jQ
GHjl++GU3t5qNDXTUb+JLpFEBQEEeFuK4fslOD8j8QcNDrhw2Jk=
=xero
-----END PGP SIGNATURE-----

--YQ82rD2jBXcYqirg--
