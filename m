Return-Path: <linux-renesas-soc+bounces-28086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A4iF2QBimluFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 16:46:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B58F21121D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 16:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FD05300351A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 15:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89D837F8DD;
	Mon,  9 Feb 2026 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yg2EXP+I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B523D291;
	Mon,  9 Feb 2026 15:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651885; cv=none; b=IKcv29xwqug2o9Ie8zL7Ty83Ybc4b8J9tMhzogwuYg4NHWTbYCk7XwIDixE7AI/ciKrZmyU0rtIW1RZEWuBr5CRoMmpy7mbZjHP3ZiMqaCBKZF2vIQ2v6MV/5QIjPRKAr6hihaAoKizHTSGHugV3oX0IqGWFEsHKFUMUK4LhCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651885; c=relaxed/simple;
	bh=GvM3s2O65gK18I39hGtyeztUQDYF3w7gL7m0UjnQuUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sICuAvD+ucOq1JkqW14V96OzpJJIOLU8T50UnbXMvtW2nSAd5uxUlOfy4rOBEGqjtXcwnn07m4WbjF7N3e82+BA7HYriUHEyQ/amOU17Z9Bucqx1y6jcq7wlMEx+ICEaOGhxNG2Qd8nGWUr3CG4kum4TKKWKvU+CsbXCVAiI/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yg2EXP+I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CA3C116C6;
	Mon,  9 Feb 2026 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651885;
	bh=GvM3s2O65gK18I39hGtyeztUQDYF3w7gL7m0UjnQuUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yg2EXP+ILq2Rn3fxB8/j/piTRYrTNUkCe+a83cTkPyC/FMaEilXcQdwkNVESBrANc
	 +CdInaoIS/MEi5p3dfJ3ebMk2/T5IMoWCyUrKMVIj04Rq3O9+glJ9hnl6cVNjSXF1a
	 oOR53ceZ6rAxbCL97uM5NF+OvseHqBDZ2G8xSUPWt50zgXUIvRPVrj+26TYdKfoKa4
	 CbXq43fRfONLa4N/rneSu/jcaNFhR4QS5iVUJXNBftu2Yr1+44V/thLRp2t4CTrSLx
	 RKzC5s64Tqlv9JQEdotMQAOrk9l6Q3sCsHARe2sp29lYyPvhunXwyBOvVi5+nR1dYk
	 av29WcKbKYhSA==
Date: Mon, 9 Feb 2026 15:44:39 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28086-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,broadcom.com:email,mailbox.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: B58F21121D3
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:53:19AM +0100, Marek Vasut wrote:
> On 1/19/26 5:57 PM, Cristian Marussi wrote:
> > On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
> > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > operation into poll mode. This is meant to work around uncooperative
> > > SCP implementations, which do not generate completion interrupts.
> > > This applies to mbox/shmem based implementations.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: arm-scmi@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > ---
> > > V2: Drop no IRQ handling from SMC transport and update commit message
> > > V3: Rename property from arm,poll-transport to arm,no-completion-irq
> > > V4: No change
> > > ---
> > >   drivers/firmware/arm_scmi/common.h | 4 ++++
> > >   drivers/firmware/arm_scmi/driver.c | 4 ++++
> > >   2 files changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> > > index 7c35c95fddbaf..7c9617d080a02 100644
> > > --- a/drivers/firmware/arm_scmi/common.h
> > > +++ b/drivers/firmware/arm_scmi/common.h
> > > @@ -235,6 +235,9 @@ struct scmi_transport_ops {
> > >    *		      to have an execution latency lesser-equal to the threshold
> > >    *		      should be considered for atomic mode operation: such
> > >    *		      decision is finally left up to the SCMI drivers.
> > > + * @no_completion_irq: Flag to indicate that this transport has no completion
> > > + *		       interrupt and has to be polled. This is similar to the
> > > + *		       force_polling below, except this is set via DT property.
> > >    * @force_polling: Flag to force this whole transport to use SCMI core polling
> > >    *		   mechanism instead of completion interrupts even if available.
> > >    * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> > > @@ -254,6 +257,7 @@ struct scmi_desc {
> > >   	int max_msg;
> > >   	int max_msg_size;
> > >   	unsigned int atomic_threshold;
> > > +	bool no_completion_irq;
> > >   	const bool force_polling;
> > >   	const bool sync_cmds_completed_on_ret;
> > >   	const bool atomic_enabled;
> > > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > > index 3e76a3204ba4f..f167194f7cf67 100644
> > > --- a/drivers/firmware/arm_scmi/driver.c
> > > +++ b/drivers/firmware/arm_scmi/driver.c
> > > @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
> > >   	cinfo->is_p2a = !tx;
> > >   	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
> > >   	cinfo->max_msg_size = info->desc->max_msg_size;
> > > +	cinfo->no_completion_irq = info->desc->no_completion_irq;
> > >   	/* Create a unique name for this transport device */
> > >   	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> > > @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
> > >   	if (ret && ret != -EINVAL)
> > >   		dev_err(dev, "Malformed arm,max-msg DT property.\n");
> > > +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
> > > +							      "arm,no-completion-irq");
> > > +
> > >   	dev_info(dev,
> > >   		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
> > >   		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
> > 
> > LGTM.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Is there anything left to do with these patches, or can this now be picked
> up ?
> 

As I had mentioned here[1], I am happy with it and I will pick it up for
v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
I had sent my PR to SoC team for v7.0

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/aW5jwtoYCFs-Pzpk@bogus/

