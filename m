Return-Path: <linux-renesas-soc+bounces-3848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9F87E83F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 12:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7263A1F24C8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0C53A297;
	Mon, 18 Mar 2024 11:09:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C13531A66;
	Mon, 18 Mar 2024 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710760140; cv=none; b=KRFWdvFgG1ek1WPdvs8X7R78/0E7cOfsrtFp4uUq6Qi21tQ9r41KdSNOaO7IFN/mk5VxHh4+xTGwzSvuryLW4OwV9dGnXCdLWmgP3Vqhmw3pCqOtdRNVwm/E2ra7J521X8TF0pvWqcxES+wZ3TXia0P2LbejmB+tosrgdTtu8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710760140; c=relaxed/simple;
	bh=LlN5vmoU3X09UJUTYhEgLanrVuqPgYAw3c3N6czQY5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U6tXXcRTUwfF0O4bkL8TVTtS8ayAdrsDhX2/u/cXU3eWZoqYIILQ+F7gNn93kbpUYfPBkP3s4wNNkcjdIFmQr7jlkiGrNJGPw7S+IjG5aYoOcSz6zIx8H7MHm6BqW5NjdnqEdsaHF+fT6xudRYY038vR7CRQroLs0S0Uv0nFAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="202139682"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Mar 2024 20:08:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 992114253BE5;
	Mon, 18 Mar 2024 20:08:53 +0900 (JST)
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
Subject: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Date: Mon, 18 Mar 2024 11:08:41 +0000
Message-Id: <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
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

The clk_disable_unprepare() doesn't guarantee that a clock is gated after
the execution as it is driver dependent. The Renesas and most of the other
platforms don't wait until clock is stopped because of performance reason.
But these platforms wait while turning on the clock.

The normal case for shutting down the clock is unbind/close/suspend or
error paths in the driver. Not waiting for the shutting down the clock
will improve the suspend time.

But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk is
on. Before enabling link reception, we need to wait for vclk to be off
and after enabling reception, we need to turn the vlck on. Special cases
like this requires a sync API for clock gating.

Add clk_poll_disable_unprepare() to poll the clock gate operation that
guarantees gating of clk after the execution.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added WARN_ON(enable count non-zero) and return an error code (-EBUSY),
   if the user is not the sole user of the clock and the enable count is
   non-zero.
 * Returned an error if there's no is_enabled() callback.
RFC->v2:
 * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
 * Redesigned to make use of __clk_is_enabled() to poll the clock gating.
---
 drivers/clk/clk.c   | 29 ++++++++++++++++++++++++++++
 include/linux/clk.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f5fa91a339d7..e10bb14c904d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/err.h>
+#include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -1160,6 +1161,34 @@ void clk_disable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_disable);
 
+/**
+ * clk_poll_disabled - poll for clock gating.
+ * @clk: the clk that is going to stop
+ * @sleep_us: Maximum time to sleep between reads in us (0
+ *            tight-loops).  Should be less than ~20ms since usleep_range
+ *            is used (see Documentation/timers/timers-howto.rst).
+ * @timeout_us: Timeout in us, 0 means never timeout
+ *
+ * It polls for a clk to be stopped.
+ */
+int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us)
+{
+	bool status;
+
+	if (IS_ERR_OR_NULL(clk))
+		return 0;
+
+	if (!clk->core->ops->is_enabled)
+		return -EOPNOTSUPP;
+
+	if (WARN(__clk_get_enable_count(clk), "clk is in use\n"))
+		return -EBUSY;
+
+	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
+				 timeout_us, false, clk);
+}
+EXPORT_SYMBOL_GPL(clk_poll_disabled);
+
 static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 84b02518791f..7f714ecce0eb 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -693,6 +693,20 @@ int __must_check clk_bulk_enable(int num_clks,
  */
 void clk_disable(struct clk *clk);
 
+/**
+ * clk_poll_disabled - inform the system whether the clock source is stopped.
+ * @clk: clock source
+ * @sleep_us: Maximum time to sleep between reads in us (0
+ *            tight-loops).  Should be less than ~20ms since usleep_range
+ *            is used (see Documentation/timers/timers-howto.rst).
+ * @timeout_us: Timeout in us, 0 means never timeout
+ *
+ * Poll for clock gating and Inform the system about it's status.
+ *
+ * Context: May sleep.
+ */
+int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us);
+
 /**
  * clk_bulk_disable - inform the system when the set of clks is no
  *		      longer required.
@@ -1030,6 +1044,11 @@ static inline int __must_check clk_bulk_enable(int num_clks,
 
 static inline void clk_disable(struct clk *clk) {}
 
+static inline int clk_poll_disabled(struct clk *clk, unsigned long sleep_us,
+				    u64 timeout_us)
+{
+	return 0;
+}
 
 static inline void clk_bulk_disable(int num_clks,
 				    const struct clk_bulk_data *clks) {}
@@ -1121,6 +1140,33 @@ static inline void clk_disable_unprepare(struct clk *clk)
 	clk_unprepare(clk);
 }
 
+/**
+ * clk_poll_disable_unprepare - Poll clk_disable_unprepare
+ * @clk: clock source
+ * @sleep_us: Maximum time to sleep between reads in us (0
+ *            tight-loops).  Should be less than ~20ms since usleep_range
+ *            is used (see Documentation/timers/timers-howto.rst).
+ * @timeout_us: Timeout in us, 0 means never timeout
+ *
+ * Context: May sleep.
+ *
+ * This function polls until the clock has stopped.
+ *
+ * Returns success (0) or negative errno.
+ */
+static inline int clk_poll_disable_unprepare(struct clk *clk,
+					     unsigned long sleep_us,
+					     u64 timeout_us)
+{
+	int ret;
+
+	clk_disable(clk);
+	ret = clk_poll_disabled(clk, sleep_us, timeout_us);
+	clk_unprepare(clk);
+
+	return ret;
+}
+
 static inline int __must_check
 clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data *clks)
 {
-- 
2.25.1


