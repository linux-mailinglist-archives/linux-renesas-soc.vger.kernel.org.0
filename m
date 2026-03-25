Return-Path: <linux-renesas-soc+bounces-30235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPbRMobgw2kgugQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:17:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F5325903
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74B5B312C532
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21D43D090B;
	Wed, 25 Mar 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UpdxeQt2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD8C3A2570;
	Wed, 25 Mar 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441676; cv=none; b=TDmVEggMVNcuS9z6Tshn58htsrUXqvs6DwLC9aBLoumaZqPlRmD884GEBWaQqJCR1yFD8orAMnyNJSOhs4enE/oEuo2C1pv9IUWEgO9ooqt4zdgZIwk4xod0KsoVM9Lm+3hBW0qCZMdXHDRX0Aa3oOr939oB0eObbHtMXo1c+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441676; c=relaxed/simple;
	bh=r2XgYTZSdCM7G0IZbpb3iOsmIHn+g3Bg7hWAC/Kzi3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkESCDbiBIOQSOfRr4h+TnejxrrRNDljvlLDEmNKd1n1AJEgom6NMirBOhzRSoM77qDqYoVnayC8AzYQLuXqxa4cQ4gupO1DjqpIkQGpcOWTzWb44AMaqaqoCJcKmoyak4wocXi/5o4JqiahygR59SLJ0m3M2jAPSe4uBmGEjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UpdxeQt2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E641CDD;
	Wed, 25 Mar 2026 05:27:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EFC33F915;
	Wed, 25 Mar 2026 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774441674; bh=r2XgYTZSdCM7G0IZbpb3iOsmIHn+g3Bg7hWAC/Kzi3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpdxeQt2YbXJHkZ26e0AGm4UKPobmeEc8zYHDPIQ7d+3Dp7TGfaxvbUJmQoUNeHt/
	 Ld+hmZJroKy4k9k3GMVoJEcCYtwB2eiAG8IurXt0H2v7nhT1fAfw9AsJyWBI8QHK7E
	 EF+csPDTqlILpKJ9qJAnCjmNTtj5kLbbV6V2sohM=
Date: Wed, 25 Mar 2026 12:27:48 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <acPUxJ3N0QptmtlJ@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CGME20260325110244eucas1p1ea280137c0b94e1f5b79d5578da7fedf@eucas1p1.samsung.com>
 <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b574ac5-09fa-4e7a-b2bb-a339fbb319bc@samsung.com>
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
	TAGGED_FROM(0.00)[bounces-30235-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: 496F5325903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:02:41PM +0100, Marek Szyprowski wrote:
> On 10.03.2026 19:40, Cristian Marussi wrote:
> > Add proper error handling on failure to enumerate clocks features or
> > rates.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 

Hi Marek,

> This patch landed yesterday in linux-next as commit 0d8b0c8068a8 
> ("firmware: arm_scmi: Harden clock protocol initialization"). In my 
> tests I found that it causes a regression on RK3568 Odroid-M1 board 
> (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts), cpufreq and GPU 
> device are not probed properly:
> 
> # dmesg | grep scmi
> scmi_core: SCMI protocol bus registered
> arm-scmi arm-scmi.0.auto: Using scmi_smc_transport
> arm-scmi arm-scmi.0.auto: SCMI max-rx-timeout: 30ms / max-msg-size: 
> 104bytes / max-msg: 20
> scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
> arm-scmi arm-scmi.0.auto: SCMI Notifications - Core Enabled.
> arm-scmi arm-scmi.0.auto: Malformed reply - real_sz:8 calc_sz:4  
> (loop_num_ret:1)
> arm-scmi arm-scmi.0.auto: SCMI Protocol v2.0 'rockchip:' Firmware 
> version 0x0
> arm-scmi arm-scmi.0.auto: Enabling SCMI Quirk 
> [quirk_clock_rates_triplet_out_of_spec]
> scmi-clocks scmi_dev.3: probe with driver scmi-clocks failed with error -22
> 

Yes there are multiple reports of issues on this hardening, the series
is on hold and wont go into v7.1 as of now...it needs some basic fixes
and various quirks probably to address non-compliant firmwares...

It will be pushed to next again with a few more fixes in the coming
days and then we'll need to figure out how many quirks will be needed on
top of that and if it is acceptable at all...

Thanks for the report,
Cristian

