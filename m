Return-Path: <linux-renesas-soc+bounces-28624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDMuAc5rpWk4AgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:51:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3841D6DC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39D11305E989
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DB5352FA5;
	Mon,  2 Mar 2026 10:47:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA2C350D7D;
	Mon,  2 Mar 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448448; cv=none; b=Rr1Lf+4qguPbTDPkoUH2T1zX2LRvIJOJADz5agO9YKhNXrBNq/ZkqzdvICMAzcdkuqaTBdApEQ5hhIuImeGJeUBxugHgs63VkPxVBzVw2EpuFow9sPawmD5Hd0ZdfaI4daGEmgxAx2LKlP/4hIrlMFCz5AUjhWQuv3AF/NeIS4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448448; c=relaxed/simple;
	bh=7dWHhQC2IFqeGMM4XAkUbsKg+tjiAbap0pQrYEeCqxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RL2fWx55KIwoH51l9iu6xPTDTNUj3zojS5JZHtZ4j/A5qoYqDc8HHzOIx2nbrS5gI+sDXYWfNqpwhs2TsCL4F+LaRUk4KjZkp0ptyeqQ2xGW/ukGsYY6DIYgV/JGR3pwA6fHAPbxRd2NOtxU4DcerNofuaeXds82t1trZsVbVPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA4F14BF;
	Mon,  2 Mar 2026 02:47:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0BD3F7BD;
	Mon,  2 Mar 2026 02:47:22 -0800 (PST)
Date: Mon, 2 Mar 2026 10:47:10 +0000
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
Message-ID: <aaVqrsh_gd9meIWT@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
 <aaJXy2V7oI1tH4Ac@shlinux89>
 <aaLHuHFpcxdyqf9P@pluto>
 <aaU5xn/UlHeAhdxk@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaU5xn/UlHeAhdxk@shlinux89>
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
	TAGGED_FROM(0.00)[bounces-28624-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.507];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:url,arm.com:email]
X-Rspamd-Queue-Id: 5B3841D6DC4
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:18:30PM +0800, Peng Fan wrote:
> On Sat, Feb 28, 2026 at 10:47:20AM +0000, Cristian Marussi wrote:
> >On Sat, Feb 28, 2026 at 10:49:47AM +0800, Peng Fan wrote:
> >> On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
> >> >Add a clock operation to get the whole set of rates available to a specific
> >> >clock: when needed this request could transparently trigger a full rate
> >> >discovery enumeration if this specific clock-rates were previously only
> >> >lazily enumerated.
> >> >

Hi,

> >> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >> >---
> >> > drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
> >> > include/linux/scmi_protocol.h     |  9 ++++
> >> > 2 files changed, 67 insertions(+), 27 deletions(-)

[snip]

> >> > 
> >> >-	if (clkd->rate_discrete)
> >> >-		sort(clkd->rates, clkd->num_rates,
> >> >-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
> >> >+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
> >> 
> >> Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
> >> get something wrong, should use ">="?
> >
> >I have NOT double checked BUT I think fro Etienne original patch, you
> >can assume that clock rates are returned by the platform in ascending
> >order (already sorted) only after Clock protocol version 0x01, the first
> >ever, so ONLY when teh used version is 0x1 we must perform a full scan
> >(no lazy optimization since we cannot assume that rates[last-1] is max
> >AND we must sort the obtained list of clocks...
> 
> Per https://developer.arm.com/documentation/den0056/c/?lang=en, SCMI version
> 3.0, CLOCK protocol version is 1.0, I see:
> "The clock rates returned by this call should be in numeric ascending order".
> 
> SCMI 2.0 also has it. But SCMI 1.0 does not have above line.
> 
> All the above specs are using CLOCK protocol version 1.0.
> 
> It might be overshoot, should the "PROTOCOL_REV_MAJOR(ph->version) == 0x1"
> be dropped, so always sort the array?

Yes there is a 'glitch' in the specs v1.0/v2.0/v3.0 since all reports
Clock proto version 0x10000 BUT the clarification around the ordering of
the returned rates is NOT always there, so, since we must be absolutely
pedantic to guarantee compatibility with any possible deployed SCMI/FW,
we cannot assume that any 0x10000 protocol return ordered rates: this
means that if proto==0x10000 we MUST sort AND we cannot play smart with
the new bound iterators since we are NOT assure that rates[0] AND
rates[last -1] contain respectively min and max rates...

On the other side for any protocol version != 0x10000 (i.e. v3.1/v3.2/v4.0)
we can assume those rates as ordered and so, on one side, we can run 'lazy'
partial enumerations AND, on the other side, we can avoid the overhead of
sorting with full scans enumerations.

Thanks,
Cristian

