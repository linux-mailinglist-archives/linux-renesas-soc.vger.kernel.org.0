Return-Path: <linux-renesas-soc+bounces-32373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIs7H8u2AWr2igEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 13:00:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A4E50C67D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 13:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C6D5300B462
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9B533F8D6;
	Mon, 11 May 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qWKADNI0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3831F33C1B4;
	Mon, 11 May 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497224; cv=none; b=ifHaJjfklPWLReFlTn5cGwtoTFgQFL7qGIRhZik+bKrJJ1oBmkXjkoM+REyLSogX9fEvw0H4K2b3GFu2dGzPJAYY4d8BlbR0R5XAb1te4sLfq36gDkbB+MyZo4IPmRC/StVgSBGxWXAs2Cd96g/54STKYGZB0ZRohaxbjJBgIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497224; c=relaxed/simple;
	bh=voSZcpcyiSDS3a/reXV/K0I/01RfqWCIKc4QVo8qHck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGnfiohNVPPTwLXRondPd5CChAj+T8sr9zhRf2A1MN2OXZv+pWU5rp40eTyBt4D59ZocTwP+qhC5YxAn+i0dpDUhcnoM9l/e1VrtwHJh3xIIYWh/GZaec4Y5I9x2n0uDKMFaEiG7cWe72BR5i8LABzqbKt9EutpnnjHE7P13+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qWKADNI0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F69216F8;
	Mon, 11 May 2026 04:00:14 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 794653F836;
	Mon, 11 May 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497219; bh=voSZcpcyiSDS3a/reXV/K0I/01RfqWCIKc4QVo8qHck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWKADNI07WVf8A2b1p6AnfwABXZ5IAyYR6C6rzl+s6/fUh/FcO0d9Q76KrGL3JnLO
	 LPtwmwejFNKqIFbStehlE8TRZO1LuTrI3NDglR5MR+GGaS1TwuREJmxHWCxTONCzTN
	 mG8sBhQYqlQ6mp8nmR7mzflzIYx3q3mIUTiNfTds=
Date: Mon, 11 May 2026 12:00:08 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
Message-ID: <agG2uPsoDZOfEgWX@pluto>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
 <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-origami-ape-of-inspiration-7b55f3@sudeepholla>
X-Rspamd-Queue-Id: 25A4E50C67D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32373-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,linux-m68k.org,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,arm.com:dkim]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:09:40AM +0100, Sudeep Holla wrote:
> On Fri, May 08, 2026 at 07:25:49PM +0200, Geert Uytterhoeven wrote:
> > Hi Cristian,
> > 
> > On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > it was a known limitation, in the SCMI Clock protocol support, the lack of
> > > dynamic allocation around per-clock rates discovery: fixed size statically
> > > per-clock rates arrays did not scale and was increasingly a waste of memory
> > > (see [1]).
> > 
> > [...]
> > 
> > > v3 -->v4
> > >  - Rebased on v7.1-rc2
> > >  - Removed unused info.rate_discrete [Geert]
> > >  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
> > >  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()
> > 
> > Thanks for the update!
> > 
> > I believe you still have a possible runtime bisectability issue
> > between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
> > rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
> > simplified per-clock rate properties": 04/15 removes the last setter
> > of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.
> > 
> 
> I have fixed this up by adding some initialisation in 04/15 and removing it
> in 06/15. Cristian, if possible can you check if the functionality will
> remain intact after 05/15 ?

LGTM.

Thanks,
Cristian

