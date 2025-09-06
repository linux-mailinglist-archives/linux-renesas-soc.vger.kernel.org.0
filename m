Return-Path: <linux-renesas-soc+bounces-21534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507FB46825
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Sep 2025 03:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 314AB7BA667
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Sep 2025 01:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4082E196C7C;
	Sat,  6 Sep 2025 01:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD0Hr3SL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2517B425;
	Sat,  6 Sep 2025 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757123407; cv=none; b=Rc3M5b98wJ53ykdLaHL98hnI10/KcYQ0M+HMMyM07g4h9b36YPifwgKLwSw2VuXPPRoNUCgo5Sgy0el98mnfGSTUe1r/yxbhXuLJ+YqkyTY8zOXxcJqQzgjXJYqhREVvoUoHVl8BH4Z95REcokVa5GX6sW/R98u8ji2TInXNhv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757123407; c=relaxed/simple;
	bh=fYiTdSD4kxkoNV6CEXTLw+kH68SZUecAyQ8SFE4MKeM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dsMt4Hm7N671Zwbph0Zjsull+aPpqzo7qSDjqOP4ewnPoJuRQum85vMxh+NZuaIE2cftqB7QvdMb8b9BmELJJcbzX1GrD+wVJQ+7euDYbIZJS5G+CK2U6OihJTjxk6ZezHbauvPLtOwfuE29f2qDG6ZMElNA6GC22NWDlqvj8n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD0Hr3SL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9551BC4CEF1;
	Sat,  6 Sep 2025 01:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757123406;
	bh=fYiTdSD4kxkoNV6CEXTLw+kH68SZUecAyQ8SFE4MKeM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aD0Hr3SLRBCy+bgiJdHFCaM2FS9ohr34EfObiogBCtHIxcBEXm2WuJ+qscs84uu1M
	 gWsa5pQBj1dhxphMMCO9xOSd4HcVf8eEBbEBCNx4sECGvvTyDDFQGo7+7VortNoH43
	 0nWUtHoFqR/AX8VZOFDBWBQDq1hiPytXIPNvNH3Xq4IjFyYfDoTPoqR1RB8uH6BN0S
	 +1i3x9z2hfm5H1WnMEIfJ2YfS5o4hlgmfu18bJ79gnlpiaVegTLjtVZ472Wm/aqnG1
	 weGj6VorxTAm3MWaWpclJuulXbVHWtCNKjhUhmwz3IE/Ng1dxFsydYzr2NFYjiZVXG
	 5pCqpjhf7g/ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE3383BF69;
	Sat,  6 Sep 2025 01:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] sh_eth: PM-related cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175712341100.2742584.3421281371078554809.git-patchwork-notify@kernel.org>
Date: Sat, 06 Sep 2025 01:50:11 +0000
References: <cover.1756998732.git.geert+renesas@glider.be>
In-Reply-To: <cover.1756998732.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: niklas.soderlund@ragnatech.se, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sh@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  4 Sep 2025 17:18:55 +0200 you wrote:
> Hi all,
> 
> This patch series contains various cleanups related to power management
> for the Renesas SH Ethernet driver, as used on Renesas SH, ARM32, and
> ARM64 platforms.
> 
> This has been tested on various SoCs (R-Mobile A1, RZ/A1H, RZ/A2M, R-Car
> H1, R-Car M2-W).
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] sh_eth: Remove dummy Runtime PM callbacks
    https://git.kernel.org/netdev/net-next/c/86e6257192c8
  - [net-next,2/3] sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
    https://git.kernel.org/netdev/net-next/c/3406114a303e
  - [net-next,3/3] sh_eth: Use async pm_runtime_put()
    https://git.kernel.org/netdev/net-next/c/ae52c3e846e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



