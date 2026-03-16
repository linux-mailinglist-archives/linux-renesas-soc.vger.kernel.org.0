Return-Path: <linux-renesas-soc+bounces-29518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIYxD3ksuGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:14:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE929D27C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F7EB302DAB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 16:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE5933509A;
	Mon, 16 Mar 2026 16:14:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D31C334C1C;
	Mon, 16 Mar 2026 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677666; cv=none; b=e0YLrC8DBYCb5KFolesxouQckHavJLpuABJ8Vrn3+tfa7R0L+BoIGhe7BHQ9JuxiI/ESy3JtgSGF/2YS4AkFSKvYCxT84tD2zf9bGJ4XOQOY6/3pvv48g4C/oxdYOoLwPJrF225F2viF1wZp65YmuWu6G6ziuaaZ4ol8pDYKxtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677666; c=relaxed/simple;
	bh=2YsfKi02CmJOqQeShPp4cv6QfyDTgJ/6MOnIaaq8FQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjOXoZbnPfD5l/W5EFCY6gPw7cIVo+W/v8Z38OLsDMns4CpPtrZIQUdeW7I25l/k5+QF9h/Y93h9lT+/mVvrXUjZV3SwjEmj4SNJhw5gnLze3i9aZ97JvRvtw2wgqckvNiwbItKISE32QfXiDty4TXp48mRYFbocJ9pTdcL7ZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD4B1477;
	Mon, 16 Mar 2026 09:14:18 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8DC3F73B;
	Mon, 16 Mar 2026 09:14:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:14:19 +0000
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
Message-ID: <abgsW1yoGtMNE3c7@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
 <abG4VfyB2C-gBa5Q@pluto>
 <20260312-classy-misty-platypus-5baea1@sudeepholla>
 <abLrm7x8ggzAhYOg@pluto>
 <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWL4rVTPnsMofPKFKCozjCPqF0K95ZFmrdrBD8EUt22A@mail.gmail.com>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29518-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.832];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0AEE929D27C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:50:17PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Thu, 12 Mar 2026 at 17:36, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > On Thu, Mar 12, 2026 at 03:33:52PM +0000, Sudeep Holla wrote:
> > > On Wed, Mar 11, 2026 at 06:45:41PM +0000, Cristian Marussi wrote:
> > > > On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> > > > > Hi Cristian,
> > > > >
> > > > > On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > > > Add proper error handling on failure to enumerate clocks features or
> > > > > > rates.
> > > > > >
> > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi Geert,

> > > >
> > > > > > --- a/drivers/firmware/arm_scmi/clock.c
> > > > > > +++ b/drivers/firmware/arm_scmi/clock.c
> > > > >
> > > > > > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> > > > > >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> > > > > >                 cinfo->clkds[clkid].id = clkid;
> > > > > >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > > > > > -               if (!ret)
> > > > > > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > > > > > +               if (ret)
> > > > > > +                       return ret;
> > > > >
> > > > > This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> > > > > do not support the SCMI CLOCK_ATTRIBUTES command.
> 
> Apparently it is not just CLOCK_ATTRIBUTES, but also
> CLOCK_DESCRIBE_RATES.
> 

I was indeed suspicious that I could have opened a can of worms by
more strictly enfrocing these...

> > > > > Before, these clocks were still instantiated, but were further unusable.
> > > > > After, the whole clock driver fails to initialize, and no SCMI clocks
> > > > > are available at all.
> > > >
> > > > ...and this is exactly what I feared while doing this sort of hardening :P
> > > >
> > > > So there are a few possible solutions (beside reverting this straight away)
> > > >
> > > > The easy fix would be instead change the above in a
> > > >
> > > >     if (ret)
> > > >             continue;
> > > >
> > > > ...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
> > > > FW releases to fix this :D
> > > >
> > > > Another option could be leave it as it is, since indeed it is the correct enforced
> > > > behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
> > > > quirk targeting the affected FW releases...
> > > >
> > > > This latter option, though, while enforcing the correct behaviour AND
> > > > fixing your R-Car issue, leaves open the door for a number of possible
> > > > failures of other unknowingly buggy Vendors similarly deployed firmwares...
> > > >
> > > > ...that could be solved with more quirks of course...but...worth it ?
> > > >
> > > > Thoughts ?
> > > >
> > > > Let's see also what @Sudeep thinks about this...
> > >
> > > I prefer to fix it as a quirk to prevent similar issues on newer platforms if
> > > the firmware baselines are derived from it. In the worst case, we can relax
> > > the hardening until we figure out a proper quirk-based solution.
> >
> > Ok, I can post a V3 with a dummy quirk 'template' RFC to be filled by
> > Geert with proper versioning....so I can check that there are no
> > surprises round the (quirked) corner...
> 
> Unfortunately you cannot "continue" from a quirk, without resorting
> to a goto, so I sent a fix: "[PATCH] firmware: arm_scmi: Support loop
> control in quirk code snippets"[1].
> 

