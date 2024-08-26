Return-Path: <linux-renesas-soc+bounces-8224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7C95ED61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECD40B21BC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748FF146588;
	Mon, 26 Aug 2024 09:36:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB3A12BF25;
	Mon, 26 Aug 2024 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664963; cv=none; b=JGayEDtZKMgxUBHHbz2pS4NrMBWDNLjxAaYixfNDbnhBzBvF0p+ErqtjPPeS8X+WcprGEb7u3RMO5WoeAD18Eepd45EyY3ua8EzopPAshNfuzbSr5VQ1sUoMuhFHb1bFHG3IigjEHL0tPhd8pYIVFJd4jmT7zZk9rMS7xvQf068=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664963; c=relaxed/simple;
	bh=df5D92/twkTlA+QLMEAQkUMWu59nT3h+JvEl8ZoQRgU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWcG54Bn/CI69+yzqWtxfzg5SJpU+LYTNhklLSldNiPUpMIDtTWMfe63MyF80RNBgVJzvitHEU+ZYoyWwCGsS0RpMvxvbbHLkC3FCiondsGToHcEzMAPqf+Q7EJ/F8GocxCUI3MH3WbgYRLDF/XCrNAU26rViJs09mQ01RCu+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WslmH2tT2z69Ly;
	Mon, 26 Aug 2024 17:31:11 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id E1569140258;
	Mon, 26 Aug 2024 17:35:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:35:57 +0800
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
Subject: [PATCH -next RESEND 02/10] mtd: rawnand: cadence: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:43:20 +0800
Message-ID: <20240826094328.2991664-3-ruanjinjie@huawei.com>
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
from the loop by using for_each_child_of_node_scoped().

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index ff92c17def83..3bc89b356963 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2836,7 +2836,6 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 static int cadence_nand_chips_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	struct device_node *np = cdns_ctrl->dev->of_node;
-	struct device_node *nand_np;
 	int max_cs = cdns_ctrl->caps2.max_banks;
 	int nchips, ret;
 
@@ -2849,10 +2848,9 @@ static int cadence_nand_chips_init(struct cdns_nand_ctrl *cdns_ctrl)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(np, nand_np) {
+	for_each_child_of_node_scoped(np, nand_np) {
 		ret = cadence_nand_chip_init(cdns_ctrl, nand_np);
 		if (ret) {
-			of_node_put(nand_np);
 			cadence_nand_chips_cleanup(cdns_ctrl);
 			return ret;
 		}
-- 
2.34.1


