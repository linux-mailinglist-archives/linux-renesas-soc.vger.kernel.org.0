Return-Path: <linux-renesas-soc+bounces-3846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68A87E81E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 12:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB7F1F23F02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 11:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F2E2FE3E;
	Mon, 18 Mar 2024 11:08:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF9636103;
	Mon, 18 Mar 2024 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760138; cv=none; b=Qt8wuWsopn3oLj1SQGWOOMDcesmdNdWuuQrH3wBTBHEHUOSyOpMbFuSbmbqlnU3s0xVMoS9P25oppasb1uWOTuN7Ed0c57bblqF6ieXPTEsdQqRx7Hz3VqP00zGmYxKP05HofwqTWFW5WmvtZNKA+y+qB5FLNcQHLij++mTek9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760138; c=relaxed/simple;
	bh=GusU4Gh1xCjEiEhu443u79bs/aqaVM5wHvkScYkv2ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nb+hF62FmiZ0iuRhP6QFF4ts76oGs78rZaZhMl0HmMVO/QbPsvRUX6Q0esC8CePLCs4o5tndWSZjA9oQdROA/McugBIFY1kYaaUZobNb3Ir6WQS47H4TuC/QfaxROATpB8gFuQrbi1hPJRfXRWI6dHMlGS0w46Lw4boo1Zg0DUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="198188837"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Mar 2024 20:08:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id C78CD4253BDA;
	Mon, 18 Mar 2024 20:08:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] clk: Update API documentation related to clock disable
Date: Mon, 18 Mar 2024 11:08:40 +0000
Message-Id: <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The API's related to clk disable operation does not explicitly
states the synchoronous or asynchrous behaviour as it is driver
dependent. So make this part clear in API documentation.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v2:
 * New patch.
---
 drivers/clk/clk.c            | 3 ++-
 include/linux/clk-provider.h | 3 ++-
 include/linux/clk.h          | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 25371c91a58f..f5fa91a339d7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1010,7 +1010,8 @@ static void clk_core_unprepare_lock(struct clk_core *core)
  * if the operation may sleep.  One example is a clk which is accessed over
  * I2c.  In the complex case a clk gate operation may require a fast and a slow
  * part.  It is this reason that clk_unprepare and clk_disable are not mutually
- * exclusive.  In fact clk_disable must be called before clk_unprepare.
+ * exclusive.  In fact clk_disable must be called before clk_unprepare.  The
+ * synchronous or asynchronous clock gating operation is driver dependent.
  */
 void clk_unprepare(struct clk *clk)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f655..5b493024e1ec 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -113,7 +113,8 @@ struct clk_duty {
  *		sleep.
  *
  * @disable:	Disable the clock atomically. Called with enable_lock held.
- *		This function must not sleep.
+ *		This function must not sleep. The synchronous or asynchronous
+ *		disabling of the clock is driver dependent.
  *
  * @is_enabled:	Queries the hardware to determine if the clock is enabled.
  *		This function must not sleep. Optional, if this op is not
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 00623f4de5e1..84b02518791f 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -681,7 +681,8 @@ int __must_check clk_bulk_enable(int num_clks,
  * @clk: clock source
  *
  * Inform the system that a clock source is no longer required by
- * a driver and may be shut down.
+ * a driver and may be shut down. It is not guaranteed to ever actually
+ * be stopped, that will be driver dependent.
  *
  * May be called from atomic contexts.
  *
-- 
2.25.1


