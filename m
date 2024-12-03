Return-Path: <linux-renesas-soc+bounces-10823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6399E19E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33A36161F74
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D011E2600;
	Tue,  3 Dec 2024 10:50:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252FE1DE4FD;
	Tue,  3 Dec 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223057; cv=none; b=K08W6HD4EnDjTRUyqXjOuOghZCTFoVtQw8wVzyEvQOPuEDpgzCs73+jpCHwjUl0/dCPaVekAwXqtiiyXXsrAn3u3h5+e/1VMcZNJFNinvasKwNooysdITHyzbbxevH9rZLcS5N1PpjqyrfTP5Kck1/flGOAr2KSjLdwv1a+eDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223057; c=relaxed/simple;
	bh=SAczOtyShWB7VFtkQ2ixtcmfUdisJH5FWg83dTyKaZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUdNBh6xPO6nqT8burBUG1Q+mgdnb06NBXZsQUjdfEKeSBheuXjBnoItw8JZHyvedpske5XkmjL6jYZUOeHcV80flpg4qVGD8ilvSpC2GGx460pDsFQBt6QFD94CR+0a0xLQzvAE8zr4xAZjU4uaeXB/7/qZp9X4UBDVOnxPlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: eg2b4tUjSWWG7j04KZB/xw==
X-CSE-MsgGUID: 3qS42FIeRxSgFNSqvgD5pA==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754429"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9B0424005E06;
	Tue,  3 Dec 2024 19:50:47 +0900 (JST)
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
Subject: [PATCH v2 11/13] arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
Date: Tue,  3 Dec 2024 10:49:38 +0000
Message-ID: <20241203105005.103927-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the RZ/G3E SMARC SoM with 4GB memory,
audio_extal, qextal and rtxin clks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
new file mode 100644
index 000000000000..c8cf61545a5f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R9A09G047E57 SMARC SoM board.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/ {
+	compatible = "renesas,rzg3e-smarc", "renesas,r9a09g047e57", "renesas,r9a09g047";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* First 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0xf8000000>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <48000000>;
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
-- 
2.43.0


