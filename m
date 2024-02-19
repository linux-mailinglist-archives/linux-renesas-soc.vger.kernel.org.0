Return-Path: <linux-renesas-soc+bounces-2958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB785A6B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7FB11F217E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 15:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837BD37702;
	Mon, 19 Feb 2024 15:00:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952231DDD5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 15:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354856; cv=none; b=YE132lSBq9SHSH8FB8EtNenAdB4wo+97ltmPT/Ynyfs75OwpFlD1K/unzC1qcq7G4HbtAfQWgGo8oNeDtArc7raEm4ZL6S9/4+N0mz7RIAEgj2c3p/02HlWefm4L7FuPpR9WkDDoqHndGtiuNFQ9tUNOYQHAUB2Rhz6r7xQpg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354856; c=relaxed/simple;
	bh=vH3pqcDHpyeRnoiv7dO/hBCTHpD96GUhVQhY2Zhqhqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hJvluG89EPeH32PXvX4f+fkXLsgTwxCZsMRU5a+nim6p+OtEkfTIP0XKkrlf/BbGVS+UGNqHUpnrCBJBD8PBQ1vD3PJ7Us17qn9NGVfYltQB+jD+FHamYRHAfKf2e3MhcERV0+kiyY0cr6dfO2ZP8mUKzJJ6o/djZhD7D6pq+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a66f:1f5b:42c8:e3c5])
	by michel.telenet-ops.be with bizsmtp
	id p30l2B00E1N8lK50630lM1; Mon, 19 Feb 2024 16:00:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58H-0016gT-9o;
	Mon, 19 Feb 2024 16:00:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58P-007Th7-4I;
	Mon, 19 Feb 2024 16:00:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add QSPI FLASH support
Date: Mon, 19 Feb 2024 16:00:41 +0100
Message-Id: <96d6567024cef9fcd6b04f92a697301c1c8d1d8e.1708354463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708354463.git.geert+renesas@glider.be>
References: <cover.1708354463.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Describe the QSPI FLASH on the Gray Hawk Single board.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Apply to r8a779h0-gray-hawk-single.dts,
  - Add missing status = "okay".
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 1163ac5e292755db..bc8616a56c039b20 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -181,12 +181,45 @@ mmc_pins: mmc {
 		power-source = <1800>;
 	};
 
+	qspi0_pins: qspi0 {
+		groups = "qspi0_ctrl", "qspi0_data4";
+		function = "qspi0";
+	};
+
 	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
 };
 
+&rpc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spansion,s25fs512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x0 0x1200000>;
+				read-only;
+			};
+			user@1200000 {
+				reg = <0x1200000 0x2e00000>;
+			};
+		};
+	};
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.34.1


