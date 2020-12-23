Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2502E209E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Dec 2020 19:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgLWSxt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Dec 2020 13:53:49 -0500
Received: from www.zeus03.de ([194.117.254.33]:33010 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgLWSxs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Dec 2020 13:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=abzfSoTswBg0ARcotWAigmx1IAOuWoPJWrUYB32ikmY=; b=W8/UD/VvP
        ZlB43o4jLzeYT9/Mx+fxIvrrLfUkuohXWlY5MTtA87k4sJxbNz7QWkZYUPPbxtUv
        AHZnFrufnrQQMgMJggd1SRy11c4sgUdrPh0WnrfE7xH21JO635cPXNOFUrI6JWVx
        Odx5VRqWopJdQWyd58QPRpNAgO23hnM6kE=
Received: (qmail 561505 invoked from network); 23 Dec 2020 19:53:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 19:53:05 +0100
X-UD-Smtp-Session: l3s3148p1@PtiSMya3HMggAwDPXwj6AD0QibTOPUCe
Date:   Wed, 23 Dec 2020 19:53:04 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Reboot regression on Lager
Message-ID: <20201223185304.GA75038@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I just discovered that my Lager can't reboot anymore. 5.10 is good,
current Linus' tree [1] is bad. I don't have time to debug this on my
own right now, so this is a reminder and notification for now.

[1] (614cb5894306 ("Merge tag 'acpi-5.11-rc1-2' of git://git.kernel.org/pub=
/scm/linux/kernel/git/rafael/linux-pm")

Happy hacking,

   Wolfram

=3D=3D=3D

[    8.280735] Unhandled fault: imprecise external abort (0x1406) at 0x0000=
0000
[    8.287793] pgd =3D (ptrval)
[    8.290504] [00000000] *pgd=3D41d85835, *pte=3D00000000, *ppte=3D00000000
[    8.296794] Internal error: : 1406 [#1] ARM
[    8.300983] Modules linked in:
[    8.304044] CPU: 0 PID: 1173 Comm: init Tainted: G        W         5.10=
=2E0-12913-g614cb5894306 #1092
[    8.313187] Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
[    8.319632] PC is at sh_mdio_ctrl+0x44/0x60
[    8.323831] LR is at sh_mmd_ctrl+0x20/0x24
[    8.327933] pc : [<c0424c04>]    lr : [<c0424c64>]    psr: 20000013
[    8.334203] sp : c1f93d18  ip : c1f93d38  fp : c1f93d34
[    8.339431] r10: 00000058  r9 : c1b55044  r8 : 00000001
[    8.344658] r7 : 00000001  r6 : 00000002  r5 : 00000000  r4 : c1b97a44
[    8.351189] r3 : f08a1320  r2 : 00000001  r1 : 00000002  r0 : c1b97a44
[    8.357720] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[    8.364863] Control: 10c53c7d  Table: 41b44059  DAC: 00000051
[    8.370611] Process init (pid: 1173, stack limit =3D 0x(ptrval))
[    8.376449] Stack: (0xc1f93d18 to 0xc1f94000)
[    8.380810] 3d00:                                                       =
c1b97a44 00000002
[    8.388997] 3d20: 00000020 0000001f c1f93d44 c1f93d38 c0424c64 c0424bcc =
c1f93d6c c1f93d48
[    8.397183] 3d40: c04227dc c0424c50 00000001 c1b97a44 00000001 c1f01000 =
c0b200ac c1b55044
[    8.405369] 3d60: c1f93d8c c1f93d70 c0422a30 c04227b0 c1f01000 c1f01000 =
00000001 0000001f
[    8.413555] 3d80: c1f93db4 c1f93d90 c041f224 c04229e4 c1f93db4 c1f93da0 =
c1f01458 c1f01000
[    8.421741] 3da0: 00000001 0000001f c1f93dd4 c1f93db8 c041f2b0 c041f1bc =
c1b55000 00000200
[    8.429926] 3dc0: c1f01470 ffffe000 c1f93de4 c1f93dd8 c0420118 c041f27c =
c1f93dfc c1f93de8
[    8.438112] 3de0: c0421224 c0420108 c1b55004 c1b55000 c1f93e0c c1f93e00 =
c041944c c04211ec
[    8.446298] 3e00: c1f93e1c c1f93e10 c041bee0 c0419424 c1f93e44 c1f93e20 =
c03d3578 c041bed4
[    8.454484] 3e20: 00000000 c0a0d0a8 00000000 4321fedc c0100264 c1f92000 =
c1f93e54 c1f93e48
[    8.462669] 3e40: c013dfb0 c03d3414 c1f93e6c c1f93e58 c013e04c c013df80 =
01234567 c0a0d0a8
[    8.470855] 3e60: c1f93f94 c1f93e70 c013e358 c013e03c 00000000 00000000 =
00000000 00000000
[    8.479041] 3e80: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.487226] 3ea0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.495412] 3ec0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.503597] 3ee0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.511783] 3f00: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.519968] 3f20: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000
[    8.528154] 3f40: 00000000 00000000 00000000 c012851c c1f93f74 c1f93f60 =
c0128548 c01271f0
[    8.536340] 3f60: ffffe000 00000000 c1f93f8c c1f93f78 c0128810 c0a04248 =
00000000 00000000
[    8.544526] 3f80: 000bc7e0 00000058 c1f93fa4 c1f93f98 c013e468 c013e200 =
00000000 c1f93fa8
[    8.552711] 3fa0: c0100060 c013e45c 00000000 00000000 fee1dead 28121969 =
01234567 00000000
[    8.560897] 3fc0: 00000000 00000000 000bc7e0 00000058 000bc7e0 00000000 =
b6f7af6c 00000000
[    8.569082] 3fe0: 000bc31c be9f6d00 0007e82c b6f02928 60000010 fee1dead =
00000000 00000000
[    8.577265] Backtrace:=20
[    8.579715] [<c0424bc0>] (sh_mdio_ctrl) from [<c0424c64>] (sh_mmd_ctrl+0=
x20/0x24)
[    8.587218]  r7:0000001f r6:00000020 r5:00000002 r4:c1b97a44
[    8.592879] [<c0424c44>] (sh_mmd_ctrl) from [<c04227dc>] (mdiobb_cmd+0x3=
8/0xa8)
[    8.600204] [<c04227a4>] (mdiobb_cmd) from [<c0422a30>] (mdiobb_read+0x5=
8/0xdc)
[    8.607531]  r9:c1b55044 r8:c0b200ac r7:c1f01000 r6:00000001 r5:c1b97a44=
 r4:00000001
