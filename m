Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269FC62FAA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 17:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242212AbiKRQpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 11:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242215AbiKRQpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:45:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A2269DF2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:45:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by andre.telenet-ops.be with bizsmtp
        id lslD2800129fmst01slDAw; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UK-000pAA-Os; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UJ-00FrgO-U1; Fri, 18 Nov 2022 17:45:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/7] Renesas ARM DT updates for v6.2 (take two)
Date:   Fri, 18 Nov 2022 17:44:59 +0100
Message-Id: <cover.1668788921.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
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

The following changes since commit b9a0be2054964026aa58966ce9724b672f210835:

  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts (2022-10-28 14:23:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v6.2-tag2

for you to fetch changes up to 884af88b756ccb57ed7cb6241c1fbd1080732124:

  arm64: dts: renesas: spider-ethernet: Enable Ethernet Switch and SERDES (2022-11-18 17:08:01 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v6.2 (take two)

  - Timer (TMU and CMT) and quad Cortex-A76 CPU topology support for
    the R-Car V4H SoC,
  - Watchdog, L2 cache, and system controller support for the RZ/V2M
    SoC on the RZ/V2M Evaluation Kit 2.0,
  - Ethernet Switch and SERDES supports for the R-Car S4-8 SoC and the
    Spider development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g011: Add L2 Cache node
      arm64: dts: renesas: r9a09g011: Add system controller node

Fabrizio Castro (4):
      arm64: dts: renesas: r9a09g011: Fix unit address format error
      arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings
      arm64: dts: renesas: r9a09g011: Add watchdog node
      arm64: dts: renesas: rzv2mevk2: Enable watchdog

Geert Uytterhoeven (5):
      arm64: dts: renesas: r8a779g0: Add L3 cache controller
      arm64: dts: renesas: r8a779g0: Add secondary CA76 CPU cores
      arm64: dts: renesas: r8a779g0: Add CPUIdle support
      arm64: dts: renesas: r8a779g0: Add CPU core clocks
      arm64: dts: renesas: r8a779g0: Add CA76 operating points

Lad Prabhakar (1):
      arm64: dts: renesas: rzg2l: Drop #address-cells from pinctrl nodes

Pierre Gondois (1):
      arm64: dts: renesas: rzg2l: Add missing cache-level properties

Thanh Quan (1):
      arm64: dts: renesas: r8a779g0: Add CMT node

Wolfram Sang (5):
      arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
      arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock
      arm64: dts: renesas: r8a779g0: Add TMU nodes
      arm64: dts: renesas: white-hawk-cpu: Sort RWDT entry correctly
      arm64: dts: renesas: spider-cpu: Switch from SCIF3 to HSCIF0

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
      arm64: dts: renesas: spider-ethernet: Enable Ethernet Switch and SERDES

 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  30 +--
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |  90 +++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 126 +++++++++-
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |   8 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 265 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   4 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  31 ++-
 10 files changed, 522 insertions(+), 37 deletions(-)
