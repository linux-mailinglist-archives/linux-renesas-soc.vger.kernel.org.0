Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA9EB5F06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 10:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbfIRIWM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 04:22:12 -0400
Received: from sauhun.de ([88.99.104.3]:36620 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIRIWM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 04:22:12 -0400
Received: from localhost (p5486CF1F.dip0.t-ipconnect.de [84.134.207.31])
        by pokefinder.org (Postfix) with ESMTPSA id 826CB2C04A3;
        Wed, 18 Sep 2019 10:22:10 +0200 (CEST)
Date:   Wed, 18 Sep 2019 10:22:10 +0200
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
Message-ID: <20190918082210.GA1379@kunai>
References: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
 <TYAPR01MB45444D01948B219CEE4F86E0D88E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <TYAPR01MB45444D01948B219CEE4F86E0D88E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I asked the BSP team about this topic, and then they have a concern about
> the retune. Since they would like to check whether the software is
> doing tune or not, just tuning situation is lacking on this patch.
> So, if MMC subsystem has such a new flag as "doing_tune" in struct mmc_host,
> it's helpful for it. (Also, perhaps it's helpful for adding extra quirks
> on this driver in the future). What do you think?

I understand the concern. I will check this.


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2B6S4ACgkQFA3kzBSg
KbaQzg//eCzKFzx2DD9oEY8ixryCJTh9F0yFNRoY3t3WLNH1byAftd89Kfhz3Sen
SHRCC8V/rpRPUREdjhsL81/SAw03YGKmyU8HuAvjIptk+BfanKhv9OHAy2BZQLMZ
jf1nYzoxvvKtYrSn+gg8p6nwd8TMxAuRSWjCEMidz+yiI4Z/UW9ywzKbQYLVPwzO
r9yBKWv2eENMDPOKDoG+uJduogbeFrwVxtXkbJ1AOrm+CNv2LGVQl24pbdWPm9r2
5BxI2etRo5L+5hwMxNl0E8loA2syVW5SybNsw5OXDDBr2jv9ZqJoHkxutP2vHXDW
N/yUqOOMThxFWDmPLhJ5yCUlnOrkLCMUtplajX2/Rt4KCocg+vNmZVl/XfjTgfpG
FZUTxMiaVWMZOEkSmgwjVSjF+b9WOEBiaQRh5MOTJlZ4eEQTeEXlfWspOLC5kWKU
Ba4ko9Hg2W3jv3lkeg8vqvN1At8r5M1Z3oxhH6jvYfU/5KFz/u905M0czOWXsUwo
jVf6sJ/t8dT3VgqEO+a9kkbk7GzFDLWsefWPd6bnbjm2fCBeewFCtKaEFHnW6yG3
+OoM3QcjVAB1H02Z9DeXgAR663JE7ZRz4WRVBo7k8Gg4rc2kRgLdwPv4jAHKzR+b
dGFRuDCpEdQeq12/NpSwo0PVlTA7U6zHWFclmhz9J966QnwzPSo=
=bvFP
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
