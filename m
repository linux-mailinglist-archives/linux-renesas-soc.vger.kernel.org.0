Return-Path: <linux-renesas-soc+bounces-223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C67F6A5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 03:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A90101C2098C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 02:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E61658;
	Fri, 24 Nov 2023 02:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kseKtNN4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED364F;
	Fri, 24 Nov 2023 02:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5817EC433C8;
	Fri, 24 Nov 2023 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700791228;
	bh=zCLwjlfraemaJl3RDTrYejmiHNAo/kGrRDOfxT5KnVg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kseKtNN4zTiaQ4RcqlasQdG8OPdJCSawu33VRaoMb8SQw/jA0QOh2bUADrjcHTnpV
	 zMQkqLsHxGMzDfRBIK3qvWs+wc+d63J2br1e0QbYoGK2+coTONLY3UahOgT9pCYJoj
	 qXOrUiNhxXMLNehC9km0egPdoWXUyduHE9GHoHX+VRIk1VglrV4FH/s8OytLPXM7IG
	 ijuyD7dZEbTU1qKC/L186m9ce5QnkmvdV4z11Jn7Mqz4GAVnnJqNseIPlueUaMNDJh
	 BVk2Wzunk0jBKiHCroqWiEDucE6TrJ9IqE6rux89x3X6/R7M9lQ0Od/MrSvmbjQguQ
	 tUOfI6WFfQoNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3FC61C595D0;
	Fri, 24 Nov 2023 02:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/3] net: rswitch: Fix issues in rswitch_start_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170079122825.7507.381822979329425043.git-patchwork-notify@kernel.org>
Date: Fri, 24 Nov 2023 02:00:28 +0000
References: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 22 Nov 2023 14:11:40 +0900 you wrote:
> This patch series is based on the latest net.git / main branch.
> 
> Changes from v2:
> https://lore.kernel.org/all/20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com/
> - Keep reverse christmas tree of local variable declarations in patch 1/3.
> 
> Changes from v1:
> https://lore.kernel.org/all/20231121055255.3627949-1-yoshihiro.shimoda.uh@renesas.com/
> - Separate a patch because fixing 2 issues.
> - Add fixing wrong type of return value.
> - Use goto for improving code readability.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] net: rswitch: Fix type of ret in rswitch_start_xmit()
    https://git.kernel.org/netdev/net/c/109b25d13e00
  - [net,v3,2/3] net: rswitch: Fix return value in rswitch_start_xmit()
    https://git.kernel.org/netdev/net/c/1aaef8634a20
  - [net,v3,3/3] net: rswitch: Fix missing dev_kfree_skb_any() in error path
    https://git.kernel.org/netdev/net/c/782486af9b5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



