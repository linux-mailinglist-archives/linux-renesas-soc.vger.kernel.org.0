Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CED2FED39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 15:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731981AbhAUOoN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 09:44:13 -0500
Received: from www.zeus03.de ([194.117.254.33]:48798 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731530AbhAUOoK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 09:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=Et0l7eAzBPvk7QUBWKo9tbk3iLHWll+ZvqTrPuVTXy4=; b=ACPdIu7qf
        yoR/5sGiiW8Uzr+L3vkUlBHJy+A3gykmClf0IWKaviqW5Hpgd1WY3rTX+/DYgxsm
        BhGas+3oMPTk73jt9aBzZLrgrn30Q48cX3/Zxc2wgZJfxNMPJg/S5DLeTERI2NT9
        ST1PC1zNCgXazEOxtosf4ijv+VnlyjL+No=
Received: (qmail 1905597 invoked from network); 21 Jan 2021 15:43:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 15:43:25 +0100
X-UD-Smtp-Session: l3s3148p1@ep/ZF2q5StQgAwDPXw2wABErSCJ/rm3+
Date:   Thu, 21 Jan 2021 15:43:21 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/v3u/devel-v2 for renesas drivers
Message-ID: <20210121144321.GA2101@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is my updated v3u devel branch for renesas-drivers. It is based on
our agreed base, so quite some patches from the previous version are
already upstream. For the remaining ones, all review comments have been
addressed, and the patches have been resent. Most binding doc updates
are in -next meanwhile. The watchdog patches have been reviewed by
Guenter. The rest is mainly your realm :) There are some debugging
patches in there which I left in place.

Please pull.

Kind regards,

   Wolfram


The following changes since commit 748c9c1c5e7d00fe6d1e5d47140e4492d7e63719:

  Merge branch 'topic/r8a779a0-dt-msiof-v2' into renesas-drivers (2021-01-12 12:36:54 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/devel-v2

for you to fetch changes up to 4a1e26c947d213b717ee6c845dc922b1102305ef:

  HACK: make hscif0 console (2021-01-21 11:41:52 +0100)

----------------------------------------------------------------
Koji Matsuoka (1):
      arm64: dts: renesas: Add I2C to R8A779A0

Linh Phung (1):
      arm64: dts: renesas: r8a779a0: Add HSCIF support

Takeshi Saito (2):
      arm64: dts: renesas: r8a779a0: Add MMC node
      arm64: dts: renesas: falcon: Enable MMC

Tho Vu (1):
      arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support

Wolfram Sang (18):
      dt-bindings: watchdog: renesas,wdt: add r8a779a0 (V3U) support
      WIP soc: v3u: allow WDT reset
      arm64: proper comment formatting in reboot handler
      watchdog: renesas_wdt: don't sleep in atomic context
      watchdog: renesas_wdt: add grace period before rebooting
      clk: renesas: r8a779a0: add clocks for I2C
      arm64: dts: renesas: Add I2C0,1,6 support for falcon board
      v3u: enable other I2C busses for testing
      dt-bindings: net: renesas,etheravb: Add r8a779a0 support
      clk: renesas: r8a779a0: add clocks for RAVB
      arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
      WIP! arm64: dts: renesas: falcon: Add Ethernet-AVB1-5 support
      dt-bindings: mmc: renesas,sdhi: Add r8a779a0 support
      arm64: dts: renesas: disable SD functions for plain eMMC
      dt-bindings: serial: renesas,hscif: Add r8a779a0 support
      arm64: dts: renesas: r8a779a0: add & update SCIF nodes
      arm64: dts: renesas: falcon: add SCIF0 nodes
      HACK: make hscif0 console


with much appreciated quality assurance from
----------------------------------------------------------------
Geert Uytterhoeven (7):
      (Rev.) arm64: dts: renesas: r8a779a0: Add HSCIF support
      (Rev.) arm64: dts: renesas: r8a779a0: add & update SCIF nodes
      (Rev.) dt-bindings: serial: renesas,hscif: Add r8a779a0 support
      (Rev.) arm64: dts: renesas: r8a779a0: Add MMC node
      (Rev.) arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support
      (Rev.) dt-bindings: net: renesas,etheravb: Add r8a779a0 support
      (Rev.) arm64: dts: renesas: Add I2C to R8A779A0

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |   1 +
 .../devicetree/bindings/net/renesas,etheravb.yaml  |   2 +
 .../devicetree/bindings/serial/renesas,hscif.yaml  |   1 +
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   1 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   2 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   2 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      | 354 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   3 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 530 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 arch/arm64/kernel/process.c                        |   4 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |  13 +
 drivers/soc/renesas/rcar-rst.c                     |   8 +
 drivers/watchdog/renesas_wdt.c                     |  33 +-
 18 files changed, 954 insertions(+), 10 deletions(-)

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAJkwMACgkQFA3kzBSg
KbZZHw//UguA/ZiXr1HBfBDDSoDwUcWSpb6bNGkHjXCVIddFR3HM5omdQ9ht04Dg
KIhRH5FYpO3HiHxYN1YBOStuT2p/M90OgZ2ELRO0swFLuPMq399jdO4kqD+XNgNu
1RPnjerJ0pv3RV+l2oqZBQjGVDEs2xLplV3M7wew1MABudSLcRAaGFYeWI0TSvAk
G7XdhbrW5yhQys8RnHAcoagAZm91/T17Wac/yerBpEwChNvSWVNYt5jF2wNlZ0PS
Qqe/dJkBICFP6L4h5cOrl1xjcEz2lfOn6yf/LH7Omne1Q02B5WseccylJgZerUew
OYzUqUGzz0N5fe4cQzmX2Jfvw7LpSzTwjYHP/aKkhg6ctqV/XH229j1rxwSZwwX7
Cg8tMIfXXlqHEgQEegyIaJtLVgRwDBKvkoLBnVUjKxWLK9r15gLFNV0gOv+M0fYX
y/RpDh4lVAJKMe9LJ4MIreXp5aTHk5AmY6lNsbYkamsR048nL1WOSjCcfLOpRQfs
fGNLLpfpGZiv21EKkScGIeXXzPKgnwTMATyJMyoAuhcBe91sdsTOO6kZIHZDY1AF
HE8XZISU7QYZhVqTYn5k+B3yEfomcBWNVodDrNT7AlNHXUdyJech09cVy6OrcT8L
kPPGFObNmWgGX6NuumuAz4xueqiGpD2EUceaqvfYLHeSYux18jQ=
=XkbQ
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
