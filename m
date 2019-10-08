Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B9BCFF31
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 18:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfJHQqT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 12:46:19 -0400
Received: from sauhun.de ([88.99.104.3]:50784 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfJHQqT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 12:46:19 -0400
Received: from localhost (p54B3324A.dip0.t-ipconnect.de [84.179.50.74])
        by pokefinder.org (Postfix) with ESMTPSA id A39662C07B8;
        Tue,  8 Oct 2019 18:46:16 +0200 (CEST)
Date:   Tue, 8 Oct 2019 18:46:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix hang up in HS400 timing mode
 selection
Message-ID: <20191008164616.GA2966@kunai>
References: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
 <TYAPR01MB45444D01948B219CEE4F86E0D88E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190918082210.GA1379@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20190918082210.GA1379@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 10:22:10AM +0200, Wolfram Sang wrote:
>=20
> > I asked the BSP team about this topic, and then they have a concern abo=
ut
> > the retune. Since they would like to check whether the software is
> > doing tune or not, just tuning situation is lacking on this patch.
> > So, if MMC subsystem has such a new flag as "doing_tune" in struct mmc_=
host,
> > it's helpful for it. (Also, perhaps it's helpful for adding extra quirks
> > on this driver in the future). What do you think?
>=20
> I understand the concern. I will check this.

For the record, I am still working on this. I am currently researching
if the hs400_downgrade() function has some relevance to it. However,
I wasn't able to trigger the fault condition the last days. Will keep
trying...


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2cvVMACgkQFA3kzBSg
KbY8yBAAmmJaSMM2cXYVqBCIGNGHtPpf0lS6cVlc8ssQWgzIYqPdD5YCMLu1Vd9H
KEE+kz2A5dgO0qGQQxdPWVgSAmGo6SbUTiAX2dQFLI1BZZ3S/LygUJstzvtVsBwo
aYjen9mJHE6VE3ccs0uoyfkMp5wbohpeWE4mdSIslQSgtKUayYOWQBLs2QfYRwwU
X/8mT4GmeUbuz8muU7Vla6HThdP96aKZx1Cw1SDdgY3Jmp2HAPLByT8uBKUR547Z
xzdbIE9gmXvpyD4Fn8/m55pwNi7fq1rWMtFTuYyZQApPLBE1wblgbEdrkZC3dn+s
+P26qo5+PwWWPupGunS6yEb0gMQauIcy6HcL6jtpNh+Lq2G0nJadp0T9uTlHv+pk
YHnoKxCBvYTJngTlkrwrfdA3OOa66zpCzItil26tR+OzGi+vFleEHeBej6iK1+vK
V+gGIIIP826AI/7rT+dpw4gIgTbIk+TN1grzPA3VkUG+j8CBnv8fqAbQi3qDALo0
y5VDJ2OVQWIvpuv2uzh62h22YE5t0S4Ue+0UECENgasti1TAmTEaZx20MsbGQ4Qx
8QZxorYDJd8Ij45kjTXO/d7zrTAPdwr2w9MZysEwhhzZfLhJtFoQTQthZ6NUDmlM
/zaXTHwWpB7SlOPcBYMMyn0426U0FBR0OPnc1qYDri9uYVBusQs=
=seba
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
