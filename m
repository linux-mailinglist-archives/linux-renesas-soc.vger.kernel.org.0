Return-Path: <linux-renesas-soc+bounces-28603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGsGOZLFommU5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:38:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98F1C2281
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A7AB301B66B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2309421EE4;
	Sat, 28 Feb 2026 10:38:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B81361DDF;
	Sat, 28 Feb 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275085; cv=none; b=m7OXMCMrc5Q7NMlhqcbCUF/ELzrQei4h5T45Zu3vE0Xf+kwyoHmNFL+m7fi6NaAYB3fO8/6xbqzRwj8+SZUMuduDaX9wq8dW/s1a70P3b5g3Xc8gL1IwPz3W6OOHiqLmMBb+KWHVUGGtINd4p9aNIiBr3lu27Xe7kg1H7nz5FTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275085; c=relaxed/simple;
	bh=YEMfO/GC8aLhW9Uxa090qhQPf3hwnXBJeaAUiMrDF78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY/O07SGkHTNUKLIXSxaUoRGas1f4XE3oKwft0zYhdVAgRIRSzbnZAvD+u1QwRVYi0uHKA1JiKdRdWy3KdGhmqTk5xAJTdRiZgQJrl+bW5PKhe4WYGqRSP3U9XAMF+JxT4yfwyXEgtfcD9IoaFgcobzWEzL+r0WHYzLh+rBjJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96BC41516;
	Sat, 28 Feb 2026 02:37:57 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2463F7BD;
	Sat, 28 Feb 2026 02:37:58 -0800 (PST)
Date: Sat, 28 Feb 2026 10:37:55 +0000
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
Subject: Re: [PATCH 07/11] firmware: arm_scmi: Harden clock parents discovery
Message-ID: <aaLFg7LAC8-dtwv_@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-8-cristian.marussi@arm.com>
 <aaJVf6q9r4F1RKzu@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaJVf6q9r4F1RKzu@shlinux89>
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
	TAGGED_FROM(0.00)[bounces-28603-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 0D98F1C2281
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:39:59AM +0800, Peng Fan wrote:
> On Fri, Feb 27, 2026 at 03:32:21PM +0000, Cristian Marussi wrote:
> >Fix clock parents enumeration to account only for effectively discovered
> >parents during enumeration, avoiding to trust the total number of parents
> >declared upfront by the platform.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
> > 1 file changed, 10 insertions(+), 8 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> >index d0fb5affb5cf..15faa79abed4 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -270,15 +270,15 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
> > 	 * assume it's returned+remaining on first call.
> > 	 */
> > 	if (!st->max_resources) {
> >-		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
> >-		p->clkd->info.parents = devm_kcalloc(p->dev,
> >-						     p->clkd->info.num_parents,
> >+		int num_parents = st->num_returned + st->num_remaining;
> >+
> >+		p->clkd->info.parents = devm_kcalloc(p->dev, num_parents,
> > 						     sizeof(*p->clkd->info.parents),
> > 						     GFP_KERNEL);
> >-		if (!p->clkd->info.parents) {
> >-			p->clkd->info.num_parents = 0;
> >+		if (!p->clkd->info.parents)
> > 			return -ENOMEM;
> >-		}
> >+
> >+		/* max_resources is used by the iterators to control bounds */
> > 		st->max_resources = st->num_returned + st->num_remaining;
> > 	}
> > 
> >@@ -293,9 +293,11 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
> > 	const struct scmi_msg_resp_clock_possible_parents *r = response;
> > 	struct scmi_clk_ipriv *p = priv;
> > 
> >-	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
> >+	p->clkd->info.parents[st->desc_index + st->loop_idx] =
> >+		le32_to_cpu(r->possible_parents[st->loop_idx]);
> > 
> >-	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
> >+	/* Count only effectively discovered parents */
> >+	p->clkd->info.num_parents++;
> 
> It maybe good to give a warning, if mismatch between 
> number of effectively discovered parents and "st->num_returned + st->num_remaining"
> 

Indeed there could be sign of something off fw-side...

> Anyway this patch LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
>

Thanks,
Cristian

