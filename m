Return-Path: <linux-renesas-soc+bounces-15151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BEA765D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A67188D114
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BBA1E5B71;
	Mon, 31 Mar 2025 12:27:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E8E1E2614;
	Mon, 31 Mar 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424073; cv=none; b=ZZDEH69OcC4WKOF9u58k/oepDTEY84Wp1qKHhDkY1NIf3bcWIDwpaVpbalfL4GOMkpuwVRsCto8Fid/sHbeBrbkXxKY6O8TLhLUuzURshFOgTObGbVuzkxJKmM2aS3ZYdkhzaQeSVgfSAZon7akcfvueBsOMrlSOgiwU5UOkUjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424073; c=relaxed/simple;
	bh=YsPd8Y+7tgFDx3LhAbuUAOKMKNCoMlZ+yTv5yPFn4FA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FL7bQw8f2MNO2LnGw3PXBvfw4USm8VB9AJl+ICxbf+2LOtHHA3/NJI3utdT9+YKP5XU46WLd/VILtynDfLm20+ISuoxWlMpoFrZSfsi1Kg6WCEuZ9dXUyJBRd+JfT/jUM1LKwchQyzx+b0E2rME3eOIx7ocdLQrWELuM4H+k6FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Kr39syVVTN2A6h/OtNM0ZQ==
X-CSE-MsgGUID: CDbLA7vATiGr1dcm32nlcQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2025 21:27:43 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.144])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F358D41D31C1;
	Mon, 31 Mar 2025 21:27:40 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 04/13] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Mon, 31 Mar 2025 14:26:45 +0200
Message-ID: <20250331122657.3390355-5-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
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


