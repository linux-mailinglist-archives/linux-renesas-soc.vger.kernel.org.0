Return-Path: <linux-renesas-soc+bounces-1813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A283C52C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B07A293F06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767106EB51;
	Thu, 25 Jan 2024 14:49:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDF6E2D2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194152; cv=none; b=c5ILmeU3Pt1Pjs6P57ZutrkhVY7PxhCdr3q8gqgxoDEpDlHqg8IZ3DIWy/tynCrTj8qitlY2xgWsmYVeHg2yMfFQMd/MoVxGJ5V3b5oNRMr3OG73b5FFmgL2a1hjCbh3c48gFdurb91cAZJ88RSsYLiO4rrKPHZ29apO/lKDjT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194152; c=relaxed/simple;
	bh=x7o7jeI2krSuoJURPzP2NxANKTR9RXMg7aSzVRhnONw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcDVCokUB5uqX0COoqWEzzU1pq2/YxLWW13yYSRfFT61TN0wwm9PbuiMdJMz+debzrLLVWQJgpD1veuWADPvv6OqSidrbzGc7R+6ofA2EakrUWbZCgv4T8d6AVdnss0+b6AU/c8edD/SYO/4/m94g//DdLGvLGtt1l4emdAV0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by andre.telenet-ops.be with bizsmtp
	id f2p02B00a58agq2012p0GF; Thu, 25 Jan 2024 15:49:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT11W-00GUsP-Np;
	Thu, 25 Jan 2024 15:49:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT12K-00FluO-NI;
	Thu, 25 Jan 2024 15:49:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 8/9] arm64: dts: renesas: Add Renesas R8A779G2 SoC support
Date: Thu, 25 Jan 2024 15:48:58 +0100
Message-Id: <4f773dbb66af5da51d1e171424ec8f97ee933b36.1706192990.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706192990.git.geert+renesas@glider.be>
References: <cover.1706192990.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Renesas R-Car V4H ES2.0 (R8A779G2) SoC, which is an
updated version of the R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779g2.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779g2.dtsi b/arch/arm64/boot/dts/renesas/r8a779g2.dtsi
new file mode 100644
index 0000000000000000..e08f531843e28b7f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g2.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H (R8A779G2) SoC
+ *
+ * Copyright (C) 2023 Glider bv
+ */
+
+#include "r8a779g0.dtsi"
+
+/ {
+	compatible = "renesas,r8a779g2", "renesas,r8a779g0";
+};
-- 
2.34.1


