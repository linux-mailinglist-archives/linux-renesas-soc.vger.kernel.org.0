Return-Path: <linux-renesas-soc+bounces-28600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJLHJEnComls5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:24:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC71C2065
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B3C53031EB6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E6C41C2E8;
	Sat, 28 Feb 2026 10:24:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7900F36923C;
	Sat, 28 Feb 2026 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772274245; cv=none; b=FspL+FgN11AIIkOUKVgzwxY3qyPAn7CEIH91jCRKQIEKx4Z4RdmgFMBj0gRARHO9S/TFlrhxLc4K7T+D4Ru0S+jYuEd0Jt4TqSWmqedG5uKe9C7XaPpJv14vm/SoOYUIGvcFBnWkw+orOJysoH8dXDd23t4Gx9tV0pPfv0N+/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772274245; c=relaxed/simple;
	bh=XxX53b31hmsmTyAhVbbI+w4NrUCJsO7S50i1Kox86bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx1jnoXWyTDWJsM1HNYF2YHGD77mxxGWRunuxxx2cZxGOhpucFRrSm8qZoVMZHBE0gKBv780Ih2yLQkHWDIprSd508nHovYLICgsmJJRSaKK+JwoVOzFLaOmuycNr1D/smN4JToU4x2dcNTPLidE1VOSsTwjPma+m5Hm5SOVIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B62B1516;
	Sat, 28 Feb 2026 02:23:56 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8EC33F7BD;
	Sat, 28 Feb 2026 02:23:57 -0800 (PST)
Date: Sat, 28 Feb 2026 10:23:54 +0000
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
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aaLCOstT89XQEP6P@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI9JBwWaMmfBbd/@shlinux89>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28600-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com,redhat.com,baylibre.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3BC71C2065
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> >Use the Clock protocol layer determine_rate logic to calculate the closest
> >rate that can be supported by a specific clock.
> >
> >No functional change.
> >
> >Cc: Brian Masney <bmasney@redhat.com>
> >Cc: Michael Turquette <mturquette@baylibre.com>
> >Cc: Stephen Boyd <sboyd@kernel.org>
> >Cc: linux-clk@vger.kernel.org
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Note that the calculation logic in the protocol layer is exactly the same
> >as it wes here.
> >
> >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> >such SCMI clocks.
> 
> Per my reading of Brain's thread, if ->determine_rate exists,
> ->determine_rate() will be used.
> 
>  	} else if (core->ops->determine_rate) {
>  		return core->ops->determine_rate(core->hw, req);
> +	} else if (clk_is_rounding_fw_managed(core)) {
> +		return 0;
> 
> So unless update scmi_clk_determine_rate() to something:
> --------
> if (clk & CLK_ROUNDING_FW_MANAGED)
> 	return 0;
> 
> return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> --------
> 
> It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> above the check of core->ops->determine_rate().

Indeed, I may have not fully understood Brian patch, since it appeared
while I was already reworking this...

I suppose I could also refrain from registering a determine_rate and
use the new flag when I know the rate will be rounded by FW...in the
future simply there will be the possibility to ask the firmware first
for a final 'clock rate determination' upfront in some of the cases in
which now we rely on FW rounding..

> 
> >---
> > drivers/clk/clk-scmi.c | 31 ++++++-------------------------
> > 1 file changed, 6 insertions(+), 25 deletions(-)
> >
> >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> >index 6b286ea6f121..c223e4ef1dd1 100644
> >--- a/drivers/clk/clk-scmi.c
> >+++ b/drivers/clk/clk-scmi.c
> >@@ -12,7 +12,6 @@
> > #include <linux/of.h>
> > #include <linux/module.h>
> > #include <linux/scmi_protocol.h>
> >-#include <asm/div64.h>
> > 
> > #define NOT_ATOMIC	false
> > #define ATOMIC		true
> >@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > static int scmi_clk_determine_rate(struct clk_hw *hw,
> > 				   struct clk_rate_request *req)
> > {
> >-	u64 fmin, fmax, ftmp;
> >+	int ret;
> > 	struct scmi_clk *clk = to_scmi_clk(hw);
> > 
> > 	/*
> >-	 * We can't figure out what rate it will be, so just return the
> >-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
> >-	 * after the rate is set and we'll know what rate the clock is
> >+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
> >+	 * called after the rate is set and we'll know what rate the clock is
> > 	 * running at then.
> > 	 */
> >-	if (clk->info->rate_discrete)
> >-		return 0;
> >-
> >-	fmin = clk->info->range.min_rate;
> >-	fmax = clk->info->range.max_rate;
> >-	if (req->rate <= fmin) {
> >-		req->rate = fmin;
> >-
> >-		return 0;
> >-	} else if (req->rate >= fmax) {
> >-		req->rate = fmax;
> >-
> >-		return 0;
> >-	}
> >-
> >-	ftmp = req->rate - fmin;
> >-	ftmp += clk->info->range.step_size - 1; /* to round up */
> >-	do_div(ftmp, clk->info->range.step_size);
> >-
> >-	req->rate = ftmp * clk->info->range.step_size + fmin;
> >+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> >+	if (ret)
> >+		return ret;
> 
> nit:
> "return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);"

..oh yes...
> 
> Otherwise:
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 

Thanks,
Cristian

