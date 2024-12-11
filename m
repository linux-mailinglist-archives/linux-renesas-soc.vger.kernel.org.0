Return-Path: <linux-renesas-soc+bounces-11205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C872B9EC2F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 04:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01CB01661AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 03:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA4920C025;
	Wed, 11 Dec 2024 03:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXcW5Mij"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BF20B81C;
	Wed, 11 Dec 2024 03:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886616; cv=none; b=sXL5MArukrN2mG6d8RhO5uNXn1kuJxMQKxmpSS9gqleSRHP3DoAXTVIKSJH5x06TRKPFAfz1LOVRGi0GQyKO6Ht+aV7bhKMSx+bFWl+WHcPSrHLcBxEWt+Wek2gh1Wls8jRB07S/tk2N7ZbzaOUKUOnozI9w0/1AasS6oExyX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886616; c=relaxed/simple;
	bh=79qZmJ+TQ8cZcD/WuIhRJ5qYo8fst9V7HyNBmkyL0ek=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ojyk8MKGuAipow7svhcNUTafa6p9cl+IpMbY8JI0TyX5aq13+M+6ZEa9phsu4T0xAGNaRccjYDMGnV0PHSAY7m+CDxg55SME51xbxACBc3zawudsH0ZD2ji6MZ903nyIKN3qjL0ifH1YDJ/vXgKnXpPD18hks2ik/qM8YPc5YUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXcW5Mij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02E7C4CEDF;
	Wed, 11 Dec 2024 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733886615;
	bh=79qZmJ+TQ8cZcD/WuIhRJ5qYo8fst9V7HyNBmkyL0ek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qXcW5MijN2d01JSQRvIlzeKSA3KJPFbeFhxHdjkyG+vEHp3bQEbXPlu4WwLjraV88
	 1IetF0GsywOOczWH0Hp2VxZN2jxPwk3Z35Mh6DgcJOwpTiz6HEgWSlSk/7zgzgSGy8
	 7ejAWW4FjXFbC9PGcx/UPrxHuNwjtNtLe2HF8bzEk9vNFMQnLx6C7Nuud7t9Z06+7i
	 jKYM+UeKelYletkG1JhrCR2G9S/sHj78msiDYDZUH4s7nasHUbMnj7jdvlUX7NNLyf
	 K/K5Somw075FZlf9cgIB6hI8QSPiFsikBgTD2Nfqem3hGZBnqHTasNE/Zo4sw3/Rk2
	 a92ouFfGAz+fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2BD380A954;
	Wed, 11 Dec 2024 03:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 resend 0/4] net: renesas: rswitch: several fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173388663152.1102804.7757113228741600120.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 03:10:31 +0000
References: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241208095004.69468-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun,  8 Dec 2024 14:50:00 +0500 you wrote:
> This series fixes several glitches found in the rswitch driver.
> 
> This repost fixes a mistake in the previous post at
> https://lore.kernel.org/netdev/20241206190015.4194153-1-nikita.yoush@cogentembedded.com/
> 
> Nikita Yushchenko (4):
>   net: renesas: rswitch: fix possible early skb release
>   net: renesas: rswitch: fix race window between tx start and complete
>   net: renesas: rswitch: fix leaked pointer on error path
>   net: renesas: rswitch: avoid use-after-put for a device tree node
> 
> [...]

Here is the summary with links:
  - [net,v2,resend,1/4] net: renesas: rswitch: fix possible early skb release
    https://git.kernel.org/netdev/net/c/5cb099902b6b
  - [net,v2,resend,2/4] net: renesas: rswitch: fix race window between tx start and complete
    https://git.kernel.org/netdev/net/c/0c9547e6ccf4
  - [net,v2,resend,3/4] net: renesas: rswitch: fix leaked pointer on error path
    https://git.kernel.org/netdev/net/c/bb617328bafa
  - [net,v2,resend,4/4] net: renesas: rswitch: avoid use-after-put for a device tree node
    https://git.kernel.org/netdev/net/c/66b7e9f85b84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



