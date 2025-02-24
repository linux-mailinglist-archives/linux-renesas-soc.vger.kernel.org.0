Return-Path: <linux-renesas-soc+bounces-13578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43BA4202A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A29AF7ABDCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174B523BD16;
	Mon, 24 Feb 2025 13:13:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C39823BD1C;
	Mon, 24 Feb 2025 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402795; cv=none; b=L66QzssOLs/BoNKLsAKXKv0YR3lWCfkwXVQow5Br7X4/84Ug7E9H3EsOFnYBivhZg7ybtxuav/tuK82Jri9FHUjEnmMK2Y+DmI/WAnhsF4xlkhRO0y+Eze5SvSiWQiw67I1yLRYhY3UF4+AXBmchFwX1qRV+/V/gklIIl6vnde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402795; c=relaxed/simple;
	bh=WAJR8x2EpfE32DKv2HxvwThe9/mAvgaXgzCVvYr6vto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MN32q1w/L4xrGIcoPEKKVWfWYLm633QU9ssZ69sW2X6CjU1EIwrAZGeapUaFYUSel37Y7HgRhsDUiM/2/cDL2i/05C9Qfvn3GjIq+2DByfzzar3SuGbaJZlhgxomahRHJDIZPPjwjZqJmyFnJjKhJzwclPdCtarVcz7Rbu96nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: QdzH9puzQ+aATfoWOGibFw==
X-CSE-MsgGUID: p+cn56RLRLaKZd6LSyEcow==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 62592400F319;
	Mon, 24 Feb 2025 22:13:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 02/12] irqchip/renesas-rzv2h: Fix wrong variable usage in rzv2h_tint_set_type()
Date: Mon, 24 Feb 2025 13:11:18 +0000
Message-ID: <20250224131253.134199-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable tssel_n is used for selecting TINT source and titsel_n for
setting the interrupt type. The variable titsel_n is wrongly used for
enabling the TINT interrupt in rzv2h_tint_set_type(). Fix this issue by
using the correct variable tssel_n.

While at it, move the tien variable assignment near to tssr.

Fixes: 0d7605e75ac2 ("irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU) driver")
Cc: stable@vger.kernel.org
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdU3xJpz-jh=j7t4JreBat2of2ksP_OR3+nKAoZBr4pSxg@mail.gmail.com
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Added Reported-by tag and Cced stable@vger.kernel.org.
v5:
 * New patch
---
 drivers/irqchip/irq-renesas-rzv2h.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index fe2d29e91026..f6363246a71a 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -301,10 +301,10 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
 
 	tssr_k = ICU_TSSR_K(tint_nr);
 	tssel_n = ICU_TSSR_TSSEL_N(tint_nr);
+	tien = ICU_TSSR_TIEN(tssel_n);
 
 	titsr_k = ICU_TITSR_K(tint_nr);
 	titsel_n = ICU_TITSR_TITSEL_N(tint_nr);
-	tien = ICU_TSSR_TIEN(titsel_n);
 
 	guard(raw_spinlock)(&priv->lock);
 
-- 
2.43.0


