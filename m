Return-Path: <linux-renesas-soc+bounces-28553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNHfDby6oWlhwAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:39:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE071B9FDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC8D1312D0DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086CE43635F;
	Fri, 27 Feb 2026 15:33:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC1A329E66;
	Fri, 27 Feb 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206403; cv=none; b=YTuwt7bmMt+cGqpyqSP+3PhNFXygHqrsk8pFJ3mws/77vsJ1gAqzr5F1lnSz2QPT0DdHB5yuxdJvW1GRHz5ygyqiYfzM2B8gFdLSh9NMVeZw84yUBBgf/N2xuBOc8LHj5HNDSTVhnAUl8sJC2C9fIxysxAhkItLo7AFpzFIplXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206403; c=relaxed/simple;
	bh=1RDdoXQv8ByWzH0qtHjedbEuu4NTenKcqHV7lqJbm5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNMDZLZwxTlV6DSeweWk3rjJ5aedMhFoaxbvACS505WqViWRiP5Jjm1taJOR9K61bwPS/Ny2ivcEz+hobd/QHxhr6an3LO6G9eNlZLksfDFxSk4sH3mMfAvODDA98FjpF99R2Dj5akMODW03op8nOjj7ou5C4h9TCaMBhEfdjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66A83339;
	Fri, 27 Feb 2026 07:33:15 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8D93F73B;
	Fri, 27 Feb 2026 07:33:13 -0800 (PST)
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
Subject: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed interface
Date: Fri, 27 Feb 2026 15:32:17 +0000
Message-ID: <20260227153225.2778358-4-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28553-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.901];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAE071B9FDE
X-Rspamd-Action: no action

Move needlessly exposed fields away from scmi_clock_info into the new
internal struct scmi_clock_desc while keeping exposed only the two new
min_rate and max_rate fields for each clock.

No functional change.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 145 +++++++++++++++---------------
 include/linux/scmi_protocol.h     |   2 +
 2 files changed, 74 insertions(+), 73 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 54e8b59c3941..f5d1c608f85a 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
 	__le32 rate_high;
 };
 
