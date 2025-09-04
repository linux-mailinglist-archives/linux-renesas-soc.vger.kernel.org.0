Return-Path: <linux-renesas-soc+bounces-21316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DDB43500
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 10:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50851BC2838
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 08:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E632BEC27;
	Thu,  4 Sep 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY5OWu4v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E382AE68;
	Thu,  4 Sep 2025 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973408; cv=none; b=ByF/02nGBAtlntujT5DY5x7XPatKsfWd02wO3qjk+14Je4XtVZAWoKnuW+u5Olqm2cSqZn4j1YTop57JNiOATTmJNsijlDU5/wpMSZUBYNrDUbEliNgWfrLO0edBpI3JwZBd32ntixUHu6YRwXmQIet059R/Y5cslGdSi+nFAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973408; c=relaxed/simple;
	bh=N0pMFl+FVaU2TYzc04EZv0vGw6J8lXA6WMCnQ79xkv0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BhcR+8pmA8wfJCOBlLxu55r30QTUpnMZcuwSksC4GPx8se2WsaHn5fkjHac58AKX52HhQJjxZchS5vrsVh15qwV7sUaQoL9OhtYouC7BgrVtNGuZSGa7zsg7qKBP2ZYKu2PliYTwkUllvHV2mcbW+7Q5pdGuIVazFa8DLU/bSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY5OWu4v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511BEC4CEF1;
	Thu,  4 Sep 2025 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756973407;
	bh=N0pMFl+FVaU2TYzc04EZv0vGw6J8lXA6WMCnQ79xkv0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WY5OWu4vVwWJRlhRpjyQ2HTNSxsXj3jzbobGTvgsbx8bo8ak/YBbykp9i9sSl6dnI
	 loClSlpJCj2bjxn/1oU0PMMGO3jjdp72d+g5615Jsf+kVQqSoML8ZLSgWwNUZKbDCD
	 rFP9P8kZspxsVYgw4Ro2//pW7hdjxuVUbCrB2l4oHukRGWi/Bc8Z1yIdbsXXrZ7ViT
	 dmc5NIQpkA95/a4d8Vi6TqvvjYsmYqYOXayGXo3wneN5PmruqDkGZUz49MLou6r/IA
	 Ka4jI/xNcOIc4ofN57CxNc9GsQuvIdzfJG68BUivhT8FjjRNTEiFfUEMSUfNGEIhm9
	 zIsyprG7a+MAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E47383C259;
	Thu,  4 Sep 2025 08:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next PATCH v5 0/4] net: renesas: rswitch: R-Car S4 add HW
 offloading for layer 2 switching
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175697341225.1714378.5684224526256527137.git-patchwork-notify@kernel.org>
Date: Thu, 04 Sep 2025 08:10:12 +0000
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
In-Reply-To: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
To: Michael Dege <michael.dege@renesas.com>
Cc: yoshihiro.shimoda.uh@renesas.com, niklas.soderlund@ragnatech.se,
 paul@pbarker.dev, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nikita.yoush@cogentembedded.com,
 andrew@lunn.ch, niklas.soderlund+renesas@ragnatech.se

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 01 Sep 2025 06:58:04 +0200 you wrote:
> Hello!
> 
> The current R-Car S4 rswitch driver only supports port based fowarding.
> This patch set adds HW offloading for L2 switching/bridgeing. The driver
> hooks into switchdev.
> 
> 1. Rename the base driver file to keep the driver name (rswitch.ko)
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/4] net: renesas: rswitch: rename rswitch.c to rswitch_main.c
    https://git.kernel.org/netdev/net-next/c/5ee21c004c0b
  - [net-next,v5,2/4] net: renesas: rswitch: configure default ageing time
    https://git.kernel.org/netdev/net-next/c/622303250c51
  - [net-next,v5,3/4] net: renesas: rswitch: add offloading for L2 switching
    https://git.kernel.org/netdev/net-next/c/b7502b1043de
  - [net-next,v5,4/4] net: renesas: rswitch: add modifiable ageing time
    https://git.kernel.org/netdev/net-next/c/92e913a3df3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



