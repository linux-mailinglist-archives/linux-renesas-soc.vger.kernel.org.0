Return-Path: <linux-renesas-soc+bounces-33098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBlbKH20FGpdPgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:43:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A935CEB4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 22:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98AF33025E72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 20:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66DC346781;
	Mon, 25 May 2026 20:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeP44ALX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D60175A86;
	Mon, 25 May 2026 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741647; cv=none; b=Y6Ob9pQQfo1Pu2hy79JwsatuN/ckAiWtShF6x4lKNsQ/XifSrgqhKL9YNbAqmn+YvjCzhEy5V7U79c1/C70ck1AM4X7t6Z4iTbhENnp52+ee7OziJWbMXIw5naGNest0W+kMR8Ld4Hblq4FI10Kgii0JfT2ZYHoVlPWl/rKUBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741647; c=relaxed/simple;
	bh=6ru5neY97HOtVhecJIGp0m2gwsYktxPjJCzFOqpTPTI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ab05JvgIG1dvhJLpldd8eCUR69qSAKK8MnsWhboSPqPOb95yFoXGHmCXS3+GNPN3xeOrnC+9CrlGY1kxdBQZ8bb4C8Jgdg9ecP44/2LAbysbOhN8jR+7kG7fn4AMpXfSgP04GIudLtqhTgtYG/RR+XSzllVzlwq7Cz6sGovgoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeP44ALX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560891F000E9;
	Mon, 25 May 2026 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741646;
	bh=IIctj1fMQCxtevyVNN1XinFPp1Y3XkrmPmLfIrsISmo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KeP44ALXyWTA1ZcjtMfAy+eBZpjKI4TZ1sxHSz+NsfhyLdvOUn4rNF0SbXhE2NOGX
	 ZBeILOjdq5jM35bMOvm18Rbb6AtVwzsW02T/KBWBusPfHjPeravq17EIIqIekT7UMR
	 WThN+hpJzH9xwSJh9BOvnHpB0eKEik0xJ8NcaItJXnV15dvM8uO+oppfZ3hFCDhzI/
	 tzR1qTJJtzz8TRUetzq3MVVNhcXvgDV/f95Dt4KpCaKE/DbUhVQVmQH9ejbFnzw0ar
	 um/UyPndqbh1PEvC+K0E2MRvdleCQuwTMFTqM7Of1MrmMF1dgBcXO+Sq+g85/i3kec
	 83GKHVQmYeHtw==
Date: Mon, 25 May 2026 13:40:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>, Paul Barker
 <paul@pbarker.dev>, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 13/14] net: renesas: rswitch: add handler
 for FDB notification
Message-ID: <20260525134045.2be8143f@kernel.org>
In-Reply-To: <20260522-rswitch_add_vlans-v5-13-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
	<20260522-rswitch_add_vlans-v5-13-53589d944a9f@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33098-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 42A935CEB4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 14:12:42 +0200 Michael Dege wrote:
> The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
> to the GWCA and adds a static rule to the MAC table.
> The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

drivers/net/ethernet/renesas/rswitch_l2.c:395:25: warning: variable 'rdev' set but not used [-Wunused-but-set-variable]
  395 |         struct rswitch_device *rdev;
      |                                ^

I'm going to send out the AI reviews, too, FWIW. 
Not sure if any of the comments are valid.
-- 
pw-bot: cr

