Return-Path: <linux-renesas-soc+bounces-8959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C49791FC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 18:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B7072837B6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A151781741;
	Sat, 14 Sep 2024 16:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dFLl+TTw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F71D0DC1
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726330075; cv=none; b=Ql9kySZ1H79s3QhPPL5yI60u14xx9APiXWk58QTIqpVYKymdASvGh1yl4Q5KW6gAdIjtSdh72ipNd2axpbGJR0e9T2HvY3KE/HONwlpPsqkXjLwxJlJw9h0otEZ3vhVZbn2fXJTc0AMzpsr0rjQGqGLbgsq281bbXN5M+aU3Lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726330075; c=relaxed/simple;
	bh=4sBx9Pok9ci2U6rCdVYCCf2eawSqaEDxsKn9nhdoqx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCY415sZVP0M3BUhjgRP0g8TiiUF7PgODBt9fAzfxVc7Vi9/Gd6bJzQgFW5TmV3m/Gz49NqRzq0FOgllf1iNZQXhDAA42X3k2GW+6oKhKq3DuFtSebjESpjJN78fSRRf67v5JPTEUVAW/VJXi0yHChlYIrZMT4dwwv+zh8vmeJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dFLl+TTw; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pVJIseX6XZkdcpVJIsxPA7; Sat, 14 Sep 2024 18:07:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726330066;
	bh=3K7AI48QI2FbNvgXLRmIkhjGNi47KFNECaCiYHSyQbw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dFLl+TTwv3G1/KfT9nw1cqsJ+7ILIdiOX2VCQMiLqGRNUDl1yEJEfSeqv7R6W/9SB
	 g+xbrqxkuVQzAs3hipVm8DwhRzdtN4Q9wvoHhWkZkFTrQG62/uNXrG/XDaMXOgWiYP
	 dKwmHdpvr82dD2gDK5iKCnn66GGNJnYZ2kgnatiZ8p6yspye+TEffcDPth75+dfpfo
	 k6Ruxq0iQjTzUaeFdSSK2RjgzrZGid+N3yGCKVE6GoDEXiBVoFOFLq+p4SMcVAuPak
	 cHn3iLLJmWR5sl9GTOkXO54JkPM9Gj2VnL0Rv0IDL1lMwezXTTMf3P2Z8TdAorbZam
	 6vfeMBY5QEhmg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Sep 2024 18:07:46 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Sat, 14 Sep 2024 18:07:24 +0200
Message-ID: <290b25827e3f0742808940719455ff0c5cb9d01d.1726329925.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after the reset_control_deassert(),
reset_control_assert() must be called, as already done in the remove
function.

Use devm_add_action_or_reset() to add the missing call and simplify the
.remove() function accordingly.

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch changes the order of function calls when releasing the resources
in the .remove function(). Looks fine to me, but pm_ functions are
sometimes tricky.

Changes in v3:
  - Use devm_add_action_or_reset()   [Biju Das]

Changes in v2: (broken proposal)
  - Re-use 'error' to simplify the patch   [claudiu beznea]
  - Update the commit description to explain why it is safe.
v2: https://lore.kernel.org/all/4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr/

v1: https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr/
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 58e123305152..c8a3727f56aa 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -668,6 +668,13 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 	return candidate;
 }
 
+static void rcar_gen3_reset_assert(void *data)
+{
+	struct reset_control *rstc = data;
+
+	reset_control_assert(rstc);
+}
+
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
@@ -686,6 +693,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	if (ret)
 		goto rpm_put;
 
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
+				       channel->rstc);
+	if (ret)
+		return ret;
+
 	val = readl(channel->base + USB2_AHB_BUS_CTR);
 	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
 	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
@@ -815,7 +827,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
-	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.46.0


