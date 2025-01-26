Return-Path: <linux-renesas-soc+bounces-12516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE6A1C81D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 14:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CEA4163B29
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 13:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB13613B59B;
	Sun, 26 Jan 2025 13:46:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56ED125A653;
	Sun, 26 Jan 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737899197; cv=none; b=hZkTq8dPko7OiuvOD1+6TCeWnVrOc0qGTyJMR1lTbU6xhcKw4oQ1Yl1cumMnKAkYMarMYnZ4Af+ACerUpWbd6R7RHPrB835vSpcjjrElhnrdmaW8qJch7VfusiT7mRSgF1SENVhTL+GTE5S6fos3n0g/dleej8rdHfGwB9UT7Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737899197; c=relaxed/simple;
	bh=Vb02NKyELnELY3I/yYUO0jXrKgV2rrD3Lff16K8zYn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cATpdITJkiN9/DTHtnT0f7bDAa5peoKrIhfKh8R6qrdKcvMNnJnjRuTjLJEsJQXsjMtV4MvknfvmrxgklPTb6TzXXrd8R49FdQtCaTNicUKii/vmitzQt2446ycjw1lwYqz7uXB+qlETLvSPVxVr17GwgJyr6dGwyGSvf+uuU6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: N1ZWdrq8Qyue9/rPNK8xTg==
X-CSE-MsgGUID: Vcvu0F6pStGLkrXCb2hXVQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2025 22:46:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 137914005016;
	Sun, 26 Jan 2025 22:46:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/7] mmc: renesas_sdhi: Arrange local variables in reverse xmas tree order
Date: Sun, 26 Jan 2025 13:46:05 +0000
Message-ID: <20250126134616.37334-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Arrange local variables in reverse xmas tree for probe().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


