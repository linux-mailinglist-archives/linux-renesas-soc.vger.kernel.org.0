Return-Path: <linux-renesas-soc+bounces-21344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316DB44060
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC9EA0652E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0EF21CC44;
	Thu,  4 Sep 2025 15:19:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98F1E3DED;
	Thu,  4 Sep 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999157; cv=none; b=l1NO3+auj9vu7kCQbM9U1fjf/0cM4iixS+C3dHzsAubivSYe77vOAVBdNPHFl1dj/nzVmsbG4mxH7dNZjXi9ar/ZA1qkRTVOwQqbSBvTjC+CLaOR4B2+XqTtiwEc4eu6LS4SKs0azA636HlYZE+b7XhlpcN51hBzgR/0Kho+nTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999157; c=relaxed/simple;
	bh=NOU3HSewXl6PBb5Jc8CeljhontiS0zUQ35EzFzrw6VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W59zkHV76GvC+AdxBitme4ioxOdYCyD7jd0hKFM3XOziy25DW0FgXvPfjfon3evffDQ7maOkr2wuMj5FZo+3ABS2gjkkus+8N+VS70+tD/uh/wNTPYEBQCitCHT1N+rMZvJL6THutm5k2qo4IpF2Kv/vXtwj7A6O7Kw2qMuvuLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B752C4CEF1;
	Thu,  4 Sep 2025 15:19:12 +0000 (UTC)
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
Subject: [PATCH net-next 3/3] sh_eth: Use async pm_runtime_put()
Date: Thu,  4 Sep 2025 17:18:58 +0200
Message-ID: <77562617360e30a47746e53e392905ea312a2f97.1756998732.git.geert+renesas@glider.be>
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

There is no stringent need to power down the device immediately after a
register read, or after a failed open.  Relax power down handling by
replacing calls to synchronous pm_runtime_put_sync() by calls to
asynchronous pm_runtime_put().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/ethernet/renesas/sh_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index f16a350736e1aa04..5a367c5523bb860f 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2233,7 +2233,7 @@ static void sh_eth_get_regs(struct net_device *ndev, struct ethtool_regs *regs,
 
 	pm_runtime_get_sync(&mdp->pdev->dev);
 	__sh_eth_get_regs(ndev, buf);
-	pm_runtime_put_sync(&mdp->pdev->dev);
+	pm_runtime_put(&mdp->pdev->dev);
 }
 
 static u32 sh_eth_get_msglevel(struct net_device *ndev)
@@ -2447,7 +2447,7 @@ static int sh_eth_open(struct net_device *ndev)
 	free_irq(ndev->irq, ndev);
 out_napi_off:
 	napi_disable(&mdp->napi);
-	pm_runtime_put_sync(&mdp->pdev->dev);
+	pm_runtime_put(&mdp->pdev->dev);
 	return ret;
 }
 
-- 
2.43.0


