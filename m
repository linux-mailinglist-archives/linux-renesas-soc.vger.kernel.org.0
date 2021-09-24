Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307874178D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 18:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344264AbhIXQh2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 12:37:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347650AbhIXQgc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 12:36:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAE21604AC;
        Fri, 24 Sep 2021 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632501299;
        bh=M2gUitgMmxHvTeA6IbPHMv2h0xP5gcxshq65vE4o2KM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VUu/5Dy8CG8Odj1tnkrCBeRA2NRy+UNOzNb7DuDK8lTuAWop9t5Zet72GDiz/at1C
         bUBlcvt8HWkyMmOHHiQY2x52qDqXjT8OFfNTSXoGhnOPOjZDqVYkjvMNe21aWpEKcA
         t0kR2P7wSx38AF6gbBQrSUAYSBjC6l80UfJuhoPda5IduQ4OirvaDX/6CzDsiXoQSc
         6HkbzN3RNxfOkHBgEDp7S/Vkf5FCiNIkccAgEmwIkfZGwRefAYcJjOBNKMyM4KTwTG
         VSZj/RzQMVI4g0bJTO4sJHiFwZ5tqAjvEaAQV2e+nKt/hr5ZHcf/KmsiXKJw1sTtpW
         6tC9FqSPw802g==
Date:   Fri, 24 Sep 2021 18:34:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, linux-can@vger.kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        wg@grandegger.com, mkl@pengutronix.de, kuba@kernel.org,
        mailhol.vincent@wanadoo.fr, socketcan@hartkopp.net
Subject: Re: [PATCH 1/3] can: rcar_canfd: Add support for r8a779a0 SoC
Message-ID: <YU3+K5WQkBC2YBBy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, linux-can@vger.kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, wg@grandegger.com,
        mkl@pengutronix.de, kuba@kernel.org, mailhol.vincent@wanadoo.fr,
        socketcan@hartkopp.net
References: <20210924153113.10046-1-uli+renesas@fpond.eu>
 <20210924153113.10046-2-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g10CtCYoBSkx6XEj"
Content-Disposition: inline
In-Reply-To: <20210924153113.10046-2-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--g10CtCYoBSkx6XEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  1 file changed, 152 insertions(+), 75 deletions(-)

Nice work, Ulrich. Compared to the BSP patch which has "422
insertions(+), 128 deletions(-)", this is a really good improvement.

Did you test it on D3 to ensure there is no regression? Or are the
additions in a way that they don't affect older versions?


--g10CtCYoBSkx6XEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFN/iYACgkQFA3kzBSg
Kba9/Q//VXO86dP3rHXXX9sgyj7cgtdw515ZLn6GwaYfbgYdRFFin7Z4Nu6CVmzT
cURgUJFMXR3HvHY7AhiRPeqd15GmCvmk+xKnoNvZadjRW1XeNxXneRB2Dd7vSHXM
IQnZaySM6/xdSLMD533qba7EsZB8cqtqxEaIm/AU/Dzrs1wZG3MZTbpkM+etpgIf
UEBYyW0vJGeZghPCz7YLu6lDFqJ6DYjcLVL39fjcRt+TAQ5mb3/9zEs6FyPFaUhl
qwJFCyuIVtR7bU6ocm6hH52fXAcFKHeb1EnW14nt9oQn3qUzMaE1J3i2s47o4OYH
HtCdIJxdT2F8FQ8rix3Qe6fxPE0p/bUHw4B+d6Nl3MzKcgc+Se4PEToBWpmGM8dG
FXcQTK8tDd2UVrRLN0wAVY1t+m7Ft5TB1Hq3V1FkOxrF+pUszkMsrB9gwwB12tTf
aIaCugarFsW1u3GCT1ifgLk8VDaxeD/ZmqRFk1bGgB64VRX0ihchQheWI0DzioRJ
+2kjyaBfhiqxJg7NcH+h76vR+kJVWTkyx/lAFo8RXlJVREFYcI6xhWmPLFvbOKxQ
paB/TRijGVZ4mFjoQxKipSB/fX8DhU2rddsyfvxdNu9XAvns5PEiqR2Pcpv9TW/x
M7aPDUoAHXXKfP/SR549HccUnqnU6pQ5bD9MLa8a4sWpt2t6o3g=
=0DHv
-----END PGP SIGNATURE-----

--g10CtCYoBSkx6XEj--
