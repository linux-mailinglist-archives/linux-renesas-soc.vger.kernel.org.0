Return-Path: <linux-renesas-soc+bounces-22423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE31BA5518
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Sep 2025 00:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9427D1BC3FA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Sep 2025 22:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6AC330FC12;
	Fri, 26 Sep 2025 22:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5WAyhgX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093330F957;
	Fri, 26 Sep 2025 22:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758925232; cv=none; b=YzC7j7oiPh6K0E8oFkH4o4xSdcYKmnsaGKPCrX4q5UehDUYPSxqNvelr7et/b10+zfQ0tG5zm/89+wjBlQv+kvvFG/cbvCY6E0lY6JNQOwSBSrRhMXGZk66KwGhP4zTPjWk0CRCmAqesf9e44+sYvSjGipcDLK5ti/nCVVZpNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758925232; c=relaxed/simple;
	bh=FmplK52TNGXVvIJ80ZpgbBnrnbf+hfS7s8cFUx4blBg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hbi4mdxOjdq+XB2fUqi4GgPQWTLl5nGNcV+BZHmNM0Ve+u2/LUmxbtFcUxP8htCUQF7Ve0hFCQ2pCWHtlb36qJ02Qg2Bl3NNRUt99Sb4V4Bq7/RHCnlWXTkf9RgDAeCWoeEGgw2ri/WDGYlDuk2EBf4VXsxlVdIVNcY2SC94o4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5WAyhgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46280C4CEF4;
	Fri, 26 Sep 2025 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758925232;
	bh=FmplK52TNGXVvIJ80ZpgbBnrnbf+hfS7s8cFUx4blBg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C5WAyhgX3BvAUOEqncVDM1+wT8tZUdO7CWybG34FiFA30sK2Hs6p5j7+pSLFInnRE
	 SeEYdVNVixlqweKmG37hYo8u45bnpeYrNUkDypKqfDw7B0PVJtCFBuXiIUMluS5aQD
	 EQ0deinxxRq85OHemw8t5kqRCC3ZLAC2fauta82mJ/KTw4vd+RkX+ctd/DfINelA3v
	 lziMuSIme696Y83z/SYizaZ7IHDWpo35/xnAPk+Q/FjLsTRspbNYSWvIu6023c9RYh
	 pIrzlEn6tXX4hSr54AHarYii4ScPFRZqXqUaYU/HnwOGHB1kZDOSMJtAvkQdK+cKUD
	 eoxORWyEHusbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEA239D0C3F;
	Fri, 26 Sep 2025 22:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [net-next] net: renesas: rswitch: Remove unneeded
 semicolons
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175892522724.77570.12314729124866518832.git-patchwork-notify@kernel.org>
Date: Fri, 26 Sep 2025 22:20:27 +0000
References: 
 <e6b57123f319c03b3f078981cb452be49e86253b.1758719832.git.geert+renesas@glider.be>
In-Reply-To: 
 <e6b57123f319c03b3f078981cb452be49e86253b.1758719832.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: yoshihiro.shimoda.uh@renesas.com, michael.dege@renesas.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nikita.yoush@cogentembedded.com,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Sep 2025 15:19:30 +0200 you wrote:
> Semicolons after end of function braces are not needed, remove them.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/ethernet/renesas/rswitch_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: renesas: rswitch: Remove unneeded semicolons
    https://git.kernel.org/netdev/net-next/c/72bc38077e80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



