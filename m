Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10C22D255A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 09:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbgLHIEn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Dec 2020 03:04:43 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:10348 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727677AbgLHIEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:04:42 -0500
X-IronPort-AV: E=Sophos;i="5.78,401,1599490800"; 
   d="scan'208";a="65235788"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Dec 2020 17:04:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B850942296C4;
        Tue,  8 Dec 2020 17:04:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org
Cc:     khiem.nguyen.xt@renesas.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] mfd: bd9571mwv: Use the SPDX license identifier
Date:   Tue,  8 Dec 2020 17:04:01 +0900
Message-Id: <1607414643-25498-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the SPDX license identifier instead of a local description.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mfd/bd9571mwv.c       | 10 +---------
 include/linux/mfd/bd9571mwv.h | 10 +---------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index fab3cdc..80c6ef0 100644
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

