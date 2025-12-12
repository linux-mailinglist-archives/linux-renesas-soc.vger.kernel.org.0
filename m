Return-Path: <linux-renesas-soc+bounces-25721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23067CB9C7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0799630ACE94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9102D4811;
	Fri, 12 Dec 2025 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpvygYdb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD82C236D;
	Fri, 12 Dec 2025 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571582; cv=none; b=AeqYd3Xhe6musuIwzcF7Yizba5n4t1JoMJVNpmOdS6XiDxDb47WFsgZNlrnOY04WOErgYKWOmVyN3qK3MA5n8MfJBZ4DUofDm9M2DJdM+BrEF9Jrgu2vfWWDtmj2IVThctk/vNvhVlBUkvxdOPWyLhuTvN3NHE0anHwsR70Lpag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571582; c=relaxed/simple;
	bh=oXV52+EBwnwQgsf4JQISAFcL+Q5wlGyp41ZRqonHpZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVhxV3gzTjKnDZp16/pP86uVvP5V9UK3WdpcR017oJdbIpuH32PVApeoxkv1FM5PzTLVqV27i2Z5XYtUrnUNAsbyprLq8JSejE3mwLV9LTiDioXXgpjNp4lp2FQH8+a7IWsdBTvAN9ITTaKfpyUY8cYRdX5mjYrTU25wmOCJ5jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpvygYdb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D849DC4CEF1;
	Fri, 12 Dec 2025 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571582;
	bh=oXV52+EBwnwQgsf4JQISAFcL+Q5wlGyp41ZRqonHpZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=KpvygYdbl+4QNc5B0uRSQKkrD3fQ8etfSezmQ9uT3E2yv1THLQROJFd6eavFCHURo
	 xX0+3Wdd/mbarggr2WfdhfVIfznhmevgSradqiJrVjX4oATKIeQpOidzJxWfYX9UMj
	 mvSRtL8QntugInpc1el8zgQfBM4jRQE3rjSZj38S6XHrdT28tifFqrTWrk+K4xbxZX
	 5nKqVWjr+g6ZSc5MEPMJTzz39ERSfNQ3UnXiSbDQ2D5/EWhTKYTYPhFDVDJ89u5xok
	 tTS1nIt0485bFcHL0AGVHkTEPjIwH7xF6ygRuyHdLliBze4vkI45jOn8PGJ1ziiTDC
	 SMAmkG1Od/Yjg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: st: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:09 -0600
Message-ID: <20251212203226.458694-3-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These .dtsi files are not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/st/spear320s.dtsi           | 24 -------
 .../boot/dts/st/stm32mp15xxab-pinctrl.dtsi    | 57 ---------------
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi    | 63 ----------------
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |  8 ---
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |  8 ---
 .../boot/dts/st/stm32mp25xxal-pinctrl.dtsi    | 71 -------------------
 7 files changed, 239 deletions(-)
 delete mode 100644 arch/arm/boot/dts/st/spear320s.dtsi
 delete mode 100644 arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp21xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 delete mode 100644 arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi

