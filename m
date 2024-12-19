Return-Path: <linux-renesas-soc+bounces-11559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE09F736B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 04:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37C98168E67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 03:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559686336;
	Thu, 19 Dec 2024 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qa9U9aIr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747115530F;
	Thu, 19 Dec 2024 03:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734579614; cv=none; b=m0YOhXghlWsZJgWTH/pPg3rF5v7ppTV1n1jnRcGZzX1an0D3FVhU4gsjxdACsqKZ4WEIa5iUcBwl/EgRszdxWiZHi8mvCw1Q+1Aa/8MyJ5fEPucO2EWHY1hA5AVfnHWbhFM1wQ3j0WHjejjGsm3DzzcdjTamXLRxcRCTBayGUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734579614; c=relaxed/simple;
	bh=AwQD96NBDWjcmiaCpMj3d61azc9avbTKwun+thA5iGM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JNiC4j242bRvaFv39LXbfLPsuK/Yqa5X9glX3/rxWp+H8Xt+2aFt+Fn5DfA4cM6nGn25ccLOefLuIcoMPR4jP8yWUGdX9F3QCGJ4fG2rV7qYDWNdhURjJ6ctZYqP0e6PlwRMsjHATmK5RsSyHf9kzie2T2rPtcHA4Wjzhb5H2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qa9U9aIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8AFC4CED4;
	Thu, 19 Dec 2024 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734579614;
	bh=AwQD96NBDWjcmiaCpMj3d61azc9avbTKwun+thA5iGM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qa9U9aIr6XhioJQZHEDzy4txY+a0h82Zpn7gdiBFazClUqOrbly8JJfR/fCIFKXqc
	 /Fy6rA3NbdJ3Fr5/uB+qCd9zDlMxnJZqUroIsKz2W8vK0SM6V4A93xZiqJjK9eA6hF
	 fk5prVs6tLkQdAokMyQhp7xTs97KRFIzGZk9AHRmZbITECgDvffqh386//XF8Qa7jh
	 m5TAYEhSc/O8ufnJloiBWby0sIXESouJrGuich1btpfnlvnestNXgNawfssVjQvLHd
	 LykBKHtW+d7kQt6RYmMyigg3Agzf6aauTaiNNx+6qHKiJimbiM8HD8T2rrZlKKSlEa
	 /5r8a0jCpmcwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEAD3805DB1;
	Thu, 19 Dec 2024 03:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] mdio support updates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173457963175.1809585.6950854571110502360.git-patchwork-notify@kernel.org>
Date: Thu, 19 Dec 2024 03:40:31 +0000
References: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Dec 2024 12:19:52 +0500 you wrote:
> This series cleans up rswitch mdio support, and adds C22 operations.
> 
> Nikita Yushchenko (5):
>   net: renesas: rswitch: do not write to MPSM register at init time
>   net: renesas: rswitch: use FIELD_PREP for remaining MPIC register
>     fields
>   net: renesas: rswitch: align mdio C45 operations with datasheet
>   net: renesas: rswitch: use generic MPSM operation for mdio C45
>   net: renesas: rswitch: add mdio C22 support
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: renesas: rswitch: do not write to MPSM register at init time
    https://git.kernel.org/netdev/net-next/c/206112fa6579
  - [net-next,v2,2/5] net: renesas: rswitch: use FIELD_PREP for remaining MPIC register fields
    https://git.kernel.org/netdev/net-next/c/da75ba93e338
  - [net-next,v2,3/5] net: renesas: rswitch: align mdio C45 operations with datasheet
    https://git.kernel.org/netdev/net-next/c/1ced1b8cacf3
  - [net-next,v2,4/5] net: renesas: rswitch: use generic MPSM operation for mdio C45
    https://git.kernel.org/netdev/net-next/c/2aa722b6d81c
  - [net-next,v2,5/5] net: renesas: rswitch: add mdio C22 support
    https://git.kernel.org/netdev/net-next/c/db48fe905d8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



