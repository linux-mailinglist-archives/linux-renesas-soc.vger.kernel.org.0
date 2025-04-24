Return-Path: <linux-renesas-soc+bounces-16284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74802A9A095
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 07:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C8F7AF80C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 05:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2400B1C8631;
	Thu, 24 Apr 2025 05:41:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D5A1A23B0;
	Thu, 24 Apr 2025 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473273; cv=none; b=m9+RJvDOKiPDe4vnXfS1mrIjy5aldk3TbvGvVbxsQtFs3kI5hFrfNAujHTaUE26C3K6DRXK5pSOayIp1VeK7PU9XKIAdF/7VbuZgj2oh5CGJHY78TztqYk4yaspf8oqm/iz3h50uStGHxFAgsEzA02bVWQV5UTvaX3NsTmMqzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473273; c=relaxed/simple;
	bh=0uCO1/IyXsJxdxSCsQbqXLLsooB0A+TxOL84PVSkYBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJCeYlSUAjPS2H4xFeM8rlrPdlLxXEfUamsGUEvO/Bq0w5PYAiXLSJmFnBM1RvEkwP24ia56inTMdMMmOwu5GPvZNR1LkShUe+A3UHI/ZtBPn5nlFPRYhT9A7IDOnjfHrbg9bh/BsGF4iXUELGPHWj4yijmRiq4RqZVYvs8iXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 9C16TnuYSF2BS48M7IXvqw==
X-CSE-MsgGUID: mxvtzuYFSLKwwneqiRFsjQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 14:41:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 960E34160629;
	Thu, 24 Apr 2025 14:41:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board
Date: Thu, 24 Apr 2025 06:40:46 +0100
Message-ID: <20250424054050.28310-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPT4 IOs are available on the carrier board's PMOD0 connector (J1).
Enable the GPT on the carrier board by adding the GPT pinmux and node on
the carrier board dtsi file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts        | 7 +++++++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts        | 7 +++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi             | 8 ++++++++
 4 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index 568d49cfe44a..b36749f94ccb 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -27,6 +27,13 @@
 #error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as PMOD_MTU3=0"
 #endif
 
+/*
+ * To enable the GPT pins GTIOC4A(PMOD0_PIN7) and GTIOC4B(PMOD0_PIN10) on the
+ * PMOD0 connector (J1), enable PMOD0_GPT by setting "#define PMOD0_GPT	1"
+ * below.
+ */
+#define PMOD0_GPT	0
+
 #include "r9a07g044l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc-pinfunction.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
index b3e6016880dd..43c456ffa63c 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
@@ -26,6 +26,13 @@
 #error "Cannot set 1 to MTU3_COUNTER_Z_PHASE_SIGNAL as PMOD_MTU3=0"
 #endif
 
+/*
+ * To enable the GPT pins GTIOC4A(PMOD0_PIN7) and GTIOC4B(PMOD0_PIN10) on the
+ * PMOD0 connector (J1), enable PMOD0_GPT by setting "#define PMOD0_GPT	1"
+ * below.
+ */
+#define PMOD0_GPT	0
+
 #include "r9a07g054l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc-pinfunction.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index e9f244c33d55..2616dbde4dd5 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -38,6 +38,11 @@ can1-stb-hog {
 		line-name = "can1_stb";
 	};
 
+	gpt_pins: gpt {
+		pinmux = <RZG2L_PORT_PINMUX(43, 0, 2)>, /* GTIOC4A */
+			 <RZG2L_PORT_PINMUX(43, 1, 2)>; /* GTIOC4B */
+	};
+
 	i2c0_pins: i2c0 {
 		pins = "RIIC0_SDA", "RIIC0_SCL";
 		input-enable;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 789f7b0b5ebc..b76b55e7f09d 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -104,6 +104,14 @@ codec_endpoint: endpoint {
 	};
 };
 
+#if PMOD0_GPT
+&gpt {
+	pinctrl-0 = <&gpt_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif /* PMOD0_GPT */
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
-- 
2.43.0


