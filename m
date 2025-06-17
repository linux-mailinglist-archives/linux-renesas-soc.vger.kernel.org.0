Return-Path: <linux-renesas-soc+bounces-18464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02817ADD3B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E4C67AC3DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D150B2EE5F9;
	Tue, 17 Jun 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j43ECud9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D52ED87D;
	Tue, 17 Jun 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175883; cv=none; b=hJbc7CdgMXUkcmFaEScswWe6RS72EnQRKnzN63mBbjEppNbxyktRJ53lUy0MtcQy5kcihAPI2LCyj85JpER+A/uyk4GBzEq6Jk5vC7I+V1GzogkOS2Ol55AiPsv8Yrp9pmZ8fQcfpwczyvrjqhh+tciN7x2rOUGhv3PpFHv7LL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175883; c=relaxed/simple;
	bh=k2IZUGGSjNh7YmwST6Jj/uXIReJvEhYDnealB+gedeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c31maCjkMS+POq6mgQRgOA1inL7tqbYu5A7VXZNd/SfSXNHG/X37ZyO8nwFs6hp+PKot+J9zFys98ZL0LCo5TJgPaJAWCWGc+mnNvrxaH8i2thhBhpT7DaEB3ZCQXTiHwEQ9gGdfna4Pb0Yf6CZSheyt+8+Nbc+AFWTCBTFjVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j43ECud9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so50989015e9.1;
        Tue, 17 Jun 2025 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175880; x=1750780680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsZfxeqM9LP6dvIsvkURMf+pGGLMSvH+G4Gi/Jfw6oo=;
        b=j43ECud9tiq0oBhConQdzHp4XexmQgY19VWod8lffbM/DSbfZz8naZ5LUGUN8kwhC1
         30tjY1c5xiAQFjrjwaIjkOOKSuyAcTxzWQGNdYGu3xNCzVbAHjHeVkV0clyZhHuhwzuS
         b5/1M3cEioMoyCl97obEh1ruM6H1zYTOX5YgS97rzEWJvCm1CZi2nNSrYTCS0MLSdqTa
         sUVZCeZnHF6LvQJ7G4gNVaeCAzIxUfqq7+SjryYZscwIpoS6VGC8KRN4eCSMh41pEBG2
         cJPvWqLmNYgb0uYcs1RFfM7Eaep6vEfhO9EH9mEAxgd+UNpI4ZUu9P53WZ62UIsLQnZT
         cO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175880; x=1750780680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsZfxeqM9LP6dvIsvkURMf+pGGLMSvH+G4Gi/Jfw6oo=;
        b=sqCr7W+6immfmfu5FV4lzWdY/BdguUwJIHTGpjz37xG4fuO56JEndyzaGHxx5R0pJK
         GsOqp1TAsm8Of77d4Cxu4f05LoeAOuwoMxXvDWYxJvz8X3KLqHunjuTHiLgn3WkT6OCe
         hptLb8gTGlZlUqePhJvYG0u/BS8ctcxi58HG2j7GnGk7Zy/H4wAHiDhKhW0FP0Sgd9ei
         33vPAGpgRY35h4RY+DcKUpSmuD+Ub4N0cgP9YHA84Wj1cY2ZPZzOB1Yq5qYGhIgDDWPP
         8HCxKkMAAzZSa6/kRwjac2ukIFKxHcLwADe87SvvxpyUhXl9SLLZjpz/M0YnYaZ6t4TM
         zIZg==
X-Forwarded-Encrypted: i=1; AJvYcCUdAVt/sIhwPvALru+B+lghzQaGxfVbM3npCn+JcawoRrr4Ic9ACSDwo+auMOklJ4x95/lEdMgObT0y2TYh@vger.kernel.org, AJvYcCXWsCiPqgkzeZx/F8HNw8B26bWxHYJg2v7ujcDr2E+5aqoaO+AdympyreG2MaFIrOrfVFW7YD7Ge1jA@vger.kernel.org, AJvYcCXfr9EkGxSO/uhvs2u7eNdCV+YuJzhSN4QAmKHHtoP2TI3PHqT551ET/yA7K/6393bvCAGBCxfEPANM@vger.kernel.org
X-Gm-Message-State: AOJu0YyijesahS1IgnMBm3XKSfvdPqzgzxerDC/IFz+AmwGuocU6u5sv
	jvD5y/YURYKSLMDzp9/xuzeIpN2C6kEa//4gJoRNfyyO01Q3RKJ4UOc1
