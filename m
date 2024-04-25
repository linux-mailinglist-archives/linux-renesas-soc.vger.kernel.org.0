Return-Path: <linux-renesas-soc+bounces-4911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF28B2562
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 17:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BAA1F24D5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 15:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9308E14C5B8;
	Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmjYbmUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2BC14C5A1;
	Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059630; cv=none; b=b3guUU/aKKK9Gu+z4kRGidjRHoweW5dDw0OSAMDNDNyu03IToKATmbL3C4on+7dIK32KyO9OGP5TkjRHkxXnf7itJ7gKR7C7EWXn2Ld8OWU8a9eZAv34C9Fv7UU7Iviszmkh+kT8aMR+vK/LIZuwTStjPjdaGf+EH8CT3FGGc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059630; c=relaxed/simple;
	bh=1EY6MgbTtDW/Fx+kD6yV6cKSy9yW23CtaOOoAnzw5T4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MrQzOvSdpLsc13kfCpzDAaIVLiQ4dzjLytIlp5qMlAma5FCbCs6hzg7Jazrnf7XqmBL8kjKCFeuHq/bVtyPKZ8C7Tjuh8wwtCEij1iGVmjpgWZSyasKad5sTV4mZEasZrTuCd1J4YBGbOARER/gurE1ZVjmhqr8kfSJOolapQ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmjYbmUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 265ADC4AF0B;
	Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714059630;
	bh=1EY6MgbTtDW/Fx+kD6yV6cKSy9yW23CtaOOoAnzw5T4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YmjYbmUBC5jl434lpLCStAf0rh8Q1E8wh/EMuH3y4bCNq/FlVKRdOOTOgZYfjXx1r
	 5p7a0VmjuKe3y9X2FxI6KBUKn56TLQxAlkEh+Lj65eWy4GVEcdC/86YASToyTV5DX2
	 2wx+w+8bf8JECoJGkxkDTLeApIZ/xKomK/lLz7NIImVh5QhzA8BvNQOE8hIKN5t3gC
	 A/E14bu2NHPXZDALc+nw1w8wB12uDtcEeaop5qQ25WUqJu9yeUdhFKir6V/EUEa63N
	 QIKSL/SzoEkJV/biRHRMEgI2zHXmw0b4VPWxtbidaQyY0Xem4pcIAITIJGWh+Gtt/m
	 NnetRUXbhpAVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EF90CF21C4;
	Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171405963005.10966.1749832467271464576.git-patchwork-notify@kernel.org>
Date: Thu, 25 Apr 2024 15:40:30 +0000
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
In-Reply-To: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: claudiu.beznea.uj@bp.renesas.com, s.shtylyov@omp.ru,
 paul.barker.ct@bp.renesas.com, niklas.soderlund+renesas@ragnatech.se,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Apr 2024 09:45:21 +0200 you wrote:
> As interrupts are now requested from ravb_probe(), before calling
> register_netdev(), ndev->name still contains the template "eth%d",
> leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> 
> 	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> 	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> 	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> 	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc
> 
> [...]

Here is the summary with links:
  - net: ravb: Fix registered interrupt names
    https://git.kernel.org/netdev/net/c/0c81ea5a8e23

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



