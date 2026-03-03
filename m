Return-Path: <linux-renesas-soc+bounces-28698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGP6MfXZpmnHWgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:54:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56E1EFBE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09733030129
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B76735F17B;
	Tue,  3 Mar 2026 12:49:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E22A35DA74;
	Tue,  3 Mar 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542168; cv=none; b=qBS8TDziHa+PCKy54ZKqARElx63bW7+CCOIzuyIO7+ZwUv/3ys9L0dTYrOqSfZsVAquHQLcgMI79VkMigfwZGucmCXABZCC1TBzaiHco9IUk+KpsFerp+6ghvT4X7BbVlrztrczObJZKjgZ+vpkvvLIey1d/Ey1mDizehL6bc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542168; c=relaxed/simple;
	bh=s7j0fbso4tsBG06xVlpLLWWbus6SBHjGxZWYTvaqeSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3V3w3QR2aPHPUu6Z7es1ef5tMZS1pyKc86JjLtivRilembVm0WQLLl3glvlRvSy9bbRqvxY63lCUWd+SutrhfmWJr/7/c7cKueG+9cSsw6s6E5F8Kof4IkGKSdbotdvGl1QQNOlKLMqnoOriOnKhDtn0ZI2tb5wi9VLSnJX+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5279B497;
	Tue,  3 Mar 2026 04:49:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2EE73F7BD;
	Tue,  3 Mar 2026 04:49:17 -0800 (PST)
Date: Tue, 3 Mar 2026 12:49:14 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aabYyj5Xh-kFWBzw@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-Rspamd-Queue-Id: 2B56E1EFBE2
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
	TAGGED_FROM(0.00)[bounces-28698-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,redhat.com,baylibre.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.574];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:39:51PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Use the Clock protocol layer determine_rate logic to calculate the closest
> > rate that can be supported by a specific clock.
> >
> > No functional change.
> >
> > Cc: Brian Masney <bmasney@redhat.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > --- a/drivers/clk/clk-scmi.c
> > +++ b/drivers/clk/clk-scmi.c
> > @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> >  static int scmi_clk_determine_rate(struct clk_hw *hw,
> >                                    struct clk_rate_request *req)
> >  {
> > -       u64 fmin, fmax, ftmp;
> > +       int ret;
> >         struct scmi_clk *clk = to_scmi_clk(hw);
> >
> >         /*
> > -        * We can't figure out what rate it will be, so just return the
> > -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> > -        * after the rate is set and we'll know what rate the clock is
> > +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> > +        * called after the rate is set and we'll know what rate the clock is
> >          * running at then.
> >          */
> > -       if (clk->info->rate_discrete)
> > -               return 0;
> > -
> > -       fmin = clk->info->range.min_rate;
> > -       fmax = clk->info->range.max_rate;
> > -       if (req->rate <= fmin) {
> > -               req->rate = fmin;
> > -
> > -               return 0;
> > -       } else if (req->rate >= fmax) {
> > -               req->rate = fmax;
> > -
> > -               return 0;
> > -       }
> > -
> > -       ftmp = req->rate - fmin;
> > -       ftmp += clk->info->range.step_size - 1; /* to round up */
> > -       do_div(ftmp, clk->info->range.step_size);
> 
> Oh, so the truncation bug exists in the original code, too.

Yep...as said I will fix the original code and then move the fixed
code.

Thanks,
Cristian

