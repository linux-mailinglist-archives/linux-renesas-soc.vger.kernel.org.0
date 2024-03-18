Return-Path: <linux-renesas-soc+bounces-3837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5B87E53C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF38E1F210B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 08:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573A328DA6;
	Mon, 18 Mar 2024 08:50:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2397A24A12
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710751859; cv=none; b=J5U3B2hzuxPN4G+Gv0k4pVYK8AaQHvVnRKzo42zTmG1Ga5/+61qum2YfACj2XtXtnDIM104M6KZWLUiOrRtU/GupnuSV2byrVLcN/qryScn1BGRcvccNuLjm58m/o5QrROJUkMoDfqlySvqG2D8NOOvUNsQ4n7hUM93ZYJdnr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710751859; c=relaxed/simple;
	bh=fVJfVhGCu12qSD2zfJVVyxL9UrDjZp+J+lNVeMMfdb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CmxQQVKUQ59ifpi9bF0f5S4iQN5bIlAYSodd0Bij0dSJcv2IpSqJhm8tRD4j0n4WaW59SPhOkMW9IhNXP8M5iePjWMhxG7LTRHUEANBH4Wk4ZgdQWL+6QAnp77M3gN0DjpgCSBSuoErVgME3D0YkNzzS/EkjWVBw6GY6pi6djYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198171091"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2024 17:50:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A270400448F;
	Mon, 18 Mar 2024 17:50:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same time
Date: Mon, 18 Mar 2024 08:50:40 +0000
Message-Id: <20240318085041.3150-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318085041.3150-1-biju.das.jz@bp.renesas.com>
References: <20240318085041.3150-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the hardware team, TIEN and TINT source should not set at the same
time due to a possible hardware race leading to spurious IRQ.

Currently on some scenarios hardware settings for TINT detection is not in
sync with TINT source as the enable/disable overrides source setting value
leading to hardware inconsistent state. For eg: consider the case GPIOINT0
is used as TINT interrupt and configuring GPIOINT5 as edge type. During
rzg2l_irq_set_type(), TINT source for GPIOINT5 is set. On disable(),
clearing of the entire bytes of TINT source selection for GPIOINT5 is same
as GPIOINT0 with TIEN disabled. Apart from this during enable(), the
setting of GPIOINT5 with TIEN results in spurious IRQ as due to a HW race,
it is possible that IP can use the TIEN with previous source value
(GPIOINT0).

So, just update TIEN during enable/disable as TINT source is already set
during rzg2l_irq_set_type(). This will make the consistent hardware
settings for detection method tied with TINT source and allows to simplify
the code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Split the patch into 2. first one avoids setting TIEN and TINT source
   together and later patch simplifies the code.
 * Updated commit header and description.
v1->v2:
 * Merged patch#4 and #5 and updated commit description.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 8803facbb3a2..ae67fec2ab46 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -151,7 +151,7 @@ static void rzg2l_irqc_irq_disable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg &= ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
+		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
 	}
@@ -163,7 +163,6 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d);
 
 	if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ) {
-		unsigned long tint = (uintptr_t)irq_data_get_irq_chip_data(d);
 		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 		u32 offset = hw_irq - IRQC_TINT_START;
 		u32 tssr_offset = TSSR_OFFSET(offset);
@@ -172,7 +171,7 @@ static void rzg2l_irqc_irq_enable(struct irq_data *d)
 
 		raw_spin_lock(&priv->lock);
 		reg = readl_relaxed(priv->base + TSSR(tssr_index));
-		reg |= (TIEN | tint) << TSSEL_SHIFT(tssr_offset);
+		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
 		writel_relaxed(reg, priv->base + TSSR(tssr_index));
 		raw_spin_unlock(&priv->lock);
 	}
-- 
2.25.1


