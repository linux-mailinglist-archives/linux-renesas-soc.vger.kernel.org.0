Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2772A7B310C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 13:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjI2LKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 07:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2LK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 07:10:28 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBDBBF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 04:10:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
        by albert.telenet-ops.be with bizsmtp
        id rnAN2A00A1EgHdD06nANVJ; Fri, 29 Sep 2023 13:10:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBNd-004qNl-6D;
        Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBO2-001frJ-5m;
        Fri, 29 Sep 2023 13:10:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DTS updates for v6.7
Date:   Fri, 29 Sep 2023 13:10:15 +0200
Message-Id: <cover.1695985427.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
References: <cover.1695985418.git.geert+renesas@glider.be>
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

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.7-tag1

for you to fetch changes up to d70be079c3cf34bd91e1c8f7b4bc760356c9150c:

  arm64: dts: renesas: ulcb/kf: Use multi Component sound (2023-09-25 09:25:04 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.7

  - Add PCIe Host and Endpoint support for the R-Car S4-8 SoC and the
    Renesas Spider development board,
  - Add FLASH support for the Renesas Genmai and RSK+RZA1 development
    boards,
  - Add multi Component sound support for Renesas ULCB development
    boards equipped with the Shimafuji Kingfisher extension,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (12):
      ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin name
      ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
      ARM: dts: renesas: gr-peach: Remove unneeded probe-type property
      ARM: dts: renesas: Remove unused LBSC nodes from board DTS
      ARM: dts: renesas: r7s72100: Add BSC node
      ARM: dts: renesas: r8a7779: Add LBSC node
      ARM: dts: renesas: r8a7792: Add LBSC node
      ARM: dts: renesas: marzen: Move Ethernet node to LBSC
      ARM: dts: renesas: blanche: Move Ethernet node to LBSC
      ARM: dts: renesas: wheat: Move Ethernet node to LBSC
      ARM: dts: renesas: genmai: Add FLASH nodes
      ARM: dts: renesas: rskrza1: Add FLASH nodes

Kuninori Morimoto (2):
      arm64: dts: renesas: Handle ADG bit for sound clk_i
      arm64: dts: renesas: ulcb/kf: Use multi Component sound

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
      arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |  82 ++++++++++-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts    |   6 -
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |  71 +++++++++-
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   7 +
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts     |   5 -
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts      |   2 +-
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts       |  32 +++--
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |   5 -
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   5 -
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts      |  34 ++---
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts        |  34 ++---
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |   5 -
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   2 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  24 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 134 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +-
 .../renesas/ulcb-audio-graph-card-mix+split.dtsi   |  16 ++-
 .../boot/dts/renesas/ulcb-audio-graph-card.dtsi    |  17 ++-
 .../renesas/ulcb-audio-graph-card2-mix+split.dtsi  |  13 +-
 .../boot/dts/renesas/ulcb-audio-graph-card2.dtsi   |   4 +-
 .../ulcb-kf-audio-graph-card-mix+split.dtsi        |  57 ++++----
 .../boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi |  27 ++--
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi       | 108 ++++++++-------
 .../dts/renesas/ulcb-kf-audio-graph-card2.dtsi     |  14 +-
 .../ulcb-kf-simple-audio-card-mix+split.dtsi       | 152 +++++++++++----------
 .../dts/renesas/ulcb-kf-simple-audio-card.dtsi     |  77 ++++++-----
 .../renesas/ulcb-simple-audio-card-mix+split.dtsi  |   8 +-
 .../boot/dts/renesas/ulcb-simple-audio-card.dtsi   |   8 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +-
 42 files changed, 664 insertions(+), 339 deletions(-)
