Return-Path: <linux-renesas-soc+bounces-384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269E7FCDB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 05:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DDFF28213E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Nov 2023 04:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6E163AF;
	Wed, 29 Nov 2023 04:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sh8+1BAl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB41A29;
	Wed, 29 Nov 2023 04:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A1AAC433C9;
	Wed, 29 Nov 2023 04:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701231024;
	bh=nTHb6DWmDp9JR4REbDZ4ARI+QcY0azvescbmfD2WdzQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sh8+1BAlA3XIl9qkN5fMf3bTqBMOp0Pj/55hNwS2J1LRVcqLabfQxPiTXWEEQHzQF
	 m/UzBWxdLSkPPEWVvou/QINA0P/U83gZ1L3G5QOxWMZFVP59TYbBB4QLEqahBnJvkM
	 JhjOKrMDPst+cK/r8gCZdmEnA2ix+Dz7P9Wud0D6iM4kfEeXK31w0PcDeA0at27Zfa
	 hcki/41mDXjsHvetZu4D33RYecLycaBZq25w87+2m9vlp99+IKM8etILRrt0lhN/lU
	 x7X5su+6mBgf5jfzgqW6kjGioihaH0WMr8C/8n7DLRqVtrBmdYW9di28/sHisYIS6R
	 BT9zgxgQfww3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0146BDFAA89;
	Wed, 29 Nov 2023 04:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] ravb: Fix races between ravb_tx_timeout_work() and net
 related ops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170123102400.3535.2157176764560319442.git-patchwork-notify@kernel.org>
Date: Wed, 29 Nov 2023 04:10:24 +0000
References: <20231127122420.3706751-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20231127122420.3706751-1-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 27 Nov 2023 21:24:20 +0900 you wrote:
> Fix races between ravb_tx_timeout_work() and functions of net_device_ops
> and ethtool_ops by using rtnl_trylock() and rtnl_unlock(). Note that
> since ravb_close() is under the rtnl lock and calls cancel_work_sync(),
> ravb_tx_timeout_work() should calls rtnl_trylock(). Otherwise, a deadlock
> may happen in ravb_tx_timeout_work() like below:
> 
> CPU0			CPU1
> 			ravb_tx_timeout()
> 			schedule_work()
> ...
> __dev_close_many()
> // Under rtnl lock
> ravb_close()
> cancel_work_sync()
> // Waiting
> 			ravb_tx_timeout_work()
> 			rtnl_lock()
> 			// This is possible to cause a deadlock
> 
> [...]

Here is the summary with links:
  - [net,v4] ravb: Fix races between ravb_tx_timeout_work() and net related ops
    https://git.kernel.org/netdev/net/c/9870257a0a33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



