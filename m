Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55125A31
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2019 23:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfEUV5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 May 2019 17:57:06 -0400
Received: from sauhun.de ([88.99.104.3]:38746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbfEUV5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 May 2019 17:57:06 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 347502C54BC;
        Tue, 21 May 2019 23:57:03 +0200 (CEST)
Date:   Tue, 21 May 2019 23:57:02 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Message-ID: <20190521215702.GA15483@kunai>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
 <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <OSBPR01MB3174B26541C20C2951509DC8D8080@OSBPR01MB3174.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3174B26541C20C2951509DC8D8080@OSBPR01MB3174.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,


> > > > +	if (host->pdev->dev.iommu_group &&
> > >
> > > I wonder if I am too cautious, but maybe we should have another
> > > condition here to be checked first, namely "host->mmc->max_segs < 512=
"?
> >=20
> > I got it. I'll fix it on v3 patch.
>=20
> I'm afraid but I misunderstood this condition is
> "host->pdata->max_segs", not "host->mmc->max_segs", to avoid small
> max_segs value than pdata->max_segs?

You are right. I was in deed thinking mmc->max_segs because it will be
set at probe time, so it would work with values > 512. But I missed the
case you described, I am sorry. But using pdata->max_segs should work.

> (No one has such max_segs value at the moment though.)

Yes. I want to be future-proof here. Just to avoid that the value might
be "magically" decreased if the value might be bigger than 512. It would
be hard to find then because it is kinda deep in the driver.

Two more remarks:

* We should probably use a define for the magic value 512.

* Maybe you could add a comment to the init_card function describing why
  we can increase max_segs in that case. Basically, a short summary of
  your patch description.

Does this make sense to you?

Kind regards,

   Wolfram


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzkdCoACgkQFA3kzBSg
KbZSnxAAr/ByncujpAchv/Vs0lGa3Xqn8CCetr18AMszvvmGj+gwd1Bo/WDhXMqr
irrDNK6nNDA5FZl8mGbAb7o3WIEC8QjwZ2jeCjMqsnAnCRB7yax0amGsSAM5kodU
KmJ+8VrhoR1sRTWq8jSGWsmQ0wGAyDoR0e+q9VpGZWob1r9bke2w5tB9dmCoP9Uz
jh+73qOmI5D6qPPNee5IWW63smuZgYMfIReWfzdjYEAo2drb7fzqiazqgB3Gk4B/
CzV4qRy70EVmhd6ApwpjVU8rPj8UakQ4HTFBhf8gsRPLDmCot3eVmQ2dFL4t/ASH
x2/jVf9tfsrTJV5j/knrCAk6/eWg5RCONAiidGuXLTJxj5pMgDWSLh7hrQ9O/l5B
hPITsiZN4Bj0fxnJVMvshZu0k3IUEAh7vTN1x5QfjRCcymjKURsFuZlfIgi/hch1
ITccZ9QWvnFnjChQSK36M1FTX2NOMvjeunJDXJRJlcITCUf3nhHd+abV1MyVVvtR
ffzoAQM/dwdwHaD6qhzMD8spEDLGk7H8exjSO385KzetMQEFKSXBdH2/WTgfz5fp
wMP/3XaAqITW/44HGLy43HY2WhU6ZMLkKYbLZKN12TdBkxvdGJagDCWQCq4Enxuj
PvYCehX/sXqVWYEFzjMLSBv+KmxLd0KmwK6rqmyAVbehslsJjaE=
=UoPT
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
