Return-Path: <linux-renesas-soc+bounces-24432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F5C49DF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 01:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49750188E7DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 00:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3C3217659;
	Tue, 11 Nov 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5JWQ4cE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB921420B;
	Tue, 11 Nov 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821044; cv=none; b=pJ6jpYdPNN6xMT0WVV0NoTRMhZ9Yp88T6LNbQuisRba0Pv2d+fMpnUqy9hpOjJmz/rSkx35KDVNNfFRZMSfHgn+MXsw/eqi/4o2lmOewbcR0uoU6D4jNPiQnrmHWmdjmmc38ak2iPhvb2bGhfKPlM5wR65/nsh1sn4o0rOyr/0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821044; c=relaxed/simple;
	bh=dQNH4pDIvYSWhlnPFdYmgqAtaeCw79/2BnOpeFqekn4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n95m2aD+YY7hFhp1ehap3t7PCmiZB6pFyKLfpglMRCLGwJmBI5XiGWbDz29ua5MEXyhWSmpKdhA0YHQQLi5XNX/nGVvpMRbswrFjZe3xkjl+GUzhajBps4Q5O6K5CwoQy50p6kcjAR6WvvzS6S1wD8qBLcOgmg17GtJY98sM7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5JWQ4cE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692B5C4CEF5;
	Tue, 11 Nov 2025 00:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762821044;
	bh=dQNH4pDIvYSWhlnPFdYmgqAtaeCw79/2BnOpeFqekn4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C5JWQ4cEYP651VAeeTxrm1e47fUgXkpGMftqHxhCCNMYcTmIuVKdqpIlgKoZjFm6M
	 YtZd5QUhSrnTIO/xJgxhX03q0j95q/8eDOsu9w3cuscln7nXrvrJy/lpdpBmAq/HY+
	 ESvD/YXHVjXhcP8Yj1oBh8WtOnq8d2V/eKBDKiMhuoUto3reCfx882Q6Qd9Ly8C5qZ
	 4zVbRcRV174wEtckhb6AzH87yTvn3w6yFJVC1Ik4nvIDdJaAY+PYwY1ck3Zs1W5+Jx
	 RLxtKAMUxG5rGAMWr+3D00qiBWFyVQ1a90uxpcgyhsLOswJURtr/Kd4cAYiL88RFuh
	 h2FHYWcDsq4hQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFF380CFD7;
	Tue, 11 Nov 2025 00:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ravb: Correct bad check of timestamp control flags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176282101482.2823873.11360443800881793172.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 00:30:14 +0000
References: <20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: horms@kernel.org, paul@pbarker.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  7 Nov 2025 21:01:00 +0100 you wrote:
> When converting the Renesas network drivers to use flags from enum
> hwtstamp_rx_filters to control when to timestamp packages instead of a
> driver specific schema with bit-wise flags an error was made.
> 
> The bit-wise driver specific flags correct logic to set get_ts was:
> 
>   q: RAVB_BE + tstamp_rx_ctrl: 0 => 0
>   q: RAVB_NC + tstamp_rx_ctrl: 0 => 0
>   q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 0
>   q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_V2_L2_EVENT => 1
>   q: RAVB_BE + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1
>   q: RAVB_NC + tstamp_rx_ctrl: RAVB_RXTSTAMP_TYPE_ALL => 1
> 
> [...]

Here is the summary with links:
  - net: ravb: Correct bad check of timestamp control flags
    https://git.kernel.org/netdev/net-next/c/38f073a71e85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



