Return-Path: <linux-renesas-soc+bounces-32086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Eo0CUkB+ml1HAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 16:40:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 924314CF970
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 16:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09C6C3007E2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 14:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30EB381AE6;
	Tue,  5 May 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RVWDs8Ot"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BE534677D;
	Tue,  5 May 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991773; cv=none; b=qqcmcnmZLw/RYMBWm5Z1oHK7ULl9wxwnbHg+/sjNjMSGi6JxM3vMmXuEQjPjNATFDRqEmgnNZqBAoXSr14CAk90bk31+7170ZciJCD0z9l9U35KptfM9KeEpkg35tcT8CquLZd/JcdPRmyRClVhkHkRklUj2fT+5Z+kKyR+O10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991773; c=relaxed/simple;
	bh=0T3MKaQLW28GaOTl2D9yp1TlQr7cPQv8Jr8lznjVrUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8mOFoZtzjGpCPt1whe4lNSZWuZ/2KupCmcap0O9JhjX8eLSB0zllv1lIXDemtLhyP4ugvqbLd/Vv2L+rhs8U6y4iEKFtsRaGSdfKixZs/re6aVpUPiSC2SeqqihgCcMz0toYaqIqiUkt36gxxVsogZM2OWzlTZMp9jlI0BIwHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RVWDs8Ot; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E304C293B;
	Tue,  5 May 2026 07:36:05 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30BB3F763;
	Tue,  5 May 2026 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777991771; bh=0T3MKaQLW28GaOTl2D9yp1TlQr7cPQv8Jr8lznjVrUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVWDs8OtvKs83ItvR0uvQRZRFHjQgeKCGanXHI1nFmSP2G72mJ7/PVKzpR4BbavsE
	 i3cYIfnOy35P9b1FxKO9dC6VhkpJXReXScZQrbAAWh8pSBemE6fDVkfFW0xjzarhSJ
	 rSs7G8mZ1nlDQlh4Ll3AJ0HMRaz5TcZNhaHVy4NE=
Date: Tue, 5 May 2026 15:36:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates
 exposed interface
Message-ID: <afoAUOTg2rQ8NUPr@pluto>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-5-cristian.marussi@arm.com>
 <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-Rspamd-Queue-Id: 924314CF970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32086-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:email,nxp.com:email]

On Tue, May 05, 2026 at 02:17:45PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian, Sudeep,

Hi Geert,

Thanks for having a look.

> 
> On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> > in the future, some of the needlessly public fields currently kept inside
> > scmi_clock_info, while keeping exposed only the two new min_rate and
> > max_rate fields for each clock.
> >
> > No functional change.
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
> arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.
> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> 
> > @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> >         flags = le32_to_cpu(r->num_rates_flags);
> >         st->num_remaining = NUM_REMAINING(flags);
> >         st->num_returned = NUM_RETURNED(flags);
> > -       p->clk->rate_discrete = RATE_DISCRETE(flags);
> 
> This removes the last setter of scmi_clock_info.rate_discrete.
> However, it is still used until the next commit cd73d1bfaa8d34bb
> ("clk: scmi: Use new simplified per-clock rate properties").
> V2 did now have this issue, as the patches were ordered differently
> in that series.
> 
> After both commits, there are no more users of
> scmi_clock_info.rate_discrete, so it can be removed.

Indeed.... good catch, rate_discerte has been moved to scmi_clock_rates
so the old public scmi_clock_info.rate_discrete is stale and no more
updated...I will remove it.

Thanks,
Cristian

