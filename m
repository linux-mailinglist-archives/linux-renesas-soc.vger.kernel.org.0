Return-Path: <linux-renesas-soc+bounces-10672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D589D5F2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C52DBB24996
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FD81DE3D6;
	Fri, 22 Nov 2024 12:46:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D374A01;
	Fri, 22 Nov 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279607; cv=none; b=d2ICieSEGGF8xcB+ZhObpyOypoki4aOQaaLsjrWjiN54C6MdLLib+VL9q9zQbaKJEuS7qQWXjHQOpsRvOApmnQ4zsKb3Oc7LTLR2taEFkNwFk7VwtkpSvTWskdXD+YmWQNorDXhL+OIM7ZqDdve8QsOGI8v9un+iH4A0691DtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279607; c=relaxed/simple;
	bh=MQSF4jsMzVHTf5gI75vPelf9C93AVmjvTiacVENoH54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz2p6p+roIgaS8rtd18/3qVg84gMFvnMr6j5o415HHxtRL96nTKT3sLl1skM7L3tqaR/MT1Y6sEwBXjACIP6ylaEGcsWorioi/Ch2mZo3Sn9YF/Pb9cPGCGWo6r9zGKOveTSL4YwbMLwqTZStWCg3CWaUmLohEWoWG06hxL9ZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: L4vUW3RoS8avNajOaqd/9w==
X-CSE-MsgGUID: NnvSNxPfRWiv/0IJsV69Ow==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="225786454"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D3253423A746;
	Fri, 22 Nov 2024 21:46:33 +0900 (JST)
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
Subject: [PATCH 09/12] arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
Date: Fri, 22 Nov 2024 12:45:45 +0000
Message-ID: <20241122124558.149827-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
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


