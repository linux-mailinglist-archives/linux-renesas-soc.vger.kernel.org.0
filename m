Return-Path: <linux-renesas-soc+bounces-11221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5349ECC33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 13:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94FDD164A12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 12:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13F6229124;
	Wed, 11 Dec 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/czkwgQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFA238E23;
	Wed, 11 Dec 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920814; cv=none; b=lbLVU9T7/Npg8X+x4MTd/7Irm9nNHVsMBRdw5TqwV4RcBpNEDPVsi0uL5rLxLHeiKpdoyanAA9Cb30ZJls9Rc/g+EK/+1gYBALCDJkUh22uvdHN2SgVNwIJWHxvwznbrTvIvZdRp2U+5vJZu4zgf1TdT9JcHCAIFcG2b7lQ32ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920814; c=relaxed/simple;
	bh=ISEDiDx58NfMq+G2quYCkJa03ldLg7tklPMLuoxVBBs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TW0fHJSwGxKppiMA/LaJPftQu93KB6amsnFTJFfgviKiN8ru5+Gpo3jrPrH02Guf4mpZoeElXQ4rN/lKZRBQiyxXS89u+E+MUUOi70HIP6CunGbongxNzWhYKLIdmc6gefU3Znbl/hdYNcxQvj/L7rGUr7IIucmlRKDHTp3KGnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/czkwgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F79CC4CED2;
	Wed, 11 Dec 2024 12:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733920814;
	bh=ISEDiDx58NfMq+G2quYCkJa03ldLg7tklPMLuoxVBBs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u/czkwgQcm2SnRRAfLP5r9Tof6X9Yy/Z527vIp7J6bVe3SJExsdNf5a4Utml82FKP
	 hC5mVsm1mbbTJPeJ99bwFuW31r4rdMCHb4FhEPYdHRqi+6s0x94+YoYvgcP97Hf5eg
	 OjGzxNrWS4ZSAz+IjmyuKRH9aRgDGdyP8NGy9JO/srmrhU6zIbB0pr6uZvbb7Z5DWB
	 OgPcOYaIDU6GMlbx2MnULpXALBW99DZyQBQbkTQvv5ZO7agaHgO5jnWNwGlmPb5HuN
	 yo9/5DEZ93eBoWB+SmxJ2a6ohiVKZQM4ylSp5k4piCTFG71SORlax6P3XBO8Hejfbq
	 mQn1VoUZuWDkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 41964380A962;
	Wed, 11 Dec 2024 12:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: renesas: rswitch: enable only used MFWD
 features
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173392083018.1562676.10619517710119884740.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 12:40:30 +0000
References: <20241209062411.152927-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241209062411.152927-1-nikita.yoush@cogentembedded.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: yoshihiro.shimoda.uh@renesas.com, andrew@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.dege@renesas.com, christian.mardmoeller@renesas.com,
 dennis.ostermann@renesas.com

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  9 Dec 2024 11:24:11 +0500 you wrote:
> Currently, rswitch driver does not utilize most of MFWD forwarding
> and processing features. It only uses port-based forwarding for ETHA
> ports, and direct descriptor forwarding for GWCA port.
> 
> Update rswitch_fwd_init() to enable exactly that, and keep everything
> else disabled.
> 
> [...]

Here is the summary with links:
  - [net-next] net: renesas: rswitch: enable only used MFWD features
    https://git.kernel.org/netdev/net-next/c/54d3970548bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



