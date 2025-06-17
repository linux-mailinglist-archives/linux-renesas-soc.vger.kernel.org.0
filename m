Return-Path: <linux-renesas-soc+bounces-18469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A48ADD7B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D82116415F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64662E8DF3;
	Tue, 17 Jun 2025 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCT+u/tR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A5285048;
	Tue, 17 Jun 2025 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177696; cv=none; b=pJqB25+6c6HNFCssEfkFImVUDhcWCZI/O1CVUgwyV+ub8vNPBJWCllHmANz62uIu2CJfckSQJvu0c7T4ZmZfeoNO4E8eaIaqYZtSO+dChIB54CWR2OC+afw351RPJ26J7zx3lBEpg+gxJjoLH2w87JL3tPxS3CqgPuY+aOhkQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177696; c=relaxed/simple;
	bh=ouWPRN3meCqCleUdTGMXD86Sjy8Od0GZer3eulG1gx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzWgD0agX1ANYDHbyMgToYoW45MXBhEVz6AqCES6jereoy8DBDuYUKSnaIlinhxIYXQwjRKGlJCyBlVSbYlYm5MKK3k7bg0YZCVGNXa4Yggq+yiKyOGcCN3+GAGDYunaRlNdNOLArA6gEaoBXAigUQdZPjtwV4dalxICrtrVsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCT+u/tR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d6ade159so49936825e9.1;
        Tue, 17 Jun 2025 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177693; x=1750782493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s92kTAKZq9+rdKOL6DkxiXRHhHYfgOv5G7ROJHjAw28=;
        b=JCT+u/tRVrFkPX9RtfINMzB91gKRPgcZJ7qT2YIL67EOEi62zR9pDk/kAvZpJzjHlC
         A8KQP+CbgGaICJJhCuptOsxBmTIk+61JCIoAZ4DlwmF4SZkLEn4m7xcZ0HIiK1bkIRLv
         IN/UWupRffqAJQPYmols9QRmfBb1VJhqLCgp8ruP8Ngrx9aR7Ie/mLHZYggfcWc2TAyN
         9Rj9extQT1h/eM4KY7G4CAC7zqZyCS626hEbpoVX9yJ3rifrSudczV9/VD3dPphXYLrk
         koLpAtGdYm+KU9UIXOnFbRE9UTPtxGpiLgkDLf9X5EjgW33fHFQ9AjSmElU3API4rj8s
         wxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177693; x=1750782493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s92kTAKZq9+rdKOL6DkxiXRHhHYfgOv5G7ROJHjAw28=;
        b=lDJxN9iWt8s7EMuNG7meN/ZAH2j7KgPEAZ4iFbsfTLE9cwmFoSRIhDpH8BwfgjXpO2
         VCi9wW8DkrlEFjzlWDqvEaQwx2rO3zgnMdNZWmCkbvBH6psbxpVFdaACgecX0DLNSOOY
         fhEoHijWTDhXlwf0KdpLXRAPJ0INTIvLiPi2qk42EEB/XggR9XeulReNevJlNeE4q2sF
         QgvvaCWMDWEMNAXFIl+e/EfKVJotg5/2XDhB8Sau9cMFA8UE8WF4G2OQIAHmNLrTr07j
         zex/tk3MBebY4hN0yz/A79mq+XrNKMXvzCZ2YjjkudxXgE/z2LGMkK/94qRZZ5QKJxvt
         MP/w==
X-Forwarded-Encrypted: i=1; AJvYcCUTAp1ZX3RtnHsP/7b9zXu9WW7LiZuG3ecQsaLC/asw1Km5Z4+WzDyHqg+h8ziYJOJ4U2+ReXqcXj6ghIFs1F+ITHY=@vger.kernel.org, AJvYcCVKD9QjRjGsAMyfFuOWkvU6P1YoNbXCnCcQb1n36gefh7qk4CsZOg8GWV79pq7bebRY09iCUkWeuaHgJD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/sjkid0hDZXlF4SXCYrvGv1Mtnj2L/zC5YvFVIYdSfrClbHoY
	i8I4HMdfTE0Kw6+Xi/yx7gwfT+jfMBgLU1Js1pI8pqhvIDje/sOzTtWD
X-Gm-Gg: ASbGnct1FEajCHztegSRGK3ZtbRvgpnoF8JJkFeN56B1fP9XRdAKrCppn2xqtAOFdbS
	X79kCa44cWfY/t3BI1KjbXr5GQDqj7GndqXHT6GO/TC3dmrMPvhpaxbvxvro0stuWbbsC9Mu87L
	uKTAQOgr8a8D6qpIextrPjNK5twWxdY36nyhzso2cx+W6o83B4+DYN2nHdrrnm4LyAukkOOq86k
	/bMkTKH7ckFOssN70W20t8oIa2WJ0v0gi/BVhlX8yCMYWcr+TcZXCMvnhEShPdk/X9IgA3DEyJ8
	t7D5Rl0QApkP3JGgWvOO9AO7CrIVuHN7udOgIYqgNPIK2HoA1XT5gnMEOfpws6NfDVGqirim6d2
	OxIlszRmh9F4=
X-Google-Smtp-Source: AGHT+IEBvhm2Fdb231NcAN/EjH3oTlscYWyBR4xcz7GjSRvkL7tWnLAVXPe1BEQ/9enPpLmjx3tt+g==
X-Received: by 2002:a05:6000:2302:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a5723711famr11873788f8f.15.1750177692755;
        Tue, 17 Jun 2025 09:28:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a68b0esm14220831f8f.29.2025.06.17.09.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:28:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 1/2] arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
Date: Tue, 17 Jun 2025 17:28:09 +0100
Message-ID: <20250617162810.154332-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Add the initial dtsi for the RZ/T2H Soc:

- gic
- armv8-timer
- cpg clock
- sci0 uart

also add arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi, that keeps
all 4 CPUs enabled, for consistency with later support of -m24
and -m04 SoC revisions, that only have 2 and 1 Cortex-A55, respectively,
and that will use /delete-node/ to disable the missing CPUs.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10 -> v11:
- Dropped GIC_CPU_MASK_SIMPLE from timer node
- Added hypervisor timer in timer node and added the missing interrupt-names
- Reordered the `extal_clk` node
- Reordered the l3_ca55 node and renamed it to L3_CA55 for consistency
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 124 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 ++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
new file mode 100644
index 000000000000..42c3b86196d6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g077";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sci0: serial@80005000 {
+			compatible = "renesas,r9a09g077-rsci";
+			reg = <0 0x80005000 0 0x400>;
+			interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller@80280000 {
+			compatible = "renesas,r9a09g077-cpg-mssr";
+			reg = <0 0x80280000 0 0x1000>,
+			      <0 0x81280000 0 0x9000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		gic: interrupt-controller@83000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x83000000 0 0x40000>,
+			      <0x0 0x83040000 0 0x160000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
new file mode 100644
index 000000000000..6f4a11b39d12
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H 4-core SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g077.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g077m44", "renesas,r9a09g077";
+};
-- 
2.49.0


