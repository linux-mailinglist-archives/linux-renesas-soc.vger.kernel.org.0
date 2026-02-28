Return-Path: <linux-renesas-soc+bounces-28598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNAlO5S+omkr5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:08:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DF1C1E48
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FAD5302AD2B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378F140F8F4;
	Sat, 28 Feb 2026 10:07:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CDB407592;
	Sat, 28 Feb 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273273; cv=none; b=V1JDVLu1UQH+eJyYhDxuXE36VW6JRn7aOG6x5GKue7AUKDms5PdxGDvVr/C24VOTr52926ax1Mwy68gksbJ1pI+4K7Cs7etaesAxZcqvXFnjBCsdPN0MMb6AsmH19OP9YssfGTmpB5nXZaDeiD/JsUtwUpxGN6Enf0ILv4bEy24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273273; c=relaxed/simple;
	bh=4/cPzflDTW7DUSptMo2+wGlYGjykDqCn0LPoJWqoxhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQqvzRY/TZgXvMuhmhafC0cPDQ4jJgyk4Y6hnp4LCGdIz8a9WaJPDSdwNbl1+bGigP2FWpUhnHCrne78BtndwbpnAWWKsv3HLadZd86r72P/cDUfdNTjY9qPmR02JveLAwzzp3huhZIdQHDBU1XRUocOlDnsrx6SjrBhza8WGt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6472E1516;
	Sat, 28 Feb 2026 02:07:44 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8012C3F7BD;
	Sat, 28 Feb 2026 02:07:46 -0800 (PST)
Date: Sat, 28 Feb 2026 10:07:42 +0000
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
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaK-bnBtKXmAjIJQ@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <20260227165009.000040d6@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227165009.000040d6@huawei.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28598-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 5F6DF1C1E48
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 04:50:09PM +0000, Jonathan Cameron wrote:
> On Fri, 27 Feb 2026 15:32:15 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a clock operation to help determining the effective rate, closest to
> > the required one, that a specific clock can support.
> > 
> > Calculation is currently performed kernel side and the logic is taken
> > directly from the SCMI Clock driver: embedding the determinate rate logic
> > in the protocol layer enables semplifications in the SCMI Clock protocol
> 
> simplifications
> 
> > interface and  will more easily accommodate further evolutions where such
> > determine_rate logic into is optionally delegated to the platform SCMI
> > server.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> Hi Cristian,
> 
> Drive by review follows.  It's Friday afternoon an only a few mins to beer
> o'clock :)

Thanks for having a look :P

> 
> > ---
> > Spoiler alert next SCMI spec will most probably include a new
> > CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> > so this clock proto_ops will be needed anyway sooner or later
> > ---
> >  drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
> >  include/linux/scmi_protocol.h     |  6 +++++
> >  2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > index ab36871650a1..54e8b59c3941 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/limits.h>
> >  #include <linux/sort.h>
> > +#include <asm/div64.h>
> >  
> >  #include "protocols.h"
> >  #include "notify.h"
> > @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
> >  	return ret;
> >  }
> >  
> > +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> > +				     u32 clk_id, unsigned long *rate)
> > +{
> > +	u64 fmin, fmax, ftmp;
> > +	struct scmi_clock_info *clk;
> > +	struct clock_info *ci = ph->get_priv(ph);
> > +
> > +	if (!rate)
> > +		return -EINVAL;
> > +
> > +	clk = scmi_clock_domain_lookup(ci, clk_id);
> > +	if (IS_ERR(clk))
> > +		return PTR_ERR(clk);
> > +
> > +	/*
> > +	 * If we can't figure out what rate it will be, so just return the
> > +	 * rate back to the caller.
> > +	 */
> > +	if (clk->rate_discrete)
> > +		return 0;
> > +
> > +	fmin = clk->range.min_rate;
> > +	fmax = clk->range.max_rate;
> > +	if (*rate <= fmin) {
> 
> Does the rate ever end up different by doing this than it would if you
> just dropped these short cuts? If not I wonder if this code complexity
> is worthwhile vs
> 
> 	*rate = clamp(*rate, clk->range.min_rate, clk->range.max_rate);
> 
> then carry on with the clamping to a step.
> 
> The only case I can immediately spot where it would be different would
> be if (range.max_rate - range.min_rate) % range.step_size != 0
> which smells like an invalid clock and could result in an out of
> range rounding up anyway.

Yes indeed, but this patch aimed really ONLY at moving this logic from the
CLK SCMI driver into the SCMI Clock protocol layer since it then enables
more simplications...I have NOT really look into the logic...I suppose I
could optimize this in a following distinct patch...

> 
> > +		*rate = fmin;
> > +		return 0;
> > +	} else if (*rate >= fmax) {
> > +		*rate = fmax;
> > +		return 0;
> > +	}
> > +
> > +	ftmp = *rate - fmin;
> > +	ftmp += clk->range.step_size - 1; /* to round up */
> > +	do_div(ftmp, clk->range.step_size);
> > +
> > +	*rate = ftmp * clk->range.step_size + fmin;
> > +
> > +	return 0;
> > +}
> 

Thanks,
Cristian

