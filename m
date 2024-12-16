Return-Path: <linux-renesas-soc+bounces-11416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADA9F3A51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 20:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1EC9188AE05
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 19:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705820CCE4;
	Mon, 16 Dec 2024 19:53:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C7720CCDA;
	Mon, 16 Dec 2024 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378837; cv=none; b=SuhD8SwiWUh257MKtyCeM9mJ6qHlGKbzOlhp+tlyVXPRXQ9Zmh/Gjpuoh64tm0ADalrQRsNFg9bJ4w21SM9JArDcBpidELNf4Chl+FPPruEQeMELHuAwcKIXdjFVHEQE6Hli7U5VZwG4SqeB5ps4WkrXfBtrF49LON3nO2sKjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378837; c=relaxed/simple;
	bh=pHeIEhZAHw7VKa55xxkHFt9tcdb7RAb0E4BBWmx2CPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZJAPgfZeD50myZC/cnUynr2qVZ+5w43J2DF7d/nuIFuhEsQVUrOtp/1TDH8re9/5ue+mkvxUcts8tLnX06hKMPZFZq9aRyPql8VSaKCNwyQC0FhOR342jwx+4FQWK3CwnE8r99QTWmXgh+fHO4Rm9OfVqwIKaSv/1rVrQZcZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: HbUEFUjxRAuSpREfU8r66w==
X-CSE-MsgGUID: tOFAO9RwTliMoeIRQTUpOQ==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="228014628"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EF80240638D0;
	Tue, 17 Dec 2024 04:53:51 +0900 (JST)
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
Subject: [PATCH v4 7/7] arm64: dts: renesas: r9a09g047: Add scif pincontrol
Date: Mon, 16 Dec 2024 19:53:17 +0000
Message-ID: <20241216195325.164212-8-biju.das.jz@bp.renesas.com>
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

Add device node for scif pincontrol.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Replaced rzg2l-pinctrl.h->renesas,r9a09g047-pinctrl.h header file.
 * Retained Rb tag.
v2->v3:
 * Added Rb tag from Geert.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index d4d61bd03969..c063d47e2952 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
 #include "r9a09g047e57.dtsi"
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
@@ -16,3 +17,15 @@ / {
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
 };
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0


