Return-Path: <linux-renesas-soc+bounces-18013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694ABAD2EAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CF81171529
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 07:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1300E197A88;
	Tue, 10 Jun 2025 07:31:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D3625E479;
	Tue, 10 Jun 2025 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540667; cv=none; b=ejlQo6GMtWKHHrPl9Q4RY19GXiyH0EkmD6iVAkIORpscOzOeo8hAA3nBq0UU4YYnPbJgpv8OwHcgLfFhHuAKXYcHnJu9V4De75G8/beyzk6RA6PZ6kXQ8zbK6vDMU3v1fzc+u3lCyv4dJG1hvE8VHnjau5hlaf2vaaQuzyaRzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540667; c=relaxed/simple;
	bh=sl/Jer9SlFDqqCrXwL9SyWXcyXuHCXE0oRjjAb8NyN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kY+1pKzsEq7B/VAlDVYTGHybcH/+JVx3p1iTeK04R48LvnvYCY39KNxP20Xkvkd29GxlR7IDuBTZJziRUY1MxOaGwlmqTbKhIaokJP4Ig+lz6ZJr+0aCV4RhZ+kwIjBvYSq8fat/Y+UY0vCjlN8MIE5oXlO8+wmt5CZ1zrPTYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 7DguW4f4QpGi06t6esroBg==
X-CSE-MsgGUID: q0s7tISTTni3GfV+tG1kPw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2025 16:25:54 +0900
Received: from shimoda-ggear.. (unknown [10.166.13.45])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EF6904178CD3;
	Tue, 10 Jun 2025 16:25:54 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] mmc: host: tmio: Add .sdio_irq()
Date: Tue, 10 Jun 2025 16:25:44 +0900
Message-ID: <20250610072545.2001435-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
References: <20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas SDHI controller requires vender specific handling when
an SDIO irq occurs. So, add .sdio_irq() to the tmio core.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 41787ea77a134..717594a3dc698 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -193,6 +193,7 @@ struct tmio_mmc_host {
 	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	unsigned int (*get_timeout_cycles)(struct tmio_mmc_host *host);
+	void (*sdio_irq)(struct tmio_mmc_host *host);
 
 	const struct tmio_mmc_dma_ops *dma_ops;
 };
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index b71241f55df57..d16aa0017e8c5 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -696,8 +696,11 @@ static bool __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
 
 	sd_ctrl_write16(host, CTL_SDIO_STATUS, sdio_status);
 
-	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
+	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ) {
+		if (host->sdio_irq)
+			host->sdio_irq(host);
 		mmc_signal_sdio_irq(mmc);
+	}
 
 	return ireg;
 }
-- 
2.43.0


