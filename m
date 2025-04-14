Return-Path: <linux-renesas-soc+bounces-15905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1FA87EC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54D1C1778D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 11:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5882D1F75;
	Mon, 14 Apr 2025 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cDvzK6Ou"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7B2D1F76
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629166; cv=none; b=pUNZrZzeRpxvJU7yOKv0muxfMkEw9MVDY45v/6XT0ZAY0eyeacwXjms3BuqfZomd0nBKnOHfPKbOvag/13JzsLTbPZoAgeVc94Pc2SlaeOei+D03s8JPPbiEm6oqyb0nyjshO5W9Dj7T6lzDPiWvd15Z1pq1jWBaqnEUh/PlKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629166; c=relaxed/simple;
	bh=BLUuQBI2rjIEjiV44qckHLkMPmjJGzDu57PnVOTf4vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h60uo1Ifh9mFTs3inxh0ijHe26EVyWa4GttF/O43OT/cTQmEsnENmWP5Eafvqu4tb+dVpOPg8fdVrDdvI+hJtcn+SSCDO5uiFph6LVGapEy8JxyslGYMc3dl/QA4n9UtYP1zQfsfKuqRgrTPvF4KqptFwvvpk6Fg9w45pkD5A2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cDvzK6Ou; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1D8uzMqHicxqUE8ZVL+Xwbzv5ws9usqqzZDyzyn8ZAU=; b=cDvzK6
	Ou2dv1eOoW4GK72nFFzNs+m79GIp6vhNj2nD9rFG3tDe1QfkfgvsorCDqrCqRhYy
	pi9TfLoe+6jmeeAdnPwo0NU63ugy6RFh1vk3klDsA+VDPo38VKJPnThvUDeYyRm3
	H7+KBQtP3VktraayKgeYAcTcDRdKgn0w+wqAErcMhTMtM5aNQM/4khzJ4gKQMt6O
	k/zL/shMtfO3fQuurHHtKoyLnZdiOEZ6WkMBrB3Kxde/kVAEou+baqZNOgSvdzP2
	CQIu70PQtTQqYOPmRlGg+55CoHJ0iv6e8Zub+qlU+0ijNHdnVBQvOML3NNNkZQTf
	37ACOMwwaH/J+GdA==
Received: (qmail 2268526 invoked from network); 14 Apr 2025 13:12:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Apr 2025 13:12:39 +0200
X-UD-Smtp-Session: l3s3148p1@2nVEIbsydJoujnth
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/2] ARM: dts: renesas: r9a06g032: rename uart port labels
Date: Mon, 14 Apr 2025 13:12:19 +0200
Message-ID: <20250414111218.7641-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
References: <20250414111218.7641-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the documentation and schematics, UARTs are counted from '1' not '0'.
Rename the labels accordingly, otherwise it is too easy to get confused
with eight UARTs available.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/r9a06g032-rzn1d400-db.dts   |  4 ++--
 arch/arm/boot/dts/renesas/r9a06g032.dtsi         | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 322e4c95ad3d..fef40e288679 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -24,7 +24,7 @@ chosen {
 	};
 
 	aliases {
-		serial0 = &uart0;
+		serial0 = &uart1;
 	};
 
 	keyboard {
@@ -278,7 +278,7 @@ &switch_port4 {
 	status = "okay";
 };
 
-&uart0 {
+&uart1 {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 80ad1fdc77a0..b71c5483545a 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -170,7 +170,7 @@ usb@2,0 {
 			};
 		};
 
-		uart0: serial@40060000 {
+		uart1: serial@40060000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40060000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -181,7 +181,7 @@ uart0: serial@40060000 {
 			status = "disabled";
 		};
 
-		uart1: serial@40061000 {
+		uart2: serial@40061000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40061000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -192,7 +192,7 @@ uart1: serial@40061000 {
 			status = "disabled";
 		};
 
-		uart2: serial@40062000 {
+		uart3: serial@40062000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40062000 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -203,7 +203,7 @@ uart2: serial@40062000 {
 			status = "disabled";
 		};
 
-		uart3: serial@50000000 {
+		uart4: serial@50000000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x50000000 0x400>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -216,7 +216,7 @@ uart3: serial@50000000 {
 			status = "disabled";
 		};
 
-		uart4: serial@50001000 {
+		uart5: serial@50001000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x50001000 0x400>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
@@ -229,7 +229,7 @@ uart4: serial@50001000 {
 			status = "disabled";
 		};
 
-		uart5: serial@50002000 {
+		uart6: serial@50002000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x50002000 0x400>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
@@ -242,7 +242,7 @@ uart5: serial@50002000 {
 			status = "disabled";
 		};
 
-		uart6: serial@50003000 {
+		uart7: serial@50003000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x50003000 0x400>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
@@ -255,7 +255,7 @@ uart6: serial@50003000 {
 			status = "disabled";
 		};
 
-		uart7: serial@50004000 {
+		uart8: serial@50004000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x50004000 0x400>;
 			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.47.2


