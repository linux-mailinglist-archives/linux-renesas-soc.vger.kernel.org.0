Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7C5B90A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Sep 2022 00:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiINWzJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 18:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiINWzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 18:55:09 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42481AF17
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yccWPUw7hg5FduCUp/AKOgkDHANl
        7R+4KzDV9DvbwE8=; b=eZgJlBKRwMtq4Bs7U0oI7Ajc8scj+enCKI8y2McFa4eP
        RMdayVfKHpSlSM/ZWyJm1yGHJIMP+Av+4eOF5ziBL73ya8fdVHpTmoRi7dpK5xoJ
        V/M4ph6LzTPXCotWOW0998PcWer+cnaJqgpk130HuY5z/O9cIZ3HrkF0wpJvfPw=
Received: (qmail 2747870 invoked from network); 15 Sep 2022 00:55:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2022 00:55:06 +0200
X-UD-Smtp-Session: l3s3148p1@Ua4MBavohMNScWNM
Date:   Wed, 14 Sep 2022 23:55:04 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: spider: Move aliases and chosen
Message-ID: <YyJbyK+TOEFrJdro@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <c03500bb10eae10caeb3f4f97bc979eeee6cce75.1663167551.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OkMTGHbhOmtmuw7S"
Content-Disposition: inline
In-Reply-To: <c03500bb10eae10caeb3f4f97bc979eeee6cce75.1663167551.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--OkMTGHbhOmtmuw7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2022 at 05:01:29PM +0200, Geert Uytterhoeven wrote:
> The serial console and serial debug ports on Spider is located on the

"are located"

> CPU board.  Hence move the aliases and chosen nodes containing serial
> port configuration from the main Spider DTS file to the DTS file that
> describes the CPU board.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--OkMTGHbhOmtmuw7S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMiW8gACgkQFA3kzBSg
KbblNg//dXeMIHP1pSiSd4ZJS96B9C0I5ZO7vxlzOqCVpwRiV6K6Y1qTibzOdL8Y
Xj0HlkbcH6vz+LbRKG0IbF/fyhf7XMqOS8eAI1FlYDG6dyjBAFIONuaHh8ofrR4d
MS8lkwNSqQxIQBpL2WDemO2lR0oA6TWLzxL7emmRfIJixB+YhBro2n0h6CapAGCM
lh/zgjG1cp8Z9kd0Vzv7JFTC47L9QmS1FFRFh30Zo8a/AOXWsNBHQI+/UqBKM0uL
7FEl873z+PDYgfNtHLqzn2oGLis7r6REHK0aIV8a6BD552nEvJKG8g5g3lxsWSGq
jm1EdJfqoZQSvcr6yyJ5wu6JXR/t9fbUQTfyPcrp9kekJeIXkVW+WHuiJswVreeK
KczrV39pzEL1V7Wc+I+VqxqJ/KGQrpXidX5wXcII1qpVEP7xS8jKfk/iUuTG5mSK
0ecfACj9P2FpKCKlRf+iq9XusCFJ2nm64yNaxp6eaYB6bMPOD4246RO2/GUoS2qN
2ZRho2CvmdiJ+bLiyusxJ+aGXTlENfAeho5P5C0oBNtLCyLUcS8le9nxWS7qtudY
AGY2guL1HADjk2g5M6mNMOfPz4EIqmwnl3EO11p3zNbnh7wWK0hY5pNi4/4XFfkh
cHCnoeMAiDC/CPC9LJIxOMCGDKKHfH4LtXBHmf3iY5GmQwHdrgI=
=I/Zp
-----END PGP SIGNATURE-----

--OkMTGHbhOmtmuw7S--
