Return-Path: <linux-renesas-soc+bounces-31733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKBONFEW8WkcdAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:19:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D248BA6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D33E1308F717
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5110833CEA9;
	Tue, 28 Apr 2026 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mwefKaPm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA823264DD;
	Tue, 28 Apr 2026 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407436; cv=none; b=Obl2f7o/yOwWxdGvjAj8Hx2qTEthP6Fzd8vD/LXipWqzD+YrauYloe+aTwtYYjs3P1v81O8CMSw7qyCRcMTX7TzdcBGMuGfzKYlKbveb7R5bq5ApHiS6IWB7hIfyaXAGIQ/koCiYMGxtBEapLCGGyobI7W7g9gAPoP+J5flBeUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407436; c=relaxed/simple;
	bh=P2pDG/wbyXu8rvvGPP+RiEpj+f5STXBcLJcHsAu83UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lp7YAQcGE056/1T3dScBlnorRxYCIigDFkoq5wP09qa78BrP6HY1ZYN1E6k7WoxbMCjjNiGASH1T/1OCB4CAIBSiRS7PHReNkX6gNyFBJp3beOjdgZMqja8AnZ7WC/P/AOCOxlZVPduvDiKcjfeLLLqiI5FNy5IGPYnLwiTxwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mwefKaPm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8401C01;
	Tue, 28 Apr 2026 13:17:08 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DA1F3F763;
	Tue, 28 Apr 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407434; bh=P2pDG/wbyXu8rvvGPP+RiEpj+f5STXBcLJcHsAu83UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mwefKaPmm0jyQSIKhiKALsZAnUBD5homuXnTZ/E9KJK9X2uI+QGVOROS/kc7ndgUY
	 byJn61FFion6HCwp0l5D6sE/lnrOo+yvE4lierNqg5tBQffFaurJAzZDVvDgpkfCRF
	 sqsf8B072etWsleBq+rnQDxnw661yx2Nv8ujsJTE=
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
Subject: [PATCH v3 13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
Date: Tue, 28 Apr 2026 21:15:20 +0100
Message-ID: <20260428201522.903875-14-cristian.marussi@arm.com>
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
X-Rspamd-Queue-Id: 808D248BA6A
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
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31733-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

Clock rates are guaranteed to be returned in ascending order for SCMI clock
protocol versions greater than 1.0: in such a case, use bounded iterators
to minimize the number of message exchanges needed to discover min and max
rate.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - fixed final ret value in scmi_clock_describe_get
---
 drivers/firmware/arm_scmi/clock.c | 90 +++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 8ce889dfc87b..15a963b1edb9 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -160,6 +160,7 @@ struct scmi_clock_rate_notify_payld {
 struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
+	unsigned int tot_rates;
 	unsigned int num_rates;
 	u64 *rates;
 #define	RATE_MIN	0
@@ -483,15 +484,16 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	}
 
 	if (!st->max_resources) {
-		int num_rates = st->num_returned + st->num_remaining;
+		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
 					      sizeof(*p->clkd->rates), GFP_KERNEL);
 		if (!p->clkd->rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
-		st->max_resources = st->num_returned + st->num_remaining;
+		p->clkd->tot_rates = tot_rates;
+		st->max_resources = tot_rates;
 	}
 
 	return 0;
@@ -514,8 +516,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 }
 
 static int
-scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
-			      struct clock_info *cinfo)
+scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
 {
 	int ret;
 	void *iter;
@@ -524,7 +526,6 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.update_state = iter_clk_describe_update_state,
 		.process_response = iter_clk_describe_process_response,
 	};
-	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
 	struct scmi_clk_ipriv cpriv = {
 		.clkd = clkd,
 		.dev = ph->dev,
@@ -544,17 +545,88 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (!clkd->num_rates)
 		return 0;
 
+	if (clkd->rate_discrete)
+		sort(clkd->rates, clkd->num_rates,
+		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+
+	return 0;
+}
+
+static int
+scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_clk_describe_prepare_message,
+		.update_state = iter_clk_describe_update_state,
+		.process_response = iter_clk_describe_process_response,
+	};
+	struct scmi_clk_ipriv cpriv = {
+		.clkd = clkd,
+		.dev = ph->dev,
+	};
+	unsigned int first, last;
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+					    sizeof(struct scmi_msg_clock_describe_rates),
+					    &cpriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	/* Try to grab a triplet, so that in case is NON-discrete we are done */
+	first = 0;
+	last = 2;
+	ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	if (ret)
+		goto out;
+
+	/* If discrete grab the last value, which should be the max */
+	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+		first = clkd->tot_rates - 1;
+		last = clkd->tot_rates - 1;
+		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	}
+
+out:
+	ph->hops->iter_response_cleanup(iter);
+
+	return ret;
+}
+
+static int
+scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
+			      u32 clk_id, struct clock_info *cinfo)
+{
+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
+	int ret;
+
+	/*
+	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
+	 * be discovered in ascending order, lazy enumeration cannot be use for
+	 * SCMI Clock v1.0 protocol.
+	 */
+	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
+		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
+	else
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+
+	if (ret)
+		return ret;
+
+	clkd->info.min_rate = clkd->rates[RATE_MIN];
 	if (!clkd->rate_discrete) {
 		clkd->info.max_rate = clkd->rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
 			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
 			clkd->rates[RATE_STEP]);
 	} else {
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
 		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
+			clkd->info.name, clkd->rate_discrete,
+			clkd->info.min_rate, clkd->info.max_rate);
 	}
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
 
 	return 0;
 }
-- 
2.53.0


