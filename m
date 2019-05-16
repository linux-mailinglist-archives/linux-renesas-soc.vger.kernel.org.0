Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFBF82080D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 15:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfEPNZg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 09:25:36 -0400
Received: from sauhun.de ([88.99.104.3]:41868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726717AbfEPNZg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 09:25:36 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 880F82C04C2;
        Thu, 16 May 2019 15:25:34 +0200 (CEST)
Date:   Thu, 16 May 2019 15:25:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Message-ID: <20190516132534.GB2832@kunai>
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
 <20190516121659.GA2832@kunai>
 <CAMuHMdUpqbQ=3hBzt9nYfy-jwSbPQ9kF8Q-org=fecR_RiDN4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUpqbQ=3hBzt9nYfy-jwSbPQ9kF8Q-org=fecR_RiDN4A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> SoC-specific structs differ, and at this point in the code, we just have a
> pointer, not a fixed-size array. So you cannot use ARRAY_SIZE().

Right, just a pointer. But well, you found a middle path for ARRAY_SIZE.
Thanks!


--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzdZMoACgkQFA3kzBSg
KbZb/BAAgprGb31sBOakW/CJSDtTglT1A2SR6MisiZ6fm6Oeki9SuTZ5QB4dhmnJ
Qj6FbnUGlDF+ZDfz0XeQw5+Qh1WtTQPFtNwl/Xiqn8dqCcGFxsrF9bK2GwNS3yp7
z6/QSlqCxS5qVKv+ccWPoWWny9wYC2p9lTMhErJxsKHqNW3melywtEYMvVSt2624
vQtrdeCBu3FCEh0eEaX5LGys95zGsIc3SNbMpx5Oeh6y53UCiA8DDimNKKK1T4Hi
s4kqvCpamPUgnHiQnaneqZt5UEg2ySuDj/6LlGdtZJF67RlI3XzZYEKlnfrp3rYs
3o1ZHQydLpQAI3fnPxKz24pkZJugzn6gWJJMLF/ThJW+T/n7Tjdy6LS54/Yvr/Qd
eUzY78pNZlOopX+6PJWGa1TtmTPl05dnI9DInl7yQonQmwNlcfJ9rQJKTlEdhKL9
z8C3HPDYZRADQ+nMJcDUe+jZb7y6eMZYzITZhR1V5rT7+Dv3s8P65PXnEf9aDpHv
6jzU0xu5mhzY8VrnfNY1QxdeYSXHH9gEvnNix1TKOPWD3FaKvntUGb87Oxf4rtwu
HEG2Y5V9XKe6gCx81O3rDR9UJBDHVssJw93sLPbGF18fMDOe/K32RedAjiUp5vRq
a1aJBp0Hob0PxZiwza6xXLdBZVpCxqnYCOrUPk/Woeb+9fcmhfI=
=lmbc
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
