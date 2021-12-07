Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB2D46B5C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 09:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhLGI3B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 03:29:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:35100 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232717AbhLGI2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 03:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=092SULqdAQJccKnq4YxK7WEc3ff7
        mBMwVj8zR8DWZpM=; b=MU4UVYUS/3yl/wCsEJlIyODFG5CRklUcz91C6XywSpXd
        G17xG9fvjnZPLsrHnS3Fl8C0y0AFGB9e9Yb2IeSFmEeSX8KXFrr4teD5uoNnLwO8
        tFaBwacZGB0PNUyEjvnADwqDyivEIaBk+3tZqTUXe6w2AxGJYwc+50vihoAm7oA=
Received: (qmail 137329 invoked from network); 7 Dec 2021 09:25:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Dec 2021 09:25:17 +0100
X-UD-Smtp-Session: l3s3148p1@kszCHIrSpKggAwDPXwjfAHtMsMWgaLw5
Date:   Tue, 7 Dec 2021 09:25:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Magnus Damm <damm@opensource.se>
Cc:     linux-serial@vger.kernel.org, geert+renesas@glider.be,
        gregkh@linuxfoundation.org, linux-renesas-soc@vger.kernel.org,
        jirislaby@kernel.org
Subject: Re: [PATCH] serial: sh-sci: Remove BREAK/FRAME/PARITY/OVERRUN
 printouts
Message-ID: <Ya8aaej5BidMemRL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <damm@opensource.se>, linux-serial@vger.kernel.org,
        geert+renesas@glider.be, gregkh@linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org, jirislaby@kernel.org
References: <163884254093.18109.2982470198301927679.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v3LurCebDLnXVtzP"
Content-Disposition: inline
In-Reply-To: <163884254093.18109.2982470198301927679.sendpatchset@octo>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--v3LurCebDLnXVtzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 11:02:20AM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>=20
> Update the SCIF serial driver to remove printouts for break, frame, parity
> and overrun errors. This reduces the amount of console printouts generated
> by the defconfig kernel on R-Car Gen3 for certain use cases. To retrieve
> more information about such errors the user may inspect counters. Also th=
ese
> errors are fed into the TTY layer for further application specific handli=
ng.
>=20
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--v3LurCebDLnXVtzP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGvGmUACgkQFA3kzBSg
KbbiEg//deeHC324Nzp1umJ03u9Jk7z5Yw091lWzHcLqItDClMl1qznwTDAMMWLW
CBXicny7TbP/Zw0nGN5o4Ox4oL70znOb1OwhXFkBB50OyubIGvX4IgDyHbTGgprc
BrLOYO6WNl5IaoFNyVg2d+2juyHh+bfrmd5Dt07BTbM46gXA2y6Mbio2XxVfvo+1
1f1EPMnSRoGAezrknxSLHrYK2pahNLNjmyM+IeoIvCTrmnsRtibbvymwfOT5OtpS
Nh4bYnSHyfFU8ZLkCOmtAgViae5xpVt79v1RO4Mudq6o+4KiziokbgbOm6qS+wSN
LDl4qKex7V1t/dVEdPaFNSsxetXXbPfWIiFMC7KpKivMoIvL6ONQVRRZ8oBuoVmG
TpjIdq7aRpsoZRIaQ7yDyMT/uE2Xx8V9VgW9jhTco7s9rLvct3towgIOkiaJE9JL
FS0g19St0D6TSYl70tP5prAbXp7Ab0viwTGtcG0P4+63bum5GlHsFhIXDC6s6NJi
AvADLsKFmjx+WYierErouNtaACadAmKnn44uA4SOSJCAu5/QCcibl94DHL4UO/+B
4KLS6yshUKPV9suLyxoVhT1lWT4+rdnKoFmSM1tdexbbLDMqwSW3+NVjuTzJxdfS
ed8iRFGZHUBRWLIpVIDScZRgZkJktQM2AXA/SkEsfGO2P1zV+xg=
=f1IL
-----END PGP SIGNATURE-----

--v3LurCebDLnXVtzP--
