Return-Path: <linux-renesas-soc+bounces-28548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNPtINu6oWlhwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:40:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BFD1BA003
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 739A13064EF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57E5428848;
	Fri, 27 Feb 2026 15:33:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F413F074C;
	Fri, 27 Feb 2026 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206386; cv=none; b=qhglad3Zi1+4SGitjl5pPl09zFPNISVz0VBkq2gbYbEn4F4r7mDV7e2rjzmf5Lxi/6S7MrJfSvRsymGIg+ut56i7x36XPuc33znrA28Qrk8W2dl08aKCSli8fwXNDOXulv+EhUHU4k8b8OCVp7U8QMTAwxWL9/YdFpmSJr8MG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206386; c=relaxed/simple;
	bh=CN8c4/9USCmVuLCHdmKnafZJhuVjmEI7m47N19uUl7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh7bwDdWLd3hWgtbfeMCA19vXH4XG2ocsMUZxxUq95e/pUpypaWMFGXuDUab0+ew39/JcjPYyNWaxv9RXjZiYGApuCtZARdIv5F5SdI5fyrdUMns+MT00qPcfnZDCdH/0MidDkkKKl4/VAs53m0Pf4d2QOStXu2FvUXDl43g4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D68339;
	Fri, 27 Feb 2026 07:32:58 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC71D3F73B;
	Fri, 27 Feb 2026 07:32:58 -0800 (PST)
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
Subject: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate operation
Date: Fri, 27 Feb 2026 15:32:15 +0000
Message-ID: <20260227153225.2778358-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28548-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: A2BFD1BA003
X-Rspamd-Action: no action

Add a clock operation to help determining the effective rate, closest to
the required one, that a specific clock can support.

Calculation is currently performed kernel side and the logic is taken
directly from the SCMI Clock driver: embedding the determinate rate logic
in the protocol layer enables semplifications in the SCMI Clock protocol
interface and  will more easily accommodate further evolutions where such
determine_rate logic into is optionally delegated to the platform SCMI
server.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Spoiler alert next SCMI spec will most probably include a new
CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
so this clock proto_ops will be needed anyway sooner or later
---
 drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1..54e8b59c3941 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/limits.h>
 #include <linux/sort.h>
+#include <asm/div64.h>
 
 #include "protocols.h"
 #include "notify.h"
@@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
+				     u32 clk_id, unsigned long *rate)
+{
+	u64 fmin, fmax, ftmp;
+	struct scmi_clock_info *clk;
+	struct clock_info *ci = ph->get_priv(ph);
+
+	if (!rate)
+		return -EINVAL;
+
+	clk = scmi_clock_domain_lookup(ci, clk_id);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/*
+	 * If we can't figure out what rate it will be, so just return the
+	 * rate back to the caller.
+	 */
+	if (clk->rate_discrete)
+		return 0;
+
+	fmin = clk->range.min_rate;
+	fmax = clk->range.max_rate;
+	if (*rate <= fmin) {
+		*rate = fmin;
+		return 0;
+	} else if (*rate >= fmax) {
+		*rate = fmax;
+		return 0;
+	}
+
+	ftmp = *rate - fmin;
+	ftmp += clk->range.step_size - 1; /* to round up */
+	do_div(ftmp, clk->range.step_size);
+
+	*rate = ftmp * clk->range.step_size + fmin;
+
+	return 0;
+}
+
 static int
 scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      enum clk_state state,
@@ -936,6 +977,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
 	.info_get = scmi_clock_info_get,
 	.rate_get = scmi_clock_rate_get,
 	.rate_set = scmi_clock_rate_set,
+	.determine_rate = scmi_clock_determine_rate,
 	.enable = scmi_clock_enable,
 	.disable = scmi_clock_disable,
 	.state_get = scmi_clock_state_get,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index aafaac1496b0..28579c145045 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -91,6 +91,10 @@ enum scmi_clock_oem_config {
  * @info_get: get the information of the specified clock
  * @rate_get: request the current clock rate of a clock
  * @rate_set: set the clock rate of a clock
+ * @determine_rate: determine the effective rate that can be supported by a
+ *		    clock calculating the closest allowed rate.
+ *		    Note that @rate is an input/output parameter used both to
+ *		    describe the requested rate and report the closest match
  * @enable: enables the specified clock
  * @disable: disables the specified clock
  * @state_get: get the status of the specified clock
@@ -108,6 +112,8 @@ struct scmi_clk_proto_ops {
 			u64 *rate);
 	int (*rate_set)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			u64 rate);
+	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
+			      unsigned long *rate);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
-- 
2.53.0


