Return-Path: <linux-renesas-soc+bounces-9452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA80990A2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 19:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ABA1C222F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 17:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A9D50A63;
	Fri,  4 Oct 2024 17:32:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85901D9A56;
	Fri,  4 Oct 2024 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728063176; cv=none; b=qSFDYXtOo+5yvMEZ0GC/lbeOS0B2KM0h1qK3SEP84Z1u0vQu5pHH4HYRUtqzMOFhfa3+XCL44flKbF9l5ZUewyNQcYQyRk8sCeGumHWSAM1n/mpGZzFg9UpLV7ZNCMv8y8LIX8EughvwIYxnWlRn4yR+YGpeoEjhcAVBu/p2lfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728063176; c=relaxed/simple;
	bh=e8w3JolVMNRV6NE2b5/n3MDrA7ieZG/Fvmzf8oOeAPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVKZYGCURR2FL9ZehKTLiPlvUUodE9+MNgkysJELyUQsMhLRHrxISMzMHNPSSOiu+BrYK4cwhqjKOsiFUFyxA+0TtGyaGb+mni6g1pKGUor6Kitq6v5kTLRWEW6QdhZPxtnre5Smj3mIOPjC73LOAB/8XVqTK2oVl//VHuHMw3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,178,1725289200"; 
   d="scan'208";a="220831328"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Oct 2024 02:32:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4FBC7403136C;
	Sat,  5 Oct 2024 02:32:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 2/2] arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash
Date: Fri,  4 Oct 2024 18:32:32 +0100
Message-ID: <20241004173235.74307-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
References: <20241004173235.74307-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * Updated bl2 size to 0x1d000
v4:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi  | 15 +++++++++++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi | 15 +++++++++++----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 83f5642d0d35..434252a8c0a5 100644
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
+				reg = <0x00000000 0x0001d000>;
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
index b4ef5ea8a9e3..1255034acc3b 100644
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
+				reg = <0x00000000 0x0001d000>;
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


