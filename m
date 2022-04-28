Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A735135AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347733AbiD1NyR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347881AbiD1NyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:54:14 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59DE21CFF9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 06:51:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="118328299"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Apr 2022 22:50:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B0F0A4010DCA;
        Thu, 28 Apr 2022 22:50:59 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/3] treewide: Initial support for R-Car V4H
Date:   Thu, 28 Apr 2022 22:50:55 +0900
Message-Id: <20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
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

Changes from v2:
 - Remove accepted patches from this series.
 - Fix some typo and missing entries in patch [1/3].
 - Fix inccorect values in patch [[12]/3].
 - Add Reviewed-by tags in patch [[23]/3].
 https://lore.kernel.org/all/20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v1:
 - Remove accepted patches from this series.
 - Change the dt-binding files' license from (GPL-2.0 or MIT) to
   (GPL-2.0-only OR BSD-2-Clause).
 - Add some definitions in patch [2/7].
 - Add "renesas,rcar-gen4-hscif" in a required property in patch [3/7].
 - Modify r8a779a0-cpg-mssr.c in patch [4/7].
https://lore.kernel.org/all/20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (3):
  clk: renesas: cpg-mssr: Add support for R-Car V4H
  arm64: dts: renesas: Add Renesas R8A779G0 SoC support
  arm64: dts: renesas: Add Renesas White Hawk boards support

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  45 ++++
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  22 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 122 ++++++++++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       | 218 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 9 files changed, 422 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi
 create mode 100644 drivers/clk/renesas/r8a779g0-cpg-mssr.c

-- 
2.25.1

