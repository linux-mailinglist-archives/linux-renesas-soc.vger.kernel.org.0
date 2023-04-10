Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C486DC40F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Apr 2023 09:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjDJHzt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Apr 2023 03:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjDJHzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Apr 2023 03:55:48 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC24172E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Apr 2023 00:55:47 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id ivvj290021C8whw06vvjFz; Mon, 10 Apr 2023 09:55:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmMW-00GRs2-LH;
        Mon, 10 Apr 2023 09:55:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmNL-008PVV-74;
        Mon, 10 Apr 2023 09:55:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.4 (take two)
Date:   Mon, 10 Apr 2023 09:55:28 +0200
Message-Id: <cover.1681113117.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681113111.git.geert+renesas@glider.be>
References: <cover.1681113111.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 4db0ce4038dec3cf5cb42587a111f4415be381b6:

  arm64: dts: renesas: r8a779a0: Update CAN-FD to R-Car Gen4 compatible value (2023-03-16 17:00:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.4-tag2

for you to fetch changes up to 2f04079bf5920b5120407421478dff1d5692d959:

  arm64: dts: renesas: r8a779a0: Revise renesas,ipmmu-main (2023-04-04 10:01:01 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.4 (take two)

  - Add PWM support for the R-Car H1 and H2 SoCs,
  - Add slide switch and I2C support for the Marzen development board,
  - Add SCI (serial) and Camera support for the RZ/G2L SoC and the
    RZ/G2L SMARC EVK development board,
  - Add IOMMU support for the R-Car V4H SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: rzg2l: Add clock-names and reset-names to DMAC nodes
      arm64: dts: renesas: r9a07g044: Enable SCI0 using DT overlay

Geert Uytterhoeven (7):
      dt-bindings: clock: r8a7779: Add PWM module clock
      ARM: dts: r8a7779: Add PWM support
      ARM: dts: marzen: Add slide switches
      ARM: dts: marzen: Enable I2C support
      ARM: dts: r8a7790: Add TPU device node
      ARM: dts: r8a7790: Add PWM device nodes
      arm64: dts: renesas: r8a779a0: Revise renesas,ipmmu-main

Lad Prabhakar (2):
      arm64: dts: renesas: r9a07g044: Add CSI and CRU nodes
      arm64: dts: renesas: rzg2l-smarc: Enable CRU, CSI support

Niklas Söderlund (1):
      arm64: dts: renesas: falcon-csi-dsi: Set bus-type for MAX96712

Yoshihiro Shimoda (4):
      arm64: dts: renesas: r8a779f0: Revise renesas,ipmmu-main
      arm64: dts: renesas: r8a779g0: Add IPMMU nodes
      arm64: dts: renesas: r8a779g0: Add iommus to DMAC nodes
      arm64: dts: renesas: r8a779g0: Add iommus to MMC node

 arch/arm/boot/dts/r8a7779-marzen.dts               |  69 +++++++++++
 arch/arm/boot/dts/r8a7779.dtsi                     |  91 ++++++++++++---
 arch/arm/boot/dts/r8a7790.dtsi                     |  81 +++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  |   5 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  22 ++--
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   8 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 126 +++++++++++++++++++++
 .../boot/dts/renesas/r9a07g043-smarc-pmod.dtso     |  45 ++++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   2 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  81 +++++++++++++
 .../renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtso  |  21 ++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   2 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |  80 +++++++++++++
 include/dt-bindings/clock/r8a7779-clock.h          |   1 +
 15 files changed, 608 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043-smarc-pmod.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
