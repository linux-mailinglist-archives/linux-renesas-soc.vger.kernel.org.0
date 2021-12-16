Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88BC477594
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 16:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbhLPPRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 10:17:04 -0500
Received: from www.zeus03.de ([194.117.254.33]:48318 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232758AbhLPPRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 10:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=+8LH1JXZc3vVd15/5ty3P8fj5Rbw
        53Xz5kFME0Bh0qY=; b=c3/f4Ypw2I69OX+zLiJ+bbjxByGJD77YE2IL9ZXOA+Pd
        FkJ7l04PgWmP7bmOAVQpgLl1yb2XyyWh/giYR+RndwxqIGYOmqbvDCWo3WOBewnd
        EuUg9uL3hwEpcl4Hoc9fB+4AgfTr6XoJ/gJYhJi3Olq9VbSDqd2gOYsb6uzkb4c=
Received: (qmail 3751849 invoked from network); 16 Dec 2021 16:17:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Dec 2021 16:17:01 +0100
X-UD-Smtp-Session: l3s3148p1@0GkJ6kTT9JkgAQnoAGshAMNCcCooTOTk
Date:   Thu, 16 Dec 2021 16:17:01 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH 1/3] serial: sh-sci: Drop support for "sci_ick" clock
Message-ID: <YbtYbeybi2t6oEPz@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
References: <cover.1639663832.git.geert+renesas@glider.be>
 <b4103e44d6ac46b6c1c264e2aeac80b39941fe74.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JfXCO/GGNuYOvHmo"
Content-Disposition: inline
In-Reply-To: <b4103e44d6ac46b6c1c264e2aeac80b39941fe74.1639663832.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--JfXCO/GGNuYOvHmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 03:17:32PM +0100, Geert Uytterhoeven wrote:
> Since commit 1b463bd51042927e ("ARM: dts: r8a7794: Rename the serial
> port clock to fck") in v4.6, all upstream DTS files call the SCIF
> functional clock "fck".
>=20
> Hence the time is ripe to drop backward-compatibility with old DTBs that
> use the old "sci_ick" name.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note that such old DTBs have stopped working anyway since commit
> 58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
> support") in v5.5.

Ah, with that paragraph in mind:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JfXCO/GGNuYOvHmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7WG0ACgkQFA3kzBSg
KbZWrw//ZU3WSAi08e8sQG4QdKB7eDQTGeCSgoFDLkGViP99ixeOMvupRZw7pcFj
J5R9YeMzXqoJbw+C42yN7upxuhMCtYQ1jks9YP3uYrWwGCeEbelg4WRWh0KSLC8g
GafTINh1pek3Gado9acyUsyCK0U9IG+DgIkZ+RQ8aoB/fY02lLIHPKtl/R1Gyg9n
O54I1YdwLaUci2zoF5a6dAYAnJctlrVuNwCIxMiuyX0hoigaY9fh6p/D5338v6Gh
g4H4VvoPsiIvM/Op7ZZgDJZ6R91V82e5MAtU/W0Fk48fJ36zcETB8g7U57KVuB6v
/bSD9OXHcvTLsvwv5bcs/dS75aKZCQiFCLBwd6qJ+AISHPAQWDsKRfcOeyfaLVeE
gVIx6T6pykavAcbMiG8eCDKNzBbnajLsJf7GZozk1iLA1aDP5+M7luDfWZkyfgVH
LG5D6DyFvGqQKkgqLpnyDVAe0YDzhuwmIqWD5l4xFcONLxJb5ZQVKIJ6678UpT/0
+B4O7O76wVRVFoIoHoYSpxnW1gAG2cjrmlAf3lqj6uvPdgy2C5OhQLPz6Igy84/t
4Y6JkzFjF8uKI5FnZjIXqzrJEu+lFkOha4ku31mP73RUSEwrFdCAJJG/h0JyhFp8
na29UH0NpJzSvJXIm/fDQ8eIIV4RZB7BLD6Vwm8GsTc1ILvPg+I=
=b7Ic
-----END PGP SIGNATURE-----

--JfXCO/GGNuYOvHmo--
