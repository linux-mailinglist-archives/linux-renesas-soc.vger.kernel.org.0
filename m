Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A051F5A477B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiH2KrV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 06:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiH2KrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 06:47:20 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E4057E21
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XB9S+g3RgsAKe4wV1L4FCt4ykgD9
        Q1Hr2OkQZ7DpO4I=; b=XcziZsJnZO5MoLBSeHojAN0pcC6/zSDIPXTS2iygh8SV
        t5boa2U5rH95AlcLQC/fhf2kCJfHa3S4KDxqzndVVP4Jd95HklQ4zwR0h1qDKrZB
        kEf4+jSnN+QCsKfOYDPiwG5phyPRdBdU8TEUF4H1kl5Iof7zlEOwUu/Q10WZbCw=
Received: (qmail 78389 invoked from network); 29 Aug 2022 12:47:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 12:47:14 +0200
X-UD-Smtp-Session: l3s3148p1@176c/F7nMp0gAwDPXyz6AKlRFcsoQyrD
Date:   Mon, 29 Aug 2022 12:47:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a774e1: Rename i2c_dvfs to
 iic_pmic
Message-ID: <YwyZMq3E6EhmS5a2@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <7d60653d4d63904dc025a133297a53eb885fa064.1661525361.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Vd2AfSQG5oK9W91f"
Content-Disposition: inline
In-Reply-To: <7d60653d4d63904dc025a133297a53eb885fa064.1661525361.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Vd2AfSQG5oK9W91f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
> "iic-pmic" in the RZ/G Series, 2nd Generation User=E2=80=99s Manual: Hard=
ware
> Rev. 1.00.
>=20
> See also commit a636d8037ef6028a ("arm64: dts: renesas: rzg2: Rename
> i2c_dvfs to iic_pmic"), which apparently forgot to update RZ/G2H.

Maybe convert this paragraph into a Fixes tag?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Other than that:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for taking care of this!

   Wolfram


--Vd2AfSQG5oK9W91f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMMmS4ACgkQFA3kzBSg
KbYUPg//bO+BzwUuDZ8kAvCHopSZL3d5Zk2CP0KMhaF3u9Ply+2C/ONwO/qsJAhE
u024RN812hu19L0IJI6HgN9tW8Y1HXhSTwv/Bo7pqGI5KlD2Aol5U2BmM2cUtZA2
caOQYl4wS8TcehA0OP6szIY9LyvMBuhsuz/ZlHjDkTRjEWlWlVpTgJeu2AOr1EUy
SJi4isJgn11sfPIFEhBXn4nYU67LXvOiH6ftbAtjMUkhHbZ8Ft4h+VsvAAJLO10P
azIh4bI8+LD0CMjlYWYNmPS3SYP2cSziciceobmo7+dSU411qwS70cpEYlEhG21A
JYRcDXzNrnLbtVJ7hiszgQ5XCWpXh5ZBC/5QLmQTZwr4v4fZ1RAUuJ//Zh6I4dpC
p2lvguI/rlG2JA3VzXQHHVDIlK+n6J14soj3VXqpbq6mVUpFirqmI5zbLw0PPIOf
BYvlXPbIz5748fle1aRD4U7yi5nq+irFEjeI+1gauRkYpO6phiRFy8KDBxA5Wc7s
Dl1N6kAJWfFuLHDqf4nJn9/hrde0sKr/hbWS4cCB2hZDmGYUQh5bEpHOGnQcJ7fX
qZLSDt22mcHI8Z37hCRi/ko8AvLodyy0bbLhOg6PhzM4Kxn8SpC1t4aVamb7oQ+r
KZpBj+/9ljklbSQi7E5+e/N+6cM5EicmP6uQ0m5HKjykLtLLR/E=
=7aqe
-----END PGP SIGNATURE-----

--Vd2AfSQG5oK9W91f--
