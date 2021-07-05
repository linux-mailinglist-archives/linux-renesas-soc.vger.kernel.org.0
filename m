Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247E33BBD10
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jul 2021 14:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhGEMvP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jul 2021 08:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGEMvO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jul 2021 08:51:14 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8765C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jul 2021 05:48:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:fd03:2275:4427:8d01])
        by laurent.telenet-ops.be with bizsmtp
        id RQoa250062pudom01QoaCA; Mon, 05 Jul 2021 14:48:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m0O1a-006ycX-3Q; Mon, 05 Jul 2021 14:48:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m0O1Z-006N2Y-GD; Mon, 05 Jul 2021 14:48:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add I2C EEPROM for PMIC
Date:   Mon,  5 Jul 2021 14:48:32 +0200
Message-Id: <32443cd203ce2787d9a719d06a473b9e9cd508c2.1625489160.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the I2C EEPROM which serves as external storage
for the PMIC setup, as a backup of the internal OTP configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.15.

 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index ab270e39d458de36..9c7146084ea1c779 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -510,6 +510,12 @@ pmic: pmic@30 {
 		rohm,ddr-backup-power = <0x1>;
 		rohm,rstbmode-level;
 	};
+
+	eeprom@50 {
+		compatible = "rohm,br24t01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
 };
 
 &lvds0 {
-- 
2.25.1

