Return-Path: <linux-renesas-soc+bounces-11135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586BB9EA546
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 03:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0195285063
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 02:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB0C1A01C6;
	Tue, 10 Dec 2024 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yrl7qcLt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C8327456;
	Tue, 10 Dec 2024 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798430; cv=none; b=IRygsvyWZQIzNHPRwGTsAgSTd2RaOP0WXOx0NnTadCLyiGwFuP6gp0Lp6ftK68tMCJOJ/zYuAye27plSzImrwN7o5S70uN5TnwG3ZjfiZHsj4QEs89eiFHgVyEM6ZwPQiWLfzq7E1Fxb2P0Y/t33FteWJ6mg/4tj6UPp8ggm5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798430; c=relaxed/simple;
	bh=/pA2UJ9mYVtZJqRppOUf94YsfX3VuTsDRl0ahSBS4kw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JciSpQ7Ufb2HgJ/DGJsBhV4o2zUei94qzS0R8IOIKNj8G16sKjcraSEpngJqAEpES0dLrXPkOhCM12z6Uws52qybETm/Qxlv1mCyraN4ib8wbopjIehBaWoYFP3pStfUZV95DdTOdQz0N8WTajYBDgPBpvTkZp9LBPIw1oY5E4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yrl7qcLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F05C4CED1;
	Tue, 10 Dec 2024 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733798430;
	bh=/pA2UJ9mYVtZJqRppOUf94YsfX3VuTsDRl0ahSBS4kw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Yrl7qcLt+b8M7GXm7FzCtvOgcxXcPMhLctuzDswU2fNFVYxFaOt9qI+Un1a+NZyiW
	 aUVbJxBxTAGlfxmZtFplLQlShl5BMz2g8o85afxxdy7CZNWFRQaFqRKa/FONiFBhw9
	 yb1XCvFrk91kNyU/HQhLkUOsKgZt0P5m1L4gt1x8vcKDz8Ds0hWrvr4OprqPSGPQzJ
	 QCUR8NxjaGin/SJ3nHRTDRSR2jsHTQwZZIFkhXqtPIflTW1yhIlRJuL6u/5G3JAZNS
	 8vhRHTqOUjRYvWMojyt1nYCVlYl7ZGzR9DATFneFNXmrcL+hz4xZ5ukDtUnzks2t2K
	 fUwgpkkf4DpzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CD8380A95E;
	Tue, 10 Dec 2024 02:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: do not deinit disabled
 ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173379844599.320519.5448905413088938480.git-patchwork-notify@kernel.org>
Date: Tue, 10 Dec 2024 02:40:45 +0000
References: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241206192140.1714-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat,  7 Dec 2024 00:21:39 +0500 you wrote:
> In rswitch_ether_port_init_all(), only enabled ports are initialized.
> Then, rswitch_ether_port_deinit_all() shall also only deinitialize
> enabled ports.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next,1/2] net: renesas: rswitch: do not deinit disabled ports
    https://git.kernel.org/netdev/net-next/c/070927427d82
  - [net-next,2/2] net: renesas: rswitch: remove speed from gwca structure
    https://git.kernel.org/netdev/net-next/c/32fd46f5b69e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



