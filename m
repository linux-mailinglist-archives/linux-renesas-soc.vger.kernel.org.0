Return-Path: <linux-renesas-soc+bounces-8595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F736967BCD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Sep 2024 20:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80C2A1C211D4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 Sep 2024 18:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CDF50269;
	Sun,  1 Sep 2024 18:34:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E5C5466B;
	Sun,  1 Sep 2024 18:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725215686; cv=none; b=XkCK4Y2sK8NQyPC/ejedkdppHKivhuzRhGcq34VsFgdVEwDOomxYLDZwOX1nv+72+OPV7d9/ukoRJQrYMtCKC9gGTKlHrOvk8gNN2QAFUu5PJBaSc/kJzJZwTpixMj0LioYRqhPsnHfBFvoaqvJ4CbWOvUikyaXnB1xrV+WHICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725215686; c=relaxed/simple;
	bh=hgjTumKpvn22Mt4/yMiGeVtGASaad9OShkJuFnPJGBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKrMfb6nlSsEh9OKB8fXN0Xj6C/W/T2qEyLMSCu4YP21PG7wSmGmUs4w9xRHDm5JZ3Wf/m6CEc5I+6pCFP3oJHEgi0E7Wh2Lg7RPvc6mtthGy/QcUqoveqSheZxpsg9Y9OKRfTR/XuMfpIFO2XjRkF9/NS65W8yi3nVJItMCIb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,194,1719846000"; 
   d="scan'208";a="217187984"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Sep 2024 03:34:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.9])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5228B40065B0;
	Mon,  2 Sep 2024 03:34:35 +0900 (JST)
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
Subject: [PATCH v4 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash
Date: Sun,  1 Sep 2024 19:34:18 +0100
Message-ID: <20240901183422.31600-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240901183422.31600-1-biju.das.jz@bp.renesas.com>
References: <20240901183422.31600-1-biju.das.jz@bp.renesas.com>
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
v4:
 * New patch.
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


