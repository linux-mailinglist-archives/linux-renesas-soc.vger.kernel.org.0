Return-Path: <linux-renesas-soc+bounces-31723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEk/FcAV8WmDdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:17:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F448B98D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C0B43067164
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC3318EE6;
	Tue, 28 Apr 2026 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GB74LoxZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9DA313E1D;
	Tue, 28 Apr 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407402; cv=none; b=lDqE8OoLpBGFrl7Qvy+jvjT4zhG0Fo9LTPlQGG0FOvX5w8qhvrXa9DA0GeY2tieRxsBRq/HYppga3S9FVlQo/rCDG3W1JEUVr5cO7q+Mt8NYQLna1gKUVwKtzI8qfkOXkfrsjJre2rROm70tzgXuaZIU1XI3lQDMRzSXXcwVopM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407402; c=relaxed/simple;
	bh=rgpT6JeYUUTF8dPGQi0+aswaXnBqWOyh+njR4c8YQ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfsOwoOCrM828lk7feqEr+JhNDkvpcGD7Qvt1DCju31LEkLrMMdjP5NmOHv0fKdcI0StJIzVoCNMb+3lgkgzmUNJPj7aoUrie+uFymbuj3TFimvBAa/+BPrUjNLmPsFiTKbD9w4di/9sK6sgXFZXWT7gclKY32noZDZCegEX90I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GB74LoxZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0897A3296;
	Tue, 28 Apr 2026 13:16:35 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F17D3F763;
	Tue, 28 Apr 2026 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407400; bh=rgpT6JeYUUTF8dPGQi0+aswaXnBqWOyh+njR4c8YQ2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GB74LoxZt7ZhrnoGJQDDlRWTGE6uIx44OLgSl2LCWR0MZxb0v33zPyUCzUf1DyP5J
	 jzYYV3pb9HRq/+jMQ+r7cYUsR/AWv7/eRYcCvglhbqlF8Dmbgj4/y7MKpyBAmIkNVu
	 GPgofIaURFERY3XQuXqF7pnV/fzYrZB6hOCc41ZI=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock operation
Date: Tue, 28 Apr 2026 21:15:10 +0100
Message-ID: <20260428201522.903875-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B80F448B98D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,redhat.com,baylibre.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31723-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:email,arm.com:email,arm.com:dkim,arm.com:mid]

Use the Clock protocol layer determine_rate logic to calculate the closest
rate that can be supported by a specific clock.

No functional change.

Cc: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
@brian: I'd modify further this clk-scmi driver, with a patch on top of
this series, to properly use your new CLK_ROUNDING_NOOP flag once your
series AND another (already reviewed) series on clk-scmi from Peng are in.
---
 drivers/clk/clk-scmi.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index b6a12f3bc123..c223e4ef1dd1 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 static int scmi_clk_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
 {
-	u64 fmin, fmax, ftmp;
+	int ret;
 	struct scmi_clk *clk = to_scmi_clk(hw);
 
 	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
+	 * called after the rate is set and we'll know what rate the clock is
 	 * running at then.
 	 */
-	if (clk->info->rate_discrete)
-		return 0;
-
-	fmin = clk->info->range.min_rate;
-	fmax = clk->info->range.max_rate;
-	if (req->rate <= fmin) {
-		req->rate = fmin;
-
-		return 0;
-	} else if (req->rate >= fmax) {
-		req->rate = fmax;
-
-		return 0;
-	}
-
-	ftmp = req->rate - fmin;
-	ftmp += clk->info->range.step_size - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clk->info->range.step_size);
-
-	req->rate = ftmp * clk->info->range.step_size + fmin;
+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.53.0


