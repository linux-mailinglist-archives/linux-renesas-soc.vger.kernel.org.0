Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF4E21B4A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 14:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgGJMDl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 08:03:41 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40840 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726828AbgGJMDl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 08:03:41 -0400
X-IronPort-AV: E=Sophos;i="5.75,335,1589209200"; 
   d="scan'208";a="51813283"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2020 21:03:39 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1C054255479;
        Fri, 10 Jul 2020 21:03:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into eMMC nodes
Date:   Fri, 10 Jul 2020 21:03:32 +0900
Message-Id: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add full-pwr-cycle-in-suspend property to do a graceful shutdown of
the eMMC device in system suspend.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This new property has been merged into mmc.git / next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=next&id=475923f495c0cdd4f35c469681013dddd09d3728

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   | 1 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index dc24cec4..7402cfa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -715,6 +715,7 @@
 	mmc-hs400-1_8v;
 	bus-width = <8>;
 	non-removable;
+	full-pwr-cycle-in-suspend;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 98bbcaf..1bf7795 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -833,6 +833,7 @@
 	mmc-hs400-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
+	full-pwr-cycle-in-suspend;
 	status = "okay";
 };
 
-- 
2.7.4

