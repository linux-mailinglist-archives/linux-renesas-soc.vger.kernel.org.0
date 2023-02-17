Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B8169AA9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 12:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjBQLnL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjBQLnK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:43:10 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 871CC604D8;
        Fri, 17 Feb 2023 03:43:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,304,1669042800"; 
   d="scan'208";a="149953573"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Feb 2023 20:43:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.177])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A7CC4002645;
        Fri, 17 Feb 2023 20:43:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/6] serial: 8250_em: Drop slab.h
Date:   Fri, 17 Feb 2023 11:42:51 +0000
Message-Id: <20230217114255.226517-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch removes the unused header file slab.h.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Split from patch#1
 * Removed the unused header file slab.h.
---
 drivers/tty/serial/8250/8250_em.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
index 785153d8502d..7bbf206ff476 100644
--- a/drivers/tty/serial/8250/8250_em.c
+++ b/drivers/tty/serial/8250/8250_em.c
@@ -13,7 +13,6 @@
 #include <linux/serial_reg.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
-#include <linux/slab.h>
 
 #include "8250.h"
 
-- 
2.25.1

