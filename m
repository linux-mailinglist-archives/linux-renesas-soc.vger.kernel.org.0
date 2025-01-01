Return-Path: <linux-renesas-soc+bounces-11757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC8B9FF491
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 17:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2677C3A2881
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jan 2025 16:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553DF1E1C33;
	Wed,  1 Jan 2025 16:34:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FCD1854;
	Wed,  1 Jan 2025 16:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735749272; cv=none; b=kWcZjYWFOPVzUUOPWApxkcmCVrPT0HgVP76dHB1lxMo44H4Ewgp1mdX5EghBYwi1U4mw5fUlHmprSS79ZYoSphUpdGKrR/1sEbBhzDOflsLwFP12s59M2o8dHrco0D5pwCD+T1F1IxVtMe2sN8oUPYQL2J0xQVOuQ9dP/zGe7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735749272; c=relaxed/simple;
	bh=W/e4htr/3OTwn1h55S4V1UPq/N97BFKGOw5vRfOg+ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BusBzpqDrGUxDtmE9TwFe9qmYwZ8jT7mWrd5tboxNSI41goDWDfzmH8HvbmCu/YaUSf1P699l5bKmlhp66Wn6TfzhifuLy9mUyB6BRQuSOF+0Ls9osSgqVdg18Lsg4r/Bu+z3SZcpG/K2hqJJRsQRxlNZon6d1BXTLyVjViVuhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VFhNedirSpavQdxJM9ervw==
X-CSE-MsgGUID: 9j0ecfesTDKGDRTA3b15aA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jan 2025 01:34:29 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 638884026B1F;
	Thu,  2 Jan 2025 01:34:19 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Subject: [PATCH v2 4/4] arm64: dts: renesas: r9a09g047: add sys node
Date: Wed,  1 Jan 2025 17:33:44 +0100
Message-ID: <20250101163344.128139-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20250101163344.128139-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add system controller node to RZ/G3E (R9A09G047) SoC DTSI.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index b73daf43683f..e87521cf9a0b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -162,6 +162,13 @@ cpg: clock-controller@10420000 {
 			#power-domain-cells = <0>;
 		};
 
+		sys: system-controller@10430000 {
+			compatible = "renesas,r9a09g047-sys";
+			reg = <0 0x10430000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
+			resets = <&cpg 0x30>;
+		};
+
 		ostm0: timer@11800000 {
 			compatible = "renesas,r9a09g047-ostm", "renesas,ostm";
 			reg = <0x0 0x11800000 0x0 0x1000>;
-- 
2.25.1


