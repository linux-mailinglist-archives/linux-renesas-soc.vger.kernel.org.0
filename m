Return-Path: <linux-renesas-soc+bounces-21342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 769DBB4405A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6743A9C95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560CF1917F4;
	Thu,  4 Sep 2025 15:19:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFB1EE019;
	Thu,  4 Sep 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999151; cv=none; b=nL4KwUKYUGzKvEHQ5+CygGCBz6UM9AuGC4adAZNSs5wrn/XGQr3zz4wZ0dSKDyLGaaLmiC+g/Lts6GGYU4nq6hGgkRbVPriUtT3+oMzfaNC34TXK0OKuJhT8wl9flaX27JfMhAmH2ClHu+lyYhFcMI63EVpccyGzk6mb5/HJXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999151; c=relaxed/simple;
	bh=G2vkUllljZiqemcIu9291MJS4HE9A49R/NJIxK0Hheg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZIkAyUi1pYMDSxejp1LdL4n9K4iBWbC1xHrCPy6VsZsdAw76FmLmwaxgYidD0cp+W1wvyW/QhMo7ahb6EULCJ1jJ1ArAyweEOfZzNEsufax+1BQjoFMHYd5NQ5kcxVf3yHhgo0SroQTxlMxiOa/u90EJkOPT68M57ziWsdfEie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11D4C4CEF1;
	Thu,  4 Sep 2025 15:19:07 +0000 (UTC)
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
Subject: [PATCH net-next 1/3] sh_eth: Remove dummy Runtime PM callbacks
Date: Thu,  4 Sep 2025 17:18:56 +0200
Message-ID: <ab2a8bb51eb7d02426f4072c27523c8f41ac1ad4.1756998732.git.geert+renesas@glider.be>
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

Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
->runtime_suspend|resume callbacks"), unassigned
.runtime_{suspend,resume}() callbacks are treated the same as dummy
callbacks that just return zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/sh_eth.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 5fc8027c92c7c95b..0516db9dc946fcdb 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3529,21 +3529,8 @@ static int sh_eth_resume(struct device *dev)
 }
 #endif
 
-static int sh_eth_runtime_nop(struct device *dev)
-{
-	/* Runtime PM callback shared between ->runtime_suspend()
-	 * and ->runtime_resume(). Simply returns success.
-	 *
-	 * This driver re-initializes all registers after
-	 * pm_runtime_get_sync() anyway so there is no need
-	 * to save and restore registers here.
-	 */
-	return 0;
-}
-
 static const struct dev_pm_ops sh_eth_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(sh_eth_suspend, sh_eth_resume)
-	SET_RUNTIME_PM_OPS(sh_eth_runtime_nop, sh_eth_runtime_nop, NULL)
 };
 #define SH_ETH_PM_OPS (&sh_eth_dev_pm_ops)
 #else
-- 
2.43.0


