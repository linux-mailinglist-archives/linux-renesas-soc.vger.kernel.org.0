Return-Path: <linux-renesas-soc+bounces-28570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGsrFW29oWmswAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:51:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 675901BA4B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD1BA30C21A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7830B4418C2;
	Fri, 27 Feb 2026 15:34:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D595D43DA2E;
	Fri, 27 Feb 2026 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206460; cv=none; b=t9ziKoZMDrR2t2J987iRJypdKlUig7hFspNcWmEtwd6qfWXGeErvY/VIYZZAB4YUt2d/88rDjJfiydtVjrAfwPyXWt5z+Y/0V0tm9Sx9pllr/JfpWJKcC8G+40xAFhVPDSeuKh8b4DRUQyzq/BOhKGAgfmeyr5W3NT5pK1gLAWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206460; c=relaxed/simple;
	bh=cDmyGhVRBAXTAOsnBaTbIhCabwry7zDHpYdYX7wGMMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBMBpTFWQTW3sbP6kLVE+nt/qTMam+14EC9AoCIyQ8FVUPZGrAVyxC1UIF6pxserwb26LT7/qhYJclnGz+TR5hH1e6Xd593JlUTo0EzBmSy7vUQnVfmO7OTJmslNzpDhBKWHv4/o45USmya0A7De9IXwjsAd1RsZzxV/QAxo+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C0DC339;
	Fri, 27 Feb 2026 07:34:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC343F73B;
	Fri, 27 Feb 2026 07:34:11 -0800 (PST)
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
Subject: [PATCH 11/11] firmware: arm_scmi: Introduce all_rates_get clock operation
Date: Fri, 27 Feb 2026 15:32:25 +0000
Message-ID: <20260227153225.2778358-12-cristian.marussi@arm.com>
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
	TAGGED_FROM(0.00)[bounces-28570-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.893];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 675901BA4B0
X-Rspamd-Action: no action

Add a clock operation to get the whole set of rates available to a specific
clock: when needed this request could transparently trigger a full rate
discovery enumeration if this specific clock-rates were previously only
lazily enumerated.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
 include/linux/scmi_protocol.h     |  9 ++++
 2 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index a0de10652abe..c2fd9a1c3316 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
 
 struct scmi_clock_desc {
 	u32 id;
-	bool rate_discrete;
 	unsigned int tot_rates;
-	unsigned int num_rates;
-	u64 *rates;
+	struct scmi_clock_rates r;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	flags = le32_to_cpu(r->num_rates_flags);
 	st->num_remaining = NUM_REMAINING(flags);
 	st->num_returned = NUM_RETURNED(flags);
-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
 
 	/* Warn about out of spec replies ... */
-	if (!p->clkd->rate_discrete &&
+	if (!p->clkd->r.rate_discrete &&
 	    (st->num_returned != 3 || st->num_remaining != 0)) {
 		dev_warn(p->dev,
 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	if (!st->max_resources) {
 		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
-					      sizeof(*p->clkd->rates), GFP_KERNEL);
-		if (!p->clkd->rates)
+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
+		if (!p->clkd->r.rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
-	p->clkd->num_rates++;
+	p->clkd->r.num_rates++;
 
 	return 0;
 }
@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+	/*
+	 * Using tot_rates as max_resources parameter here so as to trigger
+	 * the dynamic allocation only when strictly needed: when trying a
+	 * full enumeration after a lazy one tot_rates will be non-zero.
+	 */
+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
+					    CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		return ret;
 
 	/* empty set ? */
-	if (!clkd->num_rates)
+	if (!clkd->r.num_rates)
 		return 0;
 
-	if (clkd->rate_discrete)
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
+		sort(clkd->r.rates, clkd->r.num_rates,
+		     sizeof(clkd->r.rates[0]), rate_cmp_func, NULL);
 
 	return 0;
 }
@@ -583,7 +587,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 		goto out;
 
 	/* If discrete grab the last value, which should be the max */
-	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+	if (clkd->r.rate_discrete && clkd->tot_rates > 3) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
@@ -615,16 +619,16 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
-	if (!clkd->rate_discrete) {
-		clkd->info.max_rate = clkd->rates[RATE_MAX];
+	clkd->info.min_rate = clkd->r.rates[RATE_MIN];
+	if (!clkd->r.rate_discrete) {
+		clkd->info.max_rate = clkd->r.rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
-			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
-			clkd->rates[RATE_STEP]);
+			clkd->r.rates[RATE_MIN], clkd->r.rates[RATE_MAX],
+			clkd->r.rates[RATE_STEP]);
 	} else {
-		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		clkd->info.max_rate = clkd->r.rates[clkd->r.num_rates - 1];
 		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
-			clkd->info.name, clkd->rate_discrete,
+			clkd->info.name, clkd->r.rate_discrete,
 			clkd->info.min_rate, clkd->info.max_rate);
 	}
 
@@ -729,7 +733,7 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	 * If we can't figure out what rate it will be, so just return the
 	 * rate back to the caller.
 	 */
-	if (clkd->rate_discrete)
+	if (clkd->r.rate_discrete)
 		return 0;
 
 	fmin = clk->min_rate;
@@ -743,14 +747,40 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	}
 
 	ftmp = *rate - fmin;
