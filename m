Return-Path: <linux-renesas-soc+bounces-28606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN16EsPHommy5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:47:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E53481C23F2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52442302EC8D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AF44279F3;
	Sat, 28 Feb 2026 10:47:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BB035A394;
	Sat, 28 Feb 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275648; cv=none; b=imRzE48LSvqwnZw+BbKw6FjxansjDo75ssM01ttIcfxbcrg2H8CgmZ0+lXNts9kDYFjv+9qQ6t5YskZ7x4dP3spYiDFMK2qZSfGdrMkdWjU4ivvCpFcxOIvTldxZYbhumZzUsJO1ukmlKQei9LwVt1GwOOQJUcfSwKLB2s563v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275648; c=relaxed/simple;
	bh=nzAk7/QowEGPMrlDONM9TR2kjxqD1F41usJmvt9CiyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N34Dnv4Ja3SAQIHCnMPNff6sToHCPPs5zldK1yodTgiOMq5b1SaRHooDPvzWqdU3ep+bZsWgM1WYtySPty+Xh5YIGbLROFvi6YkFOMm9zJgpBA3gTZoU2elIZFMz9mW8d/qpeI/oZXHwcOBcwlcHaYSoN/JyBuxDHBK5sY41oRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AB711516;
	Sat, 28 Feb 2026 02:47:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A713F7BD;
	Sat, 28 Feb 2026 02:47:22 -0800 (PST)
Date: Sat, 28 Feb 2026 10:47:20 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 11/11] firmware: arm_scmi: Introduce all_rates_get clock
 operation
Message-ID: <aaLHuHFpcxdyqf9P@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
 <aaJXy2V7oI1tH4Ac@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJXy2V7oI1tH4Ac@shlinux89>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28606-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: E53481C23F2
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:49:47AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
> >Add a clock operation to get the whole set of rates available to a specific
> >clock: when needed this request could transparently trigger a full rate
> >discovery enumeration if this specific clock-rates were previously only
> >lazily enumerated.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
> > include/linux/scmi_protocol.h     |  9 ++++
> > 2 files changed, 67 insertions(+), 27 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index a0de10652abe..c2fd9a1c3316 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
> > 
> > struct scmi_clock_desc {
> > 	u32 id;
> >-	bool rate_discrete;
> > 	unsigned int tot_rates;
> >-	unsigned int num_rates;
> >-	u64 *rates;
> >+	struct scmi_clock_rates r;
> > #define	RATE_MIN	0
> > #define	RATE_MAX	1
> > #define	RATE_STEP	2
> >@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 	flags = le32_to_cpu(r->num_rates_flags);
> > 	st->num_remaining = NUM_REMAINING(flags);
> > 	st->num_returned = NUM_RETURNED(flags);
> >-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
> >+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
> > 
> > 	/* Warn about out of spec replies ... */
> >-	if (!p->clkd->rate_discrete &&
> >+	if (!p->clkd->r.rate_discrete &&
> > 	    (st->num_returned != 3 || st->num_remaining != 0)) {
> > 		dev_warn(p->dev,
> > 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> >@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 	if (!st->max_resources) {
> > 		unsigned int tot_rates = st->num_returned + st->num_remaining;
> > 
> >-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
> >-					      sizeof(*p->clkd->rates), GFP_KERNEL);
> >-		if (!p->clkd->rates)
> >+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
> >+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
> >+		if (!p->clkd->r.rates)
> > 			return -ENOMEM;
> > 
> > 		/* max_resources is used by the iterators to control bounds */
> >@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> > 	struct scmi_clk_ipriv *p = priv;
> > 	const struct scmi_msg_resp_clock_describe_rates *r = response;
> > 
> >-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> >+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> > 
> > 	/* Count only effectively discovered rates */
> >-	p->clkd->num_rates++;
> >+	p->clkd->r.num_rates++;
> > 
> > 	return 0;
> > }
> >@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> > 		.dev = ph->dev,
> > 	};
> > 
> >-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
> >+	/*
> >+	 * Using tot_rates as max_resources parameter here so as to trigger
> >+	 * the dynamic allocation only when strictly needed: when trying a
> >+	 * full enumeration after a lazy one tot_rates will be non-zero.
> >+	 */
> >+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
> >+					    CLOCK_DESCRIBE_RATES,
> > 					    sizeof(struct scmi_msg_clock_describe_rates),
> > 					    &cpriv);
> > 	if (IS_ERR(iter))
> >@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> > 		return ret;
> > 
> > 	/* empty set ? */
> >-	if (!clkd->num_rates)
> >+	if (!clkd->r.num_rates)
> > 		return 0;
> > 
> >-	if (clkd->rate_discrete)
> >-		sort(clkd->rates, clkd->num_rates,
> >-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
> 
> Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
> get something wrong, should use ">="?

I have NOT double checked BUT I think fro Etienne original patch, you
can assume that clock rates are returned by the platform in ascending
order (already sorted) only after Clock protocol version 0x01, the first
ever, so ONLY when teh used version is 0x1 we must perform a full scan
(no lazy optimization since we cannot assume that rates[last-1] is max
AND we must sort the obtained list of clocks...

Thanks,
Cristian

