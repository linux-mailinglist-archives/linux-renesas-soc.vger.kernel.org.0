Return-Path: <linux-renesas-soc+bounces-29151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMaeNSxnsGloigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:47:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52783256A36
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 109A6310E7C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9708F3BA220;
	Tue, 10 Mar 2026 18:41:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369B3ACA59;
	Tue, 10 Mar 2026 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168073; cv=none; b=iM3vvmNZGNuXb10HDY+crbHBiyKib93URBAqL+IKTsUwBg7HPOAr1A218QQ+mBfddulKpDjGvGqRl7ATFU7jyLmOckd67MSKER8KAPX8fsokT749HejHhyrNIhUXrUqwSx+eQ2Go4walYnFxj+oFh43DOLVQLLHM+xkZnK0UUjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168073; c=relaxed/simple;
	bh=tAXZbQO3lfNUeKaNdgyEAOZcuatbe/cp0YB0Fsh0EPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItjkW64eqGOI1hiLUTBBtBzGaDJdqXX8byAM8q0g/Ws/u0cQ6XWtWkWEfzM4UJF+jJKQ9TrGeVzVjcz5SEkENmw1VNdDurVw67uQE3XC9Rvzh5MHryhW9mDiDMKHMYCHeVTU9zU58Xn0ZlY5Hs2GzE3rwz86t6iB18YhsixpbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29A2014BF;
	Tue, 10 Mar 2026 11:41:03 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12B433F7BD;
	Tue, 10 Mar 2026 11:41:05 -0700 (PDT)
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
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 07/13] firmware: arm_scmi: Make clock rates allocation dynamic
Date: Tue, 10 Mar 2026 18:40:24 +0000
Message-ID: <20260310184030.3669330-8-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52783256A36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29151-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
from the static per-clock rates allocation model in favour of a dynamic
runtime allocation based on effectively discovered resources.

No functional change.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
 include/linux/scmi_protocol.h     |  1 -
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 467b13a3a18f..c9b62edce4fd 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -161,7 +161,7 @@ struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
 	unsigned int num_rates;
-	u64 rates[SCMI_MAX_NUM_RATES];
+	u64 *rates;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
+	if (!st->max_resources) {
+		int num_rates = st->num_returned + st->num_remaining;
+
+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+					      sizeof(*p->clkd->rates), GFP_KERNEL);
+		if (!p->clkd->rates)
+			return -ENOMEM;
+
+		/* max_resources is used by the iterators to control bounds */
+		st->max_resources = st->num_returned + st->num_remaining;
+	}
+
 	return 0;
 }
 
@@ -493,6 +505,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 
 	p->clkd->rates[st->desc_index + st->loop_idx] =
 		RATE_TO_U64(r->rate[st->loop_idx]);
+
+	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
 
 	return 0;
@@ -515,8 +529,7 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, SCMI_MAX_NUM_RATES,
-					    CLOCK_DESCRIBE_RATES,
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index d97b4e734744..5552ac04c820 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -15,7 +15,6 @@
 
 #define SCMI_MAX_STR_SIZE		64
 #define SCMI_SHORT_NAME_MAX_SIZE	16
-#define SCMI_MAX_NUM_RATES		16
 
 /**
  * struct scmi_revision_info - version information structure
-- 
2.53.0


