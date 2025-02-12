Return-Path: <linux-renesas-soc+bounces-13092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9978A32E95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 19:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568A13A316C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 18:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43B262163;
	Wed, 12 Feb 2025 18:20:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE60263880;
	Wed, 12 Feb 2025 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384456; cv=none; b=JOrosmBAzV7UhNA4hJ1E2CCcoiI0tGDu7YcBkNR3c34zr31cSTC+euWpNsw+z2zCh0ySHAhgFQjPZUZMu2A0odcJIahgAdcfeLgybDRAl+yYT6C/rN9OsWyQsOcaZAS/aoHcQObRm3J1kNkoE9pb1ug/sk32qXXcWTASnrAyqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384456; c=relaxed/simple;
	bh=a112S2t2t+RqzPRqeRSGvpVr7QT7viwC+lEIJWyViG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJw6aOJjn+xWNHpfmIUatqz2ZWZwbxWWGYwWDCj5uViunWqhmTtbXbGZsAMYsT9chLNbHsKtg4zO81dop1kzPUh2pzSrLjHzh/VBNX+V4vYxkymtYCVlODmcl/DXl/md+UXKqYQMH23dsfW9Zo1PAmaq2PsPuY8OBt730E1Icso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: LuopoEAEQw2UDOkkZf7tOw==
X-CSE-MsgGUID: nV+DVoHRRf+4MvGBjn9Dkg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Feb 2025 03:20:54 +0900
Received: from mulinux.example.org (unknown [10.226.93.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 08D87401A44E;
	Thu, 13 Feb 2025 03:20:51 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] irqchip/renesas-rzg2l: Remove pm_put label
Date: Wed, 12 Feb 2025 18:20:32 +0000
Message-Id: <20250212182034.366167-5-fabrizio.castro.jz@renesas.com>
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

No need to keep label `pm_put`, as it's only used once.
Call pm_runtime_put() directly from the error path.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index c024023a1832..0f325ceb0f53 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -586,9 +586,9 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 					      node, &rzg2l_irqc_domain_ops,
 					      rzg2l_irqc_data);
 	if (!irq_domain) {
+		pm_runtime_put(dev);
 		dev_err(dev, "failed to add irq domain\n");
-		ret = -ENOMEM;
-		goto pm_put;
+		return -ENOMEM;
 	}
 
 	register_syscore_ops(&rzg2l_irqc_syscore_ops);
@@ -605,11 +605,6 @@ static int rzg2l_irqc_common_init(struct device_node *node, struct device_node *
 	dev = NULL;
 
 	return 0;
-
-pm_put:
-	pm_runtime_put(dev);
-
-	return ret;
 }
 
 static int __init rzg2l_irqc_init(struct device_node *node,
-- 
2.34.1


