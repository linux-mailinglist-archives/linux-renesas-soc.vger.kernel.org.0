Return-Path: <linux-renesas-soc+bounces-29170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAMzN0vWsGnLngIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 03:41:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8625B0A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 03:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7818D3072A53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 02:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6B336C5BB;
	Wed, 11 Mar 2026 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubgT5aG/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F080A365A1D;
	Wed, 11 Mar 2026 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196828; cv=none; b=MwuNx1KHyeJkYroUIQ8zlXOEW8qJZpCYmDl4BFlEZGT1YOpixQ30sqXKHJi1C0CzBluAzdzXwJ0AYmTunEfv6lgEREEoY6exqprEUxlku/794CBcBXU68xeE99v9sa/5g+itzWDj0fWenrbCNHD6Idwww2tz2XKWvwWvnqXxkpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196828; c=relaxed/simple;
	bh=0W1/uqeN7s+y4BrnCTgH2t3SrW+mHp4U/yK6807QK9o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XF1TZfd7fE8sLGZiv/iHVWfwgWJ0uflUFPC+kQtgfndceUnMOlyIqCvw6MhMiW7IpDIAyvNmQdv+TmXnwWArpqbkr3HBKN3XQpCzhFtaP+G8qpHtDr+4hoy7Jf8d7vL18i2+aejAY1xmqvHqMMTCdRU59vMS7gCTv/fEHBLyFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubgT5aG/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA31C2BCB1;
	Wed, 11 Mar 2026 02:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773196827;
	bh=0W1/uqeN7s+y4BrnCTgH2t3SrW+mHp4U/yK6807QK9o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ubgT5aG/he785w1wUzxTeTMduoldInc4R/nlPXMRvVg3tDdMQd7UWN7K8Jq5pUurr
	 pNCU6lNeH0Axb6K2iY40YKnfzoKAIHY9k34STmLiVMFlGobD51xJOe8OEBeKrw0W7Q
	 7Baw1FJlQyby8K0CeGeCq6CF+ps/ObfvA5KuGp6ZHJSoLZOMxFK+rkJX0AkvylctMz
	 i/sAjCcN4pankl8Nzb7JGlzkvOXjRAP7rL2XkaSMnGVMEr0Vji4CcKFjKZRAoJZKNU
	 pnB+k48KSGVNth18zgfOFhC3oduGEhBI9vPcjgM8WVw5BwZrCqfpzg71SHmz+ZPdwG
	 hxKvEmHXi9EDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE953808200;
	Wed, 11 Mar 2026 02:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v2] net: ethernet: ravb: Disable interrupts when
 closing
 device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177319682429.3014711.13529379862945821912.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 02:40:24 +0000
References: <20260307095532.2118495-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260307095532.2118495-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: yoshihiro.shimoda.uh@renesas.com, paul@pbarker.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: 51E8625B0A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29170-lists,linux-renesas-soc=lfdr.de,netdevbpf];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas=40ragnatech=2E?=,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  7 Mar 2026 10:55:32 +0100 you wrote:
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Disable E-MAC interrupts when closing the device.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [Niklas: Rebase from BSP and reword commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ethernet: ravb: Disable interrupts when closing device
    https://git.kernel.org/netdev/net-next/c/9278b888920e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