diff --git a/arch/arm/boot/dts/st/spear320s.dtsi b/arch/arm/boot/dts/st/spear320s.dtsi
deleted file mode 100644
index 133236dc190d..000000000000
--- a/arch/arm/boot/dts/st/spear320s.dtsi
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * DTS file for SPEAr320s SoC
- *
- * Copyright 2021 Herve Codina <herve.codina@bootlin.com>
- */
-
-/include/ "spear320.dtsi"
-
-/ {
-	ahb {
-		apb {
-			gpiopinctrl: gpio@b3000000 {
-				/*
-				 * The "RM0321 SPEAr320s address and map
-				 * registers" document mentions interrupt 6
-				 * (NPGIO_INTR) for the PL_GPIO interrupt.
-				 */
-				interrupts = <6>;
-				interrupt-parent = <&shirq>;
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
deleted file mode 100644
index 328dad140e9b..000000000000
--- a/arch/arm/boot/dts/st/stm32mp15xxab-pinctrl.dtsi
+++ /dev/null
@@ -1,57 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AB>;
-
-	gpioa: gpio@50002000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@50003000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@50004000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 32 16>;
-	};
-
-	gpiod: gpio@50005000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@50006000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@50007000 {
-		status = "okay";
-		ngpios = <6>;
-		gpio-ranges = <&pinctrl 6 86 6>;
-	};
-
-	gpiog: gpio@50008000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl 6 102 10>;
-	};
-
-	gpioh: gpio@50009000 {
-		status = "okay";
-		ngpios = <2>;
-		gpio-ranges = <&pinctrl 0 112 2>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
deleted file mode 100644
index 929bdcd45d02..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
- */
-
-#include "msm8996.dtsi"
-
-/ {
-	qcom,msm-id = <246 0x30000>;
-};
-
- /*
-  * This revision seems to have differ GPU CPR
-  * parameters, GPU frequencies and some differences
-  * when it comes to voltage delivery to.. once again
-  * the GPU. Funnily enough, it's simpler to make it an
-  * overlay on top of 3.1 (the final one) than vice versa.
-  * The differences will show here as more and more
-  * features get enabled upstream.
-  */
-
-gpu_opp_table_3_0: opp-table-gpu30 {
-	compatible = "operating-points-v2";
-
-	opp-624000000 {
-		opp-hz = /bits/ 64 <624000000>;
-		opp-level = <7>;
-	};
-
-	opp-560000000 {
-		opp-hz = /bits/ 64 <560000000>;
-		opp-level = <6>;
-	};
-
-	opp-510000000 {
-		opp-hz = /bits/ 64 <510000000>;
-		opp-level = <5>;
-	};
-
-	opp-401800000 {
-		opp-hz = /bits/ 64 <401800000>;
-		opp-level = <4>;
-	};
-
-	opp-315000000 {
-		opp-hz = /bits/ 64 <315000000>;
-		opp-level = <3>;
-	};
-
-	opp-214000000 {
-		opp-hz = /bits/ 64 <214000000>;
-		opp-level = <3>;
-	};
-
-	opp-133000000 {
-		opp-hz = /bits/ 64 <133000000>;
-		opp-level = <3>;
-	};
-};
-
-&gpu {
-	operating-points-v2 = <&gpu_opp_table_3_0>;
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi b/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
deleted file mode 100644
index e33b00b424e1..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
deleted file mode 100644
index 5e83a6926485..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-/ {
-};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
deleted file mode 100644
index 2406e972554c..000000000000
--- a/arch/arm64/boot/dts/st/stm32mp25xxal-pinctrl.dtsi
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
-/*
- * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
- * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
- */
-
-&pinctrl {
-	st,package = <STM32MP_PKG_AL>;
-
-	gpioa: gpio@44240000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 0 16>;
-	};
-
-	gpiob: gpio@44250000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 16 16>;
-	};
-
-	gpioc: gpio@44260000 {
-		status = "okay";
-		ngpios = <14>;
-		gpio-ranges = <&pinctrl 0 32 14>;
-	};
-
-	gpiod: gpio@44270000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 48 16>;
-	};
-
-	gpioe: gpio@44280000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 64 16>;
-	};
-
-	gpiof: gpio@44290000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 80 16>;
-	};
-
-	gpiog: gpio@442a0000 {
-		status = "okay";
-		ngpios = <16>;
-		gpio-ranges = <&pinctrl 0 96 16>;
-	};
-
-	gpioh: gpio@442b0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 2 114 12>;
-	};
-
-	gpioi: gpio@442c0000 {
-		status = "okay";
-		ngpios = <12>;
-		gpio-ranges = <&pinctrl 0 128 12>;
-	};
-};
-
-&pinctrl_z {
-	gpioz: gpio@46200000 {
-		status = "okay";
-		ngpios = <10>;
-		gpio-ranges = <&pinctrl_z 0 400 10>;
-	};
-};
-- 
2.51.0


