Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D4E5BCB63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 14:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiISMEK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 08:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiISMEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 08:04:09 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8066526AE0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Sep 2022 05:04:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:ed67:3be8:ebe5:696d])
        by andre.telenet-ops.be with bizsmtp
        id Mo432800W0GZoLL01o43sr; Mon, 19 Sep 2022 14:04:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFVL-005cI6-2p; Mon, 19 Sep 2022 14:04:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oaFVK-00GClj-8e; Mon, 19 Sep 2022 14:04:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM DT updates for v6.1 (take two)
Date:   Mon, 19 Sep 2022 14:03:54 +0200
Message-Id: <cover.1663588776.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663588772.git.geert+renesas@glider.be>
References: <cover.1663588772.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6f67580ca9edb33a95897d8c0056b961cbd2aeac:

  arm64: dts: renesas: Add V3H2 Condor-I board support (2022-09-02 10:45:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v6.1-tag2

for you to fetch changes up to 4ebf297b93403897668ee003427a9b780023c298:

  arm64: dts: renesas: Adjust whitespace around '{' (2022-09-19 13:53:47 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v6.1 (take two)

  - Merge Renesas ARM/ARM64 maintainers entries,
  - CAN support for the RZ/N1 SoC and the RZN1D-DB development board,
  - Watchdog, pin control, I2C (EEPROM), GPIO (LEDS/switches), and
    Ethernet support for the R-Car V4H SoC and the White Hawk
    development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      ARM: dts: r9a06g032: Add CAN{0,1} nodes
      ARM: dts: r9a06g032-rzn1d400-db: Enable CAN1

Geert Uytterhoeven (20):
      arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number
      Merge tag 'renesas-fixes-for-v6.0-tag1' into renesas-arm-dt-for-v6.1
      MAINTAINERS: Merge ARM/Renesas ARM64 and ARM/SH-Mobile ARM architectures
      arm64: dts: renesas: r8a779g0: Add RWDT node
      arm64: dts: renesas: white-hawk-cpu: Enable watchdog timer
      arm64: dts: renesas: r8a779g0: Add pinctrl device node
      arm64: dts: renesas: white-hawk-cpu: Add serial port pin control
      arm64: dts: renesas: r8a779g0: Add I2C nodes
      arm64: dts: renesas: white-hawk: Add I2C0 and EEPROMs
      arm64: dts: renesas: white-hawk: Add CSI/DSI sub-board
      arm64: dts: renesas: white-hawk: Add Ethernet sub-board
      arm64: dts: renesas: r8a779g0: Add GPIO nodes
      arm64: dts: renesas: white-hawk-cpu: Add GP LEDs
      arm64: dts: renesas: white-hawk-cpu: Add push switches
      arm64: dts: renesas: r8a779g0: Add RAVB nodes
      arm64: dts: renesas: white-hawk: Move aliases and chosen
      arm64: dts: renesas: white-hawk-cpu: Add Ethernet support
      arm64: dts: renesas: spider: Move aliases and chosen
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      ARM: dts: renesas: Fix USB PHY device and child node names

Kuninori Morimoto (2):
      arm64: dts: renesas: spider-cpu: Add missing bootargs
      arm64: dts: renesas: white-hawk-cpu: Add missing bootargs

Lad Prabhakar (3):
      arm64: dts: renesas: rzg2ul-smarc-som: Drop enabling wdt2
      arm64: dts: renesas: rzg2ul-smarc: Include SoM DTSI into board DTS
      arm64: dts: renesas: Adjust whitespace around '{'

 MAINTAINERS                                        |  35 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a77470.dtsi                    |   8 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   6 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   6 +-
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        |  28 ++
 arch/arm/boot/dts/r9a06g032.dtsi                   |  20 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  10 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  10 +
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |   9 -
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 151 ++++++++
 .../dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi   |  15 +
 .../dts/renesas/r8a779g0-white-hawk-ethernet.dtsi  |  16 +
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  15 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 382 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |  12 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   5 -
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |  11 -
 25 files changed, 686 insertions(+), 89 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
