Return-Path: <linux-renesas-soc+bounces-28568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eITaD9e8oWmswAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:48:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AE1BA3ED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7828730BF0BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5029B43E48D;
	Fri, 27 Feb 2026 15:34:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D7543E497;
	Fri, 27 Feb 2026 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206453; cv=none; b=qOTiJEq3ukMzmD7kcmVNy0RuZ1ZIlngEtiUw9STGLnDoqNrqqKig93W97mhAbyN4Myxh/runvQDULi6iFpLOWC+HMDvoElGyd/ZLyBJkMx6uZn0ZfHp0pksKR92f2N0OreYq/Fb1sOm/uX9DzYr7cXfSbyFCou2V+7FiPlPimZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206453; c=relaxed/simple;
	bh=jCtpdtL9Oa4C9wz/4HfV2UAWvexwgg0RKr0p33wNXec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdBuPNdTgpQqWt3a4aJBySNjulC5ilouxquBAPXtDRzXLqRCkYkKSWEuIeJwZ2FjgUz3zJZNP2wErXqxbtDSzE7zWjpZhdeOcfBBEXonzSKUiI1ysPn7z5eMUGyMbrtkZ//DWk5+C+QhcWx8umCfLauYgMazxW/MIsALJU6O+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C92339;
	Fri, 27 Feb 2026 07:34:04 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCBB63F73B;
	Fri, 27 Feb 2026 07:34:03 -0800 (PST)
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
Subject: [PATCH 10/11] firmware: arm_scmi: Use bound iterators to minimize discovered rates
Date: Fri, 27 Feb 2026 15:32:24 +0000
Message-ID: <20260227153225.2778358-11-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28568-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.903];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 718AE1BA3ED
X-Rspamd-Action: no action

Clock rates are guaranteed to be returned in ascending order for SCMI clock
protocol versions greater than 1.0: in such a case, use bounded iterators
to minimize the number of message exchanges needed to discover min and max
rate.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 92 +++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index d7df5c45836e..a0de10652abe 100644
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
@@ -544,19 +545,90 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
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
 
-	return 0;
+	return ret;
 }
 
 static int
-- 
2.53.0


