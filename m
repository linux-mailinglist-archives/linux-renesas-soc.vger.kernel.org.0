Return-Path: <linux-renesas-soc+bounces-27866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFEiMx/CgmkpaAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 04:50:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 470D8E1600
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 04:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 222F730F3BC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 03:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2171D2E54BD;
	Wed,  4 Feb 2026 03:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T89LGF1f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295C2E3360;
	Wed,  4 Feb 2026 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177025; cv=none; b=HJwAQ6+h8oEV3+B7QDu2noux71Zh0M0IqAPDflHj7Cu0/lkj3PT1lrrdCVNEh6ZKCstqvpd/2C8L5m6Zo4jwuRyZvzPiLI+g0WFW4nvvQ070shBnH5wgQ45Ck+FM+BhS10aTxGNAqvaeov+UpK0Isq5YSBW5GRoQK6PRXac2DkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177025; c=relaxed/simple;
	bh=PmfXVzHumuHroAZxFJVALxzyJwaUMqCFjJNETsTwo0w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Su2rr2zdZHYP5PtcD0OvWsy+Y3LRkw+AhzeSyct8YSdAdaEEYo35Zajkl4Xyc8g1dDfW35qc2W1HHo2ltD7WgNW5AMt+8UwQCvQVpr1NesnFdM2lUFQ03yOCl1aUTJkc4Tm73NCF2c6lf7VWj6952SeAkYnreexxQJZ4vzJVnnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T89LGF1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF047C116C6;
	Wed,  4 Feb 2026 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770177024;
	bh=PmfXVzHumuHroAZxFJVALxzyJwaUMqCFjJNETsTwo0w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T89LGF1fMbK/hQJPrTF5Cidx7pfA6NjyCDQ7c8k3PXB/TLD6rhDsc/A4pMxexqZl6
	 pshvTseWROu0GKev7jXgT20iJw6MtUxdAIOITYxzcmjaCqFtnMK6OpuziN4ORFpD9Z
	 LiZfBiZ5S2S1Dx6ytWRS0Zvxn7hzj3EscNwQJ2hOnjYqYIToMPpnUHxHgcARVhZ+Vf
	 LgU/0Zk2blDlk7ul6KUP2zH5bwQwQ+SJcxoo7kxMzguDxmswKRdlgtmRU1y9qY/925
	 PTq0MoxkaJpoaDfMjKGGRFY4SUD+MI7/II5MxGyb0QqXH9S1D9DIebRMOaO/gqzMru
	 CEBdvu0V/iOdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 16DEE3808200;
	Wed,  4 Feb 2026 03:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next 0/4] net: ethernet: renesas: rcar_gen4_ptp: Hide
 private
 data
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177017702087.2171580.13124762758120229117.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 03:50:20 +0000
References: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com,vger.kernel.org];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	NEURAL_SPAM(0.00)[0.974];
	TAGGED_FROM(0.00)[bounces-27866-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas=40ragnatech=2E?=,netdev,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 470D8E1600
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun,  1 Feb 2026 19:37:41 +0100 you wrote:
> Hello,
> 
> The R-Car Gen4 PTP module started out as an exclusive feature of a
> single driver, but have since been extended to cover both R-Car Switch
> and TSN driver implementations on Gen4.
> 
> The feature have already been extended to be built as its own module
> with an interface exposed thru a local header file. The header file
> however also exposes the modules private data structure. The two
> existing users have already started to poke at members of the struct.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: ethernet: renesas: rcar_gen4_ptp: Move address assignment
    https://git.kernel.org/netdev/net-next/c/642377346a4e
  - [net-next,2/4] net: ethernet: renesas: rcar_gen4_ptp: Add helper to get clock index
    https://git.kernel.org/netdev/net-next/c/9afe65e7e7d7
  - [net-next,3/4] net: ethernet: renesas: rcar_gen4_ptp: Add helper to read time
    https://git.kernel.org/netdev/net-next/c/5640afa0583d
  - [net-next,4/4] net: ethernet: renesas: rcar_gen4_ptp: Hide private data from users
    https://git.kernel.org/netdev/net-next/c/9c2f568eb236

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



