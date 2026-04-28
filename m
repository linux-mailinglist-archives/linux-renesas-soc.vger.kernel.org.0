Return-Path: <linux-renesas-soc+bounces-31722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCaUNy4W8WkcdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:18:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7048BA37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809E5307184D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6003B31714A;
	Tue, 28 Apr 2026 20:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MFx+FfVS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1983148DD;
	Tue, 28 Apr 2026 20:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407399; cv=none; b=dOzLl6C80qIAKGFU8xL4qrIoSkzuY7IQYsRfUJk+/I5O3TOmM0+Na91Y8HN2API0Hsn494nyLb97bWZyFDhmaegFRZLUWh+iUF/oxgsSlgNA2Vvh/59+CZignBMgrWzVXG8ZIY+t1T4c39G4PXNcj/I80OVwCGDdd86TMgDdvOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407399; c=relaxed/simple;
	bh=FouQA+bv5j1EdgH3z1eqPEIT8/R9xB/bagn+V+J4Zec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g2OzkgmLNXx5btJvpVPzGYnr8jxfNr6mpuOJjyoE/5phwirnJ+fweioe4Alc0xQavZCR47+V5Uckj8A2fjfNNtMvUd07zgFSXGNCfG5Jvpcc2fN3YnwxKcKHdypKSapIosTdaSocp70NqcgcruVJv+o2ptHQbaZ6PQBlDkPCIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MFx+FfVS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BBC13295;
	Tue, 28 Apr 2026 13:16:31 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043A73F763;
	Tue, 28 Apr 2026 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407396; bh=FouQA+bv5j1EdgH3z1eqPEIT8/R9xB/bagn+V+J4Zec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFx+FfVS7ekISqM2rC0y9p6YaqHj+egphpXU1nI6RUH1Fy1d+2YVVCcd7mki2DfWg
	 Q7AizXEqaBzeIjEhKDYugYignd54bKJCO9um69zP9UWvpFfw8pyiuO0GWBQSbNdlAP
	 WtlVihIU7iFjXmcLmDZNPrE7Vd/0EnVPdUli5Mwg=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 02/15] firmware: arm_scmi: Add clock determine_rate operation
Date: Tue, 28 Apr 2026 21:15:09 +0100
Message-ID: <20260428201522.903875-3-cristian.marussi@arm.com>
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
X-Rspamd-Queue-Id: A0D7048BA37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31722-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

Add a clock operation to help determining the effective rate, closest to
the required one, that a specific clock can support.

Calculation is currently performed kernel side and the logic is taken
directly from the SCMI Clock driver: embedding the determinate rate logic
in the protocol layer enables simplifications in the SCMI Clock protocol
interface and will more easily accommodate further evolutions where such
determine_rate logic into is optionally delegated to the platform SCMI
server.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - use the fixed rounding algo using div64_ul

Spoiler alert next SCMI spec will most probably include a new
CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
so this clock proto_ops will be needed anyway sooner or later
---
 drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab36871650a1..54b55517b759 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2018-2022 ARM Ltd.
  */
 
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/limits.h>
 #include <linux/sort.h>
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
+	ftmp = div64_ul(ftmp, clk->range.step_size);
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


