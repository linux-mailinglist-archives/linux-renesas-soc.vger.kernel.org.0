Return-Path: <linux-renesas-soc+bounces-28696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EvhJaHZpmnHWgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:52:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378A1EFBB5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 13:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380393017028
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B107335DA7A;
	Tue,  3 Mar 2026 12:47:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F501624DF;
	Tue,  3 Mar 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542021; cv=none; b=sSwuNagTtQqZlncQJ4An6CGnAaHMrnID/y+9ybWKtcFdtbjBxyX4MWNaOglI8I0w0rmFfF0ADRfpwxDg+zvNfrpSWkfoF825h3jRnX1oCDVrxKbLSdUmAHTUQcgeg0L5OkHs7zsXRftabuI4QhGVwct6ydM1mBk01be+uHvmcIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542021; c=relaxed/simple;
	bh=74eJWmuQvKvwedaHc+syTnjf1fOGcN8yCp+AH4IM9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCJaO+F9kl/Eug+toggL/OT+5/z+vWEh+31M0Q8oExJhXC3dPOlP5GeH6jsyM+V5vjgTrfEyVwKs7hbtM7FeU1YhZY3tRrSiaTjI9anx/rAqjKYzXRX8qthU07K7mpWBr7w1hNYXv7QA3x76lJvd5k7PHbY+9y0Sk/ZfbS7yHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23655497;
	Tue,  3 Mar 2026 04:46:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08AA3F7BD;
	Tue,  3 Mar 2026 04:46:53 -0800 (PST)
Date: Tue, 3 Mar 2026 12:46:50 +0000
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
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aabYOiZvYYOypV0A@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZjZvhifzh0W2wbMZf2DYgZjO=gXepsS2nQtSG0weCag@mail.gmail.com>
X-Rspamd-Queue-Id: 0378A1EFBB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28696-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.572];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:37:00PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Add a clock operation to help determining the effective rate, closest to
> > the required one, that a specific clock can support.
> >
> > Calculation is currently performed kernel side and the logic is taken
> > directly from the SCMI Clock driver: embedding the determinate rate logic
> > in the protocol layer enables semplifications in the SCMI Clock protocol
> > interface and  will more easily accommodate further evolutions where such
> > determine_rate logic into is optionally delegated to the platform SCMI
> > server.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Thanks for your patch!

Hi,

thanks for having a look.

> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -624,6 +625,46 @@ static int scmi_clock_rate_set(const struct scmi_protocol_handle *ph,
> >         return ret;
> >  }
> >
> > +static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
> > +                                    u32 clk_id, unsigned long *rate)
> > +{
> > +       u64 fmin, fmax, ftmp;
> > +       struct scmi_clock_info *clk;
> > +       struct clock_info *ci = ph->get_priv(ph);
> > +
> > +       if (!rate)
> > +               return -EINVAL;
> > +
> > +       clk = scmi_clock_domain_lookup(ci, clk_id);
> > +       if (IS_ERR(clk))
> > +               return PTR_ERR(clk);
> > +
> > +       /*
> > +        * If we can't figure out what rate it will be, so just return the
> > +        * rate back to the caller.
> > +        */
> > +       if (clk->rate_discrete)
> > +               return 0;
> > +
> > +       fmin = clk->range.min_rate;
> > +       fmax = clk->range.max_rate;
> > +       if (*rate <= fmin) {
> > +               *rate = fmin;
> > +               return 0;
> > +       } else if (*rate >= fmax) {
> > +               *rate = fmax;
> > +               return 0;
> > +       }
> > +
> > +       ftmp = *rate - fmin;
> > +       ftmp += clk->range.step_size - 1; /* to round up */
> > +       do_div(ftmp, clk->range.step_size);
> 
> step_size is u64, while do_div() truncates it to 32-bit.

Yes, as pointed out also by other reviewers, there are pre-existent bugs
probably in this rounding...this patch was meant only to move the logic
away from the CLK SCMI driver into the SCMI Clock protocol layer since
it enables a few simplification...

In the next V2, I will fix rounding errors by adding a dedicated Fix on
top of the original code, before this 'relocation', so as to make the
backport easier and move the fixed code.

Thanks,
Cristian

