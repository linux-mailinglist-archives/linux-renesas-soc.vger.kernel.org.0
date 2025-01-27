Return-Path: <linux-renesas-soc+bounces-12562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E411A1D56C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93EB21887AB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 11:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4FF1FECBF;
	Mon, 27 Jan 2025 11:37:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A791FECC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977874; cv=none; b=raFF5uLzC2QwggaQhJmufzQUFLU5cysPRHFAVwzMr61AZFEf5kudWcjLtx2a2vu2v5XaYo5vC/ia1yCJsFY4k55b4fEAGQoTZEySovNGrwdZjQ9rR7a30Jy9JWl8s7oOhTBDh6PpGJvO72BRMLiose1Rm47esDKphLCTTfQ2e1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977874; c=relaxed/simple;
	bh=JlNWG9SE5RxFmBANlQUrR8SUcn8OcPtFIyX1WlO3EhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Il9nrgD5lM3fGI3PNuemSq1D9YXusSHySu8OAqAjoyDwh/PVN80FEEZb/63AwrRVFT+Ksekx7r/Y8saBWJSvCr2nCTD9qcV+mjhysKBJXMOvNLbIC0WYX4v/NRQSXbihe22aH0pjUjHK7XC7gXbHj3u7msNQpM6MwGzM6Le0sdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: pXwEBHqOSlGPfutcqZ/40g==
X-CSE-MsgGUID: QV1XSH12SA+cPMFmmxzNxQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jan 2025 20:37:48 +0900
Received: from localhost.localdomain (unknown [10.226.94.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F79A41F2797;
	Mon, 27 Jan 2025 20:37:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 04/12] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
Date: Mon, 27 Jan 2025 11:36:59 +0000
Message-ID: <20250127113723.24479-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
References: <20250127113723.24479-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_reset_control_get_exclusive_deasserted() to simplify
rzv2h_icu_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Split the simplification patch into two.
 * Updated commit header and description.
 * Replaced devm_reset_control_get_optional_exclusive_deasserted()->
   devm_reset_control_get_exclusive_deasserted().
 * Moved simplification using devm_pm_runtime_enable() to next patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fd432b43506b..5c5d2e015a88 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -456,15 +456,10 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		goto put_dev;
 	}
 
-	resetn = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	resetn = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
 	if (IS_ERR(resetn)) {
 		ret = PTR_ERR(resetn);
-		goto put_dev;
-	}
-
-	ret = reset_control_deassert(resetn);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n", ret);
+		dev_err(&pdev->dev, "failed to acquire deasserted reset: %d\n", ret);
 		goto put_dev;
 	}
 
@@ -495,7 +490,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 	pm_runtime_put(&pdev->dev);
 pm_disable:
 	pm_runtime_disable(&pdev->dev);
-	reset_control_assert(resetn);
 put_dev:
 	put_device(&pdev->dev);
 
-- 
2.43.0


