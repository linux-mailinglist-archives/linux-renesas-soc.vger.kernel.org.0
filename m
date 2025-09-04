Return-Path: <linux-renesas-soc+bounces-21343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40647B44053
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794281895F7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF66226520;
	Thu,  4 Sep 2025 15:19:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD801E3DED;
	Thu,  4 Sep 2025 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999152; cv=none; b=FlJveoh+nhX9/G4McUvfALUK2hRZkeHlF4FIf4ToAJ/R7IlQ1bju41SG+wyTnyxVQFXLeF3WXrR/wLq5DqQeLa0HYecr2wSYpVuhWRs8vfGdBZgVl32t6n992DpqhRXYuOpFTBMsYT+xCjPfSMGFfd0pghyeNg/KQ3QE06p6Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999152; c=relaxed/simple;
	bh=bDxQTj17/T7I+25lDgJIxdwc9w7ekXiEm6PvXn74vpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9p4ieHo6mq4GoYZ/TJWJ0ObmM4R9vbV4cikM1LE6+ndxyWnt3Oo5nZ+NxqhtQlcEXVN7/IvGRUro3s1Ui73WzRhRd/rynX9Jvmtoa84u3QcBwke3Hkv1AkCsLN2/NY3OCY+5Znt+BH0jcx9kYBqBRJj/2iXhlgeO8izbQCSvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D6CC4CEF0;
	Thu,  4 Sep 2025 15:19:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next 2/3] sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu,  4 Sep 2025 17:18:57 +0200
Message-ID: <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998732.git.geert+renesas@glider.be>
References: <cover.1756998732.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas SuperH Ethernet driver from an open-coded dev_pm_ops
structure to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets
us drop the checks for CONFIG_PM and CONFIG_PM_SLEEP without impacting
code size, while increasing build coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/sh_eth.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 0516db9dc946fcdb..f16a350736e1aa04 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3443,8 +3443,6 @@ static void sh_eth_drv_remove(struct platform_device *pdev)
 	free_netdev(ndev);
 }
 
-#ifdef CONFIG_PM
-#ifdef CONFIG_PM_SLEEP
 static int sh_eth_wol_setup(struct net_device *ndev)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -3527,15 +3525,8 @@ static int sh_eth_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
-static const struct dev_pm_ops sh_eth_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(sh_eth_suspend, sh_eth_resume)
-};
-#define SH_ETH_PM_OPS (&sh_eth_dev_pm_ops)
-#else
-#define SH_ETH_PM_OPS NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(sh_eth_dev_pm_ops, sh_eth_suspend, sh_eth_resume);
 
 static const struct platform_device_id sh_eth_id_table[] = {
 	{ "sh7619-ether", (kernel_ulong_t)&sh7619_data },
@@ -3555,7 +3546,7 @@ static struct platform_driver sh_eth_driver = {
 	.id_table = sh_eth_id_table,
 	.driver = {
 		   .name = CARDNAME,
-		   .pm = SH_ETH_PM_OPS,
+		   .pm = pm_sleep_ptr(&sh_eth_dev_pm_ops),
 		   .of_match_table = of_match_ptr(sh_eth_match_table),
 	},
 };
-- 
2.43.0


