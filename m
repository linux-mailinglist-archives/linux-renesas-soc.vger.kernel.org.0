Return-Path: <linux-renesas-soc+bounces-24816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33FC6ED50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8E2842E5E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8598435C1BA;
	Wed, 19 Nov 2025 13:19:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33153559CA;
	Wed, 19 Nov 2025 13:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558360; cv=none; b=gRILM/ywpi4FO0i8ZRPiTEIWwHv/5oxAlwWAw+NEPbaJNkERKKda5gNpxZ2/3RXrlvQrm1g9eqXLN3iI/BorBlbvBhB+JH92YLhMg13RdhgAG7H7l8cKqRKc3xPVR1md8Gy25iHZHSZ+7IEi8ArbwkKRVFrd/3A/u6Muz2+t50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558360; c=relaxed/simple;
	bh=QmEVMjN6cev9ZC6lxmipbog95SXHXvqvrO4odpRVcJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uomk9KC2owpsZ1dnp63IzK0EnhquvjIK1/lDQjrGZ2J+ZQmACA6tqIOj5BIgqRUGSYlYwOkcz84cHyfn0ig1SHtd6CSv9x7FPi3xkSxaIzkVonAK+cYs8sTyoqgfp66PtYd2H+feUVTQQhPpu+eFgdRs+PuuTS+1ES1+Z6ckybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D46C2BCB3;
	Wed, 19 Nov 2025 13:19:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of/irq: Handle explicit interrupt parent
Date: Wed, 19 Nov 2025 14:19:11 +0100
Message-ID: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an interrupt controller is used as a proxy, it may have an
"interrupt-parent" property, but lack "interrupts" and
"interrupts-extended" properties.  In that case, the "interrupt-parent"
property in the interrupt controller node is ignored, causing the
interrupt controller to fail to probe, and leading to system boot
failures or crashes.

Fix this by also considering an explicit "interrupt-parent" property in
the interrupt controller node itself.

Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/irq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a68272db9879bedf..f374d8b212b8669c 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
 		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
 		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
 			desc->interrupt_parent = of_irq_find_parent(np);
+		else if (!desc->interrupt_parent)
+			desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
 		if (desc->interrupt_parent == np) {
 			of_node_put(desc->interrupt_parent);
 			desc->interrupt_parent = NULL;
-- 
2.43.0


