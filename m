Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6884EF755
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbiDAP40 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353711AbiDAPug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:50:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118FCDF4B0
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=VyfdU1PyrPlWhUYcuazzRtnicqZv
        MbVTN2xYeimlwHQ=; b=ZR5WGjKzdP9Aw/MNoOapcduCWbHDVST4vJ2yzkZ0sCos
        f5f401sMxy/0+KZjZkAym9SpS1LDTSCHlNbV713sb4Y8JiMQDlltBRKjoXl5fnbF
        49dlJWtYsdhkmkle5XpBLhikJmtK0+ONSj0cSx95tHTud8hpodqimX3QZjapO2Y=
Received: (qmail 785507 invoked from network); 1 Apr 2022 17:23:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 17:23:51 +0200
X-UD-Smtp-Session: l3s3148p1@DwyiXZnbWKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 17:23:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77961: Add CAN-FD node
Message-ID: <YkcZBiX75NT/uqH5@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
References: <20220319223306.60782-1-wsa+renesas@sang-engineering.com>
 <20220319223306.60782-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUc_MUXFPmkEzHaTGG5oyJNS2QROpe-RdgTpfRcOstU6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JOP95n6tgijJ98yf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUc_MUXFPmkEzHaTGG5oyJNS2QROpe-RdgTpfRcOstU6Q@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--JOP95n6tgijJ98yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Fixes: 92c406ed0a7f ("arm64: dts: renesas: r8a77961: Add CAN nodes")
>=20
> I don't think it was forgotten, and think this is not really a fix:
> CAN and CAN-FD are two different devices, with different drivers.

I thought Goda-san tested both interfaces back then, but maybe I was
wrong. Yeah, Fixes tag may be dropped probably.

> > +                       compatible =3D "renesas,r8a77961-canfd",
>=20
> Can you please send a patch to augment the DT bindings?

Sure, will do.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.19, with the Fixes tag removed.

Thanks!


--JOP95n6tgijJ98yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHGQYACgkQFA3kzBSg
KbbHbw//Yy1KJje5RE1G/DTvnNWjxlbTh2e46LqvqhkoWr1iztl4u9UKSeP+47q5
FpUMr6dTNXjv3NgGzD7RdFnVvpSJsJ1sPgbAjaRSi2CTLzyKnzSX9pLas7oaFg8H
afhxg6cCghUORAZLJ80E7dcYxadqwDpV+yVTI6e2ek/fEbRply8BjdJUQZMVQqoe
qpOHZwz7PkvlXtbzFyamapgtEw7u4fgSLQKddkoYKFo1S7TVFEk3eaUwdcCpW2e8
LOng5QLH0YbDO9PxbAlQ/UM5lLiod53RBhwr6NZL1i+qSK9jeaIaAA7lLyxZE888
UYhzSWkldzcFqAHcclUvPr49kfXH0F2pA83dzQ6aIQwRetdNx4KqD/HxtXRSQPho
YdU90v2H7jqXMUWOxxtKtaetT4DESq1OO368sEKlQc7w3iSMKb32wfqtLX4keMgq
od8vU0+dvxB4vCJV8u+PR1lUNXUasxFZViEiT+COsS49I6yRDZKQV54LI9P9HYdD
/eskQrXNAX7oddkpceyphgsNDtEZTZ9XaeKarlXyKgbZwPxcOjr+egdsBifbQg/1
oPja4dgHwB1h+VhBQtVPaN/Tf8IY2q5p9uDROfmjwqmDVy8cKIWUAR1iE0UDT8k1
6QIXMifed9ESM+V8bp6l+wIBYnBJTnW8mWxTQhsI8VNG7bWA8XU=
=gXh1
-----END PGP SIGNATURE-----

--JOP95n6tgijJ98yf--
