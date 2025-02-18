Return-Path: <linux-renesas-soc+bounces-13292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2985A3A053
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0070017794A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A487226A0CD;
	Tue, 18 Feb 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GY9/ggAn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD02EAE6;
	Tue, 18 Feb 2025 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889601; cv=none; b=jIQGJqcnOPvcSwgZq2jIJVYU9FbwjLTySb64mkYCbIBSb5NbBi0iZFU5+SZ0T8sFndPirq4RlDKGc8E9Grfvyg7H1CGbVzyOOEtbdYcTtewLbx8neGsp81whATpeVLcTbpZ/wFir/Js0cDNXEuvgeuvcf7SwsnupzAKL3VpkQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889601; c=relaxed/simple;
	bh=l5nTSB7lblqeVaAbGAXfqruUCSQEjQUjzok/W2tTmrg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Cg6hR2Yzyc8r8hh0M1C7aPQ+h1dMPzzgEGKjL9qthzjVZ9bU6gUc+sHynNEyRx/qyvVBlim4DFUfHBY0eKKC5ZrOL6DCj5OuEXAx0nx/uOrll/uYkpGWp1A2R2XqqoqUdKsyGCWT32fjNSqlAMflizULB1aqD3xkT+A9cuF7MbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GY9/ggAn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E958FC4CEE8;
	Tue, 18 Feb 2025 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739889601;
	bh=l5nTSB7lblqeVaAbGAXfqruUCSQEjQUjzok/W2tTmrg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GY9/ggAnpH8ZBp+F/EP3NSUBYOpgyjyhsBsMrba/OizvlhboGK/EJyxglQ0Einzny
	 NkX9Lt4t9Tqy01cSa9lJRTsxu5hCy7Dgb7uLU8CowJ37jVUnOOXxdQMh8G3ICXh9rT
	 2+rudTsAry30cWwBK0fn3SHdSnkVQiOtG8i+zWexBpJ4mMdEMzAioV7vm6Th66VsKL
	 YSjw/2u2QZHz+9aN3l9l7s5wy8QYqT/8o2tABys6DRlNC1ADs1oOZjcvr9hNF/SpkV
	 15zLxEm2xs7injkZJ4R0WWM5HVoXiUllgy6iJxmaqDZ2kdD3ukc9a3ZwBpDV6rvZwu
	 H1Cr8WYzZN9uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7138F380AAE9;
	Tue, 18 Feb 2025 14:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure for
 mv88q211x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173988963128.4107754.507613354421997026.git-patchwork-notify@kernel.org>
Date: Tue, 18 Feb 2025 14:40:31 +0000
References: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
To: =?utf-8?q?Niklas_S=C3=B6derlund_=3Cniklas=2Esoderlund+renesas=40ragnatech=2E?=@codeaurora.org,
	=?utf-8?q?se=3E?=@codeaurora.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 eichest@gmail.com, dima.fedrau@gmail.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 14 Feb 2025 18:46:50 +0100 you wrote:
> When adding LED support for mv88q222x devices the PHY private data
> structure was added to the mv88q211x code path, the data structure is
> however only allocated during mv88q222x probe. This results in a nullptr
> deference for mv88q2110 devices.
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
> 	Mem abort info:
> 	  ESR = 0x0000000096000004
> 	  EC = 0x25: DABT (current EL), IL = 32 bits
> 	  SET = 0, FnV = 0
> 	  EA = 0, S1PTW = 0
> 	  FSC = 0x04: level 0 translation fault
> 	Data abort info:
> 	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> 	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> 	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> 	[0000000000000001] user address but active_mm is swapper
> 	Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> 	CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc1-arm64-renesas-00342-ga3783dbf2574 #7
> 	Hardware name: Renesas White Hawk Single board based on r8a779g2 (DT)
> 	pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> 	pc : mv88q2xxx_config_init+0x28/0x84
> 	lr : mv88q2110_config_init+0x98/0xb0
> 	sp : ffff8000823eb9d0
> 	x29: ffff8000823eb9d0 x28: ffff000440942000 x27: ffff80008144e400
> 	x26: 0000000000001002 x25: 0000000000000000 x24: 0000000000000000
> 	x23: 0000000000000009 x22: ffff8000810534f0 x21: ffff800081053550
> 	x20: 0000000000000000 x19: ffff0004437d6800 x18: 0000000000000018
> 	x17: 00000000000961c8 x16: ffff0006bef75ec0 x15: 0000000000000001
> 	x14: 0000000000000001 x13: ffff000440218080 x12: 071c71c71c71c71c
> 	x11: ffff000440218080 x10: 0000000000001420 x9 : ffff8000823eb770
> 	x8 : ffff8000823eb650 x7 : ffff8000823eb750 x6 : ffff8000823eb710
> 	x5 : 0000000000000000 x4 : 0000000000000800 x3 : 0000000000000001
> 	x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0004437d6800
> 	Call trace:
> 	 mv88q2xxx_config_init+0x28/0x84 (P)
> 	 mv88q2110_config_init+0x98/0xb0
> 	 phy_init_hw+0x64/0x9c
> 	 phy_attach_direct+0x118/0x320
> 	 phy_connect_direct+0x24/0x80
> 	 of_phy_connect+0x5c/0xa0
> 	 rtsn_open+0x5bc/0x78c
> 	 __dev_open+0xf8/0x1fc
> 	 __dev_change_flags+0x198/0x220
> 	 dev_change_flags+0x20/0x64
> 	 ip_auto_config+0x270/0xefc
> 	 do_one_initcall+0xe4/0x22c
> 	 kernel_init_freeable+0x2a8/0x308
> 	 kernel_init+0x20/0x130
> 	 ret_from_fork+0x10/0x20
> 	Code: b907e404 f9432814 3100083f 540000e3 (39400680)
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: marvell-88q2xxx: Init PHY private structure for mv88q211x
    https://git.kernel.org/netdev/net-next/c/4991b88c2514

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



