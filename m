Return-Path: <linux-renesas-soc+bounces-8961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B453E97923B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 19:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2381C212E9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 17:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F02F1CF5E1;
	Sat, 14 Sep 2024 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XFXCeKKS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196817BCA
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726333381; cv=none; b=u3FL0/MRyif+xFgTrHRAkqHvCqQtiRnyWF+eGufZahygiJjZ97s4t6UWHB406AluVI5C6/kgC1OpvF/lksoPzLL+9dI3RYQNE1AEno0KMrg4hiI6OSHgceguYOPzrl9VhMomak33+e+sCAhz1IvK08lLER5u9mVjqjplX5vvPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726333381; c=relaxed/simple;
	bh=CfOgQpo0wd5FNYZlcNhUIiMkd4jJ7pzoQSKISw4XJu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EmyeGJphRIrKDjGynAAkdyvZznYMt05ZSKxmKWU7T7o21C36lcunDOp8Zx7Rufl5Y5W8Jnb1dLtQPbqypGPlIgmwNo3CVgd7rmJ4ESH7pyx2NJxZ9QY7yVCzsWw4PPXVnTUZb5yP16pJtW6KNWA1flZ53uzB1NaYXb+MQ188CFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=XFXCeKKS; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pWAYsZyXRERiZpWAZsSBCx; Sat, 14 Sep 2024 19:02:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726333371;
	bh=9mmHPrhPQ42BfgqjlGF5PD7LXLG84dsNAms6oZMuxi8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XFXCeKKSgs/6kEZR+yw8/6YixXB2Ry4EgFcEoDs730RFo8/mVKjYYcz769o/M9usl
	 f3ZanConqPx6SBi2+cViQDQZgqiOisduInT/PDD1obuCa4A43nilp+v6UEp42Gaec0
	 X+OgTrPmaqVmnt4o8hDlW/z80AscVjI+RP6PZ2Kx58FQecBcWvp1whSasZxOQquz/W
	 r6bu1QH553Bu4oGAzJDQQG/ykTgGI3BLxLlnoVXl/YUXarNqd0BJpCO9CJ4Ts+Qiy4
	 JQYAWQpX/SKoAXurjVrUcjqZwBcvGodhJrniBkVkxpdSuBXQqX/QjFPSXRJQ8agSrE
	 Ir6aUFAU5jaQw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Sep 2024 19:02:51 +0200
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
Subject: [PATCH v4] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Sat, 14 Sep 2024 19:02:44 +0200
Message-ID: <1457c401e3cdf792c5170f5c703cb24de137c19a.1726333335.git.christophe.jaillet@wanadoo.fr>
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

Changes in v4:
  - Use the error handling path in rcar_gen3_phy_usb2_init_bus()

Changes in v3:
  - Use devm_add_action_or_reset()   [Biju Das]
v3: https://lore.kernel.org/all/290b25827e3f0742808940719455ff0c5cb9d01d.1726329925.git.christophe.jaillet@wanadoo.fr/

Changes in v2: (broken proposal)
  - Re-use 'error' to simplify the patch   [claudiu beznea]
  - Update the commit description to explain why it is safe.
v2: https://lore.kernel.org/all/4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr/

v1: https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr/
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 58e123305152..f900fe42c311 100644
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
+		goto rpm_put;
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


