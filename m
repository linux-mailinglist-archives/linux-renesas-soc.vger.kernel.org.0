Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B0846765D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243895AbhLCLfF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243546AbhLCLe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:34:56 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4842C06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Dec 2021 03:31:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by baptiste.telenet-ops.be with bizsmtp
        id RnXU260073eLghq01nXUzC; Fri, 03 Dec 2021 12:31:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6ml-002IYT-TK; Fri, 03 Dec 2021 12:31:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6ml-000hQu-DW; Fri, 03 Dec 2021 12:31:27 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM DT updates for v5.17
Date:   Fri,  3 Dec 2021 12:31:18 +0100
Message-Id: <cover.1638530606.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638530605.git.geert+renesas@glider.be>
References: <cover.1638530605.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.17-tag1

for you to fetch changes up to cdda01947bbae8f1b1d19f8aac1f81ae5ce6f37e:

  arm64: dts: renesas: r8a779a0: Add DU support (2021-11-26 14:08:20 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.17

  - Serial, SPI, timer, watchdog, operating points, and QSPI FLASH
    support for the RZ/G2L SoC and the RZ/G2L SMARC EVK development
    board,
  - SDHI SDnH clocks for the R-Car Gen3 and RZ/G2 SoCs,
  - Display Unit support for the R-Car V3U SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (8):
      arm64: dts: renesas: cat875: Add rx/tx delays
      arm64: dts: renesas: r9a07g044: Sort psci node
      arm64: dts: renesas: r9a07g044: Add OSTM nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM
      arm64: dts: renesas: r9a07g044: Rename SDHI clocks
      arm64: dts: renesas: r9a07g044: Add WDT nodes
      arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog
      arm64: dts: renesas: r9a07g044: Add OPP table

Geert Uytterhoeven (2):
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
      arm64: dts: renesas: Fix operating point table node names

Kieran Bingham (3):
      arm64: dts: renesas: ulcb: Merge hdmi0_con
      arm64: dts: renesas: salvator-common: Merge hdmi0_con
      arm64: dts: renesas: r8a779a0: Add DU support

Lad Prabhakar (6):
      arm64: dts: renesas: r9a07g044: Add SCIF[1-4] nodes
      arm64: dts: renesas: rzg2l-smarc: Enable SCIF2 on carrier board
      arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
      arm64: dts: renesas: r9a07g044: Add RSPI{0,1,2} nodes
      arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2l-smarc-som: Enable serial NOR flash

Wolfram Sang (2):
      arm64: dts: reneas: rzg2: Add SDnH clocks
      arm64: dts: reneas: rcar-gen3: Add SDnH clocks

 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  16 ++
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi  |   3 +
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   3 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   3 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  35 ++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 273 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  63 +++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  42 ++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   5 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   5 +-
 20 files changed, 513 insertions(+), 66 deletions(-)
