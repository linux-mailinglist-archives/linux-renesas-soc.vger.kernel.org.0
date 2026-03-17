Return-Path: <linux-renesas-soc+bounces-29564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FKPIY0fuWmergEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:31:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE36D2A6C9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B9D03327966
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7C237CD23;
	Tue, 17 Mar 2026 09:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7A35A395;
	Tue, 17 Mar 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739369; cv=none; b=ZFB/ocqf5zI0WAJ6TwFKMiuqICimbbL1zMWMIUT7kchOYSRLigIuQWfZ1pisxkWit0eIpR7P3p5xZzbl2r62Az/HDDOSO+tF7e7Lx/pgiEtYx7PhPFXeCcF7DlRozg2Ei1dYVfmBlkq+p8dk86CXt3biWfAZ335OivUzbAQ+Y2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739369; c=relaxed/simple;
	bh=Xz17b+5X6ynEJKTd5JMVAR9verb1Jmtr4CsAB7EE3jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cop8GFARmAaEWp/OUb4qhPPugUm2IRcZAPHYhmLxtD+7hYEdfCNO3NP6UpoT5EZfaWGOh00ds69CfOHXRjgWZjejchsVZjTVn7b43vdJlDWGpHLsAm9UECvC6bREzPqoSn0x1zejIFpoo1n4w0+BXrElH4a7c+PloV7h7Gt+ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED331476;
	Tue, 17 Mar 2026 02:22:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01E5A3F778;
	Tue, 17 Mar 2026 02:22:44 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:22:38 +0000
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
Subject: Re: [PATCH v2 11/13] firmware: arm_scmi: Add bound iterators support
Message-ID: <abkdXkA4iyJ5HKH7@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-12-cristian.marussi@arm.com>
 <abkGQn9ODanEVns5@shlinux89>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkGQn9ODanEVns5@shlinux89>
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29564-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.803];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE36D2A6C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:44:02PM +0800, Peng Fan wrote:
> On Tue, Mar 10, 2026 at 06:40:28PM +0000, Cristian Marussi wrote:
> >SCMI core stack provides some common helpers to handle in a unified way
> >multipart message replies: such iterator-helpers, when run, currently
> >process by default the whole set of discovered resources.
> >
> >Introduce an alternative way to run the initialized iterator on a limited
> >range of resources.
> >
> >Note that the subset of resources that can be chosen is anyway limited by
> >the SCMI protocol specification, since you are only allowed to choose the
> >startindex on a multi-part enumeration NOT the end index, so that the
> >effective number of returned items by a bound iterators depends really
> >on platform side decisions.
> >
> >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >+static void scmi_iterator_cleanup(void *iter)
> >+{
> >+	struct scmi_iterator *i = iter;
> 
> I see you use no_free_ptr for allocation,
> Do we need to use __free for i or drop the __free usage in allocation? 

Neither I think...iter is allocated by iterator_init() which do use
__free cleanups to simplify error paths, BUT if everything goes fine
iter is returned with no_free_ptr() as a normal pointer and all the
compiler-attached cleanup helpers are removed...

Then you can use in an iterator_run() or iterator_run_bound() and in
borth case it HAS to be manually cleanup by calling this scmi_iterator_cleanup
helper where...

> 
> Regards
> Peng
> 
> >+
> >+	i->ph->xops->xfer_put(i->ph, i->t);
> >+	kfree(i);

..it is finally freed explicitly...

...or I am getting something else wrong around the cleanup helpers :P ?

Thanks,
Cristian

