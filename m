Return-Path: <linux-renesas-soc+bounces-30890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCZtFjxL0Glo5wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Apr 2026 01:20:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F78399079
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Apr 2026 01:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9F18301A175
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 23:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC55D38A29A;
	Fri,  3 Apr 2026 23:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIW+IZEO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862C346A0A;
	Fri,  3 Apr 2026 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775258424; cv=none; b=OodDYhyGZ19AC2kSAY7sWpEt2Hkurq3dhtoeIDcuVzgUbFc/yaW50vHOQ2yiDzopgQC4J5rVvF+xH0Ln5mEY1kX4f3WqcTWqSUi3GwiW44CgOmKcFDt2KYmZH3skK6H71Medz9ja1/NYeCTvG59uRKgQPCAYiaxkhAYqnrEB/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775258424; c=relaxed/simple;
	bh=QkerLX1Rpx3AOOaOSFFMyjww6gQrB4azilYIG48kvIA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TtctbfqCOwtfLsDyvMZ+TOzrX5s07touRKfk1Y+XZkqDCAKLPTaowTY5mKBdP9J6mxv71zTZwnlt8laNzKV0iq8vxxj8vuoyrzy53uCGNJ4Z3YNpSFeDjtxSpbqzDpizhPSzjMK1fmQxNdwi0PiKE31siPJ9tjeDZMXn3q6134U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIW+IZEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09F0C4CEF7;
	Fri,  3 Apr 2026 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775258423;
	bh=QkerLX1Rpx3AOOaOSFFMyjww6gQrB4azilYIG48kvIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIW+IZEO058x/ms+kWJzEszSH9gEt3CFdHr2GpLeoOPomuDgOC7FzmOF+5L4K871E
	 jvsQxAPyEP7jIiVXJv/Aq8O+9BXfQ6niNwv2jAOKY4dj23CDMC028IX3pR+1AYx3E8
	 CJJDalWlzgDTF2QeEqlq6LWiXb4nE37SSvKegd7OFLiF3ZsDIUssI10NDu/yAVx27L
	 cmzbRMRjjQjQ2c+3Olocm+tVkTx4pHHTavNwxxlW/f+3gyK8mh3HVPCwjtlnyxBQUJ
	 Y4rUkV3vBo+APsi42AEBZAOA9vXfRzTaDdPWUrIo8PgHwgI7TB25w+MYSIIGM2mD3L
	 p3knegwFkhDuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDA23809A14;
	Fri,  3 Apr 2026 23:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] net: ethernet: ravb: Suspend and resume the
 transmission
 flow
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177525840529.1487571.3313008006044854673.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 23:20:05 +0000
References: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: paul@pbarker.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 yoshihiro.shimoda.uh@renesas.com
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	NEURAL_SPAM(0.00)[0.979];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30890-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas=40ragnatech=2E?=,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C7F78399079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  1 Apr 2026 20:36:08 +0200 you wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> The current driver does not follow the latest datasheet and does not
> suspend the flow when stopping DMA and resume it when starting. Update
> the driver to do so.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [Niklas: Rebase from BSP and reword commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: ravb: Suspend and resume the transmission flow
    https://git.kernel.org/netdev/net-next/c/353d8e7989b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



