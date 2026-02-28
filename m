Return-Path: <linux-renesas-soc+bounces-28601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCdoBczEommU5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:34:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B60D1C21F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1BF9302E765
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FE0421A13;
	Sat, 28 Feb 2026 10:34:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDD44219F2;
	Sat, 28 Feb 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274887; cv=none; b=rhyzl3Tm25fK3rDTtbXKClqrqXHLeXpFkaAujuHOJ8lpoVsC3ULjvgNGHtmnIHI9Its2OZ7KJ5WSd+CJbxOr7iAyC3gufwZj3a3NYsFKhlGIN3flPDAYNImT4ekTY1I3+aVOEAxloNjWFbhB2txMajD9xtuD9aoNfV0Zw5fu6XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274887; c=relaxed/simple;
	bh=2WYRtzhnWJ7q8KnHUuARA8iJxX78I6OkYd8mjNdSoMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwliO3DAJNLs3XcWwzrubZDcSEjqBIxJBB0nFS3RYkHS60CsVxRsiNbXt7axIPbtagz1BuA98aw25gnlYxz4BKpUUuLhFTniraF6DkcEa5RgBrx9BrLtQHn7GF/50pX6He2LJMXaS0pcdJXRztPBhx34fjpvinJvbOoeORNf7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2221516;
	Sat, 28 Feb 2026 02:34:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7D393F7BD;
	Sat, 28 Feb 2026 02:34:40 -0800 (PST)
Date: Sat, 28 Feb 2026 10:34:37 +0000
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
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed
 interface
Message-ID: <aaLEvewQkqt9MkwL@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com>
 <aaJN4BSVB2RhICWK@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJN4BSVB2RhICWK@shlinux89>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28601-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,bootlin.com:url]
X-Rspamd-Queue-Id: 7B60D1C21F7
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:07:28AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:17PM +0000, Cristian Marussi wrote:
> >Move needlessly exposed fields away from scmi_clock_info into the new
> >internal struct scmi_clock_desc while keeping exposed only the two new
> >min_rate and max_rate fields for each clock.
> >
> >No functional change.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 145 +++++++++++++++---------------
> > include/linux/scmi_protocol.h     |   2 +
> > 2 files changed, 74 insertions(+), 73 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index 54e8b59c3941..f5d1c608f85a 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> > 	__le32 rate_high;
> > };
> > 
> >+struct scmi_clock_desc {
> >+	u32 id;
> >+	bool rate_discrete;
> >+	unsigned int num_rates;
> >+	u64 rates[SCMI_MAX_NUM_RATES];
> >+#define	RATE_MIN	0
> >+#define	RATE_MAX	1
> >+#define	RATE_STEP	2
> >+	struct scmi_clock_info info;
> >+};
> >+
> >+#define to_desc(p)	(container_of((p), struct scmi_clock_desc, info))
> 
> Nit:
> no need parentheses
> 

ok...

> >+
> > struct clock_info {
> > 	int num_clocks;
> > 	int max_async_req;
> > 	bool notify_rate_changed_cmd;
> > 	bool notify_rate_change_requested_cmd;
> > 	atomic_t cur_async_req;
> >-	struct scmi_clock_info *clk;
> >+	struct scmi_clock_desc *clkds;
> >+#define CLOCK_INFO(c, i)	(&(((c)->clkds + (i))->info))
> 
> Ditto.

ok

> 
> > 	int (*clock_config_set)(const struct scmi_protocol_handle *ph,
> > 				u32 clk_id, enum clk_state state,
> > 				enum scmi_clock_oem_config oem_type,
> >@@ -185,7 +199,7 @@ scmi_clock_domain_lookup(struct clock_info *ci, u32 clk_id)
> > 	if (clk_id >= ci->num_clocks)
> > 		return ERR_PTR(-EINVAL);
> > 
> >-	return ci->clk + clk_id;
> >+	return CLOCK_INFO(ci, clk_id);
> > }

[snip] 

> > 
> >@@ -536,16 +526,23 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
> > 	if (ret)
> > 		return ret;
> > 
> >-	if (!clk->rate_discrete) {
> >+	/* empty set ? */
> >+	if (!clkd->num_rates)
> >+		return 0;
> >+
> >+	if (!clkd->rate_discrete) {
> >+		clkd->info.max_rate = clkd->rates[RATE_MAX];
> 
> Not related to this patch. Just have a question,
> if a broken firmware returns RATE_MIN, but no RATE_MAX and RATE_STEP,
> should some sanity checking being added?
>

I think we already have consistency check around this, while parsing
with the iterators

	https://elixir.bootlin.com/linux/v6.19.3/source/drivers/firmware/arm_scmi/clock.c#L464

...and a related quirk because some platform really reported the right
number of rates BUT failed to express that in the message AND the
introduced additional checks broke some platforms in the wild..

	https://elixir.bootlin.com/linux/v6.19.3/source/drivers/firmware/arm_scmi/clock.c#L433

Do you see still some opportunity for misbehave with the above ?

Thanks,
Cristian

