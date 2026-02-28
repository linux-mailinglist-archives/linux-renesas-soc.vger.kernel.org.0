Return-Path: <linux-renesas-soc+bounces-28605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODtqDuzGommy5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:43:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF881C2356
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 482B53018069
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8197942316D;
	Sat, 28 Feb 2026 10:43:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE8E421EEB;
	Sat, 28 Feb 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275430; cv=none; b=S5SNNjny2lEB2GACzVZIKeJ7378FlqoXaEVEUk14FoymqTyDL3/EIh5wpu8r+brsdAEhToZGKIB3qORJarelrFkDKyzujuDEqXSbB4r+pLQv/waoENuTc0iTOP1zvHA6SBDiaBzHILvHwy2kF/bXHZ0LFrsjqxwYR2d+Wl557XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275430; c=relaxed/simple;
	bh=hidSDrD8KCcUuqVL8DmgYJwQYVoN2ONSHO9/fzM98Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNrjUzRrJ1qbcRL1tPRTQhNTixgWUHe76AZmTxX53A50xewTpnXWxOgNsT7leOU6rsvTJXVdMxZHNVxlUqeHyPcW5Lr/tAP0Lq5FrHGMH2AyPx1nCs9v/qSHM5HvlDjHEKljMV/ZRPOz7zz+QA0MlCC6LSGoQfp8g43IpaE1kHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3C21516;
	Sat, 28 Feb 2026 02:43:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027DD3F7BD;
	Sat, 28 Feb 2026 02:43:43 -0800 (PST)
Date: Sat, 28 Feb 2026 10:43:40 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 10/11] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
Message-ID: <aaLG3H432RQKENzY@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-11-cristian.marussi@arm.com>
 <20260227165339.000023f7@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227165339.000023f7@huawei.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28605-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 5EF881C2356
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:53:39PM +0000, Jonathan Cameron wrote:
> On Fri, 27 Feb 2026 15:32:24 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Clock rates are guaranteed to be returned in ascending order for SCMI clock
> > protocol versions greater than 1.0: in such a case, use bounded iterators
> > to minimize the number of message exchanges needed to discover min and max
> > rate.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > +
> > +static int
> > +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> > +			      u32 clk_id, struct clock_info *cinfo)
> > +{
> > +	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> > +	int ret;
> > +
> > +	/*
> > +	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> > +	 * be discovered in ascending order, lazy enumeration cannot be use for
> > +	 * SCMI Clock v1.0 protocol.
> > +	 */
> > +	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> > +		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> > +	else
> > +		ret = scmi_clock_describe_rates_get_full(ph, clkd);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	clkd->info.min_rate = clkd->rates[RATE_MIN];
> >  	if (!clkd->rate_discrete) {
> >  		clkd->info.max_rate = clkd->rates[RATE_MAX];
> >  		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
> >  			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
> >  			clkd->rates[RATE_STEP]);
> >  	} else {
> > -		sort(clkd->rates, clkd->num_rates,
> > -		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >  		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> > +		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> > +			clkd->info.name, clkd->rate_discrete,
> > +			clkd->info.min_rate, clkd->info.max_rate);
> >  	}
> > -	clkd->info.min_rate = clkd->rates[RATE_MIN];
> >  
> > -	return 0;
> > +	return ret;
> Why?  Far as I can see it's still always zero if you get here.

...well...simply bad refactoring late evening near beer o'clock time :P

I will fix.

Thanks,
Cristian

