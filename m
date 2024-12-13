Return-Path: <linux-renesas-soc+bounces-11315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 342ED9F1402
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 18:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95ED41889497
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFFE1E6311;
	Fri, 13 Dec 2024 17:39:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DE01E5713;
	Fri, 13 Dec 2024 17:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111574; cv=none; b=N3SzUBjSpPEMambEkfnEStH+UaFuzJh+pDXV0JLGOQumEhOhXBKSaQNOLK77pfGJomG+42Y8CO+/RUWZynZRsqffvCaI/6CHhWcqj6a8N9oOuIvmtTeaVzdyCoStpefUJRmSdg2wCKT2/tkWacAWfW7vuMrUrcsOxv1LcheU6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111574; c=relaxed/simple;
	bh=bxFb0855ZpFKiH/50oJC7pVLfu4RpabMlPcyF9/WWko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kv4f8V2RNcaH5H4S7GJiS3W5AN92agjAMVuxRiDkCcfMbrsxrsSjaps0haRI1Ofu2+Q0sNZUpzvlBeZdXtNYswU7kWSUjA3y0v2zxthj283TFOPXWHSyhdQsV82GZ/IyDx9vbsG5Ar9JigkCZuZba+0cwIZ3tpxv/zcYWhhuLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8ywrZXyzSgCdUzr/h4b81A==
X-CSE-MsgGUID: mD7gw2jbTrWzlfNF9eJhcw==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231774201"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2024 02:39:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3713C4009BF1;
	Sat, 14 Dec 2024 02:39:24 +0900 (JST)
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
Subject: [PATCH v3 6/7] arm64: dts: renesas: r9a09g047: Add pincontrol node
Date: Fri, 13 Dec 2024 17:38:52 +0000
Message-ID: <20241213173901.599226-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
References: <20241213173901.599226-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pincontrol node to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Updated gpio range from 176->232 to match the port number based
   on harware indices.
 * Added Rb tag from Geert.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 39a7cfb3095b..15711f9b6038 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -131,6 +131,19 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		pinctrl: pinctrl@10410000 {
+			compatible = "renesas,r9a09g047-pinctrl";
+			reg = <0 0x10410000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G047_IOTOP_0_SHCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 232>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			power-domains = <&cpg>;
+			resets = <&cpg 0xa5>, <&cpg 0xa6>;
+		};
+
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g047-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-- 
2.43.0


