Return-Path: <linux-renesas-soc+bounces-28584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLA6MjfNoWn3wQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:58:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5631BB1AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 17:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1549309B432
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB234B425;
	Fri, 27 Feb 2026 16:53:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3A30E830;
	Fri, 27 Feb 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211225; cv=none; b=bI0lsAmt0KRHwNKhRJAhwjArnyvcpCG6WI70F1zfRefipYgT5wJQ1ZLSC/C9RjnM3xCLDTBWaFZg8CTvtdl7bl60tAtNGUvlXsi2HVN/EhMZEylBYH/DJ89rlMtmhgevW/GKl37AxhM7Rddred0tUo9yfDZ0Z8Io7sXT2pgkKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211225; c=relaxed/simple;
	bh=PHeqLC9wOludQmAbjqNh84rSAWNcGzxZEVtvdpq6xvU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQuSRb/whCDqgLrPnfBkZ36KxxTuva3Ogff19ww1zpxqd43yPCEQtubt+BKTwX8QQH4eqAc00cFFKSYFxzm6Hsxf9oaz9SD3tor1jx+GgAa2r9qf2cu940iMN6A/3cCQF8OqNy0sDdVHNJRJzgn49UpUMBDIJmWyIPiZsNfdXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fMvXV3bTQzJ469d;
	Sat, 28 Feb 2026 00:53:14 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 48E0D40572;
	Sat, 28 Feb 2026 00:53:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 16:53:40 +0000
Date: Fri, 27 Feb 2026 16:53:39 +0000
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
Subject: Re: [PATCH 10/11] firmware: arm_scmi: Use bound iterators to
 minimize discovered rates
Message-ID: <20260227165339.000023f7@huawei.com>
In-Reply-To: <20260227153225.2778358-11-cristian.marussi@arm.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
	<20260227153225.2778358-11-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28584-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 2F5631BB1AD
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 15:32:24 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Clock rates are guaranteed to be returned in ascending order for SCMI clock
> protocol versions greater than 1.0: in such a case, use bounded iterators
> to minimize the number of message exchanges needed to discover min and max
> rate.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> +
> +static int
> +scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
> +			      u32 clk_id, struct clock_info *cinfo)
> +{
> +	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
> +	int ret;
> +
> +	/*
> +	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
> +	 * be discovered in ascending order, lazy enumeration cannot be use for
> +	 * SCMI Clock v1.0 protocol.
> +	 */
> +	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
> +		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
> +	else
> +		ret = scmi_clock_describe_rates_get_full(ph, clkd);
> +
> +	if (ret)
> +		return ret;
> +
> +	clkd->info.min_rate = clkd->rates[RATE_MIN];
>  	if (!clkd->rate_discrete) {
>  		clkd->info.max_rate = clkd->rates[RATE_MAX];
>  		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
>  			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
>  			clkd->rates[RATE_STEP]);
>  	} else {
> -		sort(clkd->rates, clkd->num_rates,
> -		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>  		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
> +		dev_dbg(ph->dev, "Clock:%s DISCRETE:%d -> Min %llu Max %llu\n",
> +			clkd->info.name, clkd->rate_discrete,
> +			clkd->info.min_rate, clkd->info.max_rate);
>  	}
> -	clkd->info.min_rate = clkd->rates[RATE_MIN];
>  
> -	return 0;
> +	return ret;
Why?  Far as I can see it's still always zero if you get here.

>  }
>  
>  static int


