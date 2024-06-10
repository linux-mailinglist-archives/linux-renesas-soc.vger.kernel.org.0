Return-Path: <linux-renesas-soc+bounces-6029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF64902C75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 01:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29F91F21FB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F7E15279E;
	Mon, 10 Jun 2024 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QB84OxM+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CA450F2;
	Mon, 10 Jun 2024 23:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062355; cv=none; b=VFhmIOwzTHWAGyhmglb76uifO6dRhKbQk/ytDJ3fhmXBBKXMK9h6MMHpmtwF8ihekG2XbnVvoKNFylEBVXTiDNB+ar4ln3Xy5OonoSigVoIRRfMUgzBuVGGV4yay5iOzsqH17BylezMCaxSzqMgu1/3GJqrU7f6Aq7eqXV+vQMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062355; c=relaxed/simple;
	bh=BBbhcx4+rlXMh6XezfxZ7t5k1cjKOvvFmBxTyZjqwEA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=exkGpKih64Fbx+I6DwxG7SDzBnAWoFKPPeune03+GANAbsqcTNgrDGLObEhAtBUa3d7tvO8jnxctRHqpTd1NSU+H69WOS7148W4avZO38lmTsOVbIfsEpmjCxpsTbKc4Sr1o+tAcKGy1u0iEdi8QSFEsrYYj9SBqW5FeyUsWDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QB84OxM+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-421798185f0so23774285e9.1;
        Mon, 10 Jun 2024 16:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718062352; x=1718667152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aronCIgLI52+LRuTPhhK/Ei7TFcTK6BH3jrY3yZ5m2M=;
        b=QB84OxM+CzBM2ppv87USQ/XQ0E++2R5D3Xj34yfPeLS80+3WOVYqH+oXwHJAVMDP5R
         5Z8f/8XPAaJiKDSIn1gEAv/qeI1k08Gh7UDTmO1kQK6V+7neQAkLJ8RxXAiEPP6eIreY
         uogWCynfslZbkbhznbYQlLxMxUQQZRtc+DyMu5YkwEqX4Jbc+L/8PKJZr6dz6rJ2VfSY
         xsaB65LVnxYBmScctRGiXhJ3CZledLxQI+xPJ42Y3CKG2E+9zub3O+y1aQETyS0k5bkS
         4UH4Zbbk2nbwMXJyCsKoEnkMatlaZZz21N+1xasF8zVo2+zN2xRmuVgb0ah92UDRYrvg
         UiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718062352; x=1718667152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aronCIgLI52+LRuTPhhK/Ei7TFcTK6BH3jrY3yZ5m2M=;
        b=cv6PoxRhtgkkxijckuqiZQSV2YBvCkzEMgv7Oqypc2+XWVDRUJUZ/sPqB7zUsC3MD8
         cbUA0te7reqrYCQJX+zLnDyTWFPQ9nYYl/RkoQfGEKGi9FLvQAJxxT0RcJqYmWQRD55+
         MBYmlnNeSv1QO1C65GaoynBuIQ/gGy+UZhM2DXfMK1O73zcdjGKGXOUTWnoilMmDLhp9
         lUIVKJGapDpSmIrgP67zcIQWQZOwy9RkYFBQOO5LVnF24jBG3S6f8ycQgdKX+UebdEzk
         Nc4OA0k/Ef4mS1uInH40a7Lt6U3wmV7lClh0wYjbkgv6xYG8EoBXmp8UtvkQIdNgArwj
         lM4A==
X-Forwarded-Encrypted: i=1; AJvYcCUAWQYypZWKfLP28hC7jk2ZOmDdkvLx4VwMm8kVBgm8hebki9mxfQzY4cK317UsE2o9+CDveYeLDB8Jc0fU3Bt+XHe0eyMFDp5MYmzuzYAdCpBfv4CFWrq1/srl7PqhMEhIM8lObwUZkbzab3e9XL5g8jw7+wo+e6rWkxwQ86LXAFtYwA==
X-Gm-Message-State: AOJu0YxTsDpraD8QEsPdqmmVomafy+UF4N+Qxf/jWsO1F92bSgitq70M
	ce2MbBuNTvkp+7Srq/2VwptJIZ+yQwMB1Ahyd79tLiVNFZkvTlne
X-Google-Smtp-Source: AGHT+IEJTpMsgsu0MXtfzihBzdAZaBdNFAQ2JoJSFxCojDnvXLdpLGLQ8ONJCnxkqtadeuNY3SRwhw==
X-Received: by 2002:a05:600c:46cd:b0:422:5c5d:1b89 with SMTP id 5b1f17b1804b1-4225c5d1c73mr169415e9.0.1718062351911;
        Mon, 10 Jun 2024 16:32:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:74ea:e666:238d:5e76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1efe9a74sm5447698f8f.104.2024.06.10.16.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:32:31 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 2/4] dt-bindings: clock: Add R9A09G057 core clocks
Date: Tue, 11 Jun 2024 00:32:19 +0100
Message-Id: <20240610233221.242749-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator core clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped the module clocks and just added the core clocks

Note the core clocks are the once which are listed as part
of section 4.4.2 which cannot be controlled by CLKON register.
---
 include/dt-bindings/clock/r9a09g057-cpg.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a09g057-cpg.h

diff --git a/include/dt-bindings/clock/r9a09g057-cpg.h b/include/dt-bindings/clock/r9a09g057-cpg.h
new file mode 100644
index 000000000000..04653d90d78d
--- /dev/null
+++ b/include/dt-bindings/clock/r9a09g057-cpg.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Core Clock list */
+#define R9A09G057_SYS_0_PCLK			0
+#define R9A09G057_CA55_0_CORE_CLK0		1
+#define R9A09G057_CA55_0_CORE_CLK1		2
+#define R9A09G057_CA55_0_CORE_CLK2		3
+#define R9A09G057_CA55_0_CORE_CLK3		4
+#define R9A09G057_CA55_0_PERIPHCLK		5
+#define R9A09G057_CM33_CLK0			6
+#define R9A09G057_CST_0_SWCLKTCK		7
+#define R9A09G057_IOTOP_0_SHCLK			8
+
+#endif /* __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ */
-- 
2.34.1


