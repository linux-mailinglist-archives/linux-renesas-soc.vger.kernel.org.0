Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211165FCB3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Oct 2022 21:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJLTCB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Oct 2022 15:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiJLTB7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Oct 2022 15:01:59 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603A723152
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Oct 2022 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3HDpTf4iffhKgY1wFSv/BgVULrjL
        kDzPe+a7qMueJBA=; b=tN7tNveq6eBwjQWGkVBTUIu/wu/q6un3/vfcKcWM1tKX
        hC5Tdq+8v8PCjRYEMJ35G7+3ngXUzN5CclB45yqJgEPk1fxfb1NxRmwyK/2c8FU8
        mcS5m1l77Obx0HjksyUrf8hnNiuENrAvQoUDNaFYb80+0Mr1EpAHXC56pNFMbXo=
Received: (qmail 816035 invoked from network); 12 Oct 2022 21:01:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2022 21:01:54 +0200
X-UD-Smtp-Session: l3s3148p1@loKpBtvqCNsgAwDtxxN7ABspc7EPVowl
Date:   Wed, 12 Oct 2022 21:01:53 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: white-hawk-cpu: Add eMMC support
Message-ID: <Y0cPISnD7cl0cfG7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
References: <cover.1665558371.git.geert+renesas@glider.be>
 <253cd479e55486dd0d3e3804add405e41c32d53b.1665558371.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lMmAf1Ck/q1S0Z4r"
Content-Disposition: inline
In-Reply-To: <253cd479e55486dd0d3e3804add405e41c32d53b.1665558371.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lMmAf1Ck/q1S0Z4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 09:12:34AM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> Describe the eMMC on the White Hawk CPU board.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lMmAf1Ck/q1S0Z4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNHDyEACgkQFA3kzBSg
Kbb4+w/9HCJGspZW9mdyHh2Vxu8MXsn41KhFKLQQMCpIXJHKG9jSKduquFn0v3QH
0Z8ZJGSmz87K7fCAptBFFuivw2dvr/4apjTeFmNrD3HS60X7HdksL/gJqyBM84sW
j1fQJOiPctuqGebQwsQb/Be2Sml8HHWM2Sgq5GHaNx2wdAM8KiVALfWQe1ZkWLjq
Cw9hkjv64PCttldY9nDksRTJP1TsBiVWHiMJ3ClEXtJux0pafgCM6br+DKEOtNCt
dtuW1HzZA/qjL1FbGpfYJ4NCAyve/5LJu+sjCu3IhyGdvBCMMet959IQgNPaPby/
+QlZYrI+h0RlIQ3JTRE8dswWfAGi+7rjh1KxtPzSif2/YbuPsvCwI/n+Olp9KsNw
wlOQD3LBYpWtAxa8CSaJ9CuqMIgC/HVDTtIYSChTKw0qncb/CmLTlFUUxTnqzF6p
l098JnQyQb0xOfoZGeMju3AEpkEP+rx21zLBAm3WL1iFt5garntP0XntlbzKGFwY
sgB+jCrLwycOwywh6hAZ6X9N/ku8kNp6erOu7vJDMUH/te92qP0lVHqkIWWOmP5O
tdvTrAhlz8/NH9QHJ9+V+S/epR4oP/AsL6mvlTNVSfPWom6naF6khsYIFWSY1m/+
BGbZxtzeheqymVQX/U7BzBLNbp+zxHktvrOVjz28UBG/dR7rI+Y=
=/X5A
-----END PGP SIGNATURE-----

--lMmAf1Ck/q1S0Z4r--
