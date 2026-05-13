Return-Path: <linux-renesas-soc+bounces-32554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EHtBaD0A2rKBAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:48:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F252CF80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD5E3309AF91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88378395DAC;
	Wed, 13 May 2026 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2hbOrkC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D50395AE4;
	Wed, 13 May 2026 03:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778643964; cv=none; b=Yu6n9ixLryrA9O1Q3DYBptTaOGzOOuGBH3BbDJvQ6sZ1myGj/7mRVlVmQr5QTsl3DGrxynNZ9uXajO4oEQ0g5cCRXMj+6ePdrqZpmxJAx8Yp+C4n5ronDJh1PcR6YR/T7z+K6Nm4ipJsbAUK4z3HMFMHu4LPSD0Hmjp+LkyrG/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778643964; c=relaxed/simple;
	bh=iwtwg0g6hyT7GNIDDPMgW69C1jvC3HXCocMMVHFK76o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jr885Zv+80ryUUjnYv8efCbXTTg2ewuVA3B/pzKNfeqBSqKR0hW5EsczDaP0dFFXwrz+5UpHR1FnTxXXwdGU1lgXyRmWDAk59qeaKlTpd3MrBPeRRN4ujFtipArP2V4nci4hAZ2wgSpdxoo/zQk+aCAZT9b0Yulb1b6EjWYoOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2hbOrkC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08410C2BCC7;
	Wed, 13 May 2026 03:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643964;
	bh=iwtwg0g6hyT7GNIDDPMgW69C1jvC3HXCocMMVHFK76o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K2hbOrkCxC4Uq46crqI4VkH3Io9Jgy+l4NpFRcZ7br9bWdobreh3swqCOWMdx5wtx
	 P6qjarusi1uchn8MIeC3V713irQfEtyFtZub9b7BAxAiOnyPRgPs8UO4iWZk5fTG/q
	 3uhNfFn05Jh5moy/dvmA1YZJikSCAFmJyuew/RupOPmI6TK7sCTyJB5lSB070lJbzC
	 6HlfW8+TUzY6Q2TU2aqodG1A2XvYONtYI5HjYXcyM4eBgwViIVRwW3xS3+FcM4kSbV
	 SwfVWJXUlK0ZNzVRrCQhHkUrbzXJb7xdUAkQToie1y/TuVMrXzA7id0Z/VTwO4b5xa
	 ini4hDG6qznfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D513822D60;
	Wed, 13 May 2026 03:45:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [next-next,v2] net: ethernet: ravb: Do not check URAM suspension
 when
 WoL is active
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177864390954.3173643.3926693192494956634.git-patchwork-notify@kernel.org>
Date: Wed, 13 May 2026 03:45:09 +0000
References: <20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260510103017.613773-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: paul@pbarker.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com, geert@linux-m68k.org,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 saikrishnag@marvell.com, geert+renesas@glider.be
X-Rspamd-Queue-Id: 7E8F252CF80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.874];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32554-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas=40ragnatech=2E?=,netdev,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 10 May 2026 12:30:17 +0200 you wrote:
> When updating the driver to match latest datasheet to suspend access to
> URAM when suspending DMA transfers a corner-case was missed, URAM access
> will not be suspended if WoL is enabled. This lead to the error message
> (correctly) being triggered as URAM access is not suspended even tho
> it's requested as part of stopping DMA.
> 
> Avoid checking if URAM access is suspended and printing the error
> message if WoL is enabled when we suspend the system, as we know it will
> not be.
> 
> [...]

Here is the summary with links:
  - [next-next,v2] net: ethernet: ravb: Do not check URAM suspension when WoL is active
    https://git.kernel.org/netdev/net/c/f5b2772d1488

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



