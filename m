Return-Path: <linux-renesas-soc+bounces-10973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A229F9E5E0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 19:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213411885977
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 18:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0021226EDE;
	Thu,  5 Dec 2024 18:09:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB9F226EFD;
	Thu,  5 Dec 2024 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422194; cv=none; b=QKPA0rKKDBUJZ1skRN15qMqOu8UdZI8bB1sCfiv3h5BIue1V1cM+yHlLR79noopb35nY2N9OVolwQEbIUSFA6mmMJUTAVA4mjdB3VoSjBsaO5aXN/rWsMAUMvbi7UEIaoYLQUp/TtbK99ai85jsjX9K21kpVYhq8PItCb+/tFy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422194; c=relaxed/simple;
	bh=J1XJwTfP0PWVVWPjjqWOT9C0M9bptvkbZXlbxz+DSD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1LEXJmwV8/kgh7MICxTB9sdp+h7mL9gQWLkWht2/4MUx5sOLDnJtJrnFI3DZj5ogT1Vw5RUbujuSsP2sVhYr+Q6cv050HdttGEFRcaSrO9ILgEUyZPkk7Qiqyl2J7WU4Gi3cQl73ESTZooF0KNliZKPUS+7QTC3wAnIYH7DjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: S6X21PWbRiqwoHBEuBKEbA==
X-CSE-MsgGUID: VqmtKijzT8atHFjL1cG5Dw==
X-IronPort-AV: E=Sophos;i="6.12,211,1728918000"; 
   d="scan'208";a="231007754"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2024 03:09:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.141])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 80CC44048AC7;
	Fri,  6 Dec 2024 03:09:37 +0900 (JST)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add pincontrol node
Date: Thu,  5 Dec 2024 18:09:19 +0000
Message-ID: <20241205180924.154715-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
References: <20241205180924.154715-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pincontrol node to RZ/G3E ("R9A09G047") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 39a7cfb3095b..17bc95fb111f 100644
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
+			gpio-ranges = <&pinctrl 0 0 176>;
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


