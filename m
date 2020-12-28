Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700D32E3F77
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 15:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502283AbgL1O2I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 09:28:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:37208 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437885AbgL1O2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 09:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=7CNRNQciaUeAwYNFKSiOrL1eScoKBv5nsfZqOxbk8mY=; b=nrxQD8wJU
        mQlup+21gOqgeaHqwIQWKQFxsYWizfpJA84c8yv2TDj2OWe29qkE1A/i4UOqTJIR
        Xkqeg45zoBBnllIlJV4v/hEEZsFIxNexQIHcsMH+IFuHU9X5E/qGG3LSMrY+RrAq
        BvAUad2x+i7bQdJ/iXp4S+WrnXPPn7I8nE=
Received: (qmail 1780583 invoked from network); 28 Dec 2020 15:27:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 15:27:24 +0100
X-UD-Smtp-Session: l3s3148p1@DbGhEoe3XJYgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 28 Dec 2020 15:27:24 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST v2] renesas/v3u/scif for renesas drivers
Message-ID: <20201228142724.GA93214@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is v2 of my v3u branch for renesas-drivers. It includes all the IO
enablement which I did for V3U and it is based on v5.11-rc1. If you want
a finer granulation, you can find per-IO-device based branches in my git
tree, now all also based on v5.11-rc1:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/*

Other changes:
	* removed the 'unused variable' patches for SMP because they are
	  already in renesas drivers
	* added a patch to enable 'gpio-ranges' and removed a patch to
	  disable 'reset-gpios' for AVB. reset-gpios work now
	* removed the patch to move from SCIF0 to HSCIF0. HSCIF0 has
	  been tested now, but we still want SCIF0 as the debug console

Please pull.

All the best,

   Wolfram


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/scif

for you to fetch changes up to 4dc3446a23362f840418d32c39626439bdd119fe:

  arm64: dts: renesas: r8a779a0: Add HSCIF support (2020-12-28 15:07:12 +0100)

----------------------------------------------------------------
Geert Uytterhoeven (8):
      arm64: dts: renesas: r8a779a0: Add dmac1 placeholder node
      clk: renesas: r8a779a0: Remove non-existent S2 clock
      clk: renesas: r8a779a0: Fix parent of CBFUSA clock
      clk: renesas: r8a779a0: Add PFC/GPIO clocks
      dt-bindings: gpio: rcar: Add r8a779a0 support
      gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
      gpio: rcar: Add R-Car V3U (R8A7799A) support
      arm64: dts: r8a779a0: Add GPIO nodes

Hoang Vo (2):
      arm64: dts: renesas: r8a779a0: Add RWDT node
      arm64: dts: renesas: falcon: Enable watchdog timer

Koji Matsuoka (3):
      arm64: dts: renesas: Add PFC driver to R8A779A0
      arm64: dts: renesas: Add I2C to R8A779A0
      arm64: dts: renesas: Add I2C support for falcon board

Linh Phung (1):
      arm64: dts: renesas: r8a779a0: Add HSCIF support

Takeshi Saito (2):
      arm64: dts: renesas: r8a779a0: Add MMC node
      arm64: dts: renesas: falcon: Enable MMC

Tho Vu (2):
      arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support
      arm64: dts: renesas: falcon: Add Ethernet-AVB support

Ulrich Hecht (17):
      pinctrl: renesas: implement unlock register masks
      pinctrl: renesas: add I/O voltage level flag
      pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
      pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
      pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
      pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
      pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
      pinctrl: renesas: r8a779a0: Add DU pins, groups and function
      pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
      pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
      pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
      pinctrl: renesas: r8a779a0: Add QSPI pins, groups, and functions
      pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
      pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions

Wolfram Sang (25):
      dt-bindings: watchdog: renesas,wdt: add r8a779a0 (V3U) support
      clk: renesas: r8a779a0: Add RWDT clocks
      WIP soc: v3u: allow WDT reset
      arm64: add grace period when rebooting
      arm64: proper comment formatting in reboot handler
      watchdog: renesas_wdt: don't sleep in atomic context
      dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support
      clk: renesas: r8a779a0: add clocks for I2C
      v3u: enable other I2C busses for testing
      i2c: rcar: faster irq code to minimize HW race condition
      i2c: rcar: optimize cacheline to minimize HW race condition
      i2c: rcar: make sure irq is not threaded on Gen2 and earlier
      i2c: rcar: protect against supurious interrupts on V3U
      arm64: dts: r8a779a0: correct reset values for GPIO
      arm64: dts: r8a779a0: enable gpio-ranges
      dt-bindings: net: renesas,etheravb: Add r8a779a0 support
      clk: renesas: r8a779a0: add clocks for RAVB
      dt-bindings: mmc: renesas,sdhi: Add r8a779a0 support
      clk: renesas: rcar-gen3: remove cpg_quirks access when registering SD clock
      clk: renesas: rcar-gen3: factor out CPG library
      clk: renesas: r8a779a0: add SDHI support
      arm64: dts: renesas: r8a779a0: add & update SCIF nodes
      arm64: dts: renesas: falcon: add SCIF0 nodes
      dt-bindings: serial: renesas,hscif: Add r8a779a0 support
      clk: renesas: r8a779a0: add HSCIF support


with much appreciated quality assurance from
----------------------------------------------------------------
Geert Uytterhoeven (10):
      (Rev.) pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add QSPI pins, groups, and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
      (Rev.) pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add DU pins, groups and function
      (Rev.) pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
      (Rev.) pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions

Yoshihiro Shimoda (5):
      (Rev.) gpio: rcar: Add R-Car V3U (R8A7799A) support
      (Rev.) gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
      (Rev.) clk: renesas: r8a779a0: Add PFC/GPIO clocks
      (Rev.) clk: renesas: r8a779a0: Fix parent of CBFUSA clock
      (Rev.) clk: renesas: r8a779a0: Remove non-existent S2 clock

 .../bindings/gpio/renesas,rcar-gpio.yaml           |    3 +
 .../devicetree/bindings/i2c/renesas,i2c.txt        |    1 +
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |    1 +
 .../devicetree/bindings/net/renesas,etheravb.yaml  |    1 +
 .../devicetree/bindings/serial/renesas,hscif.yaml  |    1 +
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |    1 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  359 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  688 +++
 arch/arm64/kernel/process.c                        |    7 +-
 drivers/clk/renesas/Kconfig                        |    5 +
 drivers/clk/renesas/Makefile                       |    1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |   51 +-
 drivers/clk/renesas/rcar-cpg-lib.c                 |  270 ++
 drivers/clk/renesas/rcar-cpg-lib.h                 |   33 +
 drivers/clk/renesas/rcar-gen3-cpg.c                |  267 +-
 drivers/gpio/gpio-rcar.c                           |   64 +-
 drivers/i2c/busses/i2c-rcar.c                      |   66 +-
 drivers/pinctrl/renesas/Kconfig                    |    5 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |   34 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c             | 4471 ++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl.c                  |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   23 +-
 drivers/soc/renesas/rcar-rst.c                     |    8 +
 drivers/watchdog/renesas_wdt.c                     |   30 +-
 25 files changed, 6095 insertions(+), 312 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.c
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.h
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/p60gACgkQFA3kzBSg
Kbbshg/8DF/d5FVNKweZTP4+tjlyLw2PYT7NIhXcVNv5VvhvomaekzS2mPz5S8qU
LG33JTovqkMQb6mYdWlXR6n+S7pY5M+GncOnmh/AQbuBhsVfAH1yDsfk+K7Q+Ycm
SxsJ/qvbdfxWeVdK4FANSPkEuGxopnntl+TyxlyrOY6t2C/31ZdntSTg4qZb3T10
IBnMKVua+1ZtaiyDPrrwdTRLNZC+UkdMn9wjJO0MoL/JcEPjHDN2uEIyCoULWgAJ
/jB2YHGercqn3IDR7Bg4lQctVD6NlVEqHymAgHo6c9XO9E+jzY4zkWzjiDE/Skgj
sEbj7ckBjZ7D/XV5v0qcT5EaJjC5oE6GAZR/uafRFJVXdaZ/GTbyoUbGIlwn9TUY
XqE4uM0Ek4asQGoCehbohAqsSHeNwsFHX/fq7AGp4MRQu89/Gw6jBAilymacCzun
9tpxVWoF0ns5zDjpEQWqJRPzbkBqumkevF05NJVGX2+kojzXY0DZuR3svUGm03TJ
iI3OPSZGEeVI3HxSytShSoEp3jpMfQyD6ZbqnKsdzwkqX5vBTw7+cv8L1tSaA8x5
3lD1bJeG9cVh2EhaHkHf5Ov7e3rxhKmmQjvS6m8B/BrBD7UHL+YxZYr0ZnFWn0ax
szf9MVNrLY2bCIo+QyWgDixtwPSlvrch0F9vOsDqXoMyPWk77L8=
=EcRN
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
