Return-Path: <linux-renesas-soc+bounces-3707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6487903D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 694D11F21767
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43E877F12;
	Tue, 12 Mar 2024 09:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38577F1C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234167; cv=none; b=kVuESoGoX3nWaZmRkM4ffIjsDazqJ29UYA6Txg23ps0qythZhAVgYoBJKJZtV8CqAWcjLAKT8FonFheKb6RTiTYg/VCEBiurB9lJXQLoq++HhbhXnbClbNxmWbI0x5cPTgQHjofvcmjk9HZ1nctW5hYHjtPHmEbsDdtTdaCwu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234167; c=relaxed/simple;
	bh=OLr9LeT9Hfp1wzFU4tuO63HS0mEUDnRlNc6XgefmHps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F6nHOI3guiAUuQqZDNCJqOQDM8vJa6WmkVidGnnFRnxCHicPDCOxw0R4Qc81WzTwPvhvLDpjUQ6bSPBNrtLRc4adbAFB+sMAQ0wuIUYWAD8bB3XyVH0whloMQ0Tzdx6rH4lXLjQQ9TDtoNM3CdLJx0Bijti/uRnWgmXw/PfDs7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id xl2d2B00E0SSLxL01l2dRe; Tue, 12 Mar 2024 10:02:37 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1d-003Qlc-BG;
	Tue, 12 Mar 2024 10:02:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1t-005m73-IJ;
	Tue, 12 Mar 2024 10:02:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: dts: renesas: gray-hawk-single: Add second debug serial port
Date: Tue, 12 Mar 2024 10:02:36 +0100
Message-Id: <6e1faff6a717cb8344661bafcae5db5dcfb53a90.1709741303.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709741303.git.geert+renesas@glider.be>
References: <cover.1709741303.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the second debug serial port (CN9800) on the Gray Hawk Single
board, as provided by HSCIF2, including the SCIF_CLK2 external clock
source, and all related pin control.

Based on a patch for Gray Hawk in the BSP by Nghia Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index bc8616a56c039b20..acf1d625ec410e55 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &hscif0;
+		serial1 = &hscif2;
 		ethernet0 = &avb0;
 	};
 
@@ -90,6 +91,14 @@ &hscif0 {
 	status = "okay";
 };
 
+&hscif2 {
+	pinctrl-0 = <&hscif2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -144,7 +153,7 @@ &mmc0 {
 };
 
 &pfc {
-	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-0 = <&scif_clk_pins>, <&scif_clk2_pins>;
 	pinctrl-names = "default";
 
 	avb0_pins: avb0 {
@@ -170,6 +179,11 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	hscif2_pins: hscif2 {
+		groups = "hscif2_data", "hscif2_ctrl";
+		function = "hscif2";
+	};
+
 	i2c0_pins: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
@@ -190,6 +204,11 @@ scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
+
+	scif_clk2_pins: scif-clk2 {
+		groups = "scif_clk2";
+		function = "scif_clk2";
+	};
 };
 
 &rpc {
@@ -228,3 +247,7 @@ &rwdt {
 &scif_clk {
 	clock-frequency = <24000000>;
 };
+
+&scif_clk2 {
+	clock-frequency = <24000000>;
+};
-- 
2.34.1


