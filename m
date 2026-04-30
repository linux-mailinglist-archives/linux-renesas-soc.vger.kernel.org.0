Return-Path: <linux-renesas-soc+bounces-31791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGzSA3I082nvyQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:52:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 793404A10F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13AE1300D680
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002FC3BAD84;
	Thu, 30 Apr 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly3jpivd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6E3BA221;
	Thu, 30 Apr 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777546348; cv=none; b=S5YbGIb45+irQfjUMrH3cirPpDqw/o4GH7EcW0HF/eALmtsad2V+JHxKeX59vP+xVi9oC4QMnV0tcoa/E4CcqBvSsWB0VYMCfGkORfno0byppQwOSZIjpPUqmEjrOITGoFzsKdjo/S6C+rTv/PVigZsOEtT6apo3i91POVL6kdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777546348; c=relaxed/simple;
	bh=gYsKTSldQ+t3dAVYY8tm2L8dmGS2r3wIELcQphbR2MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssZCA2PMeohF3yQlrPuKUBzQeAut1RW/vbj6d1+zl3YnUuQ5pSuzVcADtG3OF/1Kxt29XBffRtcHdY3JrN6tGjVfmY3+VWXXVViBwJYngAhjY/TpReGOEFfWBeV5vUrDdq12o2Pp8f0qJ01Sky6hbF+cSvkkjslHA6PKMWpNFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly3jpivd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873C3C2BCB3;
	Thu, 30 Apr 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777546347;
	bh=gYsKTSldQ+t3dAVYY8tm2L8dmGS2r3wIELcQphbR2MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ly3jpivduFyRda6zGopCDcMIOoUAdg4wiKhOYtmYz0CD/fZSO4sg7xYe3mbBZ0WFS
	 qVAZisw7OYBdkJycAG+YbsBc393Xc1ZkuquD/lWRR7qXdNiSWeuD61j3P8NdvkjncM
	 htJy4xxHJsTRm0GXJsi1gAlaD92b8TlCUvHXNdJn4geWiP9AGF9mc/1HBpN1/Howe9
	 3rYsM9181RXvaAXEHvqDTNAbHirP3Oj1o5XDXELna5nSrV8KaB6lzwVn/uBoMBLHuW
	 QAAB32xLuP3mqJ4fFFp8M7l103stl/ffpclkF/dAL38B5cX2/mdKy9sp1maQd6/jBA
	 hCm7pubYigIow==
Date: Thu, 30 Apr 2026 11:52:24 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range
 parsing
Message-ID: <20260430-meticulous-obedient-butterfly-0dfdc0@sudeepholla>
References: <cover.1775205358.git.geert+renesas@glider.be>
 <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
 <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
 <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
X-Rspamd-Queue-Id: 793404A10F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31791-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 12:34:43PM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Thu, 30 Apr 2026 at 12:17, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> > > When a range contains only an end ("-X"), the number string is parsed
> > > twice, as both "sep == first" and "sep != last" are true.  Fix this by
> > > dropping the superfluous number parsing for "sep == first".
> > >
> > > This does have a harmless functional impact for the unbounded range:
> > > "-" is now accepted, while it was rejected before.
> >
> > Supporting "-" is good but I think the ret is uninitialised in that case
> > as sep, first and last are all equal. If you agree, I can patch up by
> > initialising ret to 0. Let me know if I am missing any other case where
> > it is not good to have ret initialised to 0.
> 
> My bad, ret should indeed be preinitialized to zero.

Thanks for confirming.

> Thanks for fixing!
> 

Pushed now, will let the build/other bots take a spin and then I will
announce as applied if there are no other issues(which should be the case
as it has been in my -next for a while)

-- 
Regards,
Sudeep

