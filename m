Return-Path: <linux-renesas-soc+bounces-7350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5763931662
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 16:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CAD31F210BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 14:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAAC18E762;
	Mon, 15 Jul 2024 14:07:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947A5433B3;
	Mon, 15 Jul 2024 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721052435; cv=none; b=OVt/yg8CUiFaKphkkrzXACQmAc8JPuAJkYOCfe95AgP+zsO5smRVqcOhn4A8NP+fHrArQB9rPhnCQ8tMk/qJnKo/ZsUzaqK4BVfQLFTbgkGfNJS3ku3nhJJbft/Cc7FC1l6CQriJ8dtENEsYUd75HJOI+V3OsGN9ftc1y3GsG2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721052435; c=relaxed/simple;
	bh=kFO6Vf374RyCJl6rEOZ7v7zLwd0bjY4CJE3dt7/EYUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8S0Up8Ied28lLBJqNMwGlTwenivICeicVV+b8Tn941R+x22u0E8l/W4WJpL9vDdtmkY072okSIBLgdoqftWpXkpRQkbrNcH1Kz0/9oZfIoZN4ZYBeUaAQiVlDbNR/r8t1q37KCywCWHsTnRawwAEUyY9vsfOggLj8yeHnqIy3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,210,1716217200"; 
   d="scan'208";a="211379544"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jul 2024 23:07:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 19971435D826;
	Mon, 15 Jul 2024 23:07:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: r9a07g0{43,44,54}: Move regulator-vbus device node
Date: Mon, 15 Jul 2024 15:07:03 +0100
Message-ID: <20240715140705.334183-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move regulator-vbus device node from common to the usbphy-ctrl device node
of the individual SoC dtsi's as it embeds the vbus regulator.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi       | 4 ++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi       | 4 ++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi       | 4 ++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi | 3 ---
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 2eccab9c8962..593c66b27ad1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -725,6 +725,10 @@ phyrst: usbphy-ctrl@11c40000 {
 			power-domains = <&cpg>;
 			#reset-cells = <1>;
 			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus";
+			};
 		};
 
 		ohci0: usb@11c50000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index d3838e5820fc..47a671661142 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1129,6 +1129,10 @@ phyrst: usbphy-ctrl@11c40000 {
 			power-domains = <&cpg>;
 			#reset-cells = <1>;
 			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus";
+			};
 		};
 
 		ohci0: usb@11c50000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 1de2e5f0917d..0aace8427be3 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1137,6 +1137,10 @@ phyrst: usbphy-ctrl@11c40000 {
 			power-domains = <&cpg>;
 			#reset-cells = <1>;
 			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus";
+			};
 		};
 
 		ohci0: usb@11c50000 {
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index b34855956ae0..63fa5cf1061b 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -131,9 +131,6 @@ &ohci1 {
 
 &phyrst {
 	status = "okay";
-	usb0_vbus_otg: regulator-vbus {
-		regulator-name = "vbus";
-	};
 };
 
 &scif0 {
-- 
2.43.0


