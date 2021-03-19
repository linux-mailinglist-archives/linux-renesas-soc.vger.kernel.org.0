Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417E5341927
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 11:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbhCSKCB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 06:02:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:43978 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229769AbhCSKBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 06:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=WKceFBQbhSZtCJNGpxtUyiRflIW1yGCwvyfY6S/phsw=; b=U1F7fs3h2
        FxFoKQEfiemBgMTGA+jIii+8qRRW1CONqRswjmtzKSelw8Oi92mhVkxLQ5kS9WNY
        jyIdoWIilZBZFS3U5xT6Zu8aCrZ9rcVeo9WRGEpiXczdJKzUSrOvl+k7CO8VNMHl
        4cily3jcclkNX/I1AivUK5BUMu61ieCPPA=
Received: (qmail 727045 invoked from network); 19 Mar 2021 11:01:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2021 11:01:45 +0100
X-UD-Smtp-Session: l3s3148p1@y9C7zeC9dOggAwDPXwjVAAZjx8wbjB+v
Date:   Fri, 19 Mar 2021 11:01:45 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PULL REQUEST] renesas/v3u/timers-v1-minimal for renesas drivers
Message-ID: <20210319100145.GA2265@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

here is the minimal topic branch to prepare V3U CMT and TMU timers for
renesas-drivers. There is also another branch (intended for testing)
which enables the timers in DT, too:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/tim=
ers-v1

Bit I thought this was not so suitable for renesas drivers, so this
minimal branch.

Please pull.

Kind regards,

   Wolfram


The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/t=
imers-v1-minimal

for you to fetch changes up to 203fa4f26a8be19c225b20d8e7526b50972c099d:

  arm64: dts: renesas: r8a779a0: Add CMT support (2021-03-19 10:54:57 +0100)

----------------------------------------------------------------
Niklas S=C3=B6derlund (1):
      timekeeping: Allow runtime PM from change_clocksource()

Phong Hoang (2):
      arm64: dts: renesas: r8a779a0: Add TMU support
      arm64: dts: renesas: r8a779a0: Add CMT support

Wolfram Sang (5):
      dt-bindings: timer: renesas,tmu: add r8a779a0 TMU support
      clk: renesas: r8a779a0: Add TMU clocks
      clocksource: sh_cmt: don't use CMTOUT_IE with R-Car Gen2/3
      dt-bindings: timer: renesas,cmt: add r8a779a0 CMT support
      clk: renesas: r8a779a0: Add CMT clocks


with much appreciated quality assurance from
----------------------------------------------------------------
Geert Uytterhoeven (1):
      (Rev.) clocksource: sh_cmt: don't use CMTOUT_IE with R-Car Gen2/3

Niklas S=C3=B6derlund (1):
      (Rev.) clocksource: sh_cmt: don't use CMTOUT_IE with R-Car Gen2/3

 .../devicetree/bindings/timer/renesas,cmt.yaml     |   2 +
 .../devicetree/bindings/timer/renesas,tmu.yaml     |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 135 +++++++++++++++++=
++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  10 ++
 drivers/clocksource/sh_cmt.c                       |   5 +-
 kernel/time/timekeeping.c                          |  36 ++++--
 6 files changed, 174 insertions(+), 15 deletions(-)

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBUdokACgkQFA3kzBSg
KbbddA//U22gypc/HyzgWLRQg/EPnWYXRIip7dsjYb6zZqWbPckZmNv3t3+KGkdI
QSWRQZOQGs2/G9AUNELdfiRvxibiwf6NSCkTjbUGyvKpNg2AeEYodKA1J48bdND2
xmGHxnHmIzYAFJWPaY/pWTrUAKuoA843gJSeZFm3XoQ5S5yl4nt5OsGQRKbbAsa9
oGdBtJDx0LYJV8pV9JFRlaigebMIdFCB8ftrNcEShA+ICuiExcH1JghrVZP6kL73
LaqFgCiF6Wm5k1ZXjCYAyu/3r3n8C+9VLoeOPTo1WurgDbpF2EjXMluzZnMJR1W6
n4Z9lmjBb/eyo006gawSNNBFwNHJziYNlczMpyHwFwnRsHPKbRqZh20KIa96/KBr
fPAzcQbnqX51TJ91bgHkCrBLw3JpEPU527s4dYWJn+HCE6F6NUI7FDaX3qswuYwL
zL/UAt6n3DqcSjbEeNMGfeNU3TTJQDdClmXDAAzKl/puFkLMkpWgIjeSTpfKZlGh
rVosLEoLKK47Dg4PG2V0UngKMhwDiqjwQWxtuJVPgMSQyO6t1AX9z69bOO7q8YpT
7ZDvLdUufWvm5MRVGd5wbx8YjYPvbK9Q+olAzoYHrolhYjujSr6wmyhm/opFLB1U
5YyXzopQWcOVgvAXClmrHdJjJ8d6ndmvi5suEWnGvJLrKwacU7I=
=nEXN
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
