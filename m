Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8D01648604
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 16:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiLIP4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 10:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbiLIP4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:56:40 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A777201B6;
        Fri,  9 Dec 2022 07:56:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,230,1665414000"; 
   d="scan'208";a="145648829"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Dec 2022 00:56:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.54])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AE1CE4010ADA;
        Sat, 10 Dec 2022 00:56:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
Date:   Fri,  9 Dec 2022 15:56:22 +0000
Message-Id: <20221209155623.29147-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch sorts the header files alphabetically.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/typec/hd3ss3220.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index c24bbccd14f9..666a93f7ec65 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -5,15 +5,15 @@
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
-#include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/usb/role.h>
-#include <linux/irqreturn.h>
 #include <linux/interrupt.h>
+#include <linux/irqreturn.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/usb/role.h>
 #include <linux/usb/typec.h>
-#include <linux/delay.h>
 
 #define HD3SS3220_REG_CN_STAT_CTRL	0x09
 #define HD3SS3220_REG_GEN_CTRL		0x0A
-- 
2.25.1

