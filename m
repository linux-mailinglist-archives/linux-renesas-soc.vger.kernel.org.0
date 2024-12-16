Return-Path: <linux-renesas-soc+bounces-11418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CFF9F3A4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 20:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D5B164FC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 19:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD1B20CCD1;
	Mon, 16 Dec 2024 19:53:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3AA20C48E;
	Mon, 16 Dec 2024 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378839; cv=none; b=mNJQo1JcWlPcCjT4VMJLgxqEnuZS0kZD8lGSrEX0PRqCcq/rdAqkduB9RRTnBFuKVMsbeZCYkpIQeVpcxZJ6CCNMk/ZZVRI5ci79OVX/f32COlLEzDT/IoESCXVJo9+qfHdat7/HfPeodFK7lER1HXIq2t7xFByrkJw4vYkk3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378839; c=relaxed/simple;
	bh=l3SKUf0RRPZ3LhobSN4pIoLTWc57kHCXHqkdAciGug0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDkSjiT98IEiVqaR6nlmVJwdK2HfzTsodnIAwLkPY4eawg6UNUIls37d12+eEU5VIc1jiIB4ZMOFmwqgrzVPMgMPbfgx2kOi0VNH0lMbgdWiREXEd3HeyAcU1CMy/65ZPBodrDT9bNyFeTTiW859nudxp6MDhCQqQvu3D3UwFcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: UCZ1kcWWR52Q22Q6W/MqFQ==
X-CSE-MsgGUID: qy/dkMH6TYeRF/G5Srz5Eg==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="228014632"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 830A140638D2;
	Tue, 17 Dec 2024 04:53:48 +0900 (JST)
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
Subject: [PATCH v4 6/7] arm64: dts: renesas: r9a09g047: Add pincontrol node
Date: Mon, 16 Dec 2024 19:53:16 +0000
Message-ID: <20241216195325.164212-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pincontrol node to RZ/G3E ("R9A09G047") SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No Change.
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


