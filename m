Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74690493B9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354988AbiASOCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354991AbiASOCq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:02:46 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB20C061751
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:02:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by baptiste.telenet-ops.be with bizsmtp
        id ke2h2600l2FKFx601e2hWf; Wed, 19 Jan 2022 15:02:41 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXt-00AS1B-9E; Wed, 19 Jan 2022 15:02:41 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABXs-009iIS-CD; Wed, 19 Jan 2022 15:02:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 14/15] arm64: dts: renesas: r8a779f0: Add pinctrl device node
Date:   Wed, 19 Jan 2022 15:02:31 +0100
Message-Id: <1e39ba5a563862965409ed87f9fa5dc06a67f717.1642599415.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642599415.git.geert+renesas@glider.be>
References: <cover.1642599415.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the Pin Function Controller on the Renesas R-Car
S4-8 (R8A779F0) SoC.

Note that register banks 4-7 do not seem to be accessible as-is using
either the Control Domain (0xffd9....) or Application Domain
(0xdfd9....) addresses, so currently you cannot configure pins
controlled by these banks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
How to make the Control Domain release the bus guard, so the registers
become accessible?
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 0ac8c345558efc17..ada6ff380b203625 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -69,6 +69,14 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		pfc: pinctrl@e6050000 {
+			compatible = "renesas,pfc-r8a779f0";
+			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
+			      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>,
+			      <0 0xffd90000 0 0x16c>, <0 0xffd90800 0 0x16c>,
+			      <0 0xffd91000 0 0x16c>, <0 0xffd91800 0 0x16c>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

