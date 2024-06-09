Return-Path: <linux-renesas-soc+bounces-5977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF5901559
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 11:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33971F21679
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Jun 2024 09:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1B51CD3C;
	Sun,  9 Jun 2024 09:51:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8375A1804E;
	Sun,  9 Jun 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717926666; cv=none; b=tO8Y76Zdxhr+FSfadpavBXkDxKI06raRKAgr+IkI4cuQm26/q8cUAAlooOsJlTa2KG9CXvWwGtbHd6sgZUvawcos1puDC5ufbym44IzQFqNK5Dvzj2XlQclXJdlVgcGynUNnaZTr6bFCjGQNjHn4ZoAcrmXo0KikzWy44on4DtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717926666; c=relaxed/simple;
	bh=6Xkm7YiviFoJoemsAi5czJ/Al54+zJfurW20sYufMY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ffpj3W69cN1rJ/0RxeWPDyf60LYlfdBovjXhm64q5wcO+7X0lxN7CXoV3GxM0n9irj0/HTSHJibPwI4YyXZqAXgTp8U6CIuHyKDdsLfBNcNrlliHuH7nloOkqAhPcwl3T8EyXVWPtPQJ+uAD2I8+8m7SjdvleVcbuFeSey3Q9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,225,1712588400"; 
   d="scan'208";a="207203928"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jun 2024 18:50:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8EBE241BA293;
	Sun,  9 Jun 2024 18:50:52 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] arm64: dts: renesas: r9a07g0{43,44,54}: Drop #address-cells/#size-cells from single child node 'endpoint@0'
Date: Sun,  9 Jun 2024 10:50:49 +0100
Message-Id: <20240609095049.17193-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the below dtcheck_warnings reported by kernel test robot.

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:85.11-94.6: Warning
>> (graph_child_address): /soc/video@10830000/ports/port@1: graph node
>> has single child node 'endpoint@0', #address-cells/#size-cells are
>> not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:120.11-129.6: Warning
>> (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node
>> has single child node 'endpoint@0', #address-cells/#size-cells are
>> not necessary

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406081329.snoMrZsJ-lkp@intel.com
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 12 ++----------
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi  | 17 +++--------------
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi  | 18 +++---------------
 3 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 165bfcfef3bc..e6a30a669c37 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -79,12 +79,8 @@ ports {
 			#size-cells = <0>;
 
 			port@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				reg = <1>;
-				crucsi2: endpoint@0 {
-					reg = <0>;
+				crucsi2: endpoint {
 					remote-endpoint = <&csi2cru>;
 				};
 			};
@@ -114,12 +110,8 @@ port@0 {
 			};
 
 			port@1 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <1>;
-
-				csi2cru: endpoint@0 {
-					reg = <0>;
+				csi2cru: endpoint {
 					remote-endpoint = <&crucsi2>;
 				};
 			};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 88634ae43287..6a5496dbb05a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -710,22 +710,14 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
 					reg = <0>;
-					cruparallel: endpoint@0 {
-						reg = <0>;
+					cruparallel: endpoint {
 					};
 				};
 
 				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
 					reg = <1>;
-					crucsi2: endpoint@0 {
-						reg = <0>;
+					crucsi2: endpoint {
 						remote-endpoint = <&csi2cru>;
 					};
 				};
@@ -755,12 +747,9 @@ port@0 {
 				};
 
 				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
 					reg = <1>;
 
-					csi2cru: endpoint@0 {
-						reg = <0>;
+					csi2cru: endpoint {
 						remote-endpoint = <&crucsi2>;
 					};
 				};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index e89bfe4085f5..f37034d136b2 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -715,22 +715,14 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
 					reg = <0>;
-					cruparallel: endpoint@0 {
-						reg = <0>;
+					cruparallel: endpoint {
 					};
 				};
 
 				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-
 					reg = <1>;
-					crucsi2: endpoint@0 {
-						reg = <0>;
+					crucsi2: endpoint {
 						remote-endpoint = <&csi2cru>;
 					};
 				};
@@ -760,12 +752,8 @@ port@0 {
 				};
 
 				port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
 					reg = <1>;
-
-					csi2cru: endpoint@0 {
-						reg = <0>;
+					csi2cru: endpoint {
 						remote-endpoint = <&crucsi2>;
 					};
 				};
-- 
2.25.1


