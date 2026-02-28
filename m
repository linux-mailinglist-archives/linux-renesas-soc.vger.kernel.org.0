Return-Path: <linux-renesas-soc+bounces-28602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCLSA0vFommU5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:36:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD21C2256
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A01E301AD16
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E9D421EE4;
	Sat, 28 Feb 2026 10:36:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DF23382E8;
	Sat, 28 Feb 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275016; cv=none; b=KMlaAwj4ZpU0gx73MAyqsZwBQNnKGCb4XFR+ag9P5xJ+xYhCRoNXS9XKgz8RXFUqf+eHPZRA+QBszqmZUB0nb+yErogTqvPenfEaE7DzicVvaQDu6e3FRQG1Qm5yCj3ATLL2LFGpy1ukUE04g01rg0xpm8zVocl5LmaaS+MkH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275016; c=relaxed/simple;
	bh=ORBHh0BjScoohUVqvm3DceAaVU0nDtQEQF3h9Cj0jNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDXJEGSpFt8o5od8mUNPKQZFB0E3efL8fpgO9ZwBCLiRKHJvWhEBuXrnArknBMYWbh+Itj3NkctVlkdO2On1ikAK00mBpyLWijwjdPSCxBsHFJ05+wyfnMWXV+C9FMDjOrDkbg1/G56rggvbkzGUQOc+7LKCB7P6OtQxrGl0rQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8711516;
	Sat, 28 Feb 2026 02:36:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB233F7BD;
	Sat, 28 Feb 2026 02:36:50 -0800 (PST)
Date: Sat, 28 Feb 2026 10:36:46 +0000
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
Subject: Re: [PATCH 06/11] firmware: arm_scmi: Make clock rates allocation
 dynamic
Message-ID: <aaLFPgB6Nb77FI63@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-7-cristian.marussi@arm.com>
 <aaJS9x5lZ9xSEu1V@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJS9x5lZ9xSEu1V@shlinux89>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28602-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61AD21C2256
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:29:11AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:20PM +0000, Cristian Marussi wrote:
> >Leveraging SCMI Clock protocol dynamic discovery capabilities, move away
> >from the static per-clock rates allocation model in favour of a dynamic
> >runtime allocation based on effectively discovered resources.
> >
> >No functional change.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 19 ++++++++++++++++---
> > include/linux/scmi_protocol.h     |  1 -
> > 2 files changed, 16 insertions(+), 4 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index f5d1c608f85a..d0fb5affb5cf 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -161,7 +161,7 @@ struct scmi_clock_desc {
> > 	u32 id;
> > 	bool rate_discrete;
> > 	unsigned int num_rates;
> >-	u64 rates[SCMI_MAX_NUM_RATES];
> >+	u64 *rates;
> > #define	RATE_MIN	0
> > #define	RATE_MAX	1
> > #define	RATE_STEP	2
> >@@ -480,6 +480,18 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> > 			   QUIRK_OUT_OF_SPEC_TRIPLET);
> > 	}
> > 
> >+	if (!st->max_resources) {
> >+		int num_rates = st->num_returned + st->num_remaining;
> >+
> >+		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
> >+					      sizeof(*p->clkd->rates), GFP_KERNEL);
> >+		if (!p->clkd->rates)
> >+			return -ENOMEM;
> 
> It may be not related to this patch,
> I see scmi_clock_describe_rates_get() does not have return value check
> when being called in scmi_clock_protocol_init().
> 
> So if devm_kcalloc() fails, there maybe issue without a sanity check
> to return value of scmi_clock_describe_rates_get().
> 

Yes I think I saw that...wanted to fix too..and forgot :D 

I will add a fix in V2.

Thanks,
Cristian


