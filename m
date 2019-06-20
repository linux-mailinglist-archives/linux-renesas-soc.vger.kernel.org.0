Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1074D047
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 16:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFTOXd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 10:23:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15065 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbfFTOXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 10:23:32 -0400
X-IronPort-AV: E=Sophos;i="5.62,397,1554735600"; 
   d="scan'208";a="18990338"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jun 2019 23:23:30 +0900
Received: from renesas-ubuntu18.ree.adwin.renesas.com (unknown [10.226.36.226])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B405C4004BC2;
        Thu, 20 Jun 2019 23:23:29 +0900 (JST)
From:   Chris Paterson <chris.paterson2@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Remove dummy board DTS
Date:   Thu, 20 Jun 2019 15:23:25 +0100
Message-Id: <20190620142325.28806-1-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This dummy dts file is no longer required as we have a real board, the
r8a774a1-hihope-rzg2m.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile           | 3 ---
 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts | 6 ------
 2 files changed, 9 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index a7926cac3300..42b74c283289 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -17,6 +17,3 @@ dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
 dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
-
-# SoCs lacking upstream board support
-dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-dummy.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts b/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
deleted file mode 100644
index a1621cabbf52..000000000000
--- a/arch/arm64/boot/dts/renesas/r8a774a1-dummy.dts
+++ /dev/null
@@ -1,6 +0,0 @@
-/dts-v1/;
-#include "r8a774a1.dtsi"
-
-/ {
-	model = "Dummy RZ/G2M board";
-};
-- 
2.17.1

