Return-Path: <linux-renesas-soc+bounces-13094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37689A32E9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45451167324
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A8F264A6F;
	Wed, 12 Feb 2025 18:21:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F329726462F;
	Wed, 12 Feb 2025 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384461; cv=none; b=GMoKSsmuct2Fi0EDpxfBF7EUFx9Ln7LEJj8pWr7zhsCNOqZW9QH4ktMlqM2oFvaqoRjG3LXs2SyMYRgqm8heCuQr6UA5nwr9UIT6WgtKquBc5oS0YxjyQXHPwVq0v0/1WISSGjn1Vhm7Gr/RrYJSvIBy8yDIfueYbuRixZWCyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384461; c=relaxed/simple;
	bh=XFgVlilpPcizsEJqTDprU+/YZfTGT7N7YhVyrC1dGKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PtrzzUmr7zPDOvk9J3rZdJgRpMrVyvPJSnR9Rhdmwm0BJBSbNfg9fXTqBEF0SF/tNynmq37E9u2ocVrtlxgSDdz6/QCgh/+4Mpfxe/PztSNDt7zDTq4xaOr12Uoabih8C+CW1gaBc3OMz+ArQ0p1WsLMmpFMtRmXAgX4qIKefo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 1D62Ph5uQFq/r5wBIN9lbQ==
X-CSE-MsgGUID: n7G5hOMMScC+aj+Ec+1ZKQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:59 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C1624019C77;
	Thu, 13 Feb 2025 03:20:57 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/6] irqchip/renesas-rzg2l: Simplify checks in rzg2l_irqc_common_init()
Date: Wed, 12 Feb 2025 18:20:34 +0000
Message-Id: <20250212182034.366167-7-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both devm_pm_runtime_enable() and pm_runtime_resume_and_get()
return 0 or a negative error code.

Simplify the checks done with their respective return values
accordingly.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 0e79deccda6d..88a280291b92 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -564,11 +564,11 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 				     "failed to acquire deasserted reset: %d\n", ret);
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret, "devm_pm_runtime_enable failed: %d\n", ret);
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret, "pm_runtime_resume_and_get failed: %d\n", ret);
 
 	raw_spin_lock_init(&rzg2l_irqc_data->lock);
-- 
2.34.1


