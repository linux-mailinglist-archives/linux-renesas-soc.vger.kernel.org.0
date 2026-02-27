Return-Path: <linux-renesas-soc+bounces-28566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HLRI1S7oWlhwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:42:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C761BA108
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9236D30CF43A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4205A43D503;
	Fri, 27 Feb 2026 15:34:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2F243CEF9;
	Fri, 27 Feb 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206445; cv=none; b=UKEG5HswmtcE02uphYTPHhGDF2QZQ1X30AiYA/DR2EawYKKFShpR29WahdqRlyfbNQP3f5tcKEXKzYLYyNE6uVcIPTsCkKX4Nel8ZomwLdxADCOE8/15SBmRyYBkpbKHzcZjmp1Oxciq0wiDdpuDMYw2xdMxLx0A1sLhbg2iZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206445; c=relaxed/simple;
	bh=o1wyGFFzv1WlO61N6heUNvXWChi57n1OuASyQQfpiAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcA6TNsnxJo4i2vzE0wae2on9CR0CdukpLQBTBXT6AaLZ2w0Vdg7YYQMZDHEDHvsZ+ZlUwkGaZbRjhfoOTAR17jbwGo7E9SNduBDE/YODJEEHTY4EpanmrPxCp9ygO/0vFrFIMe+eB070ZZwPcwA+1VoTzp/CIETBtsre+4qL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD18339;
	Fri, 27 Feb 2026 07:33:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB7EF3F73B;
	Fri, 27 Feb 2026 07:33:56 -0800 (PST)
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
Subject: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Date: Fri, 27 Feb 2026 15:32:23 +0000
Message-ID: <20260227153225.2778358-10-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28566-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.904];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:mid,arm.com:email,st.com:email]
X-Rspamd-Queue-Id: 08C761BA108
X-Rspamd-Action: no action

SCMI core stack provides some common helpers to handle in a unified way
multipart message replies: such iterator-helpers, when run, currently
process by default the whole set of discovered resources.

Introduce an alternative way to run the initialized iterator on a limited
range of resources.

Note that the subset of resources that can be chosen is anyway limited by
the SCMI protocol specification, since you are only allowed to choose the
startindex on a multi-part enumeration NOT the end index, so that the
effective number of returned items by a bound iterators depends really
on platform side decisions.

Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c     |  3 +-
 drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++--------
 drivers/firmware/arm_scmi/protocols.h | 13 +++++-
 3 files changed, 55 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 15faa79abed4..d7df5c45836e 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	p->clkd->rates[st->desc_index + st->loop_idx] =
-		RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
 	p->clkd->num_rates++;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d9d6edbc1275..299265d05f62 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1813,48 +1813,50 @@ static void *scmi_iterator_init(const struct scmi_protocol_handle *ph,
 	return no_free_ptr(i);
 }
 
-static int scmi_iterator_run(void *iter)
+static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *end)
 {
 	int ret;
 	struct scmi_iterator_ops *iops;
 	const struct scmi_protocol_handle *ph;
 	struct scmi_iterator_state *st;
+	struct scmi_iterator *i;
 
 	if (!iter)
 		return -EINVAL;
 
-	/* Take ownership of the iterator */
-	struct scmi_iterator *i __free(kfree) = iter;
-
+	i = iter;
 	iops = i->ops;
 	ph = i->ph;
 	st = &i->state;
 
+	/* Reinitialize state for next run */
+	st->num_returned = 0;
+	st->num_remaining = 0;
+	st->desc_index = start ? *start : 0;
+
 	do {
 		iops->prepare_message(i->msg, st->desc_index, i->priv);
 		ret = ph->xops->do_xfer(ph, i->t);
 		if (ret)
-			break;
+			return ret;
 
 		st->rx_len = i->t->rx.len;
 		ret = iops->update_state(st, i->resp, i->priv);
 		if (ret)
-			break;
+			return ret;
 
 		if (st->num_returned > st->max_resources - st->desc_index) {
 			dev_err(ph->dev,
 				"No. of resources can't exceed %d\n",
 				st->max_resources);
-			ret = -EINVAL;
-			break;
+			return -EINVAL;
 		}
 
-		for (st->loop_idx = 0; !ret && st->loop_idx < st->num_returned;
-		     st->loop_idx++)
+		for (st->loop_idx = 0; st->loop_idx < st->num_returned; st->loop_idx++) {
 			ret = iops->process_response(ph, i->resp, st, i->priv);
-
-		if (ret)
-			break;
+			if (ret)
+				return ret;
+		}
 
 		st->desc_index += st->num_returned;
 		ph->xops->reset_rx_to_maxsz(ph, i->t);
@@ -1862,14 +1864,36 @@ static int scmi_iterator_run(void *iter)
 		 * check for both returned and remaining to avoid infinite
 		 * loop due to buggy firmware
 		 */
-	} while (st->num_returned && st->num_remaining);
+	} while (st->num_returned && st->num_remaining &&
+		 (!end || (st->desc_index <= min(*end, st->max_resources - 1))));
 
-	/* Finalize and destroy iterator */
-	ph->xops->xfer_put(ph, i->t);
+	return 0;
+}
+
+static void scmi_iterator_cleanup(void *iter)
+{
+	struct scmi_iterator *i = iter;
+
+	i->ph->xops->xfer_put(i->ph, i->t);
+	kfree(i);
+}
+
+static int scmi_iterator_run(void *iter)
+{
+	int ret;
+
+	ret = __scmi_iterator_run(iter, NULL, NULL);
+	scmi_iterator_cleanup(iter);
 
 	return ret;
 }
 
+static int scmi_iterator_run_bound(void *iter, unsigned int *start,
+				   unsigned int *end)
+{
+	return __scmi_iterator_run(iter, start, end);
+}
+
 struct scmi_msg_get_fc_info {
 	__le32 domain;
 	__le32 message_id;
@@ -2048,6 +2072,8 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.get_max_msg_size = scmi_common_get_max_msg_size,
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
+	.iter_response_run_bound = scmi_iterator_run_bound,
+	.iter_response_cleanup = scmi_iterator_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 4c75970326e6..487f84239385 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -259,7 +259,15 @@ struct scmi_fc_info {
  *			multi-part responses using the custom operations
  *			provided in @ops.
  * @iter_response_run: A common helper to trigger the run of a previously
- *		       initialized iterator.
+ *		       initialized iterator. Note that unbound iterators are
+ *		       automatically cleaned up.
+ * @iter_response_run_bound: A common helper to trigger the run of a previously
+ *			     initialized iterator, but only within the
+ *			     specified, optional, @start and @end resource
+ *			     indexes. Note that these bound-iterators need
+ *			     explicit cleanup via @iter_response_bound_cleanup.
+ * @iter_response_bound_cleanup: A common helper to finally release the iterator
+ *				 for bound iterators.
  * @protocol_msg_check: A common helper to check is a specific protocol message
  *			is supported.
  * @fastchannel_init: A common helper used to initialize FC descriptors by
@@ -276,6 +284,9 @@ struct scmi_proto_helpers_ops {
 				    unsigned int max_resources, u8 msg_id,
 				    size_t tx_size, void *priv);
 	int (*iter_response_run)(void *iter);
+	int (*iter_response_run_bound)(void *iter,
+				       unsigned int *start, unsigned int *end);
+	void (*iter_response_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.53.0


