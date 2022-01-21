Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A6949623E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jan 2022 16:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351415AbiAUPmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jan 2022 10:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240481AbiAUPmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 10:42:22 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED53C06173B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jan 2022 07:42:22 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8c86:990b:e157:4a14])
        by albert.telenet-ops.be with bizsmtp
        id lTiJ2600Z3SWdao06TiJ3M; Fri, 21 Jan 2022 16:42:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nAw3O-00Arqs-DN; Fri, 21 Jan 2022 16:42:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nAw3N-00BEEL-Vf; Fri, 21 Jan 2022 16:42:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded pinctrl-names, too
Date:   Fri, 21 Jan 2022 16:42:17 +0100
Message-Id: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"make dtbs" complains when "pinctrl-names" is present without "pinctrl-0".

Fixes: 5c0d1874072bef54 ("arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be folded into the original in renesas-arm-dt-for-v5.18.

 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 53845823d0dce9cc..728a2275ea8d21ac 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -19,46 +19,55 @@ / {
 
 &canfd {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &ehci0 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &ehci1 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &hsusb {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &i2c0 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &i2c1 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &i2c3 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &ohci0 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &ohci1 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
@@ -68,32 +77,38 @@ &phyrst {
 
 &scif2 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &sdhi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-1;
+	/delete-property/ pinctrl-names;
 	/delete-property/ vmmc-supply;
 	status = "disabled";
 };
 
 &spi1 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &ssi0 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &usb2_phy0 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
 
 &usb2_phy1 {
 	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
-- 
2.25.1

