Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A42B5B7F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2019 11:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfGAJXl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Jul 2019 05:23:41 -0400
Received: from sauhun.de ([88.99.104.3]:53790 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727833AbfGAJXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Jul 2019 05:23:41 -0400
Received: from localhost (p54B3346F.dip0.t-ipconnect.de [84.179.52.111])
        by pokefinder.org (Postfix) with ESMTPSA id C5BF72C360B;
        Mon,  1 Jul 2019 11:23:38 +0200 (CEST)
Date:   Mon, 1 Jul 2019 11:23:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-manual-calib for renesas
 drivers
Message-ID: <20190701092338.GA1968@kunai>
References: <20190628175144.GA1043@ninjato>
 <CAMuHMdWLhRwdcvR=Y1TnBuo+zzUJi-iV75_eGO+29wboU2i4Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLhRwdcvR=Y1TnBuo+zzUJi-iV75_eGO+29wboU2i4Vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> mmc/next is included in renesas-drivers anyway, but Ulf sometimes likes
> to rebase that branch.

I know :(

> Actually you made it more difficult for me, as you changed the mere
> possibility of a conflict due to Ulf rebasing mmc/next, into a certainty
> of your branch conflicting with mmc/next ;-)

Wouldn't that happen as well if I base it on an old version of mmc/next?
As soon as Ulf rebases -> problem. Geez, his rebasing is annoying.

What would be the easiest solution for you here? (except waiting for
-rc1 which was sadly not an option here)

> No problem, it's the same branch name, so I will fetch the new version
> (and I cannot compare with the old version ^-)

Right. I mainly wanted you to know that the content differs a little
=66rom what I originally requested to pull.

> Summary: Thanks for your topic branch, I will include it in tomorrow's
> release!

Thanks!

Kind regards,

   Wolfram


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Z0RUACgkQFA3kzBSg
KbZngA//QJWOnY84oElk/2OHlChvexoD/97verJZXEj3G0kE7vOzL03siE89nCKZ
Hx4k6gqMleFPpP6aFgBB/WUDgPoJaOXTqdOYQFsgezG1hpzN5hO4p8ShPYhz4KRR
nrOibW4wHhHeVucJzbt5helERSsNNXLpBOWwYL5Da8UCHT2Am52t7u5tNZK6wRsv
5cSDYnuC56QoYmJhsGnAJLjtxBmZuZ37PU6L0mZ5EPMVz8ALyuGsq26S1DpcmlMr
N/AZDa9es0NZKieV/DvEMOp7TVg5VqTtK2nbp5DRW2r+B1KhWrmOnESJSkCXQsVb
gxXDdAv0jijTm3FIL3pLqEs/t9MBx+RpmNhAmqK0QuvhgUy+U5VRUTGATCmhWOQc
rZapQwINiPKqAQ3mXXkYr+NGLjFfnRRQ+iPolupbykGD3WrM8DHZEnqwcYUOagKZ
ZRkJXJLp9PuIPrFuEz0q8vjtjezourrGcOUU8DbxuTSTjWfNqO2KN417dKNbr9He
MHcdzSPdUhH0XIlHoIuaTJGbawuNyzXZUt5o6y0KfrvAGh3vIZ5H9X56sXb3KyTr
28Md/W6jwwxlrDWpc63WVC9v0AoF//2CZzJx7QAcQG6zVA5YKXW3cVrT2+WV2aJs
7Y30ya4k81V/9B2P84tPGqzzNvqrKIx7iheciCkc87kcY+idYpw=
=WUno
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
