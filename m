Return-Path: <linux-renesas-soc+bounces-5958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0CB90025C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 13:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E20AB284A9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 11:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB2D18FDD3;
	Fri,  7 Jun 2024 11:38:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0706C190672
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jun 2024 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760292; cv=none; b=gJKONy92A85SOu51EeDBJrtT3uJeBWu83YpktyRKfKNQVn8G9gYZbrzkRFNtg6Q3N88Sdecbi40dqv52WpVo6VYYS4NCb1N/4xaERS9qk1NnQ6g3eS+fdSAz9Cer+ghrtHXWe/Oy9F1rx50QaQZo8BcXbw/Q2taq6tTNTrdG15o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760292; c=relaxed/simple;
	bh=sUDP76420iyyiGk6Cp9rhDUJbMx+RuHcFC9ZV4JESGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1zVft4Exn+OD3U9DW4RlVbl+5g2GmYlN82yurKtuGBQZGHG2sLW4n4AwDFh5W03hFjOcQYJj01JbNeDQJoUpI7tqO6J6GyRZMqFH9Q5CDECLmrCRPVuGBNXUOInjzP5Sp4f/dp5kMimOT0X+EA92ExDd+VxLgiX3LJH2UEgDQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,220,1712588400"; 
   d="scan'208";a="211042492"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jun 2024 20:38:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9242A40071E8;
	Fri,  7 Jun 2024 20:38:04 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFC v2 3/4] phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection
Date: Fri,  7 Jun 2024 12:37:44 +0100
Message-Id: <20240607113745.73934-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use regmap provided by the regulator driver to control VBUS for RZ/G2L
alike SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Used regulator driver's regmap to handle VBUS.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index fbab6ac0f0d1..90561b6f9597 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -18,6 +18,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
@@ -111,6 +112,7 @@ struct rcar_gen3_chan {
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
+	struct regmap *regmap;
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
@@ -188,6 +190,10 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	if (ch->soc_no_adp_ctrl) {
+		if (vbus)
+			regmap_write(ch->regmap, 0, 0);
+		else
+			regmap_write(ch->regmap, 0, 1);
 		vbus_ctrl_reg = USB2_VBCTRL;
 		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
 	}
@@ -718,7 +724,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	channel->vbus = devm_regulator_get_optional(dev, "vbus");
+	channel->vbus = devm_regulator_get(dev, channel->soc_no_adp_ctrl ?
+					   "usb_vbus" : "vbus");
 	if (IS_ERR(channel->vbus)) {
 		if (PTR_ERR(channel->vbus) == -EPROBE_DEFER) {
 			ret = PTR_ERR(channel->vbus);
@@ -727,6 +734,14 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		channel->vbus = NULL;
 	}
 
+	if (channel->soc_no_adp_ctrl && channel->vbus) {
+		channel->regmap = regulator_get_regmap(channel->vbus);
+		if (IS_ERR(channel->regmap)) {
+			ret = PTR_ERR(channel->vbus);
+			goto error;
+		}
+	}
+
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
-- 
2.25.1


