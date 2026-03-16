Return-Path: <linux-renesas-soc+bounces-29519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGECOGszuGmvaAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:44:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DC29D962
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2B0A306C7E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75AF39A7F6;
	Mon, 16 Mar 2026 16:39:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C20832ED3A;
	Mon, 16 Mar 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679140; cv=none; b=uYSBJEYJf/nFP7WjGPg64bjNDRdDfgxqm4RowJ68rL7IdWb679iwAU7wGnYciAHAuVLwplvHVMRbt18bjUWOujyBl8Ts3AfObHibjBBllwote+uz5M317wugLK8OWyzlzWhMvkNOp39Jm1fTklMhcT6yTSTqBk4AZpyUcu8O7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679140; c=relaxed/simple;
	bh=dwr8aXwrvNxvG7P8NuFEETWR/ngTVO8/oI+DekZIcPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCDzRXYJeG2mAJIEgXY9+UrGNldSxTUcMStZo+6Bt4kbWelqXMXze+bgSf0k5w/uRSHXHRiAsRcUXtTCwgsgeMd9vR0JEElljPh9K3XgQNqJhiOYL3pzYneocscTZulS+H90KRyZyN0qb//KZbB38ZbsUviE8dWfCoPhyjfLFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9930314BF;
	Mon, 16 Mar 2026 09:38:52 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 213E83F73B;
	Mon, 16 Mar 2026 09:38:56 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:38:53 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <abgyHXo6XeGTGyqf@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
 <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto>
 <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
 <abgsW1yoGtMNE3c7@pluto>
 <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1Z9NiQOd10zsimMcOfSC=dVYbfjAKKT4aD3Zx9KttVQ@mail.gmail.com>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29519-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.824];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 845DC29D962
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:35:26PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Mon, 16 Mar 2026 at 17:14, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > > > rates.
> > > > > > > >
> > > > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > > > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > > > >
> > > > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > > > -               if (!ret)
> > > > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > > > +               if (ret)
> > > > > > > > +                       return ret;
> > > > > > >
> > > > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> > >
> > > Apparently it is not just CLOCK_ATTRIBUTES, but also
> > > CLOCK_DESCRIBE_RATES.
> >
> > I was indeed suspicious that I could have opened a can of worms by
> > more strictly enfrocing these...
> >
> > > > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > > > are available at all.
> > > > > >
> > > > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > > > >
> > > > > > So there are a few possible solutions (beside reverting this straight away)
> > > > > >
> > > > > > The easy fix would be instead change the above in a
> > > > > >
> > > > > >     if (ret)
> > > > > >             continue;
> > > > > >
> > > > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > > > FW releases to fix this :D
> > > > > >
> > > > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > > > quirk targeting the affected FW releases...
> > > > > >
> > > > > > This latter option, though, while enforcing the correct behaviour AND
> > > > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > > > >
> > > > > > ...that could be solved with more quirks of course...but...worth it ?
> > > > > >
> > > > > > Thoughts ?
> > > > > >
> > > > > > Let's see also what @Sudeep thinks about this...
> > > > >
> > > > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > > > the firmware baselines are derived from it. In the worst case, we can relax
> > > > > the hardening until we figure out a proper quirk-based solution.
> > > >
> > > > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > > > Geert with proper versioning....so I can check that there are no
> > > > surprises round the (quirked) corner...
> > >
> > > Unfortunately you cannot "continue" from a quirk, without resorting
> > > to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> > > control in quirk code snippets"[1].
> >
> > Yes ... just realized that this afternoon when trying to draft a
> > quirk... (see other thread)
> >
> > > Then I came up with the following preliminary (have to check more
> > > firmware versions) quirk (Gmail whitespace-damaged):
> > >
> > > diff --git a/drivers/firmware/arm_scmi/clock.c
> > > b/drivers/firmware/arm_scmi/clock.c
> > > index f62f9492bd42afbc..6f2af6e9084836c6 100644
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> > > clk_protocol_events = {
> > >         .num_events = ARRAY_SIZE(clk_events),
> > >  };
> > >
> > > +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> > > +       ({                                                              \
> > > +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> > > +                       continue;                                       \
> > > +       })
> > > +
> > > +#define QUIRK_RCAR_X5H_NO_RATES
> > >          \
> > > +       ({                                                              \
> > > +               if (ret == -EOPNOTSUPP)                                 \
> > > +                       ret = 0;                                        \
> > > +       })
> > > +
> > >  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >  {
> > >         int clkid, ret;
> > > @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> > > struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> > > QUIRK_RCAR_X5H_NO_RATES);
> > >                 if (ret)
> > >                         return ret;
> > >         }
> 
> > > Does that look like what you have in mind?
> > > Thanks!
> >
> > Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
> > behaviour with continue, BUT if the set of clocks not supporting attributes
> > and the set of clocks not suppporting rates is disjoint, I feel we need your
> > double quirks :P
> 
> I could have used
> 
>     SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
> 
> after both scmi_clock_attributes_get() and
> scmi_clock_describe_rates_get(), but I wanted to keep the check as
> strict as possible: the former returns two error codes to ignore,
> the latter only one.
> 
> > If you are still finding out the exact FW versions that are failing maybe
> > it is better if you carry on and test the quirk-framework fix above together
> > with your quirks and we can make sure to pick all up together...
> 
> It is not urgent, as R-Car X5H SCMI support is not yet upstream.

Ah ok.

> 
> > ...OR maybe better I can also drop for now my offending patch that breaks
> > your FW from my V3 series and you can pick it up and post it later with
> > your quirks and the Quirk framework fix you propsoed so that we are sure
> > that we dont break anything while fixing all of this...
> 
> While there is indeed a chance that this hardening regresses on
> platforms that are already upstream...

Yes indeed...

> 
> > Also because we are already in V4 and I dont want to risk to post the
> > breaking fix (that was at the end broke since forever) BUT not the quirks...
> 
> s/in V4/at rc4/?

yep... -rc4 I meant..

> 
> > Let's see what @Sudeep thinks
> 
> OK.
>

Thanks,
Cristian