X-Gm-Gg: ASbGncsrD74o93A3gv9En3YxlJl/Y4kJmeNHhHYPZhqa6qNg+7/YQTKStJH9M23R/HD
	VhoyXpBCphFRoTT7cz0n61bGvwbJren68UlyPr3jv97WfLKXi5oTjPNO23q43RzcBSd/OAKWBc0
	CvHiPnAlKD3sgQIWQmYeDAQjSfRf4aJyh96H2cj0TpMYOGSOtlSVFsBH3MBwRNxfT8p0wuA/rys
	CKlUfHGSI+v3Xe/Nw+33JWbOvCQS99dMgV6nEzPz85fnCJ3CBq3lXU+pp3BynSjUd/4NcNZXS/c
	SgJAuFCg0yfcs1yJb13qHGiXBwDLQuR9KE+nAEvMlKqeDG7J0zf1ZoQuDkh2QFFur4iOelNp+rx
	xe3AotUWrNfQ=
X-Google-Smtp-Source: AGHT+IGnD2jDwQ6p30B87/o1bgbnTO4JgOm2ZpuDQ4yqKdnflI0Cuey9Cpb1eNwwMaJdryWKn1XHsA==
X-Received: by 2002:a5d:5f48:0:b0:3a4:d8b6:ca3f with SMTP id ffacd0b85a97d-3a5723a291dmr10158013f8f.30.1750175879992;
        Tue, 17 Jun 2025 08:57:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm14189115f8f.4.2025.06.17.08.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:57:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
Date: Tue, 17 Jun 2025 16:57:54 +0100
Message-ID: <20250617155757.149597-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Clock Generator, Module Standby and Software
Reset found on the Renesas RZ/N2H (R9A09G087) SoC. This hardware block
is similar to the one found on the RZ/T2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
- Updated commit message
- Added Acked-by tag
---
 .../bindings/clock/renesas,cpg-mssr.yaml      |  5 +++-
 .../clock/renesas,r9a09g087-cpg-mssr.h        | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 708ab6bd7d44..bc2fd3761328 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -53,6 +53,7 @@ properties:
       - renesas,r8a779g0-cpg-mssr # R-Car V4H
       - renesas,r8a779h0-cpg-mssr # R-Car V4M
       - renesas,r9a09g077-cpg-mssr # RZ/T2H
+      - renesas,r9a09g087-cpg-mssr # RZ/N2H
 
   reg:
     minItems: 1
@@ -112,7 +113,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g077-cpg-mssr
+            enum:
+              - renesas,r9a09g077-cpg-mssr
+              - renesas,r9a09g087-cpg-mssr
     then:
       properties:
         reg:
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
new file mode 100644
index 000000000000..f28166d6015f
--- /dev/null
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
+#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A09G087 CPG Core Clocks */
+#define R9A09G087_CLK_CA55C0		0
+#define R9A09G087_CLK_CA55C1		1
+#define R9A09G087_CLK_CA55C2		2
+#define R9A09G087_CLK_CA55C3		3
+#define R9A09G087_CLK_CA55S		4
+#define R9A09G087_CLK_CR52_CPU0		5
+#define R9A09G087_CLK_CR52_CPU1		6
+#define R9A09G087_CLK_CKIO		7
+#define R9A09G087_CLK_PCLKAH		8
+#define R9A09G087_CLK_PCLKAM		9
+#define R9A09G087_CLK_PCLKAL		10
+#define R9A09G087_CLK_PCLKGPTL		11
+#define R9A09G087_CLK_PCLKH		12
+#define R9A09G087_CLK_PCLKM		13
+#define R9A09G087_CLK_PCLKL		14
+
+#endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.49.0