-	ftmp += clkd->rates[RATE_STEP] - 1; /* to round up */
-	do_div(ftmp, clkd->rates[RATE_STEP]);
+	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
+	do_div(ftmp, clkd->r.rates[RATE_STEP]);
 
-	*rate = ftmp * clkd->rates[RATE_STEP] + fmin;
+	*rate = ftmp * clkd->r.rates[RATE_STEP] + fmin;
 
 	return 0;
 }
 
+static const struct scmi_clock_rates *
+scmi_clock_all_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id)
+{
+	struct clock_info *ci = ph->get_priv(ph);
+	struct scmi_clock_desc *clkd;
+	struct scmi_clock_info *clk;
+
+	clk = scmi_clock_domain_lookup(ci, clk_id);
+	if (IS_ERR(clk) || !clk->name[0])
+		return NULL;
+
+	clkd = to_desc(clk);
+	/* Needs full enumeration ? */
+	if (clkd->r.rate_discrete && clkd->tot_rates != clkd->r.num_rates) {
+		int ret;
+
+		/* rates[] is already allocated BUT we need to re-enumerate */
+		clkd->r.num_rates = 0;
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+		if (ret)
+			return NULL;
+	}
+
+	return &clkd->r;
+}
+
 static int
 scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      enum clk_state state,
@@ -1064,6 +1094,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
 	.rate_get = scmi_clock_rate_get,
 	.rate_set = scmi_clock_rate_set,
 	.determine_rate = scmi_clock_determine_rate,
+	.all_rates_get = scmi_clock_all_rates_get,
 	.enable = scmi_clock_enable,
 	.disable = scmi_clock_disable,
 	.state_get = scmi_clock_state_get,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5552ac04c820..c710107c2120 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -40,6 +40,12 @@ struct scmi_revision_info {
 	char sub_vendor_id[SCMI_SHORT_NAME_MAX_SIZE];
 };
 
+struct scmi_clock_rates {
+	bool rate_discrete;
+	unsigned int num_rates;
+	u64 *rates;
+};
+
 struct scmi_clock_info {
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int enable_latency;
@@ -85,6 +91,7 @@ enum scmi_clock_oem_config {
  *		    clock calculating the closest allowed rate.
  *		    Note that @rate is an input/output parameter used both to
  *		    describe the requested rate and report the closest match
+ * @all_rates_get: get the list of all available rates for the specified clock.
  * @enable: enables the specified clock
  * @disable: disables the specified clock
  * @state_get: get the status of the specified clock
@@ -104,6 +111,8 @@ struct scmi_clk_proto_ops {
 			u64 rate);
 	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			      unsigned long *rate);
+	const struct scmi_clock_rates __must_check *(*all_rates_get)
+		(const struct scmi_protocol_handle *ph, u32 clk_id);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
-- 
2.53.0


