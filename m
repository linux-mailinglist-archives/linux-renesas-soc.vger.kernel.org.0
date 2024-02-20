Return-Path: <linux-renesas-soc+bounces-2987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295185B964
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 11:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E2728208D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Feb 2024 10:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AF6657D3;
	Tue, 20 Feb 2024 10:43:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39AD2626C6;
	Tue, 20 Feb 2024 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425834; cv=none; b=o3padX+yuqnyDG8psxMLhfq7HShxGUbzT3Pbd2zr96m3s0DjZM2xTnq5PaiQ5GfYzVV1eXZfpq4K+uU5feWRI84pIhGLwQ26MTy8TNvsxS3YigQicC0lg/9VHbl3D4Ueya4kSk3P70r0fd/YJS70C5MVScEIpoUV25zVriXfaB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425834; c=relaxed/simple;
	bh=B2RnZXfNYMhUhiOdYc7+d0mAwKnhiBEQnEF1lJgHSVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Aob7QAd/YQjMuXTOkjPzOCKKCCznPw1wX8u7T89dZdp3genMqTnom+y+njn+QrWoTTcQfHacE4SIz7TKE9xd+3NG8LKecsJqx0Rrhe2yzJsAt1k4cEFCd8Fwkf0QNudfOjG3Rl6PvsyujrE27dYB8PepqplsUKHMIGKtapf72Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="198515571"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Feb 2024 19:43:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.246])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A40844005658;
	Tue, 20 Feb 2024 19:43:47 +0900 (JST)
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
Subject: [PATCH v2 2/3] clk: Add clk_poll_disable_unprepare()
Date: Tue, 20 Feb 2024 10:43:35 +0000
Message-Id: <20240220104336.260194-3-biju.das.jz@bp.renesas.com>
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
RFC->v2:
 * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
 * Redesigned to make use of __clk_is_enabled() to poll the clock gating.
---
 drivers/clk/clk.c   | 23 +++++++++++++++++++++++
 include/linux/clk.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9a09f51f4af1..0e66b7180388 100644
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
@@ -1138,6 +1139,28 @@ void clk_disable(struct clk *clk)
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
+	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
+				 timeout_us, false, clk);
+}
+EXPORT_SYMBOL_GPL(clk_poll_disabled);
+
 static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index e6acec5d8dbe..2d63a12214e5 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -665,6 +665,20 @@ int __must_check clk_bulk_enable(int num_clks,
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
@@ -996,6 +1010,11 @@ static inline int __must_check clk_bulk_enable(int num_clks,
 
 static inline void clk_disable(struct clk *clk) {}
 
+static inline int clk_poll_disabled(struct clk *clk, unsigned long sleep_us,
+				    u64 timeout_us)
+{
+	return 0;
+}
 
 static inline void clk_bulk_disable(int num_clks,
 				    const struct clk_bulk_data *clks) {}
@@ -1087,6 +1106,33 @@ static inline void clk_disable_unprepare(struct clk *clk)
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