+struct scmi_clock_desc {
+	u32 id;
+	bool rate_discrete;
+	unsigned int num_rates;
+	u64 rates[SCMI_MAX_NUM_RATES];
+#define	RATE_MIN	0
+#define	RATE_MAX	1
+#define	RATE_STEP	2
+	struct scmi_clock_info info;
+};
+
+#define to_desc(p)	(container_of((p), struct scmi_clock_desc, info))
+
 struct clock_info {
 	int num_clocks;
 	int max_async_req;
 	bool notify_rate_changed_cmd;
 	bool notify_rate_change_requested_cmd;
 	atomic_t cur_async_req;
-	struct scmi_clock_info *clk;
+	struct scmi_clock_desc *clkds;
+#define CLOCK_INFO(c, i)	(&(((c)->clkds + (i))->info))
 	int (*clock_config_set)(const struct scmi_protocol_handle *ph,
 				u32 clk_id, enum clk_state state,
 				enum scmi_clock_oem_config oem_type,
@@ -185,7 +199,7 @@ scmi_clock_domain_lookup(struct clock_info *ci, u32 clk_id)
 	if (clk_id >= ci->num_clocks)
 		return ERR_PTR(-EINVAL);
 
-	return ci->clk + clk_id;
+	return CLOCK_INFO(ci, clk_id);
 }
 
 static int
@@ -226,8 +240,7 @@ scmi_clock_protocol_attributes_get(const struct scmi_protocol_handle *ph,
 
 struct scmi_clk_ipriv {
 	struct device *dev;
-	u32 clk_id;
-	struct scmi_clock_info *clk;
+	struct scmi_clock_desc *clkd;
 };
 
 static void iter_clk_possible_parents_prepare_message(void *message, unsigned int desc_index,
@@ -236,7 +249,7 @@ static void iter_clk_possible_parents_prepare_message(void *message, unsigned in
 	struct scmi_msg_clock_possible_parents *msg = message;
 	const struct scmi_clk_ipriv *p = priv;
 
-	msg->id = cpu_to_le32(p->clk_id);
+	msg->id = cpu_to_le32(p->clkd->id);
 	/* Set the number of OPPs to be skipped/already read */
 	msg->skip_parents = cpu_to_le32(desc_index);
 }
@@ -246,7 +259,6 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
 {
 	const struct scmi_msg_resp_clock_possible_parents *r = response;
 	struct scmi_clk_ipriv *p = priv;
-	struct device *dev = ((struct scmi_clk_ipriv *)p)->dev;
 	u32 flags;
 
 	flags = le32_to_cpu(r->num_parent_flags);
@@ -258,12 +270,13 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
 	 * assume it's returned+remaining on first call.
 	 */
 	if (!st->max_resources) {
-		p->clk->num_parents = st->num_returned + st->num_remaining;
-		p->clk->parents = devm_kcalloc(dev, p->clk->num_parents,
-					       sizeof(*p->clk->parents),
-					       GFP_KERNEL);
-		if (!p->clk->parents) {
-			p->clk->num_parents = 0;
+		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
+		p->clkd->info.parents = devm_kcalloc(p->dev,
+						     p->clkd->info.num_parents,
+						     sizeof(*p->clkd->info.parents),
+						     GFP_KERNEL);
+		if (!p->clkd->info.parents) {
+			p->clkd->info.num_parents = 0;
 			return -ENOMEM;
 		}
 		st->max_resources = st->num_returned + st->num_remaining;
@@ -280,29 +293,27 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
 	const struct scmi_msg_resp_clock_possible_parents *r = response;
 	struct scmi_clk_ipriv *p = priv;
 
-	u32 *parent = &p->clk->parents[st->desc_index + st->loop_idx];
+	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
 
 	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
 
 	return 0;
 }
 
-static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph, u32 clk_id,
-				       struct scmi_clock_info *clk)
+static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph,
+				       u32 clk_id, struct clock_info *cinfo)
 {
 	struct scmi_iterator_ops ops = {
 		.prepare_message = iter_clk_possible_parents_prepare_message,
 		.update_state = iter_clk_possible_parents_update_state,
 		.process_response = iter_clk_possible_parents_process_response,
 	};
-
+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
 	struct scmi_clk_ipriv ppriv = {
-		.clk_id = clk_id,
-		.clk = clk,
+		.clkd = clkd,
 		.dev = ph->dev,
 	};
 	void *iter;
-	int ret;
 
 	iter = ph->hops->iter_response_init(ph, &ops, 0,
 					    CLOCK_POSSIBLE_PARENTS_GET,
@@ -311,9 +322,7 @@ static int scmi_clock_possible_parents(const struct scmi_protocol_handle *ph, u3
 	if (IS_ERR(iter))
 		return PTR_ERR(iter);
 
-	ret = ph->hops->iter_response_run(iter);
-
-	return ret;
+	return ph->hops->iter_response_run(iter);
 }
 
 static int
@@ -352,7 +361,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 	u32 attributes;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_clock_attributes *attr;
-	struct scmi_clock_info *clk = cinfo->clk + clk_id;
+	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
 
 	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
 				      sizeof(clk_id), sizeof(*attr), &t);
@@ -394,7 +403,7 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 			clk->rate_change_requested_notifications = true;
 		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
 			if (SUPPORTS_PARENT_CLOCK(attributes))
-				scmi_clock_possible_parents(ph, clk_id, clk);
+				scmi_clock_possible_parents(ph, clk_id, cinfo);
 			if (SUPPORTS_GET_PERMISSIONS(attributes))
 				scmi_clock_get_permissions(ph, clk_id, clk);
 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
@@ -424,7 +433,7 @@ static void iter_clk_describe_prepare_message(void *message,
 	struct scmi_msg_clock_describe_rates *msg = message;
 	const struct scmi_clk_ipriv *p = priv;
 
-	msg->id = cpu_to_le32(p->clk_id);
+	msg->id = cpu_to_le32(p->clkd->id);
 	/* Set the number of rates to be skipped/already read */
 	msg->rate_index = cpu_to_le32(desc_index);
 }
@@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	flags = le32_to_cpu(r->num_rates_flags);
 	st->num_remaining = NUM_REMAINING(flags);
 	st->num_returned = NUM_RETURNED(flags);
-	p->clk->rate_discrete = RATE_DISCRETE(flags);
+	p->clkd->rate_discrete = RATE_DISCRETE(flags);
 
 	/* Warn about out of spec replies ... */
-	if (!p->clk->rate_discrete &&
+	if (!p->clkd->rate_discrete &&
 	    (st->num_returned != 3 || st->num_remaining != 0)) {
 		dev_warn(p->dev,
 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
-			 p->clk->name, st->num_returned, st->num_remaining,
+			 p->clkd->info.name, st->num_returned, st->num_remaining,
 			 st->rx_len);
 
 		SCMI_QUIRK(clock_rates_triplet_out_of_spec,
@@ -479,38 +488,19 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 				   const void *response,
 				   struct scmi_iterator_state *st, void *priv)
 {
-	int ret = 0;
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	if (!p->clk->rate_discrete) {
-		switch (st->desc_index + st->loop_idx) {
-		case 0:
-			p->clk->range.min_rate = RATE_TO_U64(r->rate[0]);
-			break;
-		case 1:
-			p->clk->range.max_rate = RATE_TO_U64(r->rate[1]);
-			break;
-		case 2:
-			p->clk->range.step_size = RATE_TO_U64(r->rate[2]);
-			break;
-		default:
-			ret = -EINVAL;
-			break;
-		}
-	} else {
-		u64 *rate = &p->clk->list.rates[st->desc_index + st->loop_idx];
+	p->clkd->rates[st->desc_index + st->loop_idx] =
+		RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->num_rates++;
 
-		*rate = RATE_TO_U64(r->rate[st->loop_idx]);
-		p->clk->list.num_rates++;
-	}
-
-	return ret;
+	return 0;
 }
 
 static int
 scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
-			      struct scmi_clock_info *clk)
+			      struct clock_info *cinfo)
 {
 	int ret;
 	void *iter;
@@ -519,9 +509,9 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.update_state = iter_clk_describe_update_state,
 		.process_response = iter_clk_describe_process_response,
 	};
+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
 	struct scmi_clk_ipriv cpriv = {
-		.clk_id = clk_id,
-		.clk = clk,
+		.clkd = clkd,
 		.dev = ph->dev,
 	};
 
@@ -536,16 +526,23 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (ret)
 		return ret;
 
-	if (!clk->rate_discrete) {
+	/* empty set ? */
+	if (!clkd->num_rates)
+		return 0;
+
+	if (!clkd->rate_discrete) {
+		clkd->info.max_rate = clkd->rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
-			clk->range.min_rate, clk->range.max_rate,
-			clk->range.step_size);
-	} else if (clk->list.num_rates) {
-		sort(clk->list.rates, clk->list.num_rates,
-		     sizeof(clk->list.rates[0]), rate_cmp_func, NULL);
+			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
+			clkd->rates[RATE_STEP]);
+	} else {
+		sort(clkd->rates, clkd->num_rates,
+		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
 	}
+	clkd->info.min_rate = clkd->rates[RATE_MIN];
 
-	return ret;
+	return 0;
 }
 
 static int
@@ -630,6 +627,7 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 {
 	u64 fmin, fmax, ftmp;
 	struct scmi_clock_info *clk;
+	struct scmi_clock_desc *clkd;
 	struct clock_info *ci = ph->get_priv(ph);
 
 	if (!rate)
@@ -639,15 +637,17 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	clkd = to_desc(clk);
+
 	/*
 	 * If we can't figure out what rate it will be, so just return the
 	 * rate back to the caller.
 	 */
-	if (clk->rate_discrete)
+	if (clkd->rate_discrete)
 		return 0;
 
-	fmin = clk->range.min_rate;
-	fmax = clk->range.max_rate;
+	fmin = clk->min_rate;
+	fmax = clk->max_rate;
 	if (*rate <= fmin) {
 		*rate = fmin;
 		return 0;
@@ -657,10 +657,10 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	}
 
 	ftmp = *rate - fmin;
-	ftmp += clk->range.step_size - 1; /* to round up */
-	do_div(ftmp, clk->range.step_size);
+	ftmp += clkd->rates[RATE_STEP] - 1; /* to round up */
+	do_div(ftmp, clkd->rates[RATE_STEP]);
 
-	*rate = ftmp * clk->range.step_size + fmin;
+	*rate = ftmp * clkd->rates[RATE_STEP] + fmin;
 
 	return 0;
 }
@@ -1122,17 +1122,16 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
-	cinfo->clk = devm_kcalloc(ph->dev, cinfo->num_clocks,
-				  sizeof(*cinfo->clk), GFP_KERNEL);
-	if (!cinfo->clk)
+	cinfo->clkds = devm_kcalloc(ph->dev, cinfo->num_clocks,
+				    sizeof(*cinfo->clkds), GFP_KERNEL);
+	if (!cinfo->clkds)
 		return -ENOMEM;
 
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
-		struct scmi_clock_info *clk = cinfo->clk + clkid;
-
+		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
 		if (!ret)
-			scmi_clock_describe_rates_get(ph, clkid, clk);
+			scmi_clock_describe_rates_get(ph, clkid, cinfo);
 	}
 
 	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 28579c145045..7283302b0c85 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -51,6 +51,8 @@ struct scmi_clock_info {
 	bool rate_ctrl_forbidden;
 	bool parent_ctrl_forbidden;
 	bool extended_config;
+	u64 min_rate;
+	u64 max_rate;
 	union {
 		struct {
 			int num_rates;
-- 
2.53.0


