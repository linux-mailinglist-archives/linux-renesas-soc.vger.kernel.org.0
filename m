Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E09D50D9A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 08:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbiDYGp3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 02:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiDYGp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 02:45:26 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E8C1F2B184;
        Sun, 24 Apr 2022 23:42:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="119051216"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 15:42:20 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B4AB44009BE6;
        Mon, 25 Apr 2022 15:42:20 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/7] treewide: Initial support for R-Car V4H
Date:   Mon, 25 Apr 2022 15:41:54 +0900
Message-Id: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds initial support for the Renesas R-Car V4H
(r8a779g0) SoC.

Changes from v1:
 - Remove accepted patches from this series.
 - Change the dt-binding files' license from (GPL-2.0 or MIT) to
   (GPL-2.0-only OR BSD-2-Clause).
 - Add some definitions in patch [2/7].
 - Add "renesas,rcar-gen4-hscif" in a required property in patch [3/7].
 - Modify r8a779a0-cpg-mssr.c in patch [4/7].
https://lore.kernel.org/all/20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (7):
  dt-bindings: power: Add r8a779g0 SYSC power domain definitions
  dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
  dt-bindings: serial: renesas,hscif: Document r8a779g0 bindings
  clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
  clk: renesas: cpg-mssr: Add support for R-Car V4H
  arm64: dts: renesas: Add Renesas R8A779G0 SoC support
  arm64: dts: renesas: Add Renesas White Hawk boards support

 .../bindings/serial/renesas,hscif.yaml        |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  45 ++++
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  22 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 122 ++++++++++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  10 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  18 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       | 217 ++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c           |   5 +
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h |  90 ++++++++
 include/dt-bindings/power/r8a779g0-sysc.h     |  45 ++++
 16 files changed, 585 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi
 create mode 100644 drivers/clk/renesas/r8a779g0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h

-- 
2.25.1

