Return-Path: <linux-renesas-soc+bounces-18773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C35AE9A6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 11:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685A34A3980
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1D929008E;
	Thu, 26 Jun 2025 09:51:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB65239E79;
	Thu, 26 Jun 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931509; cv=none; b=UW7AyrMHdsThZShw7rLaj5ZOZ0ILNS114ZUYTHjN0Iisy2DWpzt3ynYLpQf9lqfeBsCE9oTv0na/HInY2Vd5lBpdEtKpAKCFyt/fEqeGiZxOeimRk6Bx1YjI2sGCP6GrABCOQkBvED5BtsRIfX5XzNZYEU3yP7IakPaGsL+pbPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931509; c=relaxed/simple;
	bh=jAnPPyhXsc6144Sd777vdZrdKpvyeQKLk9zi2o5ha00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQJCh9es3A7pRsW+eKmtYBbDodZgYI+rYkqydQ5uiQO15lwi4/JeoORhOMSQ/xfMBj5ZviM2y/lu/k8wyc4ETMsY0t+GFUQJmV3FxB0QnpEPuIicMK+KRvfpo3yNWKGvyroMd00xOWDXwGA9J71SzW4NlaQGPRN9qlBy7PuULbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40AC4CEF2;
	Thu, 26 Jun 2025 09:51:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Tam Nguyen <tam.nguyen.xa@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] arm64: dts: renesas: Add Renesas R8A779H2 SoC support
Date: Thu, 26 Jun 2025 11:51:34 +0200
Message-ID: <294ca4211c5a73942dc2ca04ae6d3c384d534f2b.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tam Nguyen <tam.nguyen.xa@renesas.com>

Add support for the Renesas R-Car V4M-7 (R8A779H2) SoC, which is
an updated version of the R-Car V4M (R8A779H0) SoC.

Signed-off-by: Tam Nguyen <tam.nguyen.xa@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779h2.dtsi b/arch/arm64/boot/dts/renesas/r8a779h2.dtsi
new file mode 100644
index 0000000000000000..2707d2d367661994
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779h2.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4M-7 (R8A779H2) SoC
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include "r8a779h0.dtsi"
+
+/ {
+	compatible = "renesas,r8a779h2", "renesas,r8a779h0";
+};
-- 
2.43.0


