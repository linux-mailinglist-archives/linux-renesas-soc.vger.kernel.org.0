Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9902E3251
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Dec 2020 18:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgL0Rpy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Dec 2020 12:45:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:47938 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgL0Rpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Dec 2020 12:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=L3wxUZ2XBWdMtFf844uIQfemgmXF
        xvnom9izZCsbvnw=; b=FUjw7En1cUWu1eLESQuObFMeZN8MFvuKFEOfAdS6NVth
        s4/OIfEBTeen4wbNFfxKf6W3Eq1Q++B3c6UGr0jABBCmR7XuzdSfX3l6ph1zc5wm
        TnPwTXJTBLnBkRfyaAkNQzBOx9aNqDNDTCrD/nP8TsGVqOJUvxBb3XYYAC92l3Q=
Received: (qmail 1557753 invoked from network); 27 Dec 2020 18:45:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2020 18:45:11 +0100
X-UD-Smtp-Session: l3s3148p1@5RkYuHW3xNQgAwDPXy4DAHNMrayzS9Yy
Date:   Sun, 27 Dec 2020 18:45:11 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779a0: Add MMC node
Message-ID: <20201227174511.GA40783@ninjato>
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com>
 <20201227174202.40834-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20201227174202.40834-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 27, 2020 at 06:41:59PM +0100, Wolfram Sang wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> Add a device node for MMC.
>=20
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I just noticed that Saito-san's SoB is missing from the DTB patches.


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/oyCIACgkQFA3kzBSg
KbbxWhAAsxyHabgJi48ENO9odDeKojiijICQjyX7Ni5uZ0WUXfeIZLEWCTOwTiP+
YATcPnV0R9o9lse5PVKyLyP+YjHMRWDtjXYDlopIloeeh5dlNJbcD3FOnsgRhyVG
LdWRd/xAZdxNJu1/ezXFyFLHBCYsFi4jlqan2yhaC418TZ580ldTKXgRF5bgS/y2
0xsPWhTP5tdrsMq5uv8NnLXQQlIUxij2flD4Ng9ri0EwIyKjCvx1VZc0UUoC9n5u
KaxWh2+7kZ0nU3v/Hwivu3C+obN8nKk5Z1du6WvCTxstgur1/bo3KrLMzXaJ6J7e
JH8PhJmDueHhuQnJnRUTxreqNpd21lm9puhxHIzgOPoeyONglrq10VUE3Vc//Czo
7kzsm8o2tchSxVBK4+RPimyiv+IpgkW1CNsCjn153dckLHyOqn53MMMru0ba3+Lr
05vy98iAt/RSYRkiau9Q1srHelPJRMEVkCQFyz0wHAaTQ2quHCJIgeKfyqaUqOf0
hN5Nzh1zbISPeTx+3zXvPr/t/53qFanFpyYiTuO7OAcTk3iZpfjHq6eIkVKX6vRF
VIujBw19oy+LaLSCRfZP5J9XjQXaR5ochKPKZeok1uctBeJ3kOtirKSiB1vYmJ8a
N+MxsbFWTv4zrhy3v6Ms/3Xa4bpSuMLXFL137dgWtbrBGZ1xDks=
=yRG/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
