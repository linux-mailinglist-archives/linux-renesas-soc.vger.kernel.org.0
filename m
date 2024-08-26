Return-Path: <linux-renesas-soc+bounces-8229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9CB95ED6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D07961C21C2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EE814A084;
	Mon, 26 Aug 2024 09:36:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5A1487EB;
	Mon, 26 Aug 2024 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664969; cv=none; b=fxKS5c6uN46BOyu6fsYFkI+zYKIAZ5IQHEPM6E+DkzeQeZLMmfuxw94JDm3vHibImewdgGH5WqWXkCC1Xgl04ErP4rebj1hIDRt8TavyRAfsKmAAiCfKJRcGGHFB4JCgiYo7h2HGQZ+lXUi0azM1SJZFQAV2TfyBcfscNmU7IGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664969; c=relaxed/simple;
	bh=BizNWYM6Kr4faisHfJ7LjecVmx3Bm/gbwgObz66plVQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/OgAYfo4Eoz0sNh3m5Ff5l6JLIUN3p4x25zoRopb6zOA84h7ZAkcG9sMCPpNMbDWiT+lvnrsY68iYibzy6az8RsLS0acDN67UW7uZ0z7C4++fDXs3YThW9p8pCCYb6VJLdN5xUfYgZn/Y2gVeqy+9+eAOe9lVE6MYhMJuxMalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wslsh577Jz1j7Gv;
	Mon, 26 Aug 2024 17:35:52 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FFC4140120;
	Mon, 26 Aug 2024 17:36:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:35:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <miquel.raynal@bootlin.com>, <michal.simek@amd.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<ruanjinjie@huawei.com>, <gustavoars@kernel.org>, <linux@treblig.org>,
	<robh@kernel.org>, <u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
	<jic23@kernel.org>
Subject: [PATCH -next RESEND 04/10] mtd: rawnand: marvell: drm/rockchip: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:43:22 +0800
Message-ID: <20240826094328.2991664-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 5b0f5a9cef81..26648b72e691 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2771,7 +2771,6 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 static int marvell_nand_chips_init(struct device *dev, struct marvell_nfc *nfc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *nand_np;
 	int max_cs = nfc->caps->max_cs_nb;
 	int nchips;
 	int ret;
@@ -2798,20 +2797,15 @@ static int marvell_nand_chips_init(struct device *dev, struct marvell_nfc *nfc)
 		return ret;
 	}
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		ret = marvell_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
-			of_node_put(nand_np);
-			goto cleanup_chips;
+			marvell_nand_chips_cleanup(nfc);
+			return ret;
 		}
 	}
 
 	return 0;
-
-cleanup_chips:
-	marvell_nand_chips_cleanup(nfc);
-
-	return ret;
 }
 
 static int marvell_nfc_init_dma(struct marvell_nfc *nfc)
-- 
2.34.1


