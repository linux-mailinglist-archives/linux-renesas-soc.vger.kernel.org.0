Return-Path: <linux-renesas-soc+bounces-8848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6597028C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2024 15:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405D21C21732
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2024 13:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C3115CD60;
	Sat,  7 Sep 2024 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SYH5bcSp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8C1591F1;
	Sat,  7 Sep 2024 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725717549; cv=none; b=h71TXYzU1+sjeV4bNgekHBqvQQ7nM51ucL6iOPcj02lLD4LUFet0W7U2wlUtLUtmbqZFVy0idbX4/YRgoo964dju1Zps4iERVTVkD3oZ1eFbbkitAwRpKAk5cGWEtqpy9ZHyyhB/i2rCC3MniZhjOxob9YNqYBhcUlB/gJAgSuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725717549; c=relaxed/simple;
	bh=SqANuviM84Av24qoAk3zFpgfL+6iOF2E8YUfIHlf9hU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XI79+ZI2ZFTYSI5K3iIJk52un48/aD+YSt6AaCIiry6iP/v7gLCS04DyTgt89HcBjxftjvZcUQO3xfAzMrUHd4kSpJ+zP3tcW+E6GYtWZW5dodaYdeGdHtEjnC7VHTJa/X4P8g+zVIbRSpsLqxVsvpQ4ERg+dgpuS2LVblZyG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SYH5bcSp; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mvxns88H1730VmvxnssasU; Sat, 07 Sep 2024 15:58:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725717539;
	bh=32/HoL3jcmr5qRrQpL/j/PmxL/AzMzQm8GZ2DrNSaj4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SYH5bcSp2M88X2ZraPu/u7TNfNAsBTnp3PHyY7KTnJpgeDHJDgOJdwMleML/RCM58
	 wVqvs1uFJBfqUofUptcQdrPCKyBOINK5cBXlT6QxlW4lOs40BM3w+VRNqa1nGHpPsq
	 i9OKzavdcUxMthx0qta40gM4byrjb1/YLLnM5nnTG9SkzwicwGDthFJn27R2uESweG
	 Fs7o21d0MoH5p2ukXIuoUjt+xLsIW4ScdGhPiaKx8UfO6pNBXZ72qz0L5MCMtr4xWm
	 hrw28A1sZ//tzKXXBzQTULG1wh0td2A1WlhwAh7usAgCJ2cSiUduHuh/WJEwI/CbH4
	 TkRgu9Ti7d+5Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 15:58:59 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Sat,  7 Sep 2024 15:58:52 +0200
Message-ID: <4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after the rcar_gen3_phy_usb2_init_bus(),
reset_control_assert() must be called, as already done in the remove
function.

This is fine to re-use the existing error handling path, because even if
"channel->rstc" is still NULL at this point, it is safe to call
reset_control_assert(NULL).

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - Re-use 'error' to simplify the patch   [claudiu beznea]
  - Update the commit description to explain why it is safe.

v1: https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr/
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 58e123305152..ccb0b54b70f7 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -803,6 +803,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	return 0;
 
 error:
+	reset_control_assert(channel->rstc);
 	pm_runtime_disable(dev);
 
 	return ret;
-- 
2.46.0


