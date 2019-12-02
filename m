Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D512210E6D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbfLBIUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:20:45 -0500
Received: from sauhun.de ([88.99.104.3]:41652 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfLBIUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:20:45 -0500
Received: from localhost (p54B3363C.dip0.t-ipconnect.de [84.179.54.60])
        by pokefinder.org (Postfix) with ESMTPSA id 048DD2C04A3;
        Mon,  2 Dec 2019 09:20:41 +0100 (CET)
Date:   Mon, 2 Dec 2019 09:20:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191202082041.GA1266@kunai>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai>
 <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
 <20191121085702.GA1184@ninjato>
 <CAMuHMdVHN_wVuqFn3UcbFWxGPLxc5TfbMBRAWpptdt9M36JRHQ@mail.gmail.com>
 <20191121111025.GB1184@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20191121111025.GB1184@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> anymore. However, I know have the issue highly reproducible with
> renesas_defconfig and renesas-drivers. Good!

Bummer, it is not that reproducible :(

Yesterday, I tried latest linus tree which includes Ulf's changes to
genpd and it worked, even with the NON_REMOVABLE workaround removed
again. Then I reverted Ulf's changes to double check it made a
difference, but the SCC still worked. So, I switched back to the
renesas-drivers tree which used to fail last week, and it sadly works,
too. Sigh...

I'll move over now to upport the manual calibration mechanism and will
keep an eye on if/when the SCC fails again...


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3kyVUACgkQFA3kzBSg
Kbb8Ng//cpuz/gHOGJtL0N7KE25TFZYi/XF0rSm0C/cBe1qwRqvL7i0c8V5Na8y2
2vbynYT4Kiua4ItZOO2n2rjPNX7wpbRaeb7v4+5kYwl/2L8aygQkyHJnQ+264/T4
gun84f6ZOJaHX6GZSapyr4ed6gYMcDBaF89nygqueo/yRKVcItI7uh9KPjqUzIC4
KFrpBj/fm1Y6/1UrzTX0fRPUMcdNjgV9RkCH38zw/U94ETRWTDsLgS5lUuIcGOch
LU2p8viq5qHWiwHXLsZDSFYMTCEp0UsKDp/u69jEUDN2rIaNcwlS3JC640lK8Fss
ttqGrO1BbqVUBaps2tEiorDyFm4w2IejuRJm9i3ZBCRDKHvZX9CW1/S9gtiqkcxJ
WjUafDfroB2eFukICTJsRjrslJvsaHI50bwD2hDxaU4nODYHaucU/dJfa8mGpkiQ
XXS4B/mN2qKbGWsAeA3af9DMO5hUzdsl/3LFc/tGhR6yvv7Vv6g/vtiyi1v8DMR1
m1qDhy5B0CEqbsRhZ3b3LiHVK6wsIIlQidlvlksqG4BI0jPw58g65sXyJM9nwBlU
GsA59ZZAmM9a4VLAUO1XboyRqNlZrdvv64XoEl1J2sbO7GDMDyZw0G7Qk5l+D/lO
T1h/0H2P4wCTqEtso24jCE0towXhliVBoj9a5B1NkgJo79j0IqQ=
=0/6o
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
