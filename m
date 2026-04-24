Return-Path: <linux-renesas-soc+bounces-31638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAITJpxx62ndMwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:35:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C245F277
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07183302A68F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068243D6CC7;
	Fri, 24 Apr 2026 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PMTTfHAJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94C62DCF52;
	Fri, 24 Apr 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037543; cv=none; b=Yc4GnRCDmgmvhnHYPeHfwy88DafGQ3ewCQWq31A4XqBnGYo1McymyaWopzNfXbc8j0fYtZ5ZfLA90DV3WIhzqCph2iwpo7ykpaTg4kdQ/GIc7GAaDtKt7fkZsQkDag2A4p/d82C7++IXLHNuIVigcc6BLEEYRshwJL62idzUgwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037543; c=relaxed/simple;
	bh=/Jr8/sdUQILExlSNhoUC+H6o4ZnAtzegjWHXjc9nxwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqANmGXn27wV74N4zJEFgoqdAbxUKUpnl4a5867/ZK1OFPGq/A0tkfT20uQBdlu9Zg/EDNTP/sB4gy4vetNwp4vtUUuECo70KKZf243HshJ4M/C3MWyICwiWAqRwVJUPeI95O+ZcDWlrLmh2RmyzcOn17qNoyA1rIy4QpaJ/96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PMTTfHAJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BDAD1BA8;
	Fri, 24 Apr 2026 06:32:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CDD13F62B;
	Fri, 24 Apr 2026 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777037538; bh=/Jr8/sdUQILExlSNhoUC+H6o4ZnAtzegjWHXjc9nxwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMTTfHAJItHYZ8aawJ+Jzk17mvBiV3VHV5EmjXideXUXopqdeINDr+pN77e/BUTum
	 kFmdmauR/A7tP4lWoLpYoYipKj5LVtq5cogG4i4XYtX7Nwpo/xhZvrgG51qjUGHcvV
	 XnlMw95PTw4/xClzkivOBmeDgPwvavbVwEran/Uc=
Date: Fri, 24 Apr 2026 14:32:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <aetw1WcSCDxk11AV@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <WNCeTzosRbKm_zGsbSPx8w@collabora.com>
X-Rspamd-Queue-Id: 1D9C245F277
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
	TAGGED_FROM(0.00)[bounces-31638-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,arm.com:dkim,arm.com:url]

On Fri, Apr 24, 2026 at 02:07:59PM +0200, Nicolas Frattaroli wrote:
> On Tuesday, 10 March 2026 19:40:25 Central European Summer Time Cristian Marussi wrote:
> > Add proper error handling on failure to enumerate clocks features or
> > rates.
> > 

Hi,

> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/clock.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> > index c9b62edce4fd..bf956305a8fe 100644
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> > @@ -402,10 +402,16 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
> >  		    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
> >  			clk->rate_change_requested_notifications = true;
> >  		if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > -			if (SUPPORTS_PARENT_CLOCK(attributes))
> > -				scmi_clock_possible_parents(ph, clk_id, cinfo);
> > -			if (SUPPORTS_GET_PERMISSIONS(attributes))
> > -				scmi_clock_get_permissions(ph, clk_id, clk);
> > +			if (SUPPORTS_PARENT_CLOCK(attributes)) {
> > +				ret = scmi_clock_possible_parents(ph, clk_id, cinfo);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +			if (SUPPORTS_GET_PERMISSIONS(attributes)) {
> > +				ret = scmi_clock_get_permissions(ph, clk_id, clk);
> > +				if (ret)
> > +					return ret;
> > +			}
> >  			if (SUPPORTS_EXTENDED_CONFIG(attributes))
> >  				clk->extended_config = true;
> >  		}
> > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >  	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >  		cinfo->clkds[clkid].id = clkid;
> >  		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > -		if (!ret)
> > -			scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +		if (ret)
> > +			return ret;
> >  	}
> >  
> >  	if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {
> > 
> 
> I see that a quirk is being added for this, but I thought I should chime
> in with my opinion for future approaches in this direction.
> 
> I don't see how this hardens anything. All this does is break platforms
> that were previously working by returning early. At most, this should

Certainly the naming in the subject was chosen badly (by me!)...indeed it
should be more something like "Enforce strict protocol compliance",
because at the end all of the broken platforms really run a slighly odd
out of spec SCMI firmware that does NOT implement one or more of the SCMI
mandatory command...

> be a warning (as in not WARN but pr_warn/dev_warn/...). If firmware
> returns nonsense, a clock driver should imho try its best to work
> around the nonsense in a safe way, because the alternative is that
> a major part of the system (and thus likely the entire system) no

..well yes we definitely dont want to break deployed platforms BUT also
we dont want to legalize this kind of out of spec behaviour in future
firmwares...hence (a number ?) of quirks an FW_BUG warns probably to
let already broken deployed platforms survive while discouraging such
implementation in future fw implementations...

These firmware most certainly wont pass the SCMI compliance test suite [1],
which indeed we do not mandate, but the reason these bugs happened is
exactly because the kernel SCMI stack was buggy and left that door open...

More specifically these kind of out-of-spec behaviours are not really just
a matter being 'picky', the problem is that any resource set in any
SCMI protocol is defined by the spec such as to be described by a
contiguos set of IDs and the drivers are designed anyway under that
assumption from the allocation point of view, so allowing a clock ID to
just fail one of the mandatory commands and skip a domain would jeopardize
all of this and, even if clearly is NOT a problem here, seems a fragile
assumption.

> longer works. It's basically the same reason why we avoid BUG(): sure,
> you prevented a problem, but you tore down the entire system to tell
> the user about it.

No I feel this is a lot different from the BUG() scenario: we'll never
merge this like this without enough quirks to let survive all the
existing impacted platforms, but the shout here is for the fw-developer
of a new un-deployed firmware: that WILL fail and no quirk will be accepted
if they plan to design a future FW out of spec from scratch because they
think is better....well...they can anyway of course but they will have
to keep their own quirks donwstream forever :P

Thanks,
Cristian

[1]: https://gitlab.arm.com/tests/scmi-tests/-/commits/master?ref_type=heads


