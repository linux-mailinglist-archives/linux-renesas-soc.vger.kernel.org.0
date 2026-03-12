Return-Path: <linux-renesas-soc+bounces-29296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBpmNiDesmmtQQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:39:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B8274AED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3945300C834
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE15A3C73E9;
	Thu, 12 Mar 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvh5st06"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F13590A9;
	Thu, 12 Mar 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329637; cv=none; b=Qw7KZsOroRgzuR2Jy6NrGhLzhs2feNvvE3UlayB0DqYQQH+x8IELynz85U8TXsvIaTpV1k2acjBO7RLMo9/UzNSTNQXG74kca6Jhe07aREzrM/M8bcpMh3HcLhgZJGSMib5hSsDrGheOBS9WwnqET/5myLPYlA+0yJbamnu+XBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329637; c=relaxed/simple;
	bh=dVSsINl4rZ0yvdCaAErEMIpSKseEOm3DREgLhMbctcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rk6NdORjrfy7LOZBjdSdtosfQEFqV4dRoJQXR4qMo4LC89zJ2eZcE0wk94HfqHZ/toXHrFujRperIKKFdwPMpZoVxJHxway4euWeXmwCLhuLdzf2z6mpJJLVCsoo5lHzSvSmGR3CeqQVn1AsBHlMVOXwgqtr5wN7cpYbvYs5vj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvh5st06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7BEC4CEF7;
	Thu, 12 Mar 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329637;
	bh=dVSsINl4rZ0yvdCaAErEMIpSKseEOm3DREgLhMbctcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvh5st06BDwVPuJAvJHJsIQZKSBm+Nsh20mpKGTLvGfZZupguVKKeH8dTz6VWYmW0
	 EXy4wln6jk3fMpcyOapCpcwS8ZQUoiCGJRMl1l5EiF2jJSwjSUJV7/bugtLKQU6k+1
	 vQJkYwja4nnLihddXMveBquC5GcNUfyIXNhWA0EAG00GwarXBsamgN/IjCA97X5BTx
	 Buc9glyyRIPVkgZMZ4zlJLupwsT0M5V6fxouCJrknGB1Lx6NolIoMoRJTNer+9mPc5
	 Rf05NjoiFIUh2b4f8DhOxD6ZwO0H3U1gcJCne3aoVie/YK0SttvuuJmjvNWjSyipuu
	 CwJHLatrT+0Bg==
Date: Thu, 12 Mar 2026 15:33:52 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <20260312-classy-misty-platypus-5baea1@sudeepholla>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abG4VfyB2C-gBa5Q@pluto>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29296-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-m68k.org,vger.kernel.org,lists.infradead.org,kernel.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 555B8274AED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 
> > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > Add proper error handling on failure to enumerate clocks features or
> > > rates.
> > >
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Hi,
> 
> > 
> > Thanks for your patch!
> > 
> > > --- a/drivers/firmware/arm_scmi/clock.c
> > > +++ b/drivers/firmware/arm_scmi/clock.c
> > 
> > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > >                 cinfo->clkds[clkid].id = clkid;
> > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > -               if (!ret)
> > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > +               if (ret)
> > > +                       return ret;
> > 
> > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > do not support the SCMI CLOCK_ATTRIBUTES command.
> > Before, these clocks were still instantiated, but were further unusable.
> > After, the whole clock driver fails to initialize, and no SCMI clocks
> > are available at all.
> 
> ...and this is exactly what I feared while doing this sort of hardening :P
> 
> So there are a few possible solutions (beside reverting this straight away)
> 
> The easy fix would be instead change the above in a
> 
> 	if (ret)
> 		continue;
> 
> ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> FW releases to fix this :D
> 
> Another option could be leave it as it is, since indeed it is the correct enforced
> behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> quirk targeting the affected FW releases...
> 
> This latter option, though, while enforcing the correct behaviour AND
> fixing your R-Car issue, leaves open the door for a number of possible
> failures of other unknowingly buggy Vendors similarly deployed firmwares...
> 
> ...that could be solved with more quirks of course...but...worth it ?
> 
> Thoughts ?
> 
> Let's see also what @Sudeep thinks about this...
> 

I prefer to fix it as a quirk to prevent similar issues on newer platforms if
the firmware baselines are derived from it. In the worst case, we can relax
the hardening until we figure out a proper quirk-based solution.

-- 
Regards,
Sudeep

