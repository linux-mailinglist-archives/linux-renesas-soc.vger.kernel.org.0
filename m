Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC2C2E372C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 13:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgL1MpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 07:45:17 -0500
Received: from www.zeus03.de ([194.117.254.33]:37952 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgL1MpQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 07:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        k1; bh=Hv3XluwVp6D/lDW30Q5coVOz1Xrm1nU5JEBdFOUHwG8=; b=zv0X4bOEC
        UYEvcqY3O7Z4nd66Be2cdZA0L32O2KhYjXZal+RJHcdhJ7s/NOvHJGQJUSDoIVd+
        M+qURbxG7hXYW1f+s1idjHIZr9FOIep4UJuY+pWgvkLGiTfji54tGOnY6il6qBbS
        AqzoMKQCIiQsYAW6PBywUMWL9Do7nBcims=
Received: (qmail 1755983 invoked from network); 28 Dec 2020 13:44:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 13:44:32 +0100
X-UD-Smtp-Session: l3s3148p1@qLTBooW36pUgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 28 Dec 2020 13:44:32 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/v3u/devel for renesas drivers
Message-ID: <20201228124432.GA66121@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers. It includes all the IO
enablement which I did for V3U and it is based on v5.11-rc1. If you want
a finer granulation, you can find per-IO-device based branches in my git
tree, these are not based on rc1, though, but a bit earlier:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/*

Please pull or let me know if you prefer something different.

All the best,

   Wolfram


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/devel

for you to fetch changes up to fdddef21566a367ec4a1927e41e04ac59e1b718a:

  arm: smp: remove unused variable (2020-12-28 13:02:37 +0100)

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

Wolfram Sang (28):
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
      dt-bindings: net: renesas,etheravb: Add r8a779a0 support
      clk: renesas: r8a779a0: add clocks for RAVB
      arm64: dts: r8a779a0: WIP disable reset-gpios for AVB
      dt-bindings: mmc: renesas,sdhi: Add r8a779a0 support
      clk: renesas: rcar-gen3: remove cpg_quirks access when registering SD clock
      clk: renesas: rcar-gen3: factor out CPG library
      clk: renesas: r8a779a0: add SDHI support
      arm64: dts: renesas: r8a779a0: add & update SCIF nodes
      arm64: dts: renesas: falcon: add SCIF0 nodes
      dt-bindings: serial: renesas,hscif: Add r8a779a0 support
      clk: renesas: r8a779a0: add HSCIF support
      WIP: arm64: dts: renesas: falcon: switch to from SCIF0 to HSCIF0
      arm64: smp: remove unused variable
      arm: smp: remove unused variable


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
 arch/arm/kernel/smp.c                              |    3 -
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  365 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  688 +++
 arch/arm64/kernel/process.c                        |    7 +-
 arch/arm64/kernel/smp.c                            |    1 -
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
 27 files changed, 6100 insertions(+), 317 deletions(-)
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.c
 create mode 100644 drivers/clk/renesas/rcar-cpg-lib.h
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/p0ywACgkQFA3kzBSg
KbYPxA/8D+W5/6KpiVNMWYakLcjao0skeLyFF+wO/wWIqEbSg+YzAQlWb0mJfJq2
shbvLjmbP5ddyYI+wvBiYYkbdStR81ZbCqI25ak8qSI3XDaA0vK4TsxnJ+hhr+C/
AZYkL1L5r+h97PxKcX+EhxjEKqhwTxe7HHcgKB/1CZUbRavujKZTWhN6gD6m7Pug
o2k2y5lLKpJ+uQXfjGVAEKflyZDY38H51uykKZroeF0tstpDUGs1WyO8OPLEH/d+
NSlcM0Bu8w3mKXi+5l6+Q3vc6tXqzzIY8xRjPoUHnWbxR+DiqyEZpi+WpwJUHkHz
Ct3jnvV6A+pS8T8OEdi22pfoFYvqN2aJ5xZwJJJqgB4m9cG41hj78tEV03+EyDSs
m91VhpNB/3fNH42s8qumZDuJTXKMwfA2z4lXhdoQwuexrZ5i3ijC5pka9TiCeBH4
VHj9Wlzr6/tz0bFp91bb3cTH+Fctn6Kk5ROsOjQGGqiSP9RtvceRK7qoWQ4bkN6a
g6j/S0aC5zrHYuSRnQVSAWtKuFvfY8JxrGTjI8YGJr5BODjnljSru5heGwtnPYzQ
EZF+vfIr4n6zxAm+V3FKFkNhDHq7gcq9p7w5+A/kxs/ymj492yLLWw3a3xNAy2N/
UgiMacA7/hIUBcfbSr+jZYxBVJ6QKjBvU7oibt1D7xLZ1aP5eDI=
=tFhq
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
