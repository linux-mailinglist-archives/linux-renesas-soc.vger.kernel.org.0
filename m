Return-Path: <linux-renesas-soc+bounces-17135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1537AB892C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACA7F1BC574D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A091FBCBE;
	Thu, 15 May 2025 14:18:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910A07261A;
	Thu, 15 May 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318734; cv=none; b=nWz64VIb69NXw7RLOucca/6SRCpOfB3moVylqT0bD6BuuLRzhLpm9FJXi5Wa6iNNk3z87ytFGsz/DW2CRqJ67IfY4yZ63Z1UM9yplfh6Xe1mFcTNQUa0Usc91ha9ICfu436eC62x1W9Ohe3wibWWHiqkjLhb2um0lRUhn0qsB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318734; c=relaxed/simple;
	bh=OjOWt5lBOJuICFWsDGNc40HOy/pLKXuct0IS7Jq1w7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8qIeyUIPrQkpDr/kL7kAh9VaxgzdBlTS+MyVk0Wsqu9Y58W646DtEro3+InPpDr9ok7Vr7QCgLz1eKxAWQlZXBsYGLpzuLQdA7LmQ5XKAXjZ+mm6jbY3djsSKjfZbFibxLMIlW8sa4ifVc1tI/8nxxHz3mmKAhcrshQc69T9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: zulF0QKjT5uWg/mzPWH8Kw==
X-CSE-MsgGUID: vnG8ERTtQ2qCWVdwtuFiIg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2025 23:18:46 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 366D2401A460;
	Thu, 15 May 2025 23:18:43 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 03/10] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Thu, 15 May 2025 16:18:18 +0200
Message-ID: <20250515141828.43444-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option for the RZ/T2H SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v8->v9: none
Changes v7->v8: none
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4:
  - Sets ARCH_R9A09G077 to Y by default.
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..7f4b4088a14e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -408,6 +408,12 @@ config ARCH_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
+config ARCH_R9A09G077
+	bool "ARM64 Platform support for RZ/T2H"
+	default y if ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/T2H SoC variants.
+
 endif # ARM64
 
 if RISCV
-- 
2.43.0


