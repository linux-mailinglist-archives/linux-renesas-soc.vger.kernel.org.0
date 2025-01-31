Return-Path: <linux-renesas-soc+bounces-12790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F867A23D25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8560188BCE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0973C1C1F1F;
	Fri, 31 Jan 2025 11:29:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1423E1C07C4;
	Fri, 31 Jan 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322945; cv=none; b=e0wH7nFP1kdnO1FxS8UpffplugfBOfng0mFyZbHFqkaX4KOR9byyidy7eSWalGjQQIrtrYyeJ0+kuoP6GhEPE8QvL89Ac7FRsCtX8k0/72E8rFx6LYQYaE5nlckmkKuwwWxq/KMfH9Z6yvhLtCXmaS50BhzSE3hn4oqRpoj3+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322945; c=relaxed/simple;
	bh=lsJZzSjFldpjIYJOW3WkoCChEKLYHsyTqSyAnjTr5t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rv9sNRUhoUdu7naN+zx1bQ+G3047LVrvLhqGoiGgm2dnyqfnlA8TZSF5imh+C5YDtWq39ozhmcU2nz1c/Lo1bszzNXSt9wIwIqB7mUqEoN+9eTgrtDpo23pM8i/lc7urEA54rMY1wcuZjuoKo9kS3Augm7uBvTqggIDMXUDRtSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GMbPr32MQ8uJTo77dglNZQ==
X-CSE-MsgGUID: KlzpA1WURnSx6mcHbSRfFA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jan 2025 20:29:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 517D942E445C;
	Fri, 31 Jan 2025 20:28:52 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v2 2/8] mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
Date: Fri, 31 Jan 2025 11:28:45 +0000
Message-ID: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arrange local variables in reverse xmas tree for probe().

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tags.
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f73b84bae0c4..6ea651409774 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -910,8 +910,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct renesas_sdhi_quirks *quirks)
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
-	struct tmio_mmc_data *mmc_data;
 	struct renesas_sdhi_dma *dma_priv;
+	struct tmio_mmc_data *mmc_data;
 	struct tmio_mmc_host *host;
 	struct renesas_sdhi *priv;
 	int num_irqs, irq, ret, i;
-- 
2.43.0


