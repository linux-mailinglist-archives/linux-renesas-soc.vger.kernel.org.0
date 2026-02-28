Return-Path: <linux-renesas-soc+bounces-28599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALhADMy/omk+5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28599-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:13:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE251C1E97
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 11:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C0363037D67
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 10:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A407A41B34C;
	Sat, 28 Feb 2026 10:13:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601BE413250;
	Sat, 28 Feb 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273607; cv=none; b=CHEB7VG5v0ZGwGbhm4TaB0TqgMx3iBL8qlrxX9Xgt0XFvsHZcorLtMDij8bJlz+U6Cu5BF2Fkaz22e06koOyt3tKgWGCR8JB3FkvkBuCVyYU0BBAHI8lfVpUrVqsznCJTfyMH7oA/aDFpZL8MVt3T5V9AEaZ6TROrsB93BIBEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273607; c=relaxed/simple;
	bh=f7BkTF9gSktQZxAQQ+v5eGGrZUWQbxCpjHljwHy/7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwH3ZqDxEsjaTukbw1nF1EnyBEQ11bQ6H/GUIrR00rNLhPTh8WCoE5g612e4NgnMx6Wb6ssJur5cLRIGhR2PQZde/IrTXL+I9IQJMqy2mPRrmqYujSWq+TS0IgLvFz0kEdApdIN5oxog0tiU8Z1bKXLnLXADV0oeof/e7Ata6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4095B1516;
	Sat, 28 Feb 2026 02:13:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979463F7BD;
	Sat, 28 Feb 2026 02:13:21 -0800 (PST)
Date: Sat, 28 Feb 2026 10:13:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaK_vgwyH1l8LRJ1@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <aaI2X6qnGabtW1t0@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI2X6qnGabtW1t0@shlinux89>
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
	TAGGED_FROM(0.00)[bounces-28599-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Queue-Id: CDE251C1E97
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:27:11AM +0800, Peng Fan wrote:
> Hi Cristian,
> 
> On Fri, Feb 27, 2026 at 03:32:15PM +0000, Cristian Marussi wrote:
> >Add a clock operation to help determining the effective rate, closest to
> >the required one, that a specific clock can support.
> >
> >Calculation is currently performed kernel side and the logic is taken
> >directly from the SCMI Clock driver: embedding the determinate rate logic
> >in the protocol layer enables semplifications in the SCMI Clock protocol
> >interface and  will more easily accommodate further evolutions where such
> >determine_rate logic into is optionally delegated to the platform SCMI
> >server.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Spoiler alert next SCMI spec will most probably include a new
> >CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> >so this clock proto_ops will be needed anyway sooner or later
> 

Hi Peng, 

thanks for having a look...

> Is there any early reviewing version available?

No I dont think there is anything shareable...just some preliminary
exploratory work following your and other vendor reaquest to have a way
to properly determine upfront what will be the final rate starting from
the requested one, because delegating all to the fw-side round-up leads
to issues in some cases when the final rate is different from teh
requested one...well...you know better than me why, being one of the
guys that pointed out the issues... :D (if I am not mistaken)

It is anyway material for v4.1...which has still to be started...so this
was just a reminder that a dedicated protocol version would be most
probably needed soon-ish..

Thanks,
Cristian

