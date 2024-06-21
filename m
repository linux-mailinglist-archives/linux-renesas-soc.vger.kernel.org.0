Return-Path: <linux-renesas-soc+bounces-6620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE59123B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B6B2B266EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3209117622A;
	Fri, 21 Jun 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzFk2nLb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908617334D;
	Fri, 21 Jun 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969431; cv=none; b=G8sz1O8Umjlwp34zOQ51cr+/WjgSiVffTEjBQiSQcwIIXbdjKE6O7MnM7zR2cHGPyiGVHtMtvqJ+ialzJfV5tSatywDh+611hPEA+/e1j1TIp5ck4oYQWXE+Qecx9ArInoaITqIiIKExwEY5smkGNrqcI6f9lWTntL4VfxJaU4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969431; c=relaxed/simple;
	bh=FO4/dxAKydbdqDeemb4ezHvY8sH16n9WUcoY8tuP6qo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kipew2Rb4utYkdYsuGZG2fKIbWZJ6vpyouLXIstG/ZdVWK2TopaDpDe0EBcpFa4/hmbY3wmsfU39UO5gQu930Si6qmhAsgr6S5WuvWkHtoC8PxbZh06ISy5J/FOU/wB7IsWiwp/JpErGBdWXPJeov6PfmWmhjfsjx7iCM6qgL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzFk2nLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A08BC2BBFC;
	Fri, 21 Jun 2024 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718969430;
	bh=FO4/dxAKydbdqDeemb4ezHvY8sH16n9WUcoY8tuP6qo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hzFk2nLbwmRD7zavmhKfSdQ8R/3n3qtRBX+Wgen5uzmhURUyHbwRpmBjtI0rCgvZT
	 sphzCyuIPMvfFjgIIdNpeCBEghVU5iKttVYkzNu4Q+1KwjawjXSnfadGA3eTBMJ9Qx
	 VYgoaloDgFPf826Y4Dh2UIpbrRHVyoAKyV4dxk5ZKCVoNa+nU389U9aBvQ5j9nqaKr
	 ConhM5O5r32ZvazUuPwLifDuFX/l2Kn9yhbvWWWjUzL04J1XXAwzxBP55NNmhx7EBO
	 X3wsrXTwzDIxjlUR4YYpEB5lelidcdK/+M2yIFGLgwr8N/XpHCFiJlxCXGB/TByUSO
	 jFSpOASRMHdTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6952EC4332D;
	Fri, 21 Jun 2024 11:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next,v10] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171896943042.2605.16261464240413345553.git-patchwork-notify@kernel.org>
Date: Fri, 21 Jun 2024 11:30:30 +0000
References: <20240620182219.2654517-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240620182219.2654517-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: yoshihiro.shimoda.uh@renesas.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 20 Jun 2024 20:22:19 +0200 you wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
> 
> The driver supports Rx checksum and offload and hardware timestamps.
> 
> [...]

Here is the summary with links:
  - [net-next,v10] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
    https://git.kernel.org/netdev/net-next/c/b0d3969d2b4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