Yes ... just realized that this afternoon when trying to draft a
quirk... (see other thread)

> Then I came up with the following preliminary (have to check more
> firmware versions) quirk (Gmail whitespace-damaged):
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c
> b/drivers/firmware/arm_scmi/clock.c
> index f62f9492bd42afbc..6f2af6e9084836c6 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -1230,6 +1230,18 @@ static const struct scmi_protocol_events
> clk_protocol_events = {
>         .num_events = ARRAY_SIZE(clk_events),
>  };
> 
> +#define QUIRK_RCAR_X5H_NO_ATTRIBUTES                                   \
> +       ({                                                              \
> +               if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)            \
> +                       continue;                                       \
> +       })
> +
> +#define QUIRK_RCAR_X5H_NO_RATES
>          \
> +       ({                                                              \
> +               if (ret == -EOPNOTSUPP)                                 \
> +                       ret = 0;                                        \
> +       })
> +
>  static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>  {
>         int clkid, ret;
> @@ -1254,10 +1266,12 @@ static int scmi_clock_protocol_init(const
> struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> QUIRK_RCAR_X5H_NO_ATTRIBUTES);
>                 if (ret)
>                         return ret;
> 
>                 ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               SCMI_QUIRK(clock_rcar_x5h_no_attributes,
> QUIRK_RCAR_X5H_NO_RATES);
>                 if (ret)
>                         return ret;
>         }
> diff --git a/drivers/firmware/arm_scmi/quirks.c
> b/drivers/firmware/arm_scmi/quirks.c
> index 3772139a758c8a78..5a69f119e1b6c806 100644
> --- a/drivers/firmware/arm_scmi/quirks.c
> +++ b/drivers/firmware/arm_scmi/quirks.c
> @@ -172,6 +172,8 @@ struct scmi_quirk {
>  /* Global Quirks Definitions */
>  DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
>  DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
> +DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000",
> +                 "renesas,r8a78000");
> 
>  /*
>   * Quirks Pointers Array
> @@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> "Qualcomm", NULL, "0x20000-");
>  static struct scmi_quirk *scmi_quirks_table[] = {
>         __DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
>         __DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
> +       __DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
>         NULL
>  };
> 
> diff --git a/drivers/firmware/arm_scmi/quirks.h
> b/drivers/firmware/arm_scmi/quirks.h
> index 74bf6406dd043049..13f28d13bbd74d4c 100644
> --- a/drivers/firmware/arm_scmi/quirks.h
> +++ b/drivers/firmware/arm_scmi/quirks.h
> @@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device
> *dev, const char *vend,
>  /* Quirk delarations */
>  DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
>  DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
> +DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
> 
>  #endif /* _SCMI_QUIRKS_H */
> 
> Does that look like what you have in mind?
> Thanks!

Yes in quirk I was only addressing NOT_ATTRIBUTES and mimicing the old
behaviour with continue, BUT if the set of clocks not supporting attributes
and the set of clocks not suppporting rates is disjoint, I feel we need your
double quirks :P

If you are still finding out the exact FW versions that are failing maybe
it is better if you carry on and test the quirk-framework fix above together
with your quirks and we can make sure to pick all up together...

...OR maybe better I can also drop for now my offending patch that breaks
your FW from my V3 series and you can pick it up and post it later with
your quirks and the Quirk framework fix you propsoed so that we are sure
that we dont break anything while fixing all of this...

Also because we are already in V4 and I dont want to risk to post the
breaking fix (that was at the end broke since forever) BUT not the quirks...

Let's see what @Sudeep thinks

Thanks,
Cristian

