Return-Path: <linux-renesas-soc+bounces-9016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4AF9842D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 12:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07891280F93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 10:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6484156678;
	Tue, 24 Sep 2024 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScHLowhF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777551494CE;
	Tue, 24 Sep 2024 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172027; cv=none; b=Gjpa7KhyP+7t7kVUSn03GB1cE7KLATaAmK7wLNTBUTHebbikes6Df775u1nwv6LVF+aHYM+7DdJSPmU2M49IanpFbZY+u7Q6lkEJ2jC6JYkfrW3tvoe745CR5r2Tyy/tcn9e0ptAg7RDfRUSKbYitRFjCBZ7THDYa1WhoZivJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172027; c=relaxed/simple;
	bh=vwwcht1BEi5Bui59qglPewDZ63ryyP+yzkukmNfzoZg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o1l2LndAs2LA0/o50pEyHA+QKvy2S5FO2/02HZVld7AsFom5yku6NTUgaDvAoYfJbOQ8N/QFjMRRnQ6CkmMXegxoUjMD3Xap1M3EZDu1TBY4qo6RfxDTyPBGa/QzlKow3sBq//yjzvN49hDDwzouktAXdY3EZIQ6/ZmbkJ2MVt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScHLowhF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23BC4CEC4;
	Tue, 24 Sep 2024 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727172026;
	bh=vwwcht1BEi5Bui59qglPewDZ63ryyP+yzkukmNfzoZg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ScHLowhF7XupHEieOu9xOfvardJ12COtXZhfE7Xcacwx6hkkdTPm/TfOWprN1fM90
	 fqJJOP3a27LMAwRGtikLxmPA6hHqDMSqGRzlBVUQNaDqtwRnIwIKXNfnHv2HG66YYs
	 KE7jVGd2ZUNOnzbV374uJNYaCNjNK/HDC0leNZUZVsuvYlvScbNOQNVkIiIvG45P0I
	 z5dqYk+E79laO223vv8uD7P6it25Ct52GTj5eQJ1J7Njul/o6m9s08F0TWpubuazGK
	 aCXNSAlcyc2TQJcY/cHwKnMgrnvk5K7QFttK2Jv29Tc4P6l5dMAYmhuD4/XP8VzJQe
	 oY4X/dA1DJbng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7126A3806655;
	Tue, 24 Sep 2024 10:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net PATCH v3 0/2] Fix maximum TX/RX frame sizes in ravb driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172717202926.3972444.193078551368656456.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 10:00:29 +0000
References: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, niklas.soderlund+renesas@ragnatech.se,
 andrew@lunn.ch, biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, mitsuhiro.kimura.kc@renesas.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Sep 2024 09:18:37 +0100 you wrote:
> These patches fix a couple of bugs in the maximum supported TX/RX frame
> sizes in the ravb driver.
> 
>   * For the GbEth IP, we were advertising a maximum TX frame size/MTU
>     that was larger that the maximum the hardware can transmit.
> 
>   * For the R-Car AVB IP, we were unnecessarily setting the maximum RX
>     frame size/MRU based on the MTU, which by default is smaller than
>     the maximum the hardware can receive.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: ravb: Fix maximum TX frame size for GbEth devices
    https://git.kernel.org/netdev/net/c/1d63864299ca
  - [net,v3,2/2] net: ravb: Fix R-Car RX frame size limit
    https://git.kernel.org/netdev/net/c/ec8234717db8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



