Return-Path: <linux-renesas-soc+bounces-25720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497FCB9C69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3027E3050BAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F462D063C;
	Fri, 12 Dec 2025 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqjlCTev"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD281299AAA;
	Fri, 12 Dec 2025 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571578; cv=none; b=UsC0ic4DDHeHn+9iViOtTDn/dnbe9x8SUIvMK4krnT/x49Ks/tzQzv8Pgnal3N472l5sVzNws08eQ5+ny1WffeY+WiMFMuXpEWNDAGhZChdUnq49CSV6xYKJty4NkuDsO/RNwrOL7zbeaiQfXmtVxJtTlYKGLYnKizQMAl0j0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571578; c=relaxed/simple;
	bh=fqhKuRpghn5B15KRjICcHBVuyPlNdJgYT2mf9hF3TJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3mRNPfDHIjtGuNbR1aitGWRXlOxZN4uagm7cuKmuaX2x3xf7UOV0fPTQDv49w/ko+q83a1KRBJ2Y5ekmOZulxaq9WCbfn9XQ874efgGTF3Gha6njHfxhRKH9iDINcoU/PYJFPxuXnJMwJLxrim93GF9rLHQl/cPpntM+Xzvo18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqjlCTev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FB8C16AAE;
	Fri, 12 Dec 2025 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571578;
	bh=fqhKuRpghn5B15KRjICcHBVuyPlNdJgYT2mf9hF3TJM=;
	h=From:To:Cc:Subject:Date:From;
	b=fqjlCTevEhy4a8HczP7A/cI8M2p8S8oG4M1EHHiapvFj0j3+5sfJMV8GZMIL1LjKa
	 Z6wBXOSUfn3K8LUXB8qJd8AFhJ5+xE2B7DSTEc4GJO7li+iPFmnXXUr6xCE8+tPZRM
	 coTNFdDm/acbq8z1bn+rkMgi91979Z9qcixwiR+Wbp8VcmvLQu5YE5tBvjLdefh5hT
	 tWXqknaTjc/cq2I/jeuOB7BcFDGD+2jJwsnkwwbUxBsVn4HW+Qo8Q5iMxW9HmKSxny
	 Y8MIqXRbkXzUliRy4iHrMXy88Ym3zltIo1hEdy8WYZcl7uJdEMcf/wO5iJOZXR+AVS
	 rhEp4vY8HaFNw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
Date: Fri, 12 Dec 2025 14:32:08 -0600
Message-ID: <20251212203226.458694-2-robh@kernel.org>
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
 .../boot/dts/qcom/qcom-ipq8062-smb208.dtsi    | 37 -------------------
 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi      |  8 ----
 .../boot/dts/qcom/qcom-ipq8064-smb208.dtsi    | 37 -------------------
 .../dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi    | 37 -------------------
 .../boot/dts/qcom/qcom-ipq8065-smb208.dtsi    | 37 -------------------
 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi      |  8 ----
 6 files changed, 164 deletions(-)
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
 delete mode 100644 arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
deleted file mode 100644
index 9d06255104c7..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8062-smb208.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include "qcom-ipq8062.dtsi"
-
-&rpm {
-	smb208_regulators: regulators {
-		compatible = "qcom,rpm-smb208-regulators";
-
-		smb208_s1a: s1a {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s1b: s1b {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2a: s2a {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2b: s2b {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
deleted file mode 100644
index 5d3ebd3e2e51..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8062.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include "qcom-ipq8064-v2.0.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. IPQ8062";
-	compatible = "qcom,ipq8062", "qcom,ipq8064";
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
deleted file mode 100644
index ac9c44f0c164..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-smb208.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "qcom-ipq8064.dtsi"
-
-&rpm {
-	smb208_regulators: regulators {
-		compatible = "qcom,rpm-smb208-regulators";
-
-		smb208_s1a: s1a {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s1b: s1b {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2a: s2a {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1250000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2b: s2b {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1250000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
deleted file mode 100644
index 0442580b22de..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0-smb208.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "qcom-ipq8064-v2.0.dtsi"
-
-&rpm {
-	smb208_regulators: regulators {
-		compatible = "qcom,rpm-smb208-regulators";
-
-		smb208_s1a: s1a {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s1b: s1b {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2a: s2a {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1250000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2b: s2b {
-			regulator-min-microvolt = < 800000>;
-			regulator-max-microvolt = <1250000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
deleted file mode 100644
index 803e6ff99ef8..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8065-smb208.dtsi
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "qcom-ipq8065.dtsi"
-
-&rpm {
-	smb208_regulators: regulators {
-		compatible = "qcom,rpm-smb208-regulators";
-
-		smb208_s1a: s1a {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s1b: s1b {
-			regulator-min-microvolt = <1050000>;
-			regulator-max-microvolt = <1150000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2a: s2a {
-			regulator-min-microvolt = <775000>;
-			regulator-max-microvolt = <1275000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-
-		smb208_s2b: s2b {
-			regulator-min-microvolt = <775000>;
-			regulator-max-microvolt = <1275000>;
-
-			qcom,switch-mode-frequency = <1200000>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
deleted file mode 100644
index ea49f6cc416d..000000000000
--- a/arch/arm/boot/dts/qcom/qcom-ipq8065.dtsi
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "qcom-ipq8064-v2.0.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. IPQ8065";
-	compatible = "qcom,ipq8065", "qcom,ipq8064";
-};
-- 
2.51.0


