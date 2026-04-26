Return-Path: <linux-renesas-soc+bounces-31660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAjxBoqb7mnXvwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:11:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A07346B692
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 01:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C6D63001012
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Apr 2026 23:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49B42E0938;
	Sun, 26 Apr 2026 23:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qNPJZs6+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3411155C82;
	Sun, 26 Apr 2026 23:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245060; cv=none; b=V+WpYc9sVIqOs3PawvayJWO3yuV7W+y58F83qbtiWo50VaPAjk8kbwQ+K608s9TiJtJDIdBJqySNR23M2Fz2f6HWajYdkzSwblcrHq0dFyh3gCQUlRGq+zYsPbasR2+QBPZF/h6yhFEbO1aO5ZpBdiPnRqREycSoZgYZygeQhnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245060; c=relaxed/simple;
	bh=a/aJYD6pRvMxLS87Yj3RcGUYhcRUIAX2XSq4KMBsQQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI5msmD0drl614XPEsEvzd4y3lfuOO20Ar3/nVdHYIqeiNdDmNFJUn+MDa9WS7PoHJjlqZxkPmuXVgf4/ZDTeHxqq4IOPgvk039iMkvxwyzrTWwtH4hx0JZDrw23mfxfWGx+aqik9irDWFmorsainPp4vpDejlPe3EbeZN9tn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qNPJZs6+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815121F02;
	Sun, 26 Apr 2026 16:10:51 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2440A3F763;
	Sun, 26 Apr 2026 16:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777245057; bh=a/aJYD6pRvMxLS87Yj3RcGUYhcRUIAX2XSq4KMBsQQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNPJZs6+vgMSeAnGjNou/szz7erkEx2r0b/jVAFVKxomqucUko7deq+yVJfoEwiJG
	 ggRKCCt9/wSae87dDwayalhIbqUpyAsN1LZ0OG3OXf3lNxskhdQGD7tgLFnB/ZlaLi
	 sLCex6afDiGYaXlHstiEwyxomHUg/JkEDxMbYIAI=
Date: Mon, 27 Apr 2026 00:10:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <ae6bdwhHoft3p0lv@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
 <aetw1WcSCDxk11AV@pluto>
 <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYGRzq2j3z1io=kHj_QsWtJBirPhbZPa5bFBD7U9e0sw@mail.gmail.com>
X-Rspamd-Queue-Id: 5A07346B692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31660-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 03:55:08PM +0200, Geert Uytterhoeven wrote:
> Hi Cristian,

Hi,

> 
> On Fri, 24 Apr 2026 at 15:32, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> > > On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > > > Add proper error handling on failure to enumerate clocks features or
> > > > rates.
> 
> > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > > > ---
> > > >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> > > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > > > index c9b62edce4fd..bf956305a8fe 100644
> > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> > > >                 SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> > > >                     clk->rate_change_requested_notifications = true;
> > > >             if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > > -                   if (SUPPORTS_PARENT_CLOCK(attributes))
> > > > -                           scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > > -                   if (SUPPORTS_GET_PERMISSIONS(attributes))
> > > > -                           scmi_clock_get_permissions(ph, clk_id, clk);
> > > > +                   if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > > > +                           ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > > > +                           if (ret)
> > > > +                                   return ret;
> > > > +                   }
> > > > +                   if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > > > +                           ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > > > +                           if (ret)
> > > > +                                   return ret;
> > > > +                   }
> > > >                     if (SUPPORTS_EXTENDED_CONFIG(attributes))
> > > >                             clk->extended_config = true;
> > > >             }
> > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > >     for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > >             cinfo->clkds[clkid].id = clkid;
> > > >             ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > -           if (!ret)
> > > > -                   scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > +           if (ret)
> > > > +                   return ret;
> > > > +
> > > > +           ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > +           if (ret)
> > > > +                   return ret;
> > > >     }
> > > >
> > > >     if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > > >
> > >
> > > I see that a quirk is being added for this, but I thought I should chime
> > > in with my opinion for future approaches in this direction.
> > >
> > > I don't see how this hardens anything. All this does is break platforms
> > > that were previously working by returning early. At most, this should
> >
> > Certainly the naming in the subject was chosen badly (by me!)...indeed it
> > should be more something like "Enforce strict protocol compliance",
> > because at the end all of the broken platforms really run a slighly odd
> > out of spec SCMI firmware that does NOT implement one or more of the SCMI
> > mandatory command...
> >
> > > be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> > > returns nonsense, a clock driver should imho try its best to work
> > > around the nonsense in a safe way, because the alternative is that
> > > a major part of the system (and thus likely the entire system) no
> >
> > ..well yes we definitely dont want to break deployed platforms BUT also
> > we dont want to legalize this kind of out of spec behaviour in future
> > firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
> > let already broken deployed platforms survive while discouraging such
> > implementation in future fw implementations...
> >
> > These firmware most certainly wont pass the SCMI compliance test suite [1],
> > which indeed we do not mandate, but the reason these bugs happened is
> > exactly because the kernel SCMI stack was buggy and left that door open...
> >
> > More specifically these kind of out-of-spec behaviours are not really just
> > a matter being 'picky', the problem is that any resource set in any
> > SCMI protocol is defined by the spec such as to be described by a
> > contiguos set of IDs and the drivers are designed anyway under that
> > assumption from the allocation point of view, so allowing a clock ID to
> > just fail one of the mandatory commands and skip a domain would jeopardize
> > all of this and, even if clearly is NOT a problem here, seems a fragile
> > assumption.
> 
> How can you have all of:
>   1. a contiguous list of IDs,
>   2. implement all mandatory commands,
>   2. restrict the use of some clocks to a subset of the agents in the system?
> Use a different list of IDs for each agent?

Yes, the SCMI server can provide a per-agent view of the world to each
agent, and ideally it should not even expose resources that are not
needed at all to an agent...and by that I mean that the server SHOULD
not enumerate that resources when queried, by dropping them from the
list of resources that return to that agent WHILE maintaining the set of
IDs contigous...

...the SCMI server provides an illusion ideally where the agent is in
control and can access whatever it wants, while the reality is that the
agent can only issue commands that are deemed safe and sensible by the server,
which is the ultimate arbiter on the system, to the extent that can hide
resources or simply silently ignore requests...

> What if a mistake was made, and a clock was exposed to an agent by
> accident?

Quirk ! 

More detail on all of this in my babbling on the other thread...sorry
for the flood of words :P

Thanks,
Cristian

