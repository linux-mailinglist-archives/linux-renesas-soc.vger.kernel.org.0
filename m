Return-Path: <linux-renesas-soc+bounces-28358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAtUExYYm2lasQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Feb 2026 15:52:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B565216F77A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Feb 2026 15:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF3293001CC5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Feb 2026 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D803502B4;
	Sun, 22 Feb 2026 14:51:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C4F78F26;
	Sun, 22 Feb 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771771917; cv=none; b=CDI3iqyTy56Tul/B1z1syE+IvT2LmondaK2qb756wQjH+9PeU6dgwMaH57+J6osmVDoM4thIHXNksyPbVZCSCXLEPoLvOK08OaMYdEleRc8foGm1csDJmZrWKSG9tdXFWHt4WP995IDZK40Y5aPO4s8qtPuBhFlVlnFEGaEBT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771771917; c=relaxed/simple;
	bh=RxqlOpyWWTWN+ztiWCzxhPuP/Tk2WGIgMWSwYZbFfnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HReMUNWtshsn723JSGPUeK/b6x7kHVskH59gpWMvoDvVmOkpkZs8GYjHJlyP0pauDdjt1hPDRFOTs2sFkGUpe9nJRIxgR0BGJR33HJf/nZv0hkfofMXO8PzXvBUL/NHRgOI8241dT6i2Dzm7120QD1yZ5Pa3fkOTA0iKu3qwOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ED2A339;
	Sun, 22 Feb 2026 06:51:41 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CB193F59E;
	Sun, 22 Feb 2026 06:51:46 -0800 (PST)
Date: Sun, 22 Feb 2026 14:51:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] firmware: arm_scmi: Increase SCMI_MAX_NUM_RATES to 64
Message-ID: <aZsX-oplR6fiLBBN@pluto>
References: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc2b9f5e361f1c50e661aa80fe1c2bcfd93c9c56.1771580928.git.geert+renesas@glider.be>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,foss.st.com,renesas.com,gmail.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28358-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.962];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: B565216F77A
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:53:31AM +0100, Geert Uytterhoeven wrote:
> Currently, the SCMI clock driver supports up to 16 clock rates.
> However, the SCMI specification v3.2 does not explicitly specify the
> maximum number of clock rates that can be returned (the theoretical
> maximum is 4095 in the first call of the CLOCK_DESCRIBE_RATES command,
> followed by 65535 remaining rates in subsequent calls).

Hi Geert,

> 
> In Renesas R-Car X5H SCP FW SDK v4.28.0, some clocks have 32 or 64
> rates, which are returned in blocks of maximum 27 entries.  When SCMI
> firmware returns more than 16 clock rates, Linux ignores all clock
> rates, this reducing functionality of the affected clocks.
> 
> Fix this by increasing the maximum number of clock rates to 64.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This does increase the size of each scmi_clock_info object by 384
> bytes, which is way too much on a system with nearly 2000 clocks.
> As currrently all scmi_clock_info structures are allocated together as a
> single array, the .rates[] member cannot just be converted to a flexible
> array, without splitting the allocation.
> 

Indeed the clock protocol does NOT dynamically allocate based on
discovery outcome, like other SCMI protocols do, so that's a waste
of resources that does NOT scale...I am gonna fix this, first, by
allocating dynamically strictly for the effectively discovered
resources (liek other protos do)

> An alternative solution would be to no longer store all rates, as
> proposed by Étienne Carrière in "[PATCH v2 1/2] firmware: arm_scmi: get
> only min/max clock rates"
> (https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com)

Yes, the other further optimization could be to just query for min/max that
are, indeed, the only rates needed currently, BUT Etienne series open code a
brand new SCMI enumeration instead of rework and use existing SCMI iterators...

...I have an old incomplete series of mine that rework this...not tesetd and
partially working of course :P...I think I will try to give it a respin to
put such optimization on top of the above rework...

I will try to post something this week...let's see

Thanks,
Cristian

