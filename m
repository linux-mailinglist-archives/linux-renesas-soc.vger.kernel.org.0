Return-Path: <linux-renesas-soc+bounces-29240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBotIUK2sWl0EwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:36:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1476268B28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 273073008743
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 18:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7115E3E3C77;
	Wed, 11 Mar 2026 18:33:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93F829405;
	Wed, 11 Mar 2026 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254009; cv=none; b=ELxfX4OfSL9tfOyvRuLCTt/O5bSl82TsE3h8i+I4XrqmHKddoH89P/hMoKPepzgUdoNpEQprHvfanpganrKY3F8YwgJbMJkyQQsI+zrEvSvZYgHQzg5gxel/0rsVf+F5wGzR7AUioxDlXaa2AXZ0MMED2cQUlF9ckzDx9fxtTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254009; c=relaxed/simple;
	bh=GUYwxiPsaz2DH4G/sAtqHJzr876hjNheBO2S7/59Pk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFHt5IFPB+DSY++Id4DAHMBzsDAjNj5HR6FVyfGidzvipd3mCiboLhPvyj831gv2A/v1U7e1GFPmhlf0NKIUUpo5xKnHNL3c6CcZjbq1aEqzGLCgffq/G8uQfrJGSDIMxINef0a7e9NkR18mYy/q6YqEX0Zd8UZHFZJXOLNan+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF3BC1682;
	Wed, 11 Mar 2026 11:33:20 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25BA43F73B;
	Wed, 11 Mar 2026 11:33:22 -0700 (PDT)
Date: Wed, 11 Mar 2026 18:33:15 +0000
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
	marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
Message-ID: <abG1a_E_7gBmc3ec@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-2-cristian.marussi@arm.com>
 <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29240-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: E1476268B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 12:30:34PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > While the do_div() helper used for rounding expects its divisor argument
> > to be a 32bits quantity, the currently provided divisor parameter is a
> > 64bit value that, as a consequence, is silently truncated and a possible
> > source of bugs.
> >
> > Fix by using the proper div64_ul helper.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/clk-scmi.c
> > +++ b/drivers/clk/clk-scmi.c
> 
> > @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
> >
> >         ftmp = req->rate - fmin;
> >         ftmp += clk->info->range.step_size - 1; /* to round up */
> > -       do_div(ftmp, clk->info->range.step_size);
> > +       ftmp = div64_ul(ftmp, clk->info->range.step_size);
> 
> include/linux/math64.h has:
> 
>     #if BITS_PER_LONG == 64
>     #define div64_ul(x, y)   div64_u64((x), (y))
>     #elif BITS_PER_LONG == 32
>     #define div64_ul(x, y)   div_u64((x), (y))
>     #endif
> 
> I.e. div64_ul() is meant for the case where the divisor is unsigned
> long.  Hence div64_ul() may still truncate step_size on 32-bit
> platforms, and thus should use div64_u64() unconditionally.
> 

Ah...my bad, I missed that...

> I am aware clock rates are "unsigned long" on 32-bit platforms, and
> thus cannot support rates that do not fit in a 32-bit value.
> If that is the reason you are using div64_ul(), it should be documented
> properly.  And probably the SCMI core code should reject any rate values
> (incl. min, max, step) that do not fit in unsigned long, as such clocks
> cannot be used on 32-bit platforms.

As per the SCMI spec Clock rates are reported as 64bit, so I suppose
that, yes I will have to add the checks you mentioned to avoid trying to
fit a reported clock rate where the upper 32bits are not zero into an
unsigned long on a 32bit machine...

Seems like there will be a V3 (together with your other reports..)

Thanks for your reviews !

Cristian

