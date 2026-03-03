Return-Path: <linux-renesas-soc+bounces-28700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNSRN3zdpmnRXwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:09:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 842521EFEC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EAE093035E35
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8146442317B;
	Tue,  3 Mar 2026 13:08:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0918342C93;
	Tue,  3 Mar 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543335; cv=none; b=i6yO2IumE2I1wFQ829Op+ZPs/EB+GiDjeoE5Pgjd4uKvuV9BhDed06t+4iUSB4KusMrONrCFV75Ffqex1GYTg+xy1wdrf5tl9Ryc2kGtPJDozzFJukyIo0shzU5YyZ7RPw5mkUXa5QFiXVpGhagOtctwnohloXxkFjKUapEgXSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543335; c=relaxed/simple;
	bh=+aD7rHRYNhH4mWSwuRacRuHrsbhzN5dK0LutoaXKLPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smYZOFZcTcYdg9MCv1HH3nQ/c895+Fyj9U96FHNV0ZsB+2f8cnHhp6uDqj7ZtxGkdicvYZvyNPPQlvyx4HQEktKmP0sxIXlBmkw8m1ImdqUL4hqiVK7sM/7rjWUkdEVNn9fN93zoSVGTWkjXOmVs4HKLtCdoVXlFz4DQga5KQwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02975497;
	Tue,  3 Mar 2026 05:08:47 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA2673F73B;
	Tue,  3 Mar 2026 05:08:49 -0800 (PST)
Date: Tue, 3 Mar 2026 13:08:46 +0000
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
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
Message-ID: <aabdXvaSlu1EDgG4@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-Rspamd-Queue-Id: 842521EFEC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28700-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.567];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 02:25:00PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> Thanks for your series!
> 
> On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > dynamic allocation around per-clock rates discovery: fixed size statically
> > per-clock rates arrays did not scale and was increasingly a waste of memory
> > (see [1]).
> >
> > This series aim at solving this in successive steps:
> >
> >  - simplify and reduce to the minimum possible the rates data info exposed
> >    to the SCMI driver by scmi_clock_info
> >  - move away from static fixed allocation of per-clock rates arrays in
> >    favour of a completely dynamic runtime allocation: just allocate what
> >    is needed based on the effectively discovered
> >
> > This is done in patches 1-6.
> >
> > A further bigger optimization suggested in a past series [1] by Etienne
> 
> s/[1]/[2]/
> 
> > would be, whenever allowed by the spec, to limit upfront the number of
> > queries in order to simply retrieve min and max rate, that are indeed the
> > only rates needed by the CLK SCMI driver.
> >
> > The approach proposed in [1] was open coding and duplicating some of the
> 
> What does [1] refer to?

I messed up the refs..of course...it was just a reference to your thread
where the number of rates where staticallty raised to 64.

> 
> > functionalities already provided by SCMI iterators, though.
> >
> > Patch 7-10 implement such optimization instead by:
> >
> >  - reworking core SCMI iterators to support bound enumerations
> >  - use such new bound iterators to perform the minimum number of queries
> >    in order to ony retrieve min an max rate
> >
> > As a final result now the rates enumeration triggered by the CLK SCMI
> > driver, while still allocating for all the existent rates, miminize the
> > number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
> >
> > Finally, patch 11 introduces a new clock protocol operation to be able to
> > trigger anytime on demand a full enumeration and obtain the full list of
> > rates when needed, not only min/max: this latter method is really only used
> > currently by some dowstream SCMI Test driver of mine.
> >
> > Based on v7.0-rc1.
> >
> > Tested on JUNO and an emulated environment.
> 
> Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
> R-Car X5H, while decreasing memory usage.
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Thanks for testing in the real world !
Cristian

