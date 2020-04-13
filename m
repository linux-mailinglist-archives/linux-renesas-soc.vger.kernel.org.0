Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13EA81A6885
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2020 17:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbgDMPMf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Apr 2020 11:12:35 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:25581 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729681AbgDMPMe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Apr 2020 11:12:34 -0400
Received: from localhost.localdomain ([93.22.151.169])
        by mwinf5d63 with ME
        id SFCX2200J3fYTYl03FCY5q; Mon, 13 Apr 2020 17:12:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 Apr 2020 17:12:32 +0200
X-ME-IP: 93.22.151.169
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: renesas: r9a06g032: Fix some typo in comments
Date:   Mon, 13 Apr 2020 06:17:09 +0200
Message-Id: <20200413041709.3630-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This file seems to be for R9A06G032 only. So replace reference to
R9A09G032 by R9A06G032 to avoid confusion.

AFAIK, R9A09G032 does'nt exist.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1907ee195a08..d900f6bf53d0 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * R9A09G032 clock driver
+ * R9A06G032 clock driver
  *
  * Copyright (C) 2018 Renesas Electronics Europe Limited
  *
@@ -338,8 +338,8 @@ clk_rdesc_get(struct r9a06g032_priv *clocks,
 }
 
 /*
- * This implements the R9A09G032 clock gate 'driver'. We cannot use the system's
- * clock gate framework as the gates on the R9A09G032 have a special enabling
+ * This implements the R9A06G032 clock gate 'driver'. We cannot use the system's
+ * clock gate framework as the gates on the R9A06G032 have a special enabling
  * sequence, therefore we use this little proxy.
  */
 struct r9a06g032_clk_gate {
-- 
2.20.1

