Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E80104E89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 09:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKUI5M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 03:57:12 -0500
Received: from sauhun.de ([88.99.104.3]:58060 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbfKUI5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 03:57:12 -0500
Received: from localhost (p54B33AAB.dip0.t-ipconnect.de [84.179.58.171])
        by pokefinder.org (Postfix) with ESMTPSA id 3D4BC2C044D;
        Thu, 21 Nov 2019 09:57:09 +0100 (CET)
Date:   Thu, 21 Nov 2019 09:57:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191121085702.GA1184@ninjato>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
 <20191119204725.GA1454@kunai>
 <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+W62MkSRuYZNT0ezOt_KkyStfoeZohu7m1pOP=4a0HQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> So some of my local code on top must have impacted the behavior.

Any change in temperature? Niklas and I wonder if it is thermal related.

> > I am working on an issue where the SCC hangs, but this has to do with
> > always providing the SCC clock (SDnH). I don't really see the connection
> > of that to RuntimePM yet, though :/
>=20
> Makes sense: this is consistent with the behavior when accessing
> registers without enabling the corresponding module clock: it hangs.
> So this can happen with other clocks, too.
> One more reason not to delegate clock handling to a guest, as doing it
> wrong can take down the host, too...

You mean when it comes to virtualization?

> > Can you test this simple workaround patch instead of the revert just so
> > we get an idea if these issues are related?
>=20
> Thanks, applying your workaround on top of
> renesas-drivers-2019-11-19-v5.4-rc8 fixes the issue.

Ok, good to know thanks for testing. Currently, I wonder why reverting
the NON_REMOVABLE workaround makes a difference. Maybe it is not
temperature related but a some race with RPM? I am debugging in this
direction now. But the lockup is still hard to trigger for me. Tried
v5.4-rc8 + NON_REMOVABLE patch with no luck. Will try renesas-drivers
next.

> This fix is part of renesas/topic/sdhi-manual-calib, right?

Yes.

> And thus has been present in some renesas-drivers release, but was
> dropped _before_ the 2019-10-15-v5.4-rc3 release.

That would explain why it didn't show up before, right? And don't you
have a Ebisu in your board farm, too? Luckily, I have one, too, now. It
should be affected.

Thanks for the pointers,

   Wolfram


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3WUVoACgkQFA3kzBSg
KbZxDA/9HjG+dZRhow9kM/5B8FgCTkpMOXHArFQlrBXPzCOqt4vVnZsvN/uuvktL
KnvgJi5iC7fXOrZquslfOJzCsB+rV5CisCI9WKh6ss/E9zGfeejDGcIyHiTVTdAX
rksAMHy0PZMKm7i62YxUOhIm0G9fa/ejpm9ObMy0G0c36e2yxldVJWmheLPhKTcd
2vTeU8RzWLvAz7O1nefmkdxhDIyQTWhNONbkBVV1imUVN46v0txL01nGg2EGWnn6
hPY9HE5M7XsAwfJXoToHbjd/cHDt8hltIo4npNusd2t4TOXS1DGMwjuwcEhZACKf
mMQrM1uFqqM270sggvltoPhK69u9A5zKvmKlqlmyI0AhRsieqof9FOx6f5r1W1BZ
R+91ddCEG6cOCTX4fG+RcFnetgBpsPVNXlzQpMuFWq4g2aSfIHdJmKdL5Kd3njbN
wfHmWLLKXvenSXaa6p2Bs+DyAarCYTAnW+OOmjED14yG/PVKc/YdAFI2kW//b+P8
szPFqyYHh5nY8y3P+rkDnw7Z1i3mCE+fv3+BmQF6FytweZanADmlh9IvFKqVeHiF
3xVpWsXcYQsyIO+rdWsk3VE0cp+OKfZ7oe/TCf9h768Ix1RRCqEeHtGZ9SrSJB4M
RXiO73qXZZwvfFHcG/BKA4dtyv5MmxvktTeltq1BSkfwaFSdW0w=
=qBxW
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
