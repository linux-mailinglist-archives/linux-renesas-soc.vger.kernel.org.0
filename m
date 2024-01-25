Return-Path: <linux-renesas-soc+bounces-1829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB783C6F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 16:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198381F21FC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508D174E38;
	Thu, 25 Jan 2024 15:35:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3F74E35
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196908; cv=none; b=URX/NKlzTmCfQcRWo8FzeWh4QpRUJ2QcAkebNCTih+Al0vn+Ap33sqRpL3TrNCgoQUfZrrVBx+rQq/0hikWgmcmHIUlgx01ZIR0XhlFwoT+WCngRyxEVEUGfl4vRavGXcdkvEblK2mZSwteynBimKVVLH+NJGI/sY33Hskr8TeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196908; c=relaxed/simple;
	bh=f3Q0vahegL/wzrvIfTXsG2xs1ltZa8ZH4YwhV4HJ3a4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkvZ5/7tdOB0d0UIAmA19MJHOhdqqU5EghdeEMhbujwBKTtJPL3vUAHm8ewR/pjKOPX49EqQtTlNNppEPe3rxBMn6UnlKKVRpz+Rwmb9vqYnd9c6zweL/I5RTbTu/zjCNJW28Wue79ddi8VSnl9IoldySAa07FebtoneZ36a21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TLPyn6B5gz4x0WB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 16:34:57 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by andre.telenet-ops.be with bizsmtp
	id f3am2B00B58agq2013amKT; Thu, 25 Jan 2024 16:34:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1jo-00GUvh-1D;
	Thu, 25 Jan 2024 16:34:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1kc-00Fs2W-0f;
	Thu, 25 Jan 2024 16:34:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 04/15] dt-bindings: power: Add r8a779h0 SYSC power domain definitions
Date: Thu, 25 Jan 2024 16:34:32 +0100
Message-Id: <c5cbef71178cada761e9da7bcbb6f21334f93ef8.1706194617.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
References: <cover.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Add power domain indices for the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by,
  - Add vendor-prefix to file name and update include guard.
---
 .../dt-bindings/power/renesas,r8a779h0-sysc.h | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 include/dt-bindings/power/renesas,r8a779h0-sysc.h

diff --git a/include/dt-bindings/power/renesas,r8a779h0-sysc.h b/include/dt-bindings/power/renesas,r8a779h0-sysc.h
new file mode 100644
index 0000000000000000..f27976f523e87822
--- /dev/null
+++ b/include/dt-bindings/power/renesas,r8a779h0-sysc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_POWER_RENESAS_R8A779H0_SYSC_H__
+#define __DT_BINDINGS_POWER_RENESAS_R8A779H0_SYSC_H__
+
+/*
+ * These power domain indices match the Power Domain Register Numbers (PDR)
+ */
+
+#define R8A779H0_PD_A1E0D0C0		0
+#define R8A779H0_PD_A1E0D0C1		1
+#define R8A779H0_PD_A1E0D0C2		2
+#define R8A779H0_PD_A1E0D0C3		3
+#define R8A779H0_PD_A2E0D0		16
+#define R8A779H0_PD_A3CR0		21
+#define R8A779H0_PD_A3CR1		22
+#define R8A779H0_PD_A3CR2		23
+#define R8A779H0_PD_A33DGA		24
+#define R8A779H0_PD_A23DGB		25
+#define R8A779H0_PD_C4			31
+#define R8A779H0_PD_A1DSP0		33
+#define R8A779H0_PD_A2IMP01		34
+#define R8A779H0_PD_A2PSC		35
+#define R8A779H0_PD_A2CV0		36
+#define R8A779H0_PD_A2CV1		37
+#define R8A779H0_PD_A3IMR0		38
+#define R8A779H0_PD_A3IMR1		39
+#define R8A779H0_PD_A3VC		40
+#define R8A779H0_PD_A2CN0		42
+#define R8A779H0_PD_A1CN0		44
+#define R8A779H0_PD_A1DSP1		45
+#define R8A779H0_PD_A2DMA		47
+#define R8A779H0_PD_A2CV2		48
+#define R8A779H0_PD_A2CV3		49
+#define R8A779H0_PD_A3IMR2		50
+#define R8A779H0_PD_A3IMR3		51
+#define R8A779H0_PD_A3PCI		52
+#define R8A779H0_PD_A2PCIPHY		53
+#define R8A779H0_PD_A3VIP0		56
+#define R8A779H0_PD_A3VIP2		58
+#define R8A779H0_PD_A3ISP0		60
+#define R8A779H0_PD_A3DUL		62
+
+/* Always-on power area */
+#define R8A779H0_PD_ALWAYS_ON		64
+
+#endif /* __DT_BINDINGS_POWER_RENESAS_R8A779H0_SYSC_H__ */
-- 
2.34.1


