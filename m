Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3F42EF0AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 11:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbhAHK3j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 05:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbhAHK3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:29:39 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137DCC0612F5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jan 2021 02:28:58 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id EAUx2400a4C55Sk01AUxph; Fri, 08 Jan 2021 11:28:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxp0r-001zhr-0w; Fri, 08 Jan 2021 11:28:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxp0q-008UsL-7R; Fri, 08 Jan 2021 11:28:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 1/2] arm64: dts: renesas: r8a779a0: Add PFC node
Date:   Fri,  8 Jan 2021 11:28:53 +0100
Message-Id: <20210108102854.2025261-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108102854.2025261-1-geert+renesas@glider.be>
References: <20210108102854.2025261-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the Pin Function (PFC) instance on the Renesas
R-Car V3U (r8a779a0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
RFC because:
  - The compatible value hasn't been documented yet,
  - The System Group (Port Group 10) register block is missing (do we
    need it?).
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6bb7eaea5b246f51..0facee255237f8a5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -90,6 +90,15 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		pfc: pin-controller@e6050000 {
+			compatible = "renesas,pfc-r8a779a0";
+			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
+			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
+			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
+			      <0 0xe6068000 0 0x16c>, <0 0xe6068800 0 0x16c>,
+			      <0 0xe6069000 0 0x16c>, <0 0xe6069800 0 0x16c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779a0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

