Return-Path: <linux-renesas-soc+bounces-6563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC13910A23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EFB1F22787
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE9C1B0100;
	Thu, 20 Jun 2024 15:39:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87FA1B013D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897999; cv=none; b=GAsetmyxYm0kPgOBhz8bA2h1W+Ge8mJtOh+0oyYKDupsReNrz/eSVVGptyHxqMuE22k44TM4YXSPSbm4KpjTZwxbxnCFGw9e6VlOJ9GPribgxQ2cAFzP03EsIwmjTRVV/94Z2VAThGo1F+ntQz8ExnrxmvKwTyjNkKu/yiprQkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897999; c=relaxed/simple;
	bh=+pCPQOwZ4goEl17+gE0wRx2tGE+ovtbPspVmKKlAWtM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTX2muE9rff8OJsL4h3nHa+UjWKpOGX/oui1BZSqHmVDm48P1zyROsXj4ED1zjs+pn9bUeL4jXgflUfjEV/YKnKRDSsPg50x1Qx33EjhoW916CnhdORuaJrtTrdf7pTEqJ6O1nJ2ga9zgfXTw0a4phLvRrUl4VEeE3YbdRNnqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by michel.telenet-ops.be with bizsmtp
	id drfo2C00R0Y0hZi06rfouL; Thu, 20 Jun 2024 17:39:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-0005LX-P5;
	Thu, 20 Jun 2024 17:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-000LnX-N7;
	Thu, 20 Jun 2024 17:39:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] mmc: tmio: Remove obsolete .set_pwr() callback()
Date: Thu, 20 Jun 2024 17:39:46 +0200
Message-Id: <fbbc13ddd19df2c40933ffa3b82fb14841bf1d4c.1718897545.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718897545.git.geert+renesas@glider.be>
References: <cover.1718897545.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ca78476e4888f1f1 ("mfd: Remove toshiba tmio drivers") removed the
last users of the .set_pwr() callback in the tmio_mmc_data structure.
Remove the callback, and all related infrastructure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Laurent tried this before in commit 3af9d15c719017fe
("mmc: tmio-mmc: Remove .set_pwr() callback from platform data"),
but it had to be reverted in commit 9d731e7539713acc ("Revert
"mmc: tmio-mmc: Remove .set_pwr() callback from platform data"")
because there were still users at that time.
---
 drivers/mmc/host/tmio_mmc.h      | 3 ---
 drivers/mmc/host/tmio_mmc_core.c | 8 --------
 include/linux/mfd/tmio.h         | 1 -
 3 files changed, 12 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index de56e6534aeaaa10..2af5730c21f4a98d 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -139,9 +139,6 @@ struct tmio_mmc_host {
 	struct mmc_host         *mmc;
 	struct mmc_host_ops     ops;
 
-	/* Callbacks for clock / power control */
-	void (*set_pwr)(struct platform_device *host, int state);
-
 	/* pio related stuff */
 	struct scatterlist      *sg_ptr;
 	struct scatterlist      *sg_orig;
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 93e912afd3ae5aa0..7b4256f0cbe77028 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -880,9 +880,6 @@ static void tmio_mmc_power_on(struct tmio_mmc_host *host, unsigned short vdd)
 
 	/* .set_ios() is returning void, so, no chance to report an error */
 
-	if (host->set_pwr)
-		host->set_pwr(host->pdev, 1);
-
 	if (!IS_ERR(mmc->supply.vmmc)) {
 		ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, vdd);
 		/*
@@ -916,9 +913,6 @@ static void tmio_mmc_power_off(struct tmio_mmc_host *host)
 
 	if (!IS_ERR(mmc->supply.vmmc))
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
-
-	if (host->set_pwr)
-		host->set_pwr(host->pdev, 0);
 }
 
 static unsigned int tmio_mmc_get_timeout_cycles(struct tmio_mmc_host *host)
@@ -1160,8 +1154,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeout_cycles)
 		_host->get_timeout_cycles = tmio_mmc_get_timeout_cycles;
 
-	_host->set_pwr = pdata->set_pwr;
-
 	ret = tmio_mmc_init_ocr(_host);
 	if (ret < 0)
 		return ret;
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index aca74ac1ff69e6f7..8c09d14a3a286ca0 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -100,7 +100,6 @@ struct tmio_mmc_data {
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
-	void (*set_pwr)(struct platform_device *host, int state);
 };
 
 /*
-- 
2.34.1


