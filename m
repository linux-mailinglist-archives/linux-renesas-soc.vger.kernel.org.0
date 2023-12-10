Return-Path: <linux-renesas-soc+bounces-875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A043A80BCC3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 20:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A00A280C86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 19:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686A1C2B5;
	Sun, 10 Dec 2023 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrIzYwhI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAB1C29A;
	Sun, 10 Dec 2023 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29537C433C9;
	Sun, 10 Dec 2023 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702237226;
	bh=YgF9ROEN1Nze2v7u2x3i8aMWf38cmiNWT54E7R8vwzk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IrIzYwhIk4M4SpGHt5RqP2JVva0ZiBfIuv9tZ2xNtb7fndbIz4goQZPwNkZg7jFxi
	 ZBnE0oNKVrQqzFFJq67hZytq+8cQCsztHRK0HsEzZU3ieck3atmF2vgTwwJv/ZJcWA
	 jY5JqKBP9A9T+iKtgj2U8SMXiINEdVM3p0kff6VOUlP3ZZU/CH7eEdLojbl4tg+2QT
	 rc2NyoxQcV1ZCiY48yqwyMtz2VQe/Ma/pLPP6sDpYQtfq/3O9Mffc0ZMdNiYC6RRp6
	 kra+S1EFMqaglfBPxxs73nibnzXNGg3tOqGzfoXPChjJV0RbCSgaVQgTXslXCNVKKs
	 O8h0wdXidEKcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 116A2C595CE;
	Sun, 10 Dec 2023 19:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/9] net: rswitch: Add jumbo frames support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170223722606.14740.8136418854142677445.git-patchwork-notify@kernel.org>
Date: Sun, 10 Dec 2023 19:40:26 +0000
References: <20231208041030.2497657-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231208041030.2497657-1-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri,  8 Dec 2023 13:10:21 +0900 you wrote:
> This patch series is based on the latest net-next.git / main branch.
> 
> Changes from v4:
> https://lore.kernel.org/all/20231207081246.1557582-1-yoshihiro.shimoda.uh@renesas.com/
>  - Based on the latest net-next.git / main branch.
>  - Drop unnecessary change of Makefile in the patch 2/9.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/9] net: rswitch: Drop unused argument/return value
    https://git.kernel.org/netdev/net-next/c/c7e0022390d4
  - [net-next,v5,2/9] net: rswitch: Use unsigned int for desc related array index
    https://git.kernel.org/netdev/net-next/c/885703418453
  - [net-next,v5,3/9] net: rswitch: Use build_skb() for RX
    https://git.kernel.org/netdev/net-next/c/6a203cb5165d
  - [net-next,v5,4/9] net: rswitch: Add unmap_addrs instead of dma address in each desc
    https://git.kernel.org/netdev/net-next/c/271e015b9153
  - [net-next,v5,5/9] net: rswitch: Add a setting ext descriptor function
    https://git.kernel.org/netdev/net-next/c/fcff581ee430
  - [net-next,v5,6/9] net: rswitch: Set GWMDNC register
    https://git.kernel.org/netdev/net-next/c/9c90316a1170
  - [net-next,v5,7/9] net: rswitch: Add jumbo frames handling for RX
    https://git.kernel.org/netdev/net-next/c/933416cc59b1
  - [net-next,v5,8/9] net: rswitch: Add jumbo frames handling for TX
    https://git.kernel.org/netdev/net-next/c/d2c96b9d5f83
  - [net-next,v5,9/9] net: rswitch: Allow jumbo frames
    https://git.kernel.org/netdev/net-next/c/c71517fe7353

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



