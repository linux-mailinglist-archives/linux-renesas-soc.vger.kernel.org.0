Return-Path: <linux-renesas-soc+bounces-2985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94A85B95F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 11:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E193281953
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 10:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8B1627FF;
	Tue, 20 Feb 2024 10:43:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA66626C6;
	Tue, 20 Feb 2024 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425831; cv=none; b=NS8Af+Pi48/hvxuqMTNVswKasYmpi1qvlzj4gut/x4KPnKgpEBkHuiU3paYOOiRuAI5byx1OuZ9HYgY6dB9vPi4ghpfQbw+H6p7Gp37x6q8Ylq+dBnycUcn7QUImZUQakNMg5XX6L/iViYm1z0Le1s5FxYZOftCiOM+ts6QxCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425831; c=relaxed/simple;
	bh=xR+waViZbIHoeeUUPDFUbXsbVqEikabY6gu0aDYi7x0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ghpegpe0ODlpZiPmrSzpiMVRXzwY8w1EN11t0lwd9+qz3A3sD4fESB78kpXb5V4/ACNeBNUToEy/mEyOfyGK63zUwuzrY6jYViOwLc+9luaCBqvPJ4W57QKghFq12evoOnS1Uj9maiaQUdPann/YyDSQWDyuN7XuFbSHwlilVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="194579410"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2024 19:43:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.246])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 976D64001942;
	Tue, 20 Feb 2024 19:43:43 +0900 (JST)
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
Subject: [PATCH v2 1/3] clk: Update API documentation related to clock disable
Date: Tue, 20 Feb 2024 10:43:34 +0000
Message-Id: <20240220104336.260194-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
References: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
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
v2:
 * New patch.
---
 drivers/clk/clk.c            | 3 ++-
 include/linux/clk-provider.h | 3 ++-
 include/linux/clk.h          | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..9a09f51f4af1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -988,7 +988,8 @@ static void clk_core_unprepare_lock(struct clk_core *core)
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
index 1293c38ddb7f..50cd0f8d37cb 100644
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
index 06f1b292f8a0..e6acec5d8dbe 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -653,7 +653,8 @@ int __must_check clk_bulk_enable(int num_clks,
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


