Return-Path: <linux-renesas-soc+bounces-15347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAEDA7B16A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15ECC162E8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FB51E8346;
	Thu,  3 Apr 2025 21:30:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD401E3DF4;
	Thu,  3 Apr 2025 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715804; cv=none; b=NzEJJZ4qWxQ0Y2Tr5WpsGxVrCXXByZFOaDBuiIqQMx5ioyeI5Xs2CZ6Vga397Vd/cJaOxLC+1+t/Ykid+C04y/a/hIqpWyoMg4wy/jOH4Fu3imQ7ruABb2aq3e43BFMkLBKr2dwB6wc1+AEavUgXKit6I72GqH0EHz3jTg/aYn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715804; c=relaxed/simple;
	bh=5PwfEq2/h/uDTAXS7x2WyG0G0NAJrDpkrxpHugsO98A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNjQ53XVrDdTmeEMr1vaM4h67JOZoDz4z0nhE1J3BNrgWJJcqD6CFGx3YMqZd9T257Q6jFsGmVH0+8+KInGOk7Ad5yrF9FV7JEywSKezHO6mywidnM+f/5lNBm2GyjIzcy/Zw4nHaUz5qDdtWntvb8z7r9J0mtvnFeqJcYWQ3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1GjNitCMSRONKwZXvrJqqw==
X-CSE-MsgGUID: tQN5AYYzRbmFAK7MtmIibQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Apr 2025 06:30:01 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 374F440B46FE;
	Fri,  4 Apr 2025 06:29:58 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/13] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Thu,  3 Apr 2025 23:29:06 +0200
Message-ID: <20250403212919.1137670-5-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4:
  - Sets ARCH_R9A09G077 to Y by default.
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..5ce646afa008 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -359,6 +359,12 @@ config ARCH_R9A09G057
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


