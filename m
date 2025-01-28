Return-Path: <linux-renesas-soc+bounces-12640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375CA208E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE5053A602F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167BA19C554;
	Tue, 28 Jan 2025 10:47:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637AE19D07E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738061272; cv=none; b=OTYKuIwkdbpZKN7TNkmt/c3ZjMj4v20YnKhLwEzet3ARXcaGaoeNubIiaRUTfmPSmEtRZP3+eS3PxBcaxxwqi73B71AZr2UkCgx82CvQ8zGgAMS/bo8ZMwJpgEt9TKse47co9XEnb+gSxtpoBUgpt2lv2dvBVNjbh5xflzu+bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738061272; c=relaxed/simple;
	bh=TDGVzuKohj7NS0FPzh8rAbFRusgwn415RvA20SRxMOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgIP/lTZI+jhX5E4XU+rGxJhpjaeGYWemrKuMfWS4OFexVoaVAaeQ4BPuoRGHC+43EsaluGTEMLVKbgy+bOACiBqfkGlV4VxEl/GCAjIJEIpzqpZuwV9m9GQJJHFkUYpfR7Dq5gjtCUruvL6Dk307XliTnYkmAH8HBx+jiAIw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3NPbdNgIRMmO1zsnZxT49g==
X-CSE-MsgGUID: NM6Q4olwTvOB7sGgbk20FA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 19:47:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BF20F41FB5B3;
	Tue, 28 Jan 2025 19:47:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 06/13] irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
Date: Tue, 28 Jan 2025 10:46:56 +0000
Message-ID: <20250128104714.80807-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rzv2h_icu_init() by using devm_pm_runtime_enable().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit header.
 * Replaced 'goto put_dev' by 'return ret' as put_device() called by
   devm_add_action_or_reset().
v2:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzv2h.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 95df8e0755e3..0211fd936514 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -468,11 +468,16 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 		return ret;
 	}
 
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "devm_pm_runtime_enable failed, %d\n", ret);
+		return ret;
+	}
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d\n", ret);
-		goto pm_disable;
+		return ret;
 	}
 
 	raw_spin_lock_init(&rzv2h_icu_data->lock);
@@ -493,8 +498,6 @@ static int rzv2h_icu_init(struct device_node *node, struct device_node *parent)
 
 pm_put:
 	pm_runtime_put(&pdev->dev);
-pm_disable:
-	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.43.0