[    8.615278] [<c04229d8>] (mdiobb_read) from [<c041f224>] (__mdiobus_read=
+0x74/0xc0)
[    8.622952]  r7:0000001f r6:00000001 r5:c1f01000 r4:c1f01000
[    8.628613] [<c041f1b0>] (__mdiobus_read) from [<c041f2b0>] (mdiobus_rea=
d+0x40/0x54)
[    8.636370]  r7:0000001f r6:00000001 r5:c1f01000 r4:c1f01458
[    8.642031] [<c041f270>] (mdiobus_read) from [<c0420118>] (phy_read+0x1c=
/0x20)
[    8.649268]  r7:ffffe000 r6:c1f01470 r5:00000200 r4:c1b55000
[    8.654929] [<c04200fc>] (phy_read) from [<c0421224>] (kszphy_config_int=
r+0x44/0xb4)
[    8.662686] [<c04211e0>] (kszphy_config_intr) from [<c041944c>] (phy_dis=
able_interrupts+0x34/0x40)
[    8.671665]  r5:c1b55000 r4:c1b55004
[    8.675241] [<c0419418>] (phy_disable_interrupts) from [<c041bee0>] (phy=
_shutdown+0x18/0x1c)
[    8.683698] [<c041bec8>] (phy_shutdown) from [<c03d3578>] (device_shutdo=
wn+0x170/0x200)
[    8.691721] [<c03d3408>] (device_shutdown) from [<c013dfb0>] (kernel_res=
tart_prepare+0x3c/0x48)
[    8.700440]  r9:c1f92000 r8:c0100264 r7:4321fedc r6:00000000 r5:c0a0d0a8=
 r4:00000000
[    8.708187] [<c013df74>] (kernel_restart_prepare) from [<c013e04c>] (ker=
nel_restart+0x1c/0x78)
[    8.716812] [<c013e030>] (kernel_restart) from [<c013e358>] (__do_sys_re=
boot+0x164/0x204)
[    8.725004]  r5:c0a0d0a8 r4:01234567
[    8.728579] [<c013e1f4>] (__do_sys_reboot) from [<c013e468>] (sys_reboot=
+0x18/0x1c)
[    8.736251]  r7:00000058 r6:000bc7e0 r5:00000000 r4:00000000
[    8.741912] [<c013e450>] (sys_reboot) from [<c0100060>] (ret_fast_syscal=
l+0x0/0x58)
[    8.749582] Exception stack(0xc1f93fa8 to 0xc1f93ff0)
[    8.754639] 3fa0:                   00000000 00000000 fee1dead 28121969 =
01234567 00000000
[    8.762825] 3fc0: 00000000 00000000 000bc7e0 00000058 000bc7e0 00000000 =
b6f7af6c 00000000
[    8.771009] 3fe0: 000bc31c be9f6d00 0007e82c b6f02928
[    8.776066] Code: e5943004 e5935000 f57ff04f e3570000 (e5944004)=20
[    8.782164] ---[ end trace db0ca13a19886fca ]---


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/jkgwACgkQFA3kzBSg
Kbbwxg/+MXPL0dMhX0m1qPQpufTZQZ+OYJxOa9UZF6z/iRrrqGF2GaRkYibr5or8
ROcj5cBw41w11nX2xIqHnX2L84Fg+Gtc0xYgZ+k1ttJj9b6+uQLsEPMMvc46E5An
Pc6D7QYqC2DT6zV5bgLR/1IxOGdexrzMOKAgXybwdu/w1HiEpgCWJfgYr0Aeuy7Z
DubCeWzlV4j9ltEw0qY/yTnt3witbX9cKOAeIFWa7jWMNPzxD4yYhC0Syv7TRWHU
fdVu+3nAfYxO2b7FtooxXs06SMjlV6jycl6kYZSxsBfPu3Z6Hc7dUnPK1NLtRX19
EjLp1/JeqH7/2REncdyMy/T4JDhfrcBh4v5HoDHV286kMYvBR8kjm6nXSeScZHb9
UyCl3r27ygc7e++6bH63dX6FcKogtj3nxuc+/ciJ6LcN1N5jdeR7qZfOkaIRuGHl
UMR0ndLiPzqBNVDzIx3yh/YQ9gNc5yxk9t+mKaggd3gP3AW355WZQCBElbT7vuXj
OEvCD9JRTtbLTMZSTtUetujoy7iHjZtbtcJimJJP4zq6p3D/dVAmEAordrVL+yx/
eEvlGQHNTfORR6SQE6+xM759fdrQxzxRhoiiTfEQwaNjenf//ZA8IYw8j9MlYMg2
MRFTTF9/9hBXcrET+pEidOMhNDAnw7hd2QYycd9LStI9noxthgA=
=OQL6
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
