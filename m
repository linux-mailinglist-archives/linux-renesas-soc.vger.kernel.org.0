Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837D12B1E4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 16:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgKMPJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgKMPJF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:05 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69B9C061A47
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2020 07:09:04 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id rr912300F4C55Sk01r91TD; Fri, 13 Nov 2020 16:09:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahA-0028AO-W7; Fri, 13 Nov 2020 16:09:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahA-00GSnP-HJ; Fri, 13 Nov 2020 16:09:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.11
Date:   Fri, 13 Nov 2020 16:08:52 +0100
Message-Id: <20201113150854.3923885-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113150854.3923885-1-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.11-tag1

for you to fetch changes up to 43bba65761952f58e850d918ee43b648427609bb:

  arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404 (2020-11-10 09:29:47 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.11

  - Touch screen and OV5640 camera support for the iWave RainboW Qseven
    board (G21D), and its camera expansion board,
  - Support for the AISTARVISION MIPI Adapter V2.1 board connected to
    HiHope RZ/G2 boards,
  - SPI (MSIOF) support for the R-Car M3-W+ SoC,
  - Digital Radio Interface (DRIF) support for the R-Car M3-N SoC,
  - Initial support for the R-Car M3-W+ ULCB/Kingfisher board combo,
  - Minor fixes and improvements.

----------------------------------------------------------------
Biju Das (4):
      arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from ethernet-phy node
      arm64: dts: renesas: cat875: Remove rxc-skew-ps from ethernet-phy node
      arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
      arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out of hd3ss3220 device

Eugeniu Rosca (2):
      arm64: dts: renesas: r8a77961: Add CAN{0,1} placeholder nodes
      arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree

Fabrizio Castro (1):
      arm64: dts: renesas: r8a77965: Add DRIF support

Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a77961: Add MSIOF nodes
      arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay handling
      arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handling

Krzysztof Kozlowski (1):
      arm64: dts: renesas: Align GPIO hog names with dtschema

Lad Prabhakar (7):
      ARM: dts: r8a7742-iwg21d-q7: Add LCD support
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Enable VIN instances
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Add parent macro for each sensor
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2H
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2M
      arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2N
      arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404

 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 222 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |  99 +++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   4 +
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |   4 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  67 +++++--
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   3 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   1 -
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   6 +-
 ...hope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi | 109 ++++++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   3 +-
 .../renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts  |  29 +++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +
 .../renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts  |  16 ++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  67 +++++--
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |   3 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   1 +
 .../renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts  |  16 ++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts   |  15 ++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  74 +++++++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          | 122 +++++++++++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   3 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  14 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +-
 35 files changed, 851 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
