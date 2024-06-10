Return-Path: <linux-renesas-soc+bounces-6019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32C90298A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 21:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534231F23069
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 19:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2318714D70A;
	Mon, 10 Jun 2024 19:55:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B7A14B95F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718049348; cv=none; b=uLuTAgcgW8+TOHDXHBmUbdn2rV5ThBPUcIRMhOhnCOhBfrwXWr9XelElTMMmE7wclFjZX+ZFqVxaTiq33dMDM6Hk0D8eZxlF1zmuJg7aT2A88hFW9SxJba3vw+cvFhhbHQjfmUoXuA4bzN5jpL4luRY7qKAEZsg8X7JT8UmO2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718049348; c=relaxed/simple;
	bh=ByGkz/KPvoeMAqYNE3SLUXMpbMKGiTR51sGa6VYsAOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kXE6O3VMRwsiuDTDVnRdbZP63yf0jbR601CB6PZUezcsfW0NGs7wREaj/22PgM87zOtzzacXqs0uJNbaXcRvge1NxyJmbYNJ/YS4omzVb7lFZrvS7PCWYaPfM7Myw+Yf/LA0AGwZc101WUw9nKd303X/h9J54NTZm8u7C2Fd8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,227,1712588400"; 
   d="scan'208";a="207368157"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2024 04:55:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.192])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E76744091B67;
	Tue, 11 Jun 2024 04:55:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] regulator: core: Fix modpost error "regulator_get_regmap" undefined
Date: Mon, 10 Jun 2024 20:55:32 +0100
Message-Id: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the modpost error "regulator_get_regmap" undefined by adding export
symbol.

Fixes: 04eca28cde52 ("regulator: Add helpers for low-level register access")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406110117.mk5UR3VZ-lkp@intel.com
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/regulator/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f0379d8ad931..b0e07cac4f06 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -3396,6 +3396,7 @@ struct regmap *regulator_get_regmap(struct regulator *regulator)
 
 	return map ? map : ERR_PTR(-EOPNOTSUPP);
 }
+EXPORT_SYMBOL_GPL(regulator_get_regmap);
 
 /**
  * regulator_get_hardware_vsel_register - get the HW voltage selector register
-- 
2.25.1


