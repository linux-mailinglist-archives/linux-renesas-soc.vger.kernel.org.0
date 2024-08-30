Return-Path: <linux-renesas-soc+bounces-8572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28616966A87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 22:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B84E1C22483
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 20:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D401BBBD8;
	Fri, 30 Aug 2024 20:30:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8836A15B117;
	Fri, 30 Aug 2024 20:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049833; cv=none; b=AKXfwm71Ky/Z4slaxAy2c6ugIMaguhPXbd/aZFfz25qHe3jQbnz/YOLNdaR+oxUpNIdaF9kNEpeSQN3fwBWh86YygkMEF3xbwsL7W16hhL25+J82LRZaO1PNYXFHpHdjfVHgGoHVRSCop6fYi5nApLjgTUiA69SAD+lfI2vvA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049833; c=relaxed/simple;
	bh=8f0bijmA+PtX3TBhXvCIH+gICe2ZayqNuVrLlZTqF7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCk0zN9SqIbs7OE5sUoudzrk0LwbTN4OwGCj6pRCPgFNPTasSZSeRfv9L20b5lXTjtbQ7ZK1ayqVp9KlZJ/6fJwGbrwJsXq7tWFMthnJvherBeesYf2mKF7WEbrZIok71d4l4ljQUvYeleRfDcwbGtCbedlzsy9izDoo8dJBtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,189,1719846000"; 
   d="scan'208";a="217084534"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Aug 2024 05:30:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.75])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2FCA8406DF57;
	Sat, 31 Aug 2024 05:30:26 +0900 (JST)
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
Subject: [PATCH v2 RESEND 3/3] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash
Date: Fri, 30 Aug 2024 21:30:05 +0100
Message-ID: <20240830203014.199326-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
References: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update partition table for spi-nor flash, so that we can flash bootloaders
in Linux by executing the below commands:
flash_erase /dev/mtd0  0 0
flash_erase /dev/mtd1  0 0
mtd_debug write /dev/mtd0 0 ${BL2_FILE_SIZE} ${BL2_IMAGE}
mtd_debug write /dev/mtd1 512 ${FIP_FILE_SIZE} ${FIP_IMAGE}

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v2 resend:
 * Rebased to next
v2:
 New patch.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi  | 15 +++++++++++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 15 +++++++++++----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 83f5642d0d35..61297993fcb0 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -341,11 +341,18 @@ partitions {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			boot@0 {
-				reg = <0x00000000 0x2000000>;
-				read-only;
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x0001c000>;
 			};
-			user@2000000 {
+
+			partition@1d000 { /* fip is at offset 0x200 */
+				label = "fip";
+				reg = <0x0001d000 0x1fe3000>;
+			};
+
+			partition@2000000 {
+				label = "user";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index b4ef5ea8a9e3..2bf7c506d543 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -259,11 +259,18 @@ partitions {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			boot@0 {
-				reg = <0x00000000 0x2000000>;
-				read-only;
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x0001c000>;
 			};
-			user@2000000 {
+
+			partition@1d000 { /* fip is at offset 0x200 */
+				label = "fip";
+				reg = <0x0001d000 0x1fe3000>;
+			};
+
+			partition@2000000 {
+				label = "user";
 				reg = <0x2000000 0x2000000>;
 			};
 		};
-- 
2.43.0


