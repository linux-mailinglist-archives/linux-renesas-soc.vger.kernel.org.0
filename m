Return-Path: <linux-renesas-soc+bounces-7680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A3944D83
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 021D2B260A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 13:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82A31A38E7;
	Thu,  1 Aug 2024 13:54:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418941A38C1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722520487; cv=none; b=i+msDwsmEZ2W2f07+QAwPJLKxBtCz/V5+AgFxKBacePGAvNO5i8GOzRh7HOxvCjicgK0/ICJ5hshHRF771HADnQ45rjKo7/LQdwXsl85jQbZor1mLFh5ak0Tevb73m9LpH11FW2NRkEX+A0MHvmJc0TlyZe9dlUBmJOBthx+uC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722520487; c=relaxed/simple;
	bh=kZTC55fVtc1syZyla3VHu7OwHXa6zhGl4Vscl0x/BEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uMd/w0tyTU/PxXVR1/e0xXYJeBxxMz8BvxbcsjfIqph4FIQ1yiALabrX3Xv4UC+2fcdGtxyldYIQlvxBk5RTnnMm1n4WfYjOsaTPlgy+w8pO6jeTxQU7fib+P3WMDKbU3n9RAGTUAwWOvhkzs3wqVrpt/C8ohBQSsAiccDSL22I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by andre.telenet-ops.be with bizsmtp
	id uduh2C0085XJrhx01duhqM; Thu, 01 Aug 2024 15:54:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWG0-004S9w-V5;
	Thu, 01 Aug 2024 15:54:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWGP-00HOE6-5G;
	Thu, 01 Aug 2024 15:54:41 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] arm64: dts: renesas: gray-hawk-single: Add CAN-FD support
Date: Thu,  1 Aug 2024 15:54:36 +0200
Message-Id: <7c2a06b7abec4ce1025761003ccdbce559789708.1722519717.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722519717.git.geert+renesas@glider.be>
References: <cover.1722519717.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable confirmed-working CAN-FD channels 0 and 1 on the Gray Hawk Single
development board:
  - Channel 0 uses an NXP TJR1443AT CAN transceiver, which must be
    enabled through a GPIO,
  - Channels 1-3 use Microchip MCP2558FD-H/SN CAN transceivers, which do
    not need explicit description, but channels 2-3 do not seem to work.

Inspired by a patch for Gray Hawk in the BSP by Duy Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add missing pinctrl-names,
  - Correct TJR1443AT Enable GPIO,
  - Reword now channels 0 and 1 work.

Changes compared to the BSP:
  - Add can_clk,
  - Add missing can_transceiver0,
  - Keep channels 2 and 3 disabled,
  - Preserve sort order.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 88f813562832c21b..9a1917b87f6138af 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -47,6 +47,13 @@ aliases {
 		ethernet0 = &avb0;
 	};
 
+	can_transceiver0: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		enable-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		max-bitrate = <5000000>;
+	};
+
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
@@ -174,6 +181,25 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&can_clk {
+	clock-frequency = <40000000>;
+};
+
+&canfd {
+	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+		phys = <&can_transceiver0>;
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -305,6 +331,21 @@ pins_mii {
 		};
 	};
 
+	can_clk_pins: can-clk {
+		groups = "can_clk";
+		function = "can_clk";
+	};
+
+	canfd0_pins: canfd0 {
+		groups = "canfd0_data";
+		function = "canfd0";
+	};
+
+	canfd1_pins: canfd1 {
+		groups = "canfd1_data";
+		function = "canfd1";
+	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
-- 
2.34.1


