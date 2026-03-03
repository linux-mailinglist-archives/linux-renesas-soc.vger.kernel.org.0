Return-Path: <linux-renesas-soc+bounces-28694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGkPHNfWpmnHWgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:40:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F81EF985
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B7D5302D732
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 12:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D525BA3D;
	Tue,  3 Mar 2026 12:40:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52261A6801;
	Tue,  3 Mar 2026 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541652; cv=none; b=ngBwCjJ6R3kdgi4DrCceieO7Dz9T8BaTq25w3j1343xZR0oNDOKaG5oDYgaPAJEKrneP72ilSSptNEi1ZxA18l7pqOlditi0psdAdoruPWxyOoBaQorMaPiEHzlhDZxn69uROszU/tbkyxAYsGZO15DhArutUKohmJ5XyyqCdk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541652; c=relaxed/simple;
	bh=n8iVkBkMAvJyu+SEQHcaGGK7g7S4SlOowfgbvqlEoJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIst4pp6JUUbtg72FH5jxxWNlFAtFEhqJIFD67xhdxR/8SLs0u+W5ruyjN2cskr8c/4xa+j2OvfuAiTWHxyktEjSikBcFf9z3oTk5YBUNTb9wYdoQT5SC9Wwi4cqBjp3hteNaL/5xUvv8zo0rF0cjkB1cW4bqGjNq+ktT7MxJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B0D9497;
	Tue,  3 Mar 2026 04:40:43 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8B7A3F7BD;
	Tue,  3 Mar 2026 04:40:45 -0800 (PST)
Date: Tue, 3 Mar 2026 12:40:32 +0000
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
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 03/11] firmware: arm_scmi: Simplify clock rates exposed
 interface
Message-ID: <aabWwICzAzAwlhGd@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-4-cristian.marussi@arm.com>
 <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7e45rc5VmHQV5GxzMvJ3r6=04sWOoFsu4JJPAqDUiJA@mail.gmail.com>
X-Rspamd-Queue-Id: 093F81EF985
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28694-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.610];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:48:00PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> Thanks for your patch!

Hi,

> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Move needlessly exposed fields away from scmi_clock_info into the new
> > internal struct scmi_clock_desc while keeping exposed only the two new
> > min_rate and max_rate fields for each clock.
> >
> > No functional change.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -157,13 +157,27 @@ struct scmi_clock_rate_notify_payld {
> >         __le32 rate_high;
> >  };
> >
> > +struct scmi_clock_desc {
> > +       u32 id;
> > +       bool rate_discrete;
> > +       unsigned int num_rates;
> > +       u64 rates[SCMI_MAX_NUM_RATES];
> > +#define        RATE_MIN        0
> > +#define        RATE_MAX        1
> > +#define        RATE_STEP       2
> 
> Any specific reason you are not using a union here, like in
> scmi_clock_info?
>

No, I will fix in v2.
 
> > +       struct scmi_clock_info info;
> > +};
> 
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -51,6 +51,8 @@ struct scmi_clock_info {
> >         bool rate_ctrl_forbidden;
> >         bool parent_ctrl_forbidden;
> >         bool extended_config;
> > +       u64 min_rate;
> > +       u64 max_rate;
> >         union {
> >                 struct {
> >                         int num_rates;
> 
> You patch description read like the actual rates would be moved
> from scmi_clock_info to scmi_clock_desc, i.e. _removed_ here?
> 

Yes they will be removed later in the series to avoid breaking the
build...I will add a _removed_ tag for clarity (that TIL that exist :D)

Thanks,
Cristian

