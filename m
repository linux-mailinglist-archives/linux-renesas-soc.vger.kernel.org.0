Return-Path: <linux-renesas-soc+bounces-17988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C143CAD27A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EE71893B73
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A282C221FD3;
	Mon,  9 Jun 2025 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAnDS/Rv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDD221732;
	Mon,  9 Jun 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501424; cv=none; b=SwCCPTx3+866McqzxaY9k6LueE5rLfa5OjDZAmIACCtlHkYPuNITReAUz25Erf9c5VmvVzvwxtlrE56zMzyDXm2kxv7jYeELYfpPyH+2LKGE3N0+99ahaMyU48hX8ONT5T0NoLSTzio7ea3tAAWIJydv/YKP1uJVmvympxTFGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501424; c=relaxed/simple;
	bh=14lBUke8BwQzqm6lQYQXtpgjN5ircV76SRTFow/HUbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elCGB/jUdr72GPsNDvrLnA5ITgCXa0ovrZmpt4JcyPteAc1oXI22DLJSFj2lcpstq7w9id1px30Pg25uMox54s9fRk2EsZ3YkOzG2Ebq5XlvzYv3fTLk3OFZEkXsN0R+2Frg3QkvAuYJsXN9U2Xpg8ungwjxrjuALmCiE2D/QVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAnDS/Rv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1164931f8f.1;
        Mon, 09 Jun 2025 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501421; x=1750106221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBomcS32ht7zBzMhijuZlnx8uPNCyoLhMOaVk/j5RNY=;
        b=XAnDS/RvFREcEoUg3bPxaU2itT7S1BjgC0tPqgWvMYtRY6HWx+ceB5NRwyww0GAffm
         cAfq4SfWN2S1SYrzFAeLVPHxduL2GU8/Pt2MHtHyXQSZBQg8YEvrOHeJpn5HPmqtN9d2
         bZ3hnQgXTdUuXykNXQdeQMh/Rb5LVzArs6dhsZ5TdCSd1DHl3I+3VmYqPxZ0z0H5iudz
         j0p54zRxx9w5UURjkl5Sxf7N3j6YlrDfD6vVz/HbbjAVN+bE6NoaKbOQsHmNEhoWVh3H
         /LoxzwK+w1G+P8fou/AarILSW5HcgPUFhyI5BVPubEd3nin4nuZ6wgIFNs/uLmpdJ+/O
         32vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501421; x=1750106221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBomcS32ht7zBzMhijuZlnx8uPNCyoLhMOaVk/j5RNY=;
        b=u6a27UqekDpdeksrk6FxVHU0fXLATKnDNxZ7hLXJeuhdRn1Ku677da9mHQUaQF6Uch
         BFtm8zMxLGvfSADNH/a/bpRshzGA11AXyP6GCrotg3JDDcpPoEa7rxX5bi/cAIR79bRU
         UsdeoJ5qAKDFwqnp4YAIOSBy8ImMOTBsYr6IuZeC4VuXoR7Yjfbx3EbJYbwxyKjSLcVi
         XL8ytD8Be5zKdjWqO2hfhw/CkiHWWYXySy8OQC6Ye/C9eT5Y9dQBU7a9oR4z6Fs+7TiZ
         rWBX8jh+UyOLeiQ7NJuwx/PauwU8MbNFOcl/DSCtF3BpD1GNA3irdkpvmrzA2+8dYkzi
         f+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7p6Ui+/5+uzu5d4hR+hvFG+QwZxGGFaLxpWhkSrA/K9/WvP8GR1/n/ufQmtmCHuYVEA17S4wB9nJNkKh@vger.kernel.org, AJvYcCVak9XGj6UJSqvATsNJYnkDdgtlNMS2EcMYNSEmtnUJPDvMqLWW3nm1GuysA9RRmpULvmkUFibNAJmf@vger.kernel.org, AJvYcCW4ic/uZ9D4z+nonjW5Wf1PImAAQCKDd88zCeLgMaSm4+5XSiw9GHm5yBK7tIYXfY6quZpICGpOFi/v@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKFAia//RpDER3W0KBY1WU7rUXZChH7Vc5gcQGrnCPU0vz3DC
	/AVfat5OrgBKAUVgv8zU5JThaqrJzbfHQLR2kVsVXq9CBGbNp8DVbVAf
X-Gm-Gg: ASbGncv6D+fXbleICD4WlKGw2B5fNkazQazEnq6cbYm5y00Efn8qXHRLHQQAXL6WyWu
	kx13P57flDsfsHk7u/mvLU//Zw71KvanRc0qMLfEM8qMyCaIaomDWuQaGHAn8vzGCbQsWG6e7wo
	FrFGZn8ZhCDaZo1TIR5V5ndlJwokxYVEAuqUaZJu9IYo3sx0y7lau2rWdamR5Jys8F7bZiWKMF3
	DFjk3jh57cTWdZTKhpGP73g+YVwn9peTtf2fb8KBCnd4F6IdkgLsM1Aix98CvQ80d+CSKImpin5
	66YC3x8YJA8AtovNG0thYu04oc02H281Rli0CYLw2gWeQT1/l539m1C3dm3h/yDuQx2Zs+PYBFW
	2gOdvJJoZGo5A0XRUQtQ=
X-Google-Smtp-Source: AGHT+IEtrgUwYwiCQTKO2SXjayShTR3iYOjN/0iYJpdheFmWzourW7l+MgEKGkX7QDf6Gdus2h/FaA==
X-Received: by 2002:a05:6000:25c7:b0:3a5:1f2:68f3 with SMTP id ffacd0b85a97d-3a5522bf87amr51616f8f.46.1749501421022;
        Mon, 09 Jun 2025 13:37:01 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:00 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/8] dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
Date: Mon,  9 Jun 2025 21:36:51 +0100
Message-ID: <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for Module Standby and Software Reset found on the
Renesas RZ/N2H (R9A09G087) SoC. The Module Standby and Software Reset IP
is similar to that found on the RZ/T2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


