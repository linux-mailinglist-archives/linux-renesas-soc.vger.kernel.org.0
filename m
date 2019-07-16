Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD48D6AF8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jul 2019 21:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfGPTF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jul 2019 15:05:27 -0400
Received: from sauhun.de ([88.99.104.3]:40512 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbfGPTF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jul 2019 15:05:27 -0400
Received: from localhost (p54B330C4.dip0.t-ipconnect.de [84.179.48.196])
        by pokefinder.org (Postfix) with ESMTPSA id 099D02C0398;
        Tue, 16 Jul 2019 21:05:25 +0200 (CEST)
Date:   Tue, 16 Jul 2019 21:05:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        niklas.soderlund@ragnatech.se, yamada.masahiro@socionext.com,
        geert@linux-m68k.org, ulf.hansson@linaro.org, magnus.damm@gmail.com
Subject: Re: [PATCH 1/2] mmc: tmio: leave clock handling to PM if enabled
Message-ID: <20190716190524.no5d25iyllgjdluh@katana>
References: <1563289264-26432-1-git-send-email-uli+renesas@fpond.eu>
 <1563289264-26432-2-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yoyke3isdctbjz5m"
Content-Disposition: inline
In-Reply-To: <1563289264-26432-2-git-send-email-uli+renesas@fpond.eu>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--yoyke3isdctbjz5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 05:01:03PM +0200, Ulrich Hecht wrote:
> This fixes a clock imbalance that occurs because the SD clock is handled
> by both PM and the hardware driver.
> See https://www.spinics.net/lists/linux-mmc/msg44431.html for details.
>=20
> This patch removes the clock handling from the driver's PM callbacks and
> turns the clock off after probing.
>=20
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks, Uli!

Niklas, I'd really like your feedback on this one because you did the PM
refactorization lately.

I will have a look later, too.


--yoyke3isdctbjz5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0uH/QACgkQFA3kzBSg
KbYF/A/8DGMPpcoaD9JN6I0wJrYUOGHaVX9/to3u1IkrxcH/zhvILNhPedJpbcwV
ZpBSdVJHK2fMt9NK3Ubbl/qnT0BUh7sWBxAeSLVbB42yVwEDN4In7xFa15FQqyqm
a/4Niirx7iOZHh9un50lhaYXQP4oQOaPiqNaHjBDxTAsthpLUcaKNYGpYqBbHsa1
n5ekJImuq6s5MSBO6vFnuZOSluCa9FZVM8j9wmZLZS49gZk74a6MqIGd0RmPxYIl
74lkSlCfco9KGRO0tmou/OEjZ0tPRrtF0RSCkwh73oPcn7dAsAoz2e8hwAcnGAoX
PJOJh/Fq1WpwZb+8Y5Ago92q7Fn3WwelEdCc0jupGStqlUSciUdE6tyeMHwgKwvU
EgOfCDz3EXqrFLDEYNisrTnswxetsNSJX5jaOuPyYlAPl7zSs8OcpvrkTBWD3R4C
86Mk6bs3k48T5yE2QktIgkpnSDPQPxt2N41P6tEXjVe04i0d6xL01dtEdkFWScrL
b0Th4x/plgFHrgiJ+0ezqQRbf/fC1yjnVCBw0+PpOEiD3mwCq/Ki2ODOZDfkz6nD
L9BinJw8S6lwf6ECyR8+HNjdF4bIXA6rXA2QXdLJgqvA/5cU/ME5mHFZZblhJ6zu
Ndp2RpaiakDb096OMwkdKTog2XVrWeUIGZLtMXAKCboJdpya1XE=
=kftr
-----END PGP SIGNATURE-----

--yoyke3isdctbjz5m--
