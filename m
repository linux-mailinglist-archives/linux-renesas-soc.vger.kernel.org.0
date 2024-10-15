Return-Path: <linux-renesas-soc+bounces-9774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60899F4DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CF8284719
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 18:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22041F76D9;
	Tue, 15 Oct 2024 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0RME2tT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6F18593A;
	Tue, 15 Oct 2024 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015824; cv=none; b=hE7IyVfpZb+6JzTq36XMMIOx4whuBQECe1t/bKpWrL/tFWBqN5uxzvTXDWvXUB4680uSzxkzYfvBwzIzob+7Ilu25NhypPsUMCPyu+a8mbH1MPXInStKkt/EJHotWBw07mo6/HzzN6phddHrTLSLhSsZRpGeJ8rRt5jmSM7TVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015824; c=relaxed/simple;
	bh=8n0g7xDrffXq9sq54MzDkr7YlpOg+702dVyJy8oxCPs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aAQ1qf5l/GAEiW4xxmktY6duUDGa0VMGG3Qzldfd/oFaAhwNBSogymrF/FfTtuSM5Qwi2F6wFTjXBLMKs9vb7kCGlcjmpDbFry2whtGHSIzsQDFAMiCqLtG/DSsb4NaPz8H7LEQEne/PsViGBHhhmerOuDV0CFTt59NRDrDdo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0RME2tT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44196C4CEC6;
	Tue, 15 Oct 2024 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729015824;
	bh=8n0g7xDrffXq9sq54MzDkr7YlpOg+702dVyJy8oxCPs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m0RME2tTT7QpbcsOAHhoavBfK71lyAY6Dd3G4A71l4ytE+AiFCfn0qS+2DKnX8KGZ
	 o9wAwAxyysCrX0jpZQTCl+0rkjCG8lrxmrpJCEMFFexN58FQFlPvCEUmQ0blFXxLmG
	 1+3B5YJ0gJRsqcNRVVcKaxiFjtJwCNRmFjhyNwH6h3RlqHd3i0QZD+wXjklpNReMKg
	 iGoCtz///UYbaIUNwsbUeUfpV1tA0JudSnMLlSq4xfu5zFCd3IAZpNAfEm0S71Ro+0
	 937SwlDrF4ZqhhPhM7dhSeYXleYkhumIMTUeuTKLYE6Uxy9GNi/1XbzT0xuHROA+Gm
	 sDSHWHVabgSnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFBE3809A8A;
	Tue, 15 Oct 2024 18:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: rtsn: fix potential memory leak in
 rtsn_start_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172901582951.1246543.13502444267104564379.git-patchwork-notify@kernel.org>
Date: Tue, 15 Oct 2024 18:10:29 +0000
References: <20241014144250.38802-1-wanghai38@huawei.com>
In-Reply-To: <20241014144250.38802-1-wanghai38@huawei.com>
To: Wang Hai <wanghai38@huawei.com>
Cc: niklas.soderlund@ragnatech.se, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch, zhangxiaoxu5@huawei.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 14 Oct 2024 22:42:50 +0800 you wrote:
> The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
> in case of skb->len being too long, add dev_kfree_skb_any() to fix it.
> 
> Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
    https://git.kernel.org/netdev/net/c/c186b7a7f238

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



