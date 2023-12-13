Return-Path: <linux-renesas-soc+bounces-971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4288810D7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 10:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9888F1F210FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Dec 2023 09:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BFB1EB5A;
	Wed, 13 Dec 2023 09:32:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF21A4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Dec 2023 01:32:29 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1c98:dbe1:1f42:c87a])
	by xavier.telenet-ops.be with bizsmtp
	id MlYT2B0044GNoGY01lYTPd; Wed, 13 Dec 2023 10:32:27 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rDLb1-00Bye0-7j;
	Wed, 13 Dec 2023 10:32:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rDLbO-00G4Wv-Sh;
	Wed, 13 Dec 2023 10:32:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control
Date: Wed, 13 Dec 2023 10:32:25 +0100
Message-Id: <8a51516581cd71ecbfa174af9c7cebad1fc83c5b.1702459865.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pin control description for the serial console was added, but not
enabled, due to missing pinctrl properties in the serial port device
node.

Fixes: 7a8d590de8132853 ("arm64: dts: renesas: white-hawk-cpu: Add serial port pin control")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.8.

 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index bb4a5270f71b6a75..913f70fe6c5cd2d8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -187,6 +187,9 @@ &extalr_clk {
 };
 
 &hscif0 {
+	pinctrl-0 = <&hscif0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
-- 
2.34.1


