Return-Path: <linux-renesas-soc+bounces-5548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5338D1F9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7542CB22F1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC47C17334E;
	Tue, 28 May 2024 15:04:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624C8172BDF;
	Tue, 28 May 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908645; cv=none; b=U23yqa4TNXrEb42I5eafcBhMMtcOaAkG9GwFOP+JFknAGv0JxgBPQMWodZ/p/86tmE3ZGnE7GC2x5jSLA6NRQI9iGd+7vOoyn7MDcl+uqsjF/sNCS+xrwO4uOD+LkQsc7o5wtzBfcUBw2yxWKT5qwKQR+0bsX4jHa+0+GO61iWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908645; c=relaxed/simple;
	bh=EnUGL5IKsUeT6sWwOIOtdHqyp1aMQvEuMBahq08UmYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+l6savYYvvrHm+6HK4WH5IP36fBdDeoGMijYLSZbR8MDk/7G8Nb2Mw7MgXvduih850ox3Loec7QdVm2zE4ypA1xg7EN9nQLQ+doQyqJ+ibRAMJfcD7SISDO1rjylxVccP5P3SXXto2LsPXBXbwymVMndU6nxJF2ZfbAL2a2jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="209903727"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 May 2024 00:03:59 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D5CA7400CF1E;
	Wed, 29 May 2024 00:03:54 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v4 2/7] net: ravb: Consider busypolling status when re-enabling interrupts
Date: Tue, 28 May 2024 16:03:34 +0100
Message-Id: <20240528150339.6791-3-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the busypolling status returned from NAPI complete to decide
if interrupts shall be re-enabled or not. This is useful to reduce the
interrupt overhead.

While at it switch to using napi_complete_done() as it take into account
the work done when providing the busypolling status.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
Changes v3->v4:
  * Used Niklas' suggested commit message.

 drivers/net/ethernet/renesas/ravb_main.c | 26 ++++++++++--------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 193ad05383a8..472aa80002be 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1341,23 +1341,19 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	if (priv->rx_fifo_errors != ndev->stats.rx_fifo_errors)
 		ndev->stats.rx_fifo_errors = priv->rx_fifo_errors;
 
-	if (work_done == budget)
-		goto out;
-
-	napi_complete(napi);
-
-	/* Re-enable RX/TX interrupts */
-	spin_lock_irqsave(&priv->lock, flags);
-	if (!info->irq_en_dis) {
-		ravb_modify(ndev, RIC0, mask, mask);
-		ravb_modify(ndev, TIC,  mask, mask);
-	} else {
-		ravb_write(ndev, mask, RIE0);
-		ravb_write(ndev, mask, TIE);
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		/* Re-enable RX/TX interrupts */
+		spin_lock_irqsave(&priv->lock, flags);
+		if (!info->irq_en_dis) {
+			ravb_modify(ndev, RIC0, mask, mask);
+			ravb_modify(ndev, TIC,  mask, mask);
+		} else {
+			ravb_write(ndev, mask, RIE0);
+			ravb_write(ndev, mask, TIE);
+		}
+		spin_unlock_irqrestore(&priv->lock, flags);
 	}
-	spin_unlock_irqrestore(&priv->lock, flags);
 
-out:
 	return work_done;
 }
 
-- 
2.39.2


