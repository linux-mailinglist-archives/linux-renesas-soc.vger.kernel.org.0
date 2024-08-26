Return-Path: <linux-renesas-soc+bounces-8222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE695ED52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8EFA2833AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8784213D630;
	Mon, 26 Aug 2024 09:36:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31EA29A2;
	Mon, 26 Aug 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664962; cv=none; b=dYMEEGwc/bpeoavNAuUM+L3pKdrM8Zx4j9/dV9SFSv6Kes9DdcGd0BayUgY1C+CLD2JYGv8GZsztD8izwomlvpnbVjs7L3UNv2s60IuYc1LPFNDOtXYJlX8ex9s+Rwa8ft70VpbnrXDleXs94wIF3GJHGqFy8yI0TfL4FqDN6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664962; c=relaxed/simple;
	bh=B5JjISuUhDdSEtMvWaNuOKcJGyjMgPOBWk6BmNkLtxE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y9cgXvYDalmOWSsgfFZhHC7mn6Emy6dBlCAD1L7nYBOzR/EJPhxQakjjwMeIKBWA/D16cEUoc6+9IX22rFvJzm9EfoqveTAUQqX26Pz24hmmpJDiQ8o8JhEGQ/mhfDynlVK84q5RnmyoYjCIMk88nuj6Ct3Swyjd704GRT6xM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wslsc0FqGz2CnTN;
	Mon, 26 Aug 2024 17:35:48 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id AAF741402E1;
	Mon, 26 Aug 2024 17:35:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 17:35:55 +0800
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
Subject: [PATCH -next RESEND 00/10] mtd: Use for_each_child_of_node_scoped()
Date: Mon, 26 Aug 2024 17:43:18 +0800
Message-ID: <20240826094328.2991664-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Jinjie Ruan (10):
  mtd: rawnand: arasan: Use for_each_child_of_node_scoped()
  mtd: rawnand: cadence: Use for_each_child_of_node_scoped()
  mtd: rawnand: pl353: Use for_each_child_of_node_scoped()
  mtd: rawnand: marvell: drm/rockchip: Use
    for_each_child_of_node_scoped()
  mtd: rawnand: rockchip: Use for_each_child_of_node_scoped()
  mtd: rawnand: meson: Use for_each_child_of_node_scoped()
  mtd: rawnand: mtk: Use for_each_child_of_node_scoped()
  mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
  mtd: rawnand: stm32_fmc2: Use for_each_child_of_node_scoped()
  mtd: rawnand: sunxi: Use for_each_child_of_node_scoped()

 drivers/mtd/nand/raw/arasan-nand-controller.c   |  5 ++---
 drivers/mtd/nand/raw/cadence-nand-controller.c  |  4 +---
 drivers/mtd/nand/raw/marvell_nand.c             | 12 +++---------
 drivers/mtd/nand/raw/meson_nand.c               |  4 +---
 drivers/mtd/nand/raw/mtk_nand.c                 |  7 ++-----
 drivers/mtd/nand/raw/pl35x-nand-controller.c    |  5 ++---
 drivers/mtd/nand/raw/renesas-nand-controller.c  | 12 +++---------
 drivers/mtd/nand/raw/rockchip-nand-controller.c |  5 ++---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          |  7 ++-----
 drivers/mtd/nand/raw/sunxi_nand.c               |  4 +---
 10 files changed, 19 insertions(+), 46 deletions(-)

-- 
2.34.1


