Return-Path: <linux-renesas-soc+bounces-31735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLiqLYIW8Wm6dAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:20:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0FF48BAA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D6D9309DBF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 20:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206FF35B645;
	Tue, 28 Apr 2026 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NtgNhkQO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B1539527C;
	Tue, 28 Apr 2026 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407443; cv=none; b=fi3ixzsBdwp8IJRgXytIXjv/AG9RbRdre4b8ftTEaDsvXRAyfuukRnieYoZWvb+HrhDJaRNeuCAEXEk+mG/W9j8OwsB4UAiQ1CBearUzuLpF4mQGnH0fJtWerap6xOLLSG4K2GASEUQR0eB1z6Tgx/eqMpfov6+mgDZuu8Edmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407443; c=relaxed/simple;
	bh=cinOs3FUzEPcdTbTkmYDC2KeojNRYuDSqaYF95xRaEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiCbGKCXDpUmAU1Q27/+cAKQkrUHUj9075ryB1CJ4/f/7BI7oZIB4qaMS+tumMzQNsqOrYgm+nl+CEmRGBl/sWJkUHOQNOoC3dRayJ3HJNHZX/AFbZAT6puv3VfLMxMFvcLw3aMy2RnKqYGjI8nhVywdouYjsr4Vc52oFzJQxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NtgNhkQO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C3FC3296;
	Tue, 28 Apr 2026 13:17:15 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C44323F763;
	Tue, 28 Apr 2026 13:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407440; bh=cinOs3FUzEPcdTbTkmYDC2KeojNRYuDSqaYF95xRaEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtgNhkQOPzrpXCvuuBj7InMLpjtPlyueQ0+wSAnEIlKG6qH9rONfJiyyoGZGn82OD
	 wxZu2++vFuX3jjcCy9nQ7d55xoFhEgRhP59P5E3qxLf3oKiae7i4G0D8aux6z1eEcC
	 ZnMyHwl1KV0FBl9laXYPeM4doJ9EztzKwJXDVtOU=
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
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 15/15] firmware: arm_scmi: Introduce all_rates_get clock operation
Date: Tue, 28 Apr 2026 21:15:22 +0100
Message-ID: <20260428201522.903875-16-cristian.marussi@arm.com>
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
X-Rspamd-Queue-Id: 2D0FF48BAA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31735-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid]

Add a clock operation to get the whole set of rates available to a specific
clock: when needed this request could transparently trigger a full rate
discovery enumeration if this specific clock-rates were previously only
lazily enumerated.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed tags
---
 drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
 include/linux/scmi_protocol.h     |  9 ++++
 2 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ba25a9c6d3ae..316d3cd90c81 100644
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
@@ -586,7 +590,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	 * If discrete and we don't already have it, grab the last value, which
 	 * should be the max
 	 */
-	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
+	if (clkd->r.rate_discrete && clkd->tot_rates > clkd->r.num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
@@ -618,16 +622,16 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
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
 
@@ -732,7 +736,7 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	 * If we can't figure out what rate it will be, so just return the
 	 * rate back to the caller.
 	 */
-	if (clkd->rate_discrete)
+	if (clkd->r.rate_discrete)
 		return 0;
 
 	fmin = clk->min_rate;
@@ -746,14 +750,40 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	}
 
 	ftmp = *rate - fmin;
-	ftmp += clkd->rates[RATE_STEP] - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clkd->rates[RATE_STEP]);
+	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
+	ftmp = div64_ul(ftmp, clkd->r.rates[RATE_STEP]);
 
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
@@ -1067,6 +1097,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
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


