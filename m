Return-Path: <linux-renesas-soc+bounces-29301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKTRIHbssmnAQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:40:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09E275C02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B74153002914
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBB6390225;
	Thu, 12 Mar 2026 16:36:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE24D38F64B;
	Thu, 12 Mar 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333419; cv=none; b=GrFJPvhcjuZDQbJ7bUPyJNwFB5AtQlTpjUaqFrIYP3pOtWMVgbxOcVmmXifXaHK4nos22z5vuXeOvhHVZ+g4yRDFlG4t4d5sVcp6BrJk4W3iWR0wuMzVIRj5OiKQ9S2c8oGh7f5EKkFXkKqNswD3srIV0rYkWQWibmjizshlnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333419; c=relaxed/simple;
	bh=PHTycdlf1dFs7CToXS9wxFQ5DOSHhKZ3v+bxy6sc4qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYOwfJiRpOXzACnkyz3xUhyygxQBQmr7Ytb46YeJfalL7YwLZSjRdTTRByu7rn3Xwo4oVY3CZ66vpoofTek94u9T0G7rplEEjazg7CXwlWtV2xnRIchvp3mkyE2xkp9ZCDbz/322Z6BtyijrES5R+3eIDJmLVkwW96Frne1g0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9E60165C;
	Thu, 12 Mar 2026 09:36:49 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0541C3F694;
	Thu, 12 Mar 2026 09:36:52 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:36:43 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <abLrm7x8ggzAhYOg@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
 <20260312-classy-misty-platypus-5baea1@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-classy-misty-platypus-5baea1@sudeepholla>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,linux-m68k.org,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29301-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8B09E275C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > Hi Cristian,
> > > 
> > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > Add proper error handling on failure to enumerate clocks features or
> > > > rates.
> > > >
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > Hi,
> > 
> > > 
> > > Thanks for your patch!
> > > 
> > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > 
> > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > >                 cinfo->clkds[clkid].id = clkid;
> > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > -               if (!ret)
> > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > +               if (ret)
> > > > +                       return ret;
> > > 
> > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > do not support the SCMI CLOCK_ATTRIBUTES command.
> > > Before, these clocks were still instantiated, but were further unusable.
> > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > are available at all.
> > 
> > ...and this is exactly what I feared while doing this sort of hardening :P
> > 
> > So there are a few possible solutions (beside reverting this straight away)
> > 
> > The easy fix would be instead change the above in a
> > 
> > 	if (ret)
> > 		continue;
> > 
> > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > FW releases to fix this :D
> > 
> > Another option could be leave it as it is, since indeed it is the correct enforced
> > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > quirk targeting the affected FW releases...
> > 
> > This latter option, though, while enforcing the correct behaviour AND
> > fixing your R-Car issue, leaves open the door for a number of possible
> > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > 
> > ...that could be solved with more quirks of course...but...worth it ?
> > 
> > Thoughts ?
> > 
> > Let's see also what @Sudeep thinks about this...
> > 
> 
> I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> the firmware baselines are derived from it. In the worst case, we can relax
> the hardening until we figure out a proper quirk-based solution.

Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
Geert with proper versioning....so I can check that there are no
surprises round the (quirked) corner...

Thanks,
Cristian

