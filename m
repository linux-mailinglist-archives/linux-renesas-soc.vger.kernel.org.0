Return-Path: <linux-renesas-soc+bounces-28583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAiZN1rMoWnowQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:54:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3562E1BB108
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625CE30A846C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862C23491DB;
	Fri, 27 Feb 2026 16:50:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380CE348880;
	Fri, 27 Feb 2026 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211018; cv=none; b=kC0UvzJOP9+9NKGThfUmLFTek7IQqATo3e9FrpDeLr+dECu4x4jwXuwjn9yX+sp4nr6hKj7Tbeg9ju403lQultR5KANy0PIM6z+Eiw7E7X109kKhs+IfrGBaFG2S1UnG9U6Y7ma2cDCAL+h704bSk4FzJSjlzbvKtngwuvWCMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211018; c=relaxed/simple;
	bh=mBElEvsqTnqCQpSLAtKfOUoBMZIeL94uiobVLGf8AdE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t7vTyuCVe4N6jlG95IXTlfLHajw8mmN+lHAXxnnDpO2hWo6wLIMdQwf2Teo5mykdm5Pu2ouWMbs/tNAdEJRloN+1CdbuUcOsJrCQXBcpbcadlHdJBE7wmO2mJJPfqgtaFUOG+ENdZPvLNKOuZzk9oxWIK0z4ZZyMbTqHcwq8QN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fMvST2qHSzJ46C8;
	Sat, 28 Feb 2026 00:49:45 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D48B40584;
	Sat, 28 Feb 2026 00:50:12 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 16:50:11 +0000
Date: Fri, 27 Feb 2026 16:50:09 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <sudeep.holla@arm.com>,
	<philip.radford@arm.com>, <james.quinlan@broadcom.com>,
	<f.fainelli@gmail.com>, <vincent.guittot@linaro.org>,
	<etienne.carriere@foss.st.com>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <dan.carpenter@linaro.org>,
	<geert+renesas@glider.be>, <kuninori.morimoto.gx@renesas.com>,
	<marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <20260227165009.000040d6@huawei.com>
In-Reply-To: <20260227153225.2778358-2-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
	<20260227153225.2778358-2-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28583-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:mid]
X-Rspamd-Queue-Id: 3562E1BB108
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 15:32:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a clock operation to help determining the effective rate, closest to
> the required one, that a specific clock can support.
> 
> Calculation is currently performed kernel side and the logic is taken
> directly from the SCMI Clock driver: embedding the determinate rate logic
> in the protocol layer enables semplifications in the SCMI Clock protocol

simplifications

> interface and  will more easily accommodate further evolutions where such
> determine_rate logic into is optionally delegated to the platform SCMI
> server.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian,

Drive by review follows.  It's Friday afternoon an only a few mins to beer
o'clock :)

> ---
> Spoiler alert next SCMI spec will most probably include a new
> CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> so this clock proto_ops will be needed anyway sooner or later
> ---
>  drivers/firmware/arm_scmi/clock.c | 42 +++++++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index ab36871650a1..54e8b59c3941 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <linux/limits.h>
>  #include <linux/sort.h>
> +#include <asm/div64.h>
>  
>  #include "protocols.h"
>  #include "notify.h"
> @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> +				     u32 clk_id, unsigned long *rate)
> +{
> +	u64 fmin, fmax, ftmp;
> +	struct scmi_clock_info *clk;
> +	struct clock_info *ci = ph->get_priv(ph);
> +
> +	if (!rate)
> +		return -EINVAL;
> +
> +	clk = scmi_clock_domain_lookup(ci, clk_id);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	/*
> +	 * If we can't figure out what rate it will be, so just return the
> +	 * rate back to the caller.
> +	 */
> +	if (clk->rate_discrete)
> +		return 0;
> +
> +	fmin = clk->range.min_rate;
> +	fmax = clk->range.max_rate;
> +	if (*rate <= fmin) {

Does the rate ever end up different by doing this than it would if you
just dropped these short cuts? If not I wonder if this code complexity
is worthwhile vs

	*rate = clamp(*rate, clk->range.min_rate, clk->range.max_rate);

then carry on with the clamping to a step.

The only case I can immediately spot where it would be different would
be if (range.max_rate - range.min_rate) % range.step_size != 0
which smells like an invalid clock and could result in an out of
range rounding up anyway.

> +		*rate = fmin;
> +		return 0;
> +	} else if (*rate >= fmax) {
> +		*rate = fmax;
> +		return 0;
> +	}
> +
> +	ftmp = *rate - fmin;
> +	ftmp += clk->range.step_size - 1; /* to round up */
> +	do_div(ftmp, clk->range.step_size);
> +
> +	*rate = ftmp * clk->range.step_size + fmin;
> +
> +	return 0;
> +}



