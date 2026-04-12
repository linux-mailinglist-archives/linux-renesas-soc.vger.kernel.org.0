Return-Path: <linux-renesas-soc+bounces-31216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JzCGzro22laIgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 20:45:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC43E57A8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 20:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 834163002FB5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 18:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D03E21CC71;
	Sun, 12 Apr 2026 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NuAHMdQR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97768379EE8;
	Sun, 12 Apr 2026 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019511; cv=none; b=FlqoQxRjjNjv/wJoB152oZMWSw3jDeE64KEnVZvMea25ZF0qOXSNugjtNXmUPtTIR0xxtzYnL6Vl9gdvdXDzPN+YDYqVbO6zr+sqfCj0VkIhe7ziRSpGNR+mmZKeEisDsf9G4H1gKfhn7kMxYpRDYrwhiUDBIuDhh6IA6sllThM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019511; c=relaxed/simple;
	bh=JycCwi4It/RmDM1Aoh26Y5e1GASVK7xVPWR4xn0eZE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wr2nJP10/EuuCZuqDrSJCFsNARWmLBTtRvQZTIX6p4nSGiHW/rHnt3thepV4aC5YvedYQfg7wHW1ciEnP5uhfJzQ6qvJBmtS2V7GoQF3lRUAJUgFcXX0ox9xnJFPuyNCjh8HVr6Tgnb9iw4thI9cY8YzFYN5tl51WU0zf3ze7gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NuAHMdQR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A480331A;
	Sun, 12 Apr 2026 11:45:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AB803F641;
	Sun, 12 Apr 2026 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776019508; bh=JycCwi4It/RmDM1Aoh26Y5e1GASVK7xVPWR4xn0eZE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NuAHMdQReW1JUpva8C4r1cbQXqIATk01UJq9WTHm/C+iuZ3Mc2tYrPl53dDN7MHsJ
	 NyhRMK27pEDOucPgnKebroKJAcy7wKvcI2p0/2CR/D59wu0/peakhyP7jV6X0if6M1
	 QFeOL1S2bifnTia3nbbEASql4Nu2bNQlsdWiHQvI=
Date: Sun, 12 Apr 2026 19:44:58 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Message-ID: <advoKvOSGpOEN_qX@pluto>
References: <cover.1775205358.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-31216-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim]
X-Rspamd-Queue-Id: C2FC43E57A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 10:41:28AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,

Hi Geert,

thanks for this, first of all.

I was a bit off the keyboard so the delay in my answer.

I will get back at this SCMI/Clocks/Quirks matters in the next few weeks
targeting next rc1-ish...

In a nutshell I was thinking to proceed roughly as follows:

 - respinning a V3 of my original Clock Rates series WITH the addtion
   of your previous fixes series on top (or merged into) BUT DROPPING
   from my original series the patch that triggered a lot of FW panics
   in the wild due to out of spec FWs. (Harden Clock protocol initialization)

 - spinning another NEW series on top of this 'Miscellaneous improvement'
   series of yours, since I want to add, on top of this rework of yours, the
   capability for the Quirk framework to match the same quirk definition
   (static key) against multiple vendors/subvendors/impl....since, as you may
   have noticed :P, I broke a number of boards recently with just one fix
   kernel side BUT all of these issues can be really quirked using some
   common identical quirk snippet to match against all the needed vendors
   (rockchip/nxp/renesas as of now)
   
   ...I have some ugly working hack with which I am experimenting on this
   quirk matching evolution...

   On top of all of this I would then reapply the FW-breaking fix AND all
   the quirks we determine as needed (possibly N matching M vendoes) and
   test as much as possible pushing into for-next...

Then we'll see what Sudeep thinks about all of this, of course.

Thoughts ? Any feedback welcome.

Thanks,
Cristian


