Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E45E2E0982
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 12:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgLVLXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 06:23:00 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:50878 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726756AbgLVLW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 06:22:59 -0500
X-IronPort-AV: E=Sophos;i="5.78,438,1599490800"; 
   d="scan'208";a="66811359"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Dec 2020 20:22:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BE7F74006CD0;
        Tue, 22 Dec 2020 20:22:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 09/12] mfd: bd9571mwv: Use the SPDX license identifier
Date:   Tue, 22 Dec 2020 20:22:16 +0900
Message-Id: <1608636139-564-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the SPDX license identifier instead of a local description.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/bd9571mwv.c       | 10 +---------
 include/linux/mfd/bd9571mwv.h | 10 +---------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 19d57a4..e68c3fa 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ROHM BD9571MWV-M MFD driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether expressed or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License version 2 for more details.
- *
  * Based on the TPS65086 driver
  */
 
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index eb05569..bcc7092 100644
--- a/include/linux/mfd/bd9571mwv.h
+++ b/include/linux/mfd/bd9571mwv.h
@@ -1,17 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * ROHM BD9571MWV-M driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether expressed or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License version 2 for more details.
- *
  * Based on the TPS65086 driver
  */
 
-- 
2.7.4

