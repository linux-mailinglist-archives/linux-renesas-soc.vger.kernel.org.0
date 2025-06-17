Return-Path: <linux-renesas-soc+bounces-18470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFCADD7FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23F454A4ABB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341352F2354;
	Tue, 17 Jun 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfQKj+3l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446D285050;
	Tue, 17 Jun 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177697; cv=none; b=L2j15LHPGwEHN2UvSyiDldYQWrSzJxS06W0BCKe3cp7tuTjAwtXmYVUpw5YmRDPuc/FsnuK5wm53EUw0dVQn9Zi9L08Q96mvWOgY0ZwGTNLff++xgMP1JsvS0OK7ht8V5E/h5LOwznvIokwacSMl37amaASn0lKWS6vwn6ZJcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177697; c=relaxed/simple;
	bh=LTKyUcCHTIdIsHi0OO6FExbF96htp5QWO9ctXaSdVng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5eqrhbRrRSLRzek06XgGC9jRC9fZCwh5Xr3iSrsT6DuqjN8kEU9qlmLF/z8zRmNHOrbGfF9BTOWYuZOX7h82sw8KBUWA61nG2yg0hBHP98FzXe30sKZWasRJ8zpLBXERtYP7HBWia1AcRXHEOqlyk3pcvNpH9rkRYtR8PpuuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfQKj+3l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d6ade159so49936905e9.1;
        Tue, 17 Jun 2025 09:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177693; x=1750782493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1udRvN4jSuClAnZgC4T0k9Z2seJqL2UUQk3g/+ah2U4=;
        b=CfQKj+3l4CIziBefud9sCdz0ZpLJSUYDrDIFfpoDiPqzfytV0PAIKuTqRwYD0tU43W
         yF8yifTc/tTqmdacl7XQ/xUtwQIfHBamPfF8G29JiqxuW33e9AF3r4qTCM3qX6vC6Qt0
         l+myUZl1OM1NQEmkaw1t2bg6gcdCnyEpdXsR59LxdN9O4OV9SEDShRq1qbg3zpfU8r8Y
         w2FPPUrrBEeZhzhznUvOVFC017ysFkPbJKl1r2a9IGm/UTQLudT5Tv9kHiTHb5KicFPs
         KuZ4mlXkQU+JGp7tNbPqcPWzC7JLdTlHjX9gaPwCAx36oXjQyy5gqCQXvZXSioledCn5
         pB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177693; x=1750782493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1udRvN4jSuClAnZgC4T0k9Z2seJqL2UUQk3g/+ah2U4=;
        b=jaaE4PXoKqk+92nECM4shGk9K+wqyINRkx+Zh+6W1x0iVGvAJ0G4O8uKKcv3QGlCLd
         QwsyWRDWoU7PhvtPwVuW8URfpcQBP5FIfoZvfUDdxetr77ZqPTJB1S01h+fL2XWj9H7j
         Y95RM9KE70JHorCFK0s3/AEiDgqIiLgVNwfFoUFegtDEuj2DRU+QWm5MLUBk/z3hwByx
         IFgJHjFjaHBugNF3oqY43CYSR4ADu+/ZYySMh/YQ20b+jRKZHsOyZaE9teGQIlx5LDCo
         LhmQ6fYYrT39KoqmKt2rs5VT8B6QBaSo3Uk1vq+LXBJp+gc2ZeMvxw/xtm9tY8eKIkFy
         ltlw==
X-Forwarded-Encrypted: i=1; AJvYcCXgNHXeAEbO5Nri0aBx72/QBLHoU4uGIRPUuC6s9i/O3QQGCUC3CAijkIsU56yNJ3/MBSRI1S0GZAsYDiw=@vger.kernel.org, AJvYcCXxBgl0Bwp3n0npI5GLrAAauZSdvc1V6DcCg0i55kUq2vhevRdw8W93MfpQR9LBJpNxoiH/gW1wJOPgSWeOZhZyd/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxynym262gXYUfjPdV5ixDkGI6R0gWkTBN0R86j5/OFlHPq+cMo
	cb61zNWrz5UKaW/k9C34jDvRcok7FdkidJexmxXGDif5pLsBAopqMXUY
X-Gm-Gg: ASbGncveYlmNmtjWF4smhnQSC4SGCYJvB3SNMAKA6p46BZ61iPF/99IKOeD/y4+AhVF
	lmiE6SbuazVIjrTZhqma6OcrFH2Co+gkpmNwicJ2PJOzSEDyZoB1u0MxbBwPmJVUP00scfpgTO1
	6lwRWWhNRBuzmhio1VZRDBwQyPnIx1GyAwiFmf7OqY6uiIC3+LKwqsB4dq28Az5Dvq5EMu6pGcO
	enhpkddG0qs2lyf0fzfcWMsfRVmcUYwvWcX5aEYa4qcKBAH1CT7935zTn6rAsCcg27uHtpXRXU2
	5pHV7FMUdjXMFWp5jztnGF6CbBBkjM/AuBD8Swqz8tkLXDnnKH92h9soF9VxlDuZkHJD9U0iMqS
	/saHMIpeDPfk=
X-Google-Smtp-Source: AGHT+IGG9PfBxBMt5sKRK6/SYmVhgpYziB+87n6Q80KnZiw6jQK46uFHpN3B2OOrD7Qfwmxh3ZvlJw==
X-Received: by 2002:a05:600c:a302:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-4533cce5542mr95955105e9.24.1750177693521;
        Tue, 17 Jun 2025 09:28:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a68b0esm14220831f8f.29.2025.06.17.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:28:13 -0700 (PDT)
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
Subject: [PATCH v11 2/2] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Tue, 17 Jun 2025 17:28:10 +0100
Message-ID: <20250617162810.154332-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the initial device tree for the RZ/T2H evaluation board.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10 -> v11:
- Updated model string in the RZ/T2H eval board.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931..52d0488cfee3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -165,5 +165,7 @@ dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..752d4c9f2cae
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g077m44.dtsi"
+
+/ {
+	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
+	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
+
+	aliases {
+		serial0 = &sci0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <25000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.49.0


