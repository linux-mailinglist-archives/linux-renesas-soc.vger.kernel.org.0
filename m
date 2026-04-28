Return-Path: <linux-renesas-soc+bounces-31738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEweNeAy8WkgegEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 00:21:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2623448C88B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 00:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9FE63096D17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Apr 2026 22:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511836D9EC;
	Tue, 28 Apr 2026 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eIi55or1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB7B346AFD;
	Tue, 28 Apr 2026 22:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414878; cv=none; b=RJJBoPKE06bpZrPZu30HFj8w6FCAYM7yLslC+ZN2C6ttQHSKtQvDDFWo8MtDfMzHADJCqSUq6k5k2zhTsQXE6l/kjBXhkCT4/4uwF3li/vchwKdRowR57m/sQ0K2s2jcjGDzcjUbngdl7mCxFXc6A4hnbeUWGLSmnFRiirf8PE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414878; c=relaxed/simple;
	bh=0oXuZXWwTkgdhqDH8uG96AOPYmMlsgWr1XRmX4V3t88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDC33DnZ+EvCLUZ7Qh+ofb7Tgvuhb5uhCkQD6XTeZgwZSBtJ2rsbpPXLU1RhjVEFZqqwcbbM4FJvupj9YDNDNCoJ2w2qjWtZ7vw8+MsH9TWMNtXU/uoKJYIz3Nn0k0yc7tGyIbBeLHm2cZx1kOHmWSF094F4T2pKsBemXaEKC8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eIi55or1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6277C1650;
	Tue, 28 Apr 2026 15:21:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7833F3F763;
	Tue, 28 Apr 2026 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777414873; bh=0oXuZXWwTkgdhqDH8uG96AOPYmMlsgWr1XRmX4V3t88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIi55or15uZzRwFD8tshHMcSkHBRaNquAsw7E3sqdnb2b4dwEP5+wIufVG1JsM2LO
	 7+ZBJ3l3IkDkZzvWYdyd7zUlWWOiu+skJJhCqa7Gy/9ktfeh641NJeHxXvL/Fs0hu/
	 OzEoIf8GeLzHFH30PSiOSCKBXY5nwdF3pEsJTjh4=
Date: Tue, 28 Apr 2026 23:20:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <afEyuvQx6KRq0WXT@pluto>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
 <20260428201522.903875-4-cristian.marussi@arm.com>
 <afEZotnIZYXEtMiC@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afEZotnIZYXEtMiC@redhat.com>
X-Rspamd-Queue-Id: 2623448C88B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31738-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]

On Tue, Apr 28, 2026 at 04:33:38PM -0400, Brian Masney wrote:
> Hi Cristian,
> 
> On Tue, Apr 28, 2026 at 09:15:10PM +0100, Cristian Marussi wrote:
> > Use the Clock protocol layer determine_rate logic to calculate the closest
> > rate that can be supported by a specific clock.
> > 
> > No functional change.
> > 
> > Cc: Brian Masney <bmasney@redhat.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > @brian: I'd modify further this clk-scmi driver, with a patch on top of
> > this series, to properly use your new CLK_ROUNDING_NOOP flag once your
> > series AND another (already reviewed) series on clk-scmi from Peng are in.

Hi Brian,

> 
> I don't know if Stephen is going to pick up my CLK_ROUNDING_NOOP series.
> We talked about it in person at LPC in Tokyo, and he was the one that
> suggested the flag rather than a new shared noop function. However he
> didn't pick it up last development cycle.
> 
> I would recommend NOT basing on that series of mine to reduce
> dependencies, and so that your stuff doesn't get held up by series.
> 

Ok, thanks for the heads up, I was indeed not able to find the _NOOP in
v7.1-rc1 and I was NOT sure...anyway a patch on top of this whenever
your series goes in should not be a problem....maybe if you can ping me
when it's merged, it would be easy NOT to miss/forget :P

Thanks,
Cristian

